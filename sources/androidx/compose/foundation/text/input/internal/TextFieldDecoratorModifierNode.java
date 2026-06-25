package androidx.compose.foundation.text.input.internal;

import android.view.KeyEvent;
import androidx.compose.foundation.content.MediaType;
import androidx.compose.foundation.content.ReceiveContentListener;
import androidx.compose.foundation.content.TransferableContent;
import androidx.compose.foundation.content.TransferableContent_androidKt;
import androidx.compose.foundation.content.internal.DragAndDropRequestPermission_androidKt;
import androidx.compose.foundation.content.internal.ReceiveContentConfiguration;
import androidx.compose.foundation.content.internal.ReceiveContentConfigurationKt;
import androidx.compose.foundation.interaction.HoverInteraction;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.text.AutofillHighlightKt;
import androidx.compose.foundation.text.Handle;
import androidx.compose.foundation.text.KeyCommand;
import androidx.compose.foundation.text.KeyboardOptions;
import androidx.compose.foundation.text.input.InputTransformation;
import androidx.compose.foundation.text.input.KeyboardActionHandler;
import androidx.compose.foundation.text.input.TextFieldBuffer;
import androidx.compose.foundation.text.input.TextFieldCharSequence;
import androidx.compose.foundation.text.input.TextFieldState;
import androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState;
import androidx.compose.foundation.text.input.internal.selection.TextToolbarState;
import androidx.compose.foundation.text.input.internal.undo.TextFieldEditUndoBehavior;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.autofill.ContentDataType;
import androidx.compose.ui.draganddrop.DragAndDropEvent;
import androidx.compose.ui.draganddrop.DragAndDropTargetModifierNode;
import androidx.compose.ui.focus.FocusEventModifierNode;
import androidx.compose.ui.focus.FocusManager;
import androidx.compose.ui.focus.FocusRequesterModifierNode;
import androidx.compose.ui.focus.FocusRequesterModifierNodeKt;
import androidx.compose.ui.focus.FocusState;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.drawscope.ContentDrawScope;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.input.key.KeyInputModifierNode;
import androidx.compose.ui.input.pointer.PointerEvent;
import androidx.compose.ui.input.pointer.PointerEventPass;
import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import androidx.compose.ui.input.pointer.PointerInputScope;
import androidx.compose.ui.input.pointer.SuspendingPointerInputFilterKt;
import androidx.compose.ui.input.pointer.SuspendingPointerInputModifierNode;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.modifier.ModifierLocalModifierNode;
import androidx.compose.ui.node.CompositionLocalConsumerModifierNode;
import androidx.compose.ui.node.CompositionLocalConsumerModifierNodeKt;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.DrawModifierNode;
import androidx.compose.ui.node.GlobalPositionAwareModifierNode;
import androidx.compose.ui.node.LayoutAwareModifierNode;
import androidx.compose.ui.node.ObserverModifierNode;
import androidx.compose.ui.node.ObserverModifierNodeKt;
import androidx.compose.ui.node.PointerInputModifierNode;
import androidx.compose.ui.node.SemanticsModifierNode;
import androidx.compose.ui.node.SemanticsModifierNodeKt;
import androidx.compose.ui.platform.ClipEntry;
import androidx.compose.ui.platform.ClipMetadata;
import androidx.compose.ui.platform.CompositionLocalsKt;
import androidx.compose.ui.platform.PlatformTextInputModifierNode;
import androidx.compose.ui.platform.SoftwareKeyboardController;
import androidx.compose.ui.platform.WindowInfo;
import androidx.compose.ui.semantics.SemanticsPropertiesKt;
import androidx.compose.ui.semantics.SemanticsPropertyReceiver;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.TextRangeKt;
import androidx.compose.ui.text.input.ImeAction;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.core.app.NotificationCompat;
import com.itextpdf.kernel.pdf.canvas.wmf.MetaDo;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.CoroutineScopeKt;
import kotlinx.coroutines.CoroutineStart;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.flow.FlowCollector;
import kotlinx.coroutines.flow.FlowKt;
import kotlinx.coroutines.flow.MutableSharedFlow;
/* compiled from: TextFieldDecoratorModifier.kt */
@Metadata(d1 = {"\u0000\u008d\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001H\b\u0000\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u00042\u00020\u00052\u00020\u00062\u00020\u00072\u00020\b2\u00020\t2\u00020\n2\u00020\u000b2\u00020\f2\u00020\rBq\u0012\u0006\u0010\u000e\u001a\u00020\u000f\u0012\u0006\u0010\u0010\u001a\u00020\u0011\u0012\u0006\u0010\u0012\u001a\u00020\u0013\u0012\b\u0010\u0014\u001a\u0004\u0018\u00010\u0015\u0012\u0006\u0010\u0016\u001a\u00020\u0017\u0012\u0006\u0010\u0018\u001a\u00020\u0017\u0012\u0006\u0010\u0019\u001a\u00020\u001a\u0012\b\u0010\u001b\u001a\u0004\u0018\u00010\u001c\u0012\u0006\u0010\u001d\u001a\u00020\u0017\u0012\u0006\u0010\u001e\u001a\u00020\u001f\u0012\u0006\u0010 \u001a\u00020\u0017\u0012\u000e\u0010!\u001a\n\u0012\u0004\u0012\u00020#\u0018\u00010\"¢\u0006\u0002\u0010$J\b\u0010n\u001a\u00020#H\u0002J\b\u0010o\u001a\u00020#H\u0002J\u000e\u0010p\u001a\u00020#H\u0082@¢\u0006\u0002\u0010qJ\b\u0010r\u001a\u00020#H\u0016J\b\u0010s\u001a\u00020#H\u0016J\b\u0010t\u001a\u00020#H\u0016J\b\u0010u\u001a\u00020#H\u0002J\u0010\u0010v\u001a\u00020#2\u0006\u0010w\u001a\u00020xH\u0016J\u0010\u0010y\u001a\u00020#2\u0006\u0010z\u001a\u00020{H\u0016J\u001b\u0010|\u001a\u00020#2\u0006\u0010}\u001a\u00020~H\u0002ø\u0001\u0000¢\u0006\u0005\b\u007f\u0010\u0080\u0001J\u001f\u0010\u0081\u0001\u001a\u00020\u00172\b\u0010\u0082\u0001\u001a\u00030\u0083\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\b\u0084\u0001\u0010\u0085\u0001J\t\u0010\u0086\u0001\u001a\u00020#H\u0016J\u0011\u0010\u0087\u0001\u001a\u00020#2\u0006\u0010z\u001a\u00020{H\u0016J3\u0010\u0088\u0001\u001a\u00020#2\b\u0010\u0089\u0001\u001a\u00030\u008a\u00012\b\u0010\u008b\u0001\u001a\u00030\u008c\u00012\b\u0010\u008d\u0001\u001a\u00030\u008e\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\b\u008f\u0001\u0010\u0090\u0001J\u001f\u0010\u0091\u0001\u001a\u00020\u00172\b\u0010\u0082\u0001\u001a\u00030\u0083\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\b\u0092\u0001\u0010\u0085\u0001J\u001f\u0010\u0093\u0001\u001a\u00020#2\b\u0010\u0094\u0001\u001a\u00030\u008e\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\b\u0095\u0001\u0010\u0096\u0001J\n\u0010\u0097\u0001\u001a\u00030\u0098\u0001H\u0002J\u0012\u0010\u0099\u0001\u001a\u00020#2\u0007\u0010\u009a\u0001\u001a\u00020\u0017H\u0002Js\u0010\u009b\u0001\u001a\u00020#2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u00152\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u001c2\u0006\u0010\u001d\u001a\u00020\u00172\u0006\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020\u00172\u000e\u0010!\u001a\n\u0012\u0004\u0012\u00020#\u0018\u00010\"J\u000e\u0010\u009c\u0001\u001a\u00020#*\u00030\u009d\u0001H\u0016J\u000e\u0010\u009e\u0001\u001a\u00020#*\u00030\u009f\u0001H\u0016R+\u0010&\u001a\u00020\u00172\u0006\u0010%\u001a\u00020\u00178B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\b+\u0010,\u001a\u0004\b'\u0010(\"\u0004\b)\u0010*R\u0016\u0010-\u001a\u00020.X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010/R\u000e\u00100\u001a\u000201X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u00102\u001a\u0004\u0018\u000103X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010\u0016\u001a\u00020\u0017X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b4\u0010(\"\u0004\b5\u0010*R\u001c\u0010\u0014\u001a\u0004\u0018\u00010\u0015X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b6\u00107\"\u0004\b8\u00109R\u0010\u0010:\u001a\u0004\u0018\u00010;X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010\u001e\u001a\u00020\u001fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b<\u0010=\"\u0004\b>\u0010?R\u000e\u0010@\u001a\u00020\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010A\u001a\u00020\u00178BX\u0082\u0004¢\u0006\u0006\u001a\u0004\bA\u0010(R\u001a\u0010 \u001a\u00020\u0017X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b \u0010(\"\u0004\bB\u0010*R\u001c\u0010\u001b\u001a\u0004\u0018\u00010\u001cX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bC\u0010D\"\u0004\bE\u0010FR\u0010\u0010G\u001a\u00020HX\u0082\u0004¢\u0006\u0004\n\u0002\u0010IR\u001a\u0010\u0019\u001a\u00020\u001aX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bJ\u0010K\"\u0004\bL\u0010MR\u0010\u0010N\u001a\u0004\u0018\u00010;X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010O\u001a\u00020PX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u0018\u001a\u00020\u0017X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bQ\u0010(\"\u0004\bR\u0010*R\u0016\u0010S\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010U0TX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010V\u001a\u00020\u00178VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bW\u0010(R\u001a\u0010\u001d\u001a\u00020\u0017X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bX\u0010(\"\u0004\bY\u0010*R\"\u0010!\u001a\n\u0012\u0004\u0012\u00020#\u0018\u00010\"X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bZ\u0010[\"\u0004\b\\\u0010]R\u000e\u0010^\u001a\u00020_X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u0012\u001a\u00020\u0013X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b`\u0010a\"\u0004\bb\u0010cR\u001a\u0010\u000e\u001a\u00020\u000fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bd\u0010e\"\u0004\bf\u0010gR\u001a\u0010\u0010\u001a\u00020\u0011X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bh\u0010i\"\u0004\bj\u0010kR\u0010\u0010l\u001a\u0004\u0018\u00010mX\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006 \u0001"}, d2 = {"Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode;", "Landroidx/compose/ui/node/DelegatingNode;", "Landroidx/compose/ui/node/DrawModifierNode;", "Landroidx/compose/ui/platform/PlatformTextInputModifierNode;", "Landroidx/compose/ui/node/SemanticsModifierNode;", "Landroidx/compose/ui/focus/FocusRequesterModifierNode;", "Landroidx/compose/ui/focus/FocusEventModifierNode;", "Landroidx/compose/ui/node/GlobalPositionAwareModifierNode;", "Landroidx/compose/ui/node/PointerInputModifierNode;", "Landroidx/compose/ui/input/key/KeyInputModifierNode;", "Landroidx/compose/ui/node/CompositionLocalConsumerModifierNode;", "Landroidx/compose/ui/modifier/ModifierLocalModifierNode;", "Landroidx/compose/ui/node/ObserverModifierNode;", "Landroidx/compose/ui/node/LayoutAwareModifierNode;", "textFieldState", "Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;", "textLayoutState", "Landroidx/compose/foundation/text/input/internal/TextLayoutState;", "textFieldSelectionState", "Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;", "filter", "Landroidx/compose/foundation/text/input/InputTransformation;", "enabled", "", "readOnly", "keyboardOptions", "Landroidx/compose/foundation/text/KeyboardOptions;", "keyboardActionHandler", "Landroidx/compose/foundation/text/input/KeyboardActionHandler;", "singleLine", "interactionSource", "Landroidx/compose/foundation/interaction/MutableInteractionSource;", "isPassword", "stylusHandwritingTrigger", "Lkotlinx/coroutines/flow/MutableSharedFlow;", "", "(Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;Landroidx/compose/foundation/text/input/internal/TextLayoutState;Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;Landroidx/compose/foundation/text/input/InputTransformation;ZZLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;ZLkotlinx/coroutines/flow/MutableSharedFlow;)V", "<set-?>", "autofillHighlightOn", "getAutofillHighlightOn", "()Z", "setAutofillHighlightOn", "(Z)V", "autofillHighlightOn$delegate", "Landroidx/compose/runtime/MutableState;", "clipboardKeyCommandsHandler", "Landroidx/compose/foundation/text/input/internal/ClipboardKeyCommandsHandler;", "Lkotlin/jvm/functions/Function1;", "dragAndDropNode", "Landroidx/compose/ui/draganddrop/DragAndDropTargetModifierNode;", "dragEnterEvent", "Landroidx/compose/foundation/interaction/HoverInteraction$Enter;", "getEnabled", "setEnabled", "getFilter", "()Landroidx/compose/foundation/text/input/InputTransformation;", "setFilter", "(Landroidx/compose/foundation/text/input/InputTransformation;)V", "inputSessionJob", "Lkotlinx/coroutines/Job;", "getInteractionSource", "()Landroidx/compose/foundation/interaction/MutableInteractionSource;", "setInteractionSource", "(Landroidx/compose/foundation/interaction/MutableInteractionSource;)V", "isElementFocused", "isFocused", "setPassword", "getKeyboardActionHandler", "()Landroidx/compose/foundation/text/input/KeyboardActionHandler;", "setKeyboardActionHandler", "(Landroidx/compose/foundation/text/input/KeyboardActionHandler;)V", "keyboardActionScope", "androidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode$keyboardActionScope$1", "Landroidx/compose/foundation/text/input/internal/TextFieldDecoratorModifierNode$keyboardActionScope$1;", "getKeyboardOptions", "()Landroidx/compose/foundation/text/KeyboardOptions;", "setKeyboardOptions", "(Landroidx/compose/foundation/text/KeyboardOptions;)V", "observeChangesJob", "pointerInputNode", "Landroidx/compose/ui/input/pointer/SuspendingPointerInputModifierNode;", "getReadOnly", "setReadOnly", "receiveContentConfigurationProvider", "Lkotlin/Function0;", "Landroidx/compose/foundation/content/internal/ReceiveContentConfiguration;", "shouldMergeDescendantSemantics", "getShouldMergeDescendantSemantics", "getSingleLine", "setSingleLine", "getStylusHandwritingTrigger", "()Lkotlinx/coroutines/flow/MutableSharedFlow;", "setStylusHandwritingTrigger", "(Lkotlinx/coroutines/flow/MutableSharedFlow;)V", "textFieldKeyEventHandler", "Landroidx/compose/foundation/text/input/internal/TextFieldKeyEventHandler;", "getTextFieldSelectionState", "()Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;", "setTextFieldSelectionState", "(Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;)V", "getTextFieldState", "()Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;", "setTextFieldState", "(Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;)V", "getTextLayoutState", "()Landroidx/compose/foundation/text/input/internal/TextLayoutState;", "setTextLayoutState", "(Landroidx/compose/foundation/text/input/internal/TextLayoutState;)V", "windowInfo", "Landroidx/compose/ui/platform/WindowInfo;", "disposeInputSession", "emitDragExitEvent", "observeUntransformedTextChanges", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "onAttach", "onCancelPointerInput", "onDetach", "onFocusChange", "onFocusEvent", "focusState", "Landroidx/compose/ui/focus/FocusState;", "onGloballyPositioned", "coordinates", "Landroidx/compose/ui/layout/LayoutCoordinates;", "onImeActionPerformed", "imeAction", "Landroidx/compose/ui/text/input/ImeAction;", "onImeActionPerformed-KlQnJC8", "(I)V", "onKeyEvent", NotificationCompat.CATEGORY_EVENT, "Landroidx/compose/ui/input/key/KeyEvent;", "onKeyEvent-ZmokQxo", "(Landroid/view/KeyEvent;)Z", "onObservedReadsChanged", "onPlaced", "onPointerEvent", "pointerEvent", "Landroidx/compose/ui/input/pointer/PointerEvent;", "pass", "Landroidx/compose/ui/input/pointer/PointerEventPass;", "bounds", "Landroidx/compose/ui/unit/IntSize;", "onPointerEvent-H0pRuoY", "(Landroidx/compose/ui/input/pointer/PointerEvent;Landroidx/compose/ui/input/pointer/PointerEventPass;J)V", "onPreKeyEvent", "onPreKeyEvent-ZmokQxo", "onRemeasured", "size", "onRemeasured-ozmzZPI", "(J)V", "requireKeyboardController", "Landroidx/compose/ui/platform/SoftwareKeyboardController;", "startInputSession", "fromTap", "updateNode", "applySemantics", "Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;", "draw", "Landroidx/compose/ui/graphics/drawscope/ContentDrawScope;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextFieldDecoratorModifierNode extends DelegatingNode implements DrawModifierNode, PlatformTextInputModifierNode, SemanticsModifierNode, FocusRequesterModifierNode, FocusEventModifierNode, GlobalPositionAwareModifierNode, PointerInputModifierNode, KeyInputModifierNode, CompositionLocalConsumerModifierNode, ModifierLocalModifierNode, ObserverModifierNode, LayoutAwareModifierNode {
    public static final int $stable = 8;
    private final MutableState autofillHighlightOn$delegate;
    private final Function1<? super KeyCommand, ? extends Unit> clipboardKeyCommandsHandler;
    private final DragAndDropTargetModifierNode dragAndDropNode;
    private HoverInteraction.Enter dragEnterEvent;
    private boolean enabled;
    private InputTransformation filter;
    private Job inputSessionJob;
    private MutableInteractionSource interactionSource;
    private boolean isElementFocused;
    private boolean isPassword;
    private KeyboardActionHandler keyboardActionHandler;
    private final TextFieldDecoratorModifierNode$keyboardActionScope$1 keyboardActionScope;
    private KeyboardOptions keyboardOptions;
    private Job observeChangesJob;
    private final SuspendingPointerInputModifierNode pointerInputNode;
    private boolean readOnly;
    private final Function0<ReceiveContentConfiguration> receiveContentConfigurationProvider;
    private boolean singleLine;
    private MutableSharedFlow<Unit> stylusHandwritingTrigger;
    private final TextFieldKeyEventHandler textFieldKeyEventHandler;
    private TextFieldSelectionState textFieldSelectionState;
    private TransformedTextFieldState textFieldState;
    private TextLayoutState textLayoutState;
    private WindowInfo windowInfo;

    public final TransformedTextFieldState getTextFieldState() {
        return this.textFieldState;
    }

    public final void setTextFieldState(TransformedTextFieldState transformedTextFieldState) {
        this.textFieldState = transformedTextFieldState;
    }

    public final TextLayoutState getTextLayoutState() {
        return this.textLayoutState;
    }

    public final void setTextLayoutState(TextLayoutState textLayoutState) {
        this.textLayoutState = textLayoutState;
    }

    public final TextFieldSelectionState getTextFieldSelectionState() {
        return this.textFieldSelectionState;
    }

    public final void setTextFieldSelectionState(TextFieldSelectionState textFieldSelectionState) {
        this.textFieldSelectionState = textFieldSelectionState;
    }

    public final InputTransformation getFilter() {
        return this.filter;
    }

    public final void setFilter(InputTransformation inputTransformation) {
        this.filter = inputTransformation;
    }

    public final boolean getEnabled() {
        return this.enabled;
    }

    public final void setEnabled(boolean z) {
        this.enabled = z;
    }

    public final boolean getReadOnly() {
        return this.readOnly;
    }

    public final void setReadOnly(boolean z) {
        this.readOnly = z;
    }

    public final KeyboardOptions getKeyboardOptions() {
        return this.keyboardOptions;
    }

    public final void setKeyboardOptions(KeyboardOptions keyboardOptions) {
        this.keyboardOptions = keyboardOptions;
    }

    public final KeyboardActionHandler getKeyboardActionHandler() {
        return this.keyboardActionHandler;
    }

    public final void setKeyboardActionHandler(KeyboardActionHandler keyboardActionHandler) {
        this.keyboardActionHandler = keyboardActionHandler;
    }

    public final boolean getSingleLine() {
        return this.singleLine;
    }

    public final void setSingleLine(boolean z) {
        this.singleLine = z;
    }

    public final MutableInteractionSource getInteractionSource() {
        return this.interactionSource;
    }

    public final void setInteractionSource(MutableInteractionSource mutableInteractionSource) {
        this.interactionSource = mutableInteractionSource;
    }

    public final boolean isPassword() {
        return this.isPassword;
    }

    public final void setPassword(boolean z) {
        this.isPassword = z;
    }

    public final MutableSharedFlow<Unit> getStylusHandwritingTrigger() {
        return this.stylusHandwritingTrigger;
    }

    public final void setStylusHandwritingTrigger(MutableSharedFlow<Unit> mutableSharedFlow) {
        this.stylusHandwritingTrigger = mutableSharedFlow;
    }

    public TextFieldDecoratorModifierNode(TransformedTextFieldState textFieldState, TextLayoutState textLayoutState, TextFieldSelectionState textFieldSelectionState, InputTransformation filter, boolean enabled, boolean readOnly, KeyboardOptions keyboardOptions, KeyboardActionHandler keyboardActionHandler, boolean singleLine, MutableInteractionSource interactionSource, boolean isPassword, MutableSharedFlow<Unit> mutableSharedFlow) {
        MutableState mutableStateOf$default;
        this.textFieldState = textFieldState;
        this.textLayoutState = textLayoutState;
        this.textFieldSelectionState = textFieldSelectionState;
        this.filter = filter;
        this.enabled = enabled;
        this.readOnly = readOnly;
        this.keyboardOptions = keyboardOptions;
        this.keyboardActionHandler = keyboardActionHandler;
        this.singleLine = singleLine;
        this.interactionSource = interactionSource;
        this.isPassword = isPassword;
        this.stylusHandwritingTrigger = mutableSharedFlow;
        this.textFieldSelectionState.setRequestAutofillAction(new Function0<Unit>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode.1
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
                DelegatableNodeKt.requestAutofill(TextFieldDecoratorModifierNode.this);
            }
        });
        this.pointerInputNode = (SuspendingPointerInputModifierNode) delegate(SuspendingPointerInputFilterKt.SuspendingPointerInputModifierNode(new PointerInputEventHandler() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1

            /* compiled from: TextFieldDecoratorModifier.kt */
            @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
            @DebugMetadata(c = "androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1$1", f = "TextFieldDecoratorModifier.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
            /* renamed from: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1$1  reason: invalid class name */
            /* loaded from: classes.dex */
            static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                final /* synthetic */ PointerInputScope $this_SuspendingPointerInputModifierNode;
                private /* synthetic */ Object L$0;
                int label;
                final /* synthetic */ TextFieldDecoratorModifierNode this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                AnonymousClass1(TextFieldDecoratorModifierNode textFieldDecoratorModifierNode, PointerInputScope pointerInputScope, Continuation<? super AnonymousClass1> continuation) {
                    super(2, continuation);
                    this.this$0 = textFieldDecoratorModifierNode;
                    this.$this_SuspendingPointerInputModifierNode = pointerInputScope;
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                    AnonymousClass1 anonymousClass1 = new AnonymousClass1(this.this$0, this.$this_SuspendingPointerInputModifierNode, continuation);
                    anonymousClass1.L$0 = obj;
                    return anonymousClass1;
                }

                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                    return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Object invokeSuspend(Object obj) {
                    IntrinsicsKt.getCOROUTINE_SUSPENDED();
                    switch (this.label) {
                        case 0:
                            ResultKt.throwOnFailure(obj);
                            CoroutineScope $this$coroutineScope = (CoroutineScope) this.L$0;
                            final TextFieldSelectionState $this$invokeSuspend_u24lambda_u240 = this.this$0.getTextFieldSelectionState();
                            final TextFieldDecoratorModifierNode textFieldDecoratorModifierNode = this.this$0;
                            PointerInputScope pointerInputScope = this.$this_SuspendingPointerInputModifierNode;
                            Function0 requestFocus = 
                            /*  JADX ERROR: Method code generation error
                                jadx.core.utils.exceptions.CodegenException: Error generate insn: 0x002a: CONSTRUCTOR  (r10v1 'requestFocus' kotlin.jvm.functions.Function0) = 
                                  (r0v3 '$this$invokeSuspend_u24lambda_u240' androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState A[D('$this$invokeSuspend_u24lambda_u240' androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState), DONT_INLINE])
                                  (r7v0 'textFieldDecoratorModifierNode' androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode A[DONT_INLINE])
                                 call: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1$1$1$requestFocus$1.<init>(androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState, androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode):void type: CONSTRUCTOR in method: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1.1.invokeSuspend(java.lang.Object):java.lang.Object, file: classes.dex
                                	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:309)
                                	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:272)
                                	at jadx.core.codegen.RegionGen.makeSimpleBlock(RegionGen.java:91)
                                	at jadx.core.dex.nodes.IBlock.generate(IBlock.java:15)
                                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:63)
                                	at jadx.core.dex.regions.Region.generate(Region.java:35)
                                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:63)
                                	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:80)
                                	at jadx.core.codegen.RegionGen.makeSwitch(RegionGen.java:267)
                                	at jadx.core.dex.regions.SwitchRegion.generate(SwitchRegion.java:79)
                                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:63)
                                	at jadx.core.dex.regions.Region.generate(Region.java:35)
                                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:63)
                                	at jadx.core.codegen.MethodGen.addRegionInsns(MethodGen.java:296)
                                	at jadx.core.codegen.MethodGen.addInstructions(MethodGen.java:275)
                                	at jadx.core.codegen.ClassGen.addMethodCode(ClassGen.java:377)
                                	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:306)
                                	at jadx.core.codegen.ClassGen.lambda$addInnerClsAndMethods$2(ClassGen.java:272)
                                	at java.base/java.util.stream.ForEachOps$ForEachOp$OfRef.accept(Unknown Source)
                                	at java.base/java.util.ArrayList.forEach(Unknown Source)
                                	at java.base/java.util.stream.SortedOps$RefSortingSink.end(Unknown Source)
                                	at java.base/java.util.stream.Sink$ChainedReference.end(Unknown Source)
                                Caused by: jadx.core.utils.exceptions.JadxRuntimeException: Expected class to be processed at this point, class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1$1$1$requestFocus$1, state: NOT_LOADED
                                	at jadx.core.dex.nodes.ClassNode.ensureProcessed(ClassNode.java:302)
                                	at jadx.core.codegen.InsnGen.inlineAnonymousConstructor(InsnGen.java:769)
                                	at jadx.core.codegen.InsnGen.makeConstructor(InsnGen.java:718)
                                	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:417)
                                	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:302)
                                	... 21 more
                                */
                            /*
                                this = this;
                                kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
                                int r0 = r13.label
                                switch(r0) {
                                    case 0: goto L11;
                                    default: goto L8;
                                }
                            L8:
                                java.lang.IllegalStateException r14 = new java.lang.IllegalStateException
                                java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
                                r14.<init>(r0)
                                throw r14
                            L11:
                                kotlin.ResultKt.throwOnFailure(r14)
                                java.lang.Object r0 = r13.L$0
                                r1 = r0
                                kotlinx.coroutines.CoroutineScope r1 = (kotlinx.coroutines.CoroutineScope) r1
                                androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode r0 = r13.this$0
                                androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r0 = r0.getTextFieldSelectionState()
                                androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode r7 = r13.this$0
                                androidx.compose.ui.input.pointer.PointerInputScope r8 = r13.$this_SuspendingPointerInputModifierNode
                                r9 = 0
                                androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1$1$1$requestFocus$1 r2 = new androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1$1$1$requestFocus$1
                                r2.<init>(r0, r7)
                                r10 = r2
                                kotlin.jvm.functions.Function0 r10 = (kotlin.jvm.functions.Function0) r10
                                kotlinx.coroutines.CoroutineStart r3 = kotlinx.coroutines.CoroutineStart.UNDISPATCHED
                                androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1$1$1$1 r2 = new androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1$1$1$1
                                r11 = 0
                                r2.<init>(r0, r8, r11)
                                r4 = r2
                                kotlin.jvm.functions.Function2 r4 = (kotlin.jvm.functions.Function2) r4
                                r5 = 1
                                r6 = 0
                                r2 = 0
                                kotlinx.coroutines.BuildersKt.launch$default(r1, r2, r3, r4, r5, r6)
                                kotlinx.coroutines.CoroutineStart r12 = kotlinx.coroutines.CoroutineStart.UNDISPATCHED
                                androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1$1$1$2 r2 = new androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1$1$1$2
                                r3 = r7
                                r7 = 0
                                r4 = r0
                                r5 = r8
                                r6 = r10
                                r2.<init>(r3, r4, r5, r6, r7)
                                r7 = r5
                                r8 = r6
                                r4 = r2
                                kotlin.jvm.functions.Function2 r4 = (kotlin.jvm.functions.Function2) r4
                                r5 = 1
                                r6 = 0
                                r2 = 0
                                r3 = r12
                                kotlinx.coroutines.BuildersKt.launch$default(r1, r2, r3, r4, r5, r6)
                                kotlinx.coroutines.CoroutineStart r3 = kotlinx.coroutines.CoroutineStart.UNDISPATCHED
                                androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1$1$1$3 r2 = new androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1$1$1$3
                                r2.<init>(r0, r7, r8, r11)
                                r4 = r2
                                kotlin.jvm.functions.Function2 r4 = (kotlin.jvm.functions.Function2) r4
                                r2 = 0
                                kotlinx.coroutines.BuildersKt.launch$default(r1, r2, r3, r4, r5, r6)
                                kotlin.Unit r0 = kotlin.Unit.INSTANCE
                                return r0
                            */
                            throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$pointerInputNode$1.AnonymousClass1.invokeSuspend(java.lang.Object):java.lang.Object");
                        }
                    }

                    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
                    public final Object invoke(PointerInputScope $this$SuspendingPointerInputModifierNode, Continuation<? super Unit> continuation) {
                        Object coroutineScope = CoroutineScopeKt.coroutineScope(new AnonymousClass1(TextFieldDecoratorModifierNode.this, $this$SuspendingPointerInputModifierNode, null), continuation);
                        return coroutineScope == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? coroutineScope : Unit.INSTANCE;
                    }
                }));
                this.dragAndDropNode = (DragAndDropTargetModifierNode) delegate(TextFieldDragAndDropNode_androidKt.textFieldDragAndDropNode$default(new Function0<Set<? extends MediaType>>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$dragAndDropNode$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public final Set<? extends MediaType> invoke() {
                        Set<? extends MediaType> set;
                        Set<? extends MediaType> set2;
                        ReceiveContentConfiguration receiveContentConfiguration = ReceiveContentConfigurationKt.getReceiveContentConfiguration(TextFieldDecoratorModifierNode.this);
                        if (receiveContentConfiguration != null) {
                            set2 = TextFieldDecoratorModifierKt.MediaTypesAll;
                            return set2;
                        }
                        set = TextFieldDecoratorModifierKt.MediaTypesText;
                        return set;
                    }
                }, new Function2<ClipEntry, ClipMetadata, Boolean>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$dragAndDropNode$2
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(2);
                    }

                    @Override // kotlin.jvm.functions.Function2
                    public final Boolean invoke(ClipEntry clipEntry, ClipMetadata clipMetadata) {
                        ClipEntry clipEntry2;
                        TextFieldDecoratorModifierNode.this.emitDragExitEvent();
                        TextFieldDecoratorModifierNode.this.getTextFieldSelectionState().clearHandleDragging();
                        String plainText = TransferableContent_androidKt.readPlainText(clipEntry);
                        ReceiveContentConfiguration receiveContentConfiguration = ReceiveContentConfigurationKt.getReceiveContentConfiguration(TextFieldDecoratorModifierNode.this);
                        if (receiveContentConfiguration != null) {
                            TransferableContent transferableContent = new TransferableContent(clipEntry, clipMetadata, TransferableContent.Source.Companion.m604getDragAndDropkB6V9T0(), null, 8, null);
                            TransferableContent remaining = receiveContentConfiguration.getReceiveContentListener().onReceive(transferableContent);
                            plainText = (remaining == null || (clipEntry2 = remaining.getClipEntry()) == null) ? null : TransferableContent_androidKt.readPlainText(clipEntry2);
                        }
                        if (plainText != null) {
                            String p0 = plainText;
                            TransformedTextFieldState.replaceSelectedText$default(TextFieldDecoratorModifierNode.this.getTextFieldState(), p0, false, null, false, 14, null);
                        }
                        return true;
                    }
                }, new Function1<DragAndDropEvent, Unit>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$dragAndDropNode$3
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ Unit invoke(DragAndDropEvent dragAndDropEvent) {
                        invoke2(dragAndDropEvent);
                        return Unit.INSTANCE;
                    }

                    /* renamed from: invoke  reason: avoid collision after fix types in other method */
                    public final void invoke2(DragAndDropEvent it) {
                        if (ReceiveContentConfigurationKt.getReceiveContentConfiguration(TextFieldDecoratorModifierNode.this) != null) {
                            DragAndDropRequestPermission_androidKt.dragAndDropRequestPermission(TextFieldDecoratorModifierNode.this, it);
                        }
                    }
                }, null, new Function1<DragAndDropEvent, Unit>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$dragAndDropNode$4
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ Unit invoke(DragAndDropEvent dragAndDropEvent) {
                        invoke2(dragAndDropEvent);
                        return Unit.INSTANCE;
                    }

                    /* renamed from: invoke  reason: avoid collision after fix types in other method */
                    public final void invoke2(DragAndDropEvent it) {
                        ReceiveContentListener receiveContentListener;
                        TextFieldDecoratorModifierNode textFieldDecoratorModifierNode = TextFieldDecoratorModifierNode.this;
                        HoverInteraction.Enter it2 = new HoverInteraction.Enter();
                        TextFieldDecoratorModifierNode.this.getInteractionSource().tryEmit(it2);
                        textFieldDecoratorModifierNode.dragEnterEvent = it2;
                        ReceiveContentConfiguration receiveContentConfiguration = ReceiveContentConfigurationKt.getReceiveContentConfiguration(TextFieldDecoratorModifierNode.this);
                        if (receiveContentConfiguration == null || (receiveContentListener = receiveContentConfiguration.getReceiveContentListener()) == null) {
                            return;
                        }
                        receiveContentListener.onDragEnter();
                    }
                }, new Function1<Offset, Unit>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$dragAndDropNode$5
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ Unit invoke(Offset offset) {
                        m1552invokek4lQ0M(offset.m4058unboximpl());
                        return Unit.INSTANCE;
                    }

                    /* renamed from: invoke-k-4lQ0M  reason: not valid java name */
                    public final void m1552invokek4lQ0M(long position) {
                        long positionOnTextField = TextLayoutStateKt.m1574fromWindowToDecorationUv8p0NA(TextFieldDecoratorModifierNode.this.getTextLayoutState(), position);
                        int cursorPosition = TextLayoutState.m1564getOffsetForPosition3MmeM6k$default(TextFieldDecoratorModifierNode.this.getTextLayoutState(), positionOnTextField, false, 2, null);
                        TextFieldDecoratorModifierNode.this.getTextFieldState().m1584selectCharsIn5zctL8(TextRangeKt.TextRange(cursorPosition));
                        TextFieldDecoratorModifierNode.this.getTextFieldSelectionState().m1634updateHandleDraggingUv8p0NA(Handle.Cursor, positionOnTextField);
                    }
                }, null, new Function1<DragAndDropEvent, Unit>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$dragAndDropNode$6
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ Unit invoke(DragAndDropEvent dragAndDropEvent) {
                        invoke2(dragAndDropEvent);
                        return Unit.INSTANCE;
                    }

                    /* renamed from: invoke  reason: avoid collision after fix types in other method */
                    public final void invoke2(DragAndDropEvent it) {
                        ReceiveContentListener receiveContentListener;
                        TextFieldDecoratorModifierNode.this.emitDragExitEvent();
                        TextFieldDecoratorModifierNode.this.getTextFieldSelectionState().clearHandleDragging();
                        ReceiveContentConfiguration receiveContentConfiguration = ReceiveContentConfigurationKt.getReceiveContentConfiguration(TextFieldDecoratorModifierNode.this);
                        if (receiveContentConfiguration == null || (receiveContentListener = receiveContentConfiguration.getReceiveContentListener()) == null) {
                            return;
                        }
                        receiveContentListener.onDragExit();
                    }
                }, new Function1<DragAndDropEvent, Unit>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$dragAndDropNode$7
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ Unit invoke(DragAndDropEvent dragAndDropEvent) {
                        invoke2(dragAndDropEvent);
                        return Unit.INSTANCE;
                    }

                    /* renamed from: invoke  reason: avoid collision after fix types in other method */
                    public final void invoke2(DragAndDropEvent it) {
                        TextFieldDecoratorModifierNode.this.emitDragExitEvent();
                    }
                }, 72, null));
                this.textFieldKeyEventHandler = TextFieldKeyEventHandler_androidKt.createTextFieldKeyEventHandler();
                this.keyboardActionScope = new TextFieldDecoratorModifierNode$keyboardActionScope$1(this);
                this.clipboardKeyCommandsHandler = ClipboardKeyCommandsHandler.m1488constructorimpl(new Function1<KeyCommand, Unit>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$clipboardKeyCommandsHandler$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(1);
                    }

                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* compiled from: TextFieldDecoratorModifier.kt */
                    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
                    @DebugMetadata(c = "androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$clipboardKeyCommandsHandler$1$1", f = "TextFieldDecoratorModifier.kt", i = {}, l = {382, 383, 384}, m = "invokeSuspend", n = {}, s = {})
                    /* renamed from: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$clipboardKeyCommandsHandler$1$1  reason: invalid class name */
                    /* loaded from: classes.dex */
                    public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                        final /* synthetic */ KeyCommand $keyCommand;
                        int label;
                        final /* synthetic */ TextFieldDecoratorModifierNode this$0;

                        /* compiled from: TextFieldDecoratorModifier.kt */
                        @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
                        /* renamed from: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$clipboardKeyCommandsHandler$1$1$WhenMappings */
                        /* loaded from: classes.dex */
                        public /* synthetic */ class WhenMappings {
                            public static final /* synthetic */ int[] $EnumSwitchMapping$0;

                            static {
                                int[] iArr = new int[KeyCommand.values().length];
                                try {
                                    iArr[KeyCommand.COPY.ordinal()] = 1;
                                } catch (NoSuchFieldError e) {
                                }
                                try {
                                    iArr[KeyCommand.CUT.ordinal()] = 2;
                                } catch (NoSuchFieldError e2) {
                                }
                                try {
                                    iArr[KeyCommand.PASTE.ordinal()] = 3;
                                } catch (NoSuchFieldError e3) {
                                }
                                $EnumSwitchMapping$0 = iArr;
                            }
                        }

                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        AnonymousClass1(KeyCommand keyCommand, TextFieldDecoratorModifierNode textFieldDecoratorModifierNode, Continuation<? super AnonymousClass1> continuation) {
                            super(2, continuation);
                            this.$keyCommand = keyCommand;
                            this.this$0 = textFieldDecoratorModifierNode;
                        }

                        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                            return new AnonymousClass1(this.$keyCommand, this.this$0, continuation);
                        }

                        @Override // kotlin.jvm.functions.Function2
                        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                            return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                        }

                        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                        public final Object invokeSuspend(Object $result) {
                            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                            switch (this.label) {
                                case 0:
                                    ResultKt.throwOnFailure($result);
                                    switch (WhenMappings.$EnumSwitchMapping$0[this.$keyCommand.ordinal()]) {
                                        case 1:
                                            this.label = 1;
                                            if (this.this$0.getTextFieldSelectionState().copy(false, this) == coroutine_suspended) {
                                                return coroutine_suspended;
                                            }
                                            break;
                                        case 2:
                                            this.label = 2;
                                            if (this.this$0.getTextFieldSelectionState().cut(this) == coroutine_suspended) {
                                                return coroutine_suspended;
                                            }
                                            break;
                                        case 3:
                                            this.label = 3;
                                            if (this.this$0.getTextFieldSelectionState().paste(this) == coroutine_suspended) {
                                                return coroutine_suspended;
                                            }
                                            break;
                                    }
                                case 1:
                                    ResultKt.throwOnFailure($result);
                                    break;
                                case 2:
                                    ResultKt.throwOnFailure($result);
                                    break;
                                case 3:
                                    ResultKt.throwOnFailure($result);
                                    break;
                                default:
                                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                            }
                            return Unit.INSTANCE;
                        }
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ Unit invoke(KeyCommand keyCommand) {
                        invoke2(keyCommand);
                        return Unit.INSTANCE;
                    }

                    /* renamed from: invoke  reason: avoid collision after fix types in other method */
                    public final void invoke2(KeyCommand keyCommand) {
                        BuildersKt__Builders_commonKt.launch$default(TextFieldDecoratorModifierNode.this.getCoroutineScope(), null, CoroutineStart.UNDISPATCHED, new AnonymousClass1(keyCommand, TextFieldDecoratorModifierNode.this, null), 1, null);
                    }
                });
                this.receiveContentConfigurationProvider = new Function0<ReceiveContentConfiguration>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$receiveContentConfigurationProvider$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(0);
                    }

                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // kotlin.jvm.functions.Function0
                    public final ReceiveContentConfiguration invoke() {
                        return ReceiveContentConfigurationKt.getReceiveContentConfiguration(TextFieldDecoratorModifierNode.this);
                    }
                };
                mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
                this.autofillHighlightOn$delegate = mutableStateOf$default;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public final boolean isFocused() {
                WindowInfo windowInfo = this.windowInfo;
                boolean isWindowFocused = windowInfo != null && windowInfo.isWindowFocused();
                return this.isElementFocused && isWindowFocused;
            }

            private final boolean getAutofillHighlightOn() {
                State $this$getValue$iv = this.autofillHighlightOn$delegate;
                return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public final void setAutofillHighlightOn(boolean z) {
                MutableState $this$setValue$iv = this.autofillHighlightOn$delegate;
                $this$setValue$iv.setValue(Boolean.valueOf(z));
            }

            @Override // androidx.compose.ui.node.DrawModifierNode
            public void draw(ContentDrawScope $this$draw) {
                $this$draw.drawContent();
                if (getAutofillHighlightOn()) {
                    DrawScope.m4834drawRectnJ9OG0$default($this$draw, ((Color) CompositionLocalConsumerModifierNodeKt.currentValueOf(this, AutofillHighlightKt.getLocalAutofillHighlightColor())).m4299unboximpl(), 0L, 0L, 0.0f, null, null, 0, 126, null);
                }
            }

            /* JADX INFO: Access modifiers changed from: private */
            public final Object observeUntransformedTextChanges(Continuation<? super Unit> continuation) {
                Object collect = FlowKt.take(FlowKt.drop(SnapshotStateKt.snapshotFlow(new Function0<String>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$observeUntransformedTextChanges$2
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public final String invoke() {
                        return TextFieldDecoratorModifierNode.this.getTextFieldState().getUntransformedText().toString();
                    }
                }), 1), 1).collect(new FlowCollector() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$observeUntransformedTextChanges$3
                    @Override // kotlinx.coroutines.flow.FlowCollector
                    public /* bridge */ /* synthetic */ Object emit(Object value, Continuation $completion) {
                        return emit((String) value, (Continuation<? super Unit>) $completion);
                    }

                    public final Object emit(String it, Continuation<? super Unit> continuation2) {
                        TextFieldDecoratorModifierNode.this.setAutofillHighlightOn(false);
                        return Unit.INSTANCE;
                    }
                }, continuation);
                return collect == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? collect : Unit.INSTANCE;
            }

            public final void updateNode(TransformedTextFieldState textFieldState, TextLayoutState textLayoutState, TextFieldSelectionState textFieldSelectionState, InputTransformation filter, boolean enabled, boolean readOnly, KeyboardOptions keyboardOptions, KeyboardActionHandler keyboardActionHandler, boolean singleLine, MutableInteractionSource interactionSource, boolean isPassword, MutableSharedFlow<Unit> mutableSharedFlow) {
                boolean previousEditable = this.enabled && !this.readOnly;
                boolean previousEnabled = this.enabled;
                TransformedTextFieldState previousTextFieldState = this.textFieldState;
                KeyboardOptions previousKeyboardOptions = this.keyboardOptions;
                TextFieldSelectionState previousTextFieldSelectionState = this.textFieldSelectionState;
                MutableInteractionSource previousInteractionSource = this.interactionSource;
                boolean previousIsPassword = this.isPassword;
                MutableSharedFlow previousStylusHandwritingTrigger = this.stylusHandwritingTrigger;
                boolean editable = enabled && !readOnly;
                this.textFieldState = textFieldState;
                this.textLayoutState = textLayoutState;
                this.textFieldSelectionState = textFieldSelectionState;
                this.filter = filter;
                this.enabled = enabled;
                this.readOnly = readOnly;
                this.keyboardOptions = keyboardOptions;
                this.keyboardActionHandler = keyboardActionHandler;
                this.singleLine = singleLine;
                this.interactionSource = interactionSource;
                this.isPassword = isPassword;
                this.stylusHandwritingTrigger = mutableSharedFlow;
                if (editable != previousEditable || !Intrinsics.areEqual(textFieldState, previousTextFieldState) || !Intrinsics.areEqual(keyboardOptions, previousKeyboardOptions) || !Intrinsics.areEqual(mutableSharedFlow, previousStylusHandwritingTrigger)) {
                    if (editable && isFocused()) {
                        startInputSession(false);
                    } else if (!editable) {
                        disposeInputSession();
                    }
                }
                if (enabled != previousEnabled || editable != previousEditable || !ImeAction.m6505equalsimpl0(keyboardOptions.m1334getImeActionOrDefaulteUduSuo$foundation_release(), previousKeyboardOptions.m1334getImeActionOrDefaulteUduSuo$foundation_release()) || isPassword != previousIsPassword) {
                    SemanticsModifierNodeKt.invalidateSemantics(this);
                }
                if (!Intrinsics.areEqual(textFieldSelectionState, previousTextFieldSelectionState)) {
                    this.pointerInputNode.resetPointerInputHandler();
                    if (isAttached()) {
                        textFieldSelectionState.setReceiveContentConfiguration(this.receiveContentConfigurationProvider);
                    }
                    textFieldSelectionState.setRequestAutofillAction(new Function0<Unit>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$updateNode$1
                        /* JADX INFO: Access modifiers changed from: package-private */
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
                            DelegatableNodeKt.requestAutofill(TextFieldDecoratorModifierNode.this);
                        }
                    });
                }
                if (!Intrinsics.areEqual(interactionSource, previousInteractionSource)) {
                    this.pointerInputNode.resetPointerInputHandler();
                }
            }

            @Override // androidx.compose.ui.node.SemanticsModifierNode
            public boolean getShouldMergeDescendantSemantics() {
                return true;
            }

            @Override // androidx.compose.ui.node.SemanticsModifierNode
            public void applySemantics(SemanticsPropertyReceiver $this$applySemantics) {
                TextFieldCharSequence text = this.textFieldState.getOutputText();
                long selection = text.m1456getSelectiond9O1mEE();
                SemanticsPropertiesKt.setInputText($this$applySemantics, new AnnotatedString(this.textFieldState.getUntransformedText().toString(), null, 2, null));
                SemanticsPropertiesKt.setEditableText($this$applySemantics, new AnnotatedString(text.toString(), null, 2, null));
                SemanticsPropertiesKt.m6123setTextSelectionRangeFDrldGo($this$applySemantics, selection);
                if (!this.enabled) {
                    SemanticsPropertiesKt.disabled($this$applySemantics);
                }
                if (this.isPassword) {
                    SemanticsPropertiesKt.password($this$applySemantics);
                }
                final boolean editable = this.enabled && !this.readOnly;
                SemanticsPropertiesKt.setEditable($this$applySemantics, editable);
                SemanticsPropertiesKt.setContentDataType($this$applySemantics, ContentDataType.Companion.getText());
                SemanticsPropertiesKt.onAutofillText$default($this$applySemantics, null, new Function1<AnnotatedString, Boolean>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public final Boolean invoke(AnnotatedString newText) {
                        if (editable) {
                            this.getTextFieldState().replaceAll(newText);
                            this.setAutofillHighlightOn(true);
                            BuildersKt__Builders_commonKt.launch$default(this.getCoroutineScope(), null, null, new AnonymousClass1(this, null), 3, null);
                            return true;
                        }
                        return false;
                    }

                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* compiled from: TextFieldDecoratorModifier.kt */
                    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
                    @DebugMetadata(c = "androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$1$1", f = "TextFieldDecoratorModifier.kt", i = {}, l = {MetaDo.META_SETVIEWPORTORG}, m = "invokeSuspend", n = {}, s = {})
                    /* renamed from: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$1$1  reason: invalid class name */
                    /* loaded from: classes.dex */
                    public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                        int label;
                        final /* synthetic */ TextFieldDecoratorModifierNode this$0;

                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        AnonymousClass1(TextFieldDecoratorModifierNode textFieldDecoratorModifierNode, Continuation<? super AnonymousClass1> continuation) {
                            super(2, continuation);
                            this.this$0 = textFieldDecoratorModifierNode;
                        }

                        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                            return new AnonymousClass1(this.this$0, continuation);
                        }

                        @Override // kotlin.jvm.functions.Function2
                        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                            return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                        }

                        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                        public final Object invokeSuspend(Object $result) {
                            Object observeUntransformedTextChanges;
                            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                            switch (this.label) {
                                case 0:
                                    ResultKt.throwOnFailure($result);
                                    this.label = 1;
                                    observeUntransformedTextChanges = this.this$0.observeUntransformedTextChanges(this);
                                    if (observeUntransformedTextChanges == coroutine_suspended) {
                                        return coroutine_suspended;
                                    }
                                    break;
                                case 1:
                                    ResultKt.throwOnFailure($result);
                                    break;
                                default:
                                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                            }
                            return Unit.INSTANCE;
                        }
                    }
                }, 1, null);
                SemanticsPropertiesKt.getTextLayoutResult$default($this$applySemantics, null, new Function1<List<TextLayoutResult>, Boolean>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$2
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public final Boolean invoke(List<TextLayoutResult> list) {
                        TextLayoutResult result = TextFieldDecoratorModifierNode.this.getTextLayoutState().getLayoutResult();
                        return Boolean.valueOf(result != null ? list.add(result) : false);
                    }
                }, 1, null);
                if (editable) {
                    SemanticsPropertiesKt.setText$default($this$applySemantics, null, new Function1<AnnotatedString, Boolean>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$3
                        /* JADX INFO: Access modifiers changed from: package-private */
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        {
                            super(1);
                        }

                        @Override // kotlin.jvm.functions.Function1
                        public final Boolean invoke(AnnotatedString newText) {
                            if (editable) {
                                this.getTextFieldState().replaceAll(newText);
                                return true;
                            }
                            return false;
                        }
                    }, 1, null);
                    SemanticsPropertiesKt.insertTextAtCursor$default($this$applySemantics, null, new Function1<AnnotatedString, Boolean>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$4
                        /* JADX INFO: Access modifiers changed from: package-private */
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        {
                            super(1);
                        }

                        @Override // kotlin.jvm.functions.Function1
                        public final Boolean invoke(AnnotatedString newText) {
                            if (editable) {
                                TransformedTextFieldState.replaceSelectedText$default(this.getTextFieldState(), newText, true, null, false, 12, null);
                                return true;
                            }
                            return false;
                        }
                    }, 1, null);
                }
                SemanticsPropertiesKt.setSelection$default($this$applySemantics, null, new Function3<Integer, Integer, Boolean, Boolean>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$5
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(3);
                    }

                    @Override // kotlin.jvm.functions.Function3
                    public /* bridge */ /* synthetic */ Boolean invoke(Integer num, Integer num2, Boolean bool) {
                        return invoke(num.intValue(), num2.intValue(), bool.booleanValue());
                    }

                    public final Boolean invoke(int start, int end, boolean relativeToOriginal) {
                        TextFieldCharSequence text2;
                        TextFieldDecoratorModifierNode textFieldDecoratorModifierNode = TextFieldDecoratorModifierNode.this;
                        if (relativeToOriginal) {
                            text2 = textFieldDecoratorModifierNode.getTextFieldState().getUntransformedText();
                        } else {
                            text2 = textFieldDecoratorModifierNode.getTextFieldState().getVisualText();
                        }
                        long selection2 = text2.m1456getSelectiond9O1mEE();
                        if (!TextFieldDecoratorModifierNode.this.getEnabled() || Math.min(start, end) < 0 || Math.max(start, end) > text2.length()) {
                            return false;
                        }
                        if (start == TextRange.m6339getStartimpl(selection2) && end == TextRange.m6334getEndimpl(selection2)) {
                            return true;
                        }
                        long selectionRange = TextRangeKt.TextRange(start, end);
                        if (relativeToOriginal || start == end) {
                            TextFieldDecoratorModifierNode.this.getTextFieldSelectionState().updateTextToolbarState(TextToolbarState.None);
                        } else {
                            TextFieldDecoratorModifierNode.this.getTextFieldSelectionState().updateTextToolbarState(TextToolbarState.Selection);
                        }
                        TextFieldDecoratorModifierNode textFieldDecoratorModifierNode2 = TextFieldDecoratorModifierNode.this;
                        if (relativeToOriginal) {
                            textFieldDecoratorModifierNode2.getTextFieldState().m1585selectUntransformedCharsIn5zctL8(selectionRange);
                        } else {
                            textFieldDecoratorModifierNode2.getTextFieldState().m1584selectCharsIn5zctL8(selectionRange);
                        }
                        return true;
                    }
                }, 1, null);
                final int effectiveImeAction = this.keyboardOptions.m1334getImeActionOrDefaulteUduSuo$foundation_release();
                SemanticsPropertiesKt.m6119onImeAction9UiTYpY$default($this$applySemantics, effectiveImeAction, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$6
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(0);
                    }

                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // kotlin.jvm.functions.Function0
                    public final Boolean invoke() {
                        TextFieldDecoratorModifierNode.this.m1551onImeActionPerformedKlQnJC8(effectiveImeAction);
                        return true;
                    }
                }, 2, null);
                SemanticsPropertiesKt.onClick$default($this$applySemantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$7
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(0);
                    }

                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // kotlin.jvm.functions.Function0
                    public final Boolean invoke() {
                        boolean isFocused;
                        SoftwareKeyboardController requireKeyboardController;
                        isFocused = TextFieldDecoratorModifierNode.this.isFocused();
                        TextFieldDecoratorModifierNode textFieldDecoratorModifierNode = TextFieldDecoratorModifierNode.this;
                        if (!isFocused) {
                            FocusRequesterModifierNodeKt.requestFocus(textFieldDecoratorModifierNode);
                        } else if (!textFieldDecoratorModifierNode.getReadOnly()) {
                            requireKeyboardController = TextFieldDecoratorModifierNode.this.requireKeyboardController();
                            requireKeyboardController.show();
                        }
                        return true;
                    }
                }, 1, null);
                SemanticsPropertiesKt.onLongClick$default($this$applySemantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$8
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(0);
                    }

                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // kotlin.jvm.functions.Function0
                    public final Boolean invoke() {
                        boolean isFocused;
                        isFocused = TextFieldDecoratorModifierNode.this.isFocused();
                        if (!isFocused) {
                            FocusRequesterModifierNodeKt.requestFocus(TextFieldDecoratorModifierNode.this);
                        }
                        TextFieldDecoratorModifierNode.this.getTextFieldSelectionState().updateTextToolbarState(TextToolbarState.Selection);
                        return true;
                    }
                }, 1, null);
                if (!TextRange.m6333getCollapsedimpl(selection) && !this.isPassword) {
                    SemanticsPropertiesKt.copyText$default($this$applySemantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$9
                        /* JADX INFO: Access modifiers changed from: package-private */
                        {
                            super(0);
                        }

                        /* JADX INFO: Access modifiers changed from: package-private */
                        /* compiled from: TextFieldDecoratorModifier.kt */
                        @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
                        @DebugMetadata(c = "androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$9$1", f = "TextFieldDecoratorModifier.kt", i = {}, l = {TypedValues.MotionType.TYPE_QUANTIZE_INTERPOLATOR_TYPE}, m = "invokeSuspend", n = {}, s = {})
                        /* renamed from: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$9$1  reason: invalid class name */
                        /* loaded from: classes.dex */
                        public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                            int label;
                            final /* synthetic */ TextFieldDecoratorModifierNode this$0;

                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            AnonymousClass1(TextFieldDecoratorModifierNode textFieldDecoratorModifierNode, Continuation<? super AnonymousClass1> continuation) {
                                super(2, continuation);
                                this.this$0 = textFieldDecoratorModifierNode;
                            }

                            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                            public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                                return new AnonymousClass1(this.this$0, continuation);
                            }

                            @Override // kotlin.jvm.functions.Function2
                            public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                                return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                            }

                            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                            public final Object invokeSuspend(Object $result) {
                                Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                                switch (this.label) {
                                    case 0:
                                        ResultKt.throwOnFailure($result);
                                        this.label = 1;
                                        if (TextFieldSelectionState.copy$default(this.this$0.getTextFieldSelectionState(), false, this, 1, null) == coroutine_suspended) {
                                            return coroutine_suspended;
                                        }
                                        break;
                                    case 1:
                                        ResultKt.throwOnFailure($result);
                                        break;
                                    default:
                                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                                }
                                return Unit.INSTANCE;
                            }
                        }

                        /* JADX WARN: Can't rename method to resolve collision */
                        @Override // kotlin.jvm.functions.Function0
                        public final Boolean invoke() {
                            BuildersKt__Builders_commonKt.launch$default(TextFieldDecoratorModifierNode.this.getCoroutineScope(), null, null, new AnonymousClass1(TextFieldDecoratorModifierNode.this, null), 3, null);
                            return true;
                        }
                    }, 1, null);
                    if (this.enabled && !this.readOnly) {
                        SemanticsPropertiesKt.cutText$default($this$applySemantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$10
                            /* JADX INFO: Access modifiers changed from: package-private */
                            {
                                super(0);
                            }

                            /* JADX INFO: Access modifiers changed from: package-private */
                            /* compiled from: TextFieldDecoratorModifier.kt */
                            @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
                            @DebugMetadata(c = "androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$10$1", f = "TextFieldDecoratorModifier.kt", i = {}, l = {616}, m = "invokeSuspend", n = {}, s = {})
                            /* renamed from: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$10$1  reason: invalid class name */
                            /* loaded from: classes.dex */
                            public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                                int label;
                                final /* synthetic */ TextFieldDecoratorModifierNode this$0;

                                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                AnonymousClass1(TextFieldDecoratorModifierNode textFieldDecoratorModifierNode, Continuation<? super AnonymousClass1> continuation) {
                                    super(2, continuation);
                                    this.this$0 = textFieldDecoratorModifierNode;
                                }

                                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                                public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                                    return new AnonymousClass1(this.this$0, continuation);
                                }

                                @Override // kotlin.jvm.functions.Function2
                                public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                                    return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                                }

                                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                                public final Object invokeSuspend(Object $result) {
                                    Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                                    switch (this.label) {
                                        case 0:
                                            ResultKt.throwOnFailure($result);
                                            this.label = 1;
                                            if (this.this$0.getTextFieldSelectionState().cut(this) == coroutine_suspended) {
                                                return coroutine_suspended;
                                            }
                                            break;
                                        case 1:
                                            ResultKt.throwOnFailure($result);
                                            break;
                                        default:
                                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                                    }
                                    return Unit.INSTANCE;
                                }
                            }

                            /* JADX WARN: Can't rename method to resolve collision */
                            @Override // kotlin.jvm.functions.Function0
                            public final Boolean invoke() {
                                BuildersKt__Builders_commonKt.launch$default(TextFieldDecoratorModifierNode.this.getCoroutineScope(), null, null, new AnonymousClass1(TextFieldDecoratorModifierNode.this, null), 3, null);
                                return true;
                            }
                        }, 1, null);
                    }
                }
                if (editable) {
                    SemanticsPropertiesKt.pasteText$default($this$applySemantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$11
                        /* JADX INFO: Access modifiers changed from: package-private */
                        {
                            super(0);
                        }

                        /* JADX INFO: Access modifiers changed from: package-private */
                        /* compiled from: TextFieldDecoratorModifier.kt */
                        @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
                        @DebugMetadata(c = "androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$11$1", f = "TextFieldDecoratorModifier.kt", i = {}, l = {623}, m = "invokeSuspend", n = {}, s = {})
                        /* renamed from: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$applySemantics$11$1  reason: invalid class name */
                        /* loaded from: classes.dex */
                        public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                            int label;
                            final /* synthetic */ TextFieldDecoratorModifierNode this$0;

                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            AnonymousClass1(TextFieldDecoratorModifierNode textFieldDecoratorModifierNode, Continuation<? super AnonymousClass1> continuation) {
                                super(2, continuation);
                                this.this$0 = textFieldDecoratorModifierNode;
                            }

                            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                            public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                                return new AnonymousClass1(this.this$0, continuation);
                            }

                            @Override // kotlin.jvm.functions.Function2
                            public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                                return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                            }

                            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                            public final Object invokeSuspend(Object $result) {
                                Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                                switch (this.label) {
                                    case 0:
                                        ResultKt.throwOnFailure($result);
                                        this.label = 1;
                                        if (this.this$0.getTextFieldSelectionState().paste(this) == coroutine_suspended) {
                                            return coroutine_suspended;
                                        }
                                        break;
                                    case 1:
                                        ResultKt.throwOnFailure($result);
                                        break;
                                    default:
                                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                                }
                                return Unit.INSTANCE;
                            }
                        }

                        /* JADX WARN: Can't rename method to resolve collision */
                        @Override // kotlin.jvm.functions.Function0
                        public final Boolean invoke() {
                            BuildersKt__Builders_commonKt.launch$default(TextFieldDecoratorModifierNode.this.getCoroutineScope(), null, null, new AnonymousClass1(TextFieldDecoratorModifierNode.this, null), 3, null);
                            return true;
                        }
                    }, 1, null);
                }
                InputTransformation it = this.filter;
                if (it != null) {
                    it.applySemantics($this$applySemantics);
                }
            }

            @Override // androidx.compose.ui.focus.FocusEventModifierNode
            public void onFocusEvent(FocusState focusState) {
                if (this.isElementFocused == focusState.isFocused()) {
                    return;
                }
                this.isElementFocused = focusState.isFocused();
                onFocusChange();
                boolean editable = this.enabled && !this.readOnly;
                if (focusState.isFocused()) {
                    if (editable) {
                        startInputSession(false);
                        return;
                    }
                    return;
                }
                disposeInputSession();
                TransformedTextFieldState $this$iv = this.textFieldState;
                TextFieldState $this$iv$iv = $this$iv.textFieldState;
                InputTransformation inputTransformation$iv$iv = $this$iv.inputTransformation;
                TextFieldEditUndoBehavior undoBehavior$iv$iv = TextFieldEditUndoBehavior.MergeIfPossible;
                $this$iv$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
                TextFieldBuffer $this$editUntransformedTextAsUser_u24lambda_u2411$iv = $this$iv$iv.getMainBuffer$foundation_release();
                $this$editUntransformedTextAsUser_u24lambda_u2411$iv.commitComposition$foundation_release();
                $this$iv.updateWedgeAffinity($this$editUntransformedTextAsUser_u24lambda_u2411$iv);
                $this$iv$iv.commitEditAsUser(inputTransformation$iv$iv, true, undoBehavior$iv$iv);
                this.textFieldState.collapseSelectionToMax();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public final void onFocusChange() {
                Job launch$default;
                this.textFieldSelectionState.setFocused(isFocused());
                if (isFocused() && this.observeChangesJob == null) {
                    launch$default = BuildersKt__Builders_commonKt.launch$default(getCoroutineScope(), null, null, new TextFieldDecoratorModifierNode$onFocusChange$1(this, null), 3, null);
                    this.observeChangesJob = launch$default;
                } else if (!isFocused()) {
                    Job job = this.observeChangesJob;
                    if (job != null) {
                        Job.DefaultImpls.cancel$default(job, (CancellationException) null, 1, (Object) null);
                    }
                    this.observeChangesJob = null;
                }
            }

            @Override // androidx.compose.ui.Modifier.Node
            public void onAttach() {
                onObservedReadsChanged();
                this.textFieldSelectionState.setReceiveContentConfiguration(this.receiveContentConfigurationProvider);
            }

            @Override // androidx.compose.ui.Modifier.Node
            public void onDetach() {
                disposeInputSession();
                this.textFieldSelectionState.setReceiveContentConfiguration(null);
            }

            @Override // androidx.compose.ui.node.GlobalPositionAwareModifierNode
            public void onGloballyPositioned(LayoutCoordinates coordinates) {
                this.textLayoutState.setDecoratorNodeCoordinates(coordinates);
            }

            @Override // androidx.compose.ui.node.PointerInputModifierNode
            /* renamed from: onPointerEvent-H0pRuoY */
            public void mo472onPointerEventH0pRuoY(PointerEvent pointerEvent, PointerEventPass pass, long bounds) {
                this.pointerInputNode.mo472onPointerEventH0pRuoY(pointerEvent, pass, bounds);
            }

            @Override // androidx.compose.ui.node.PointerInputModifierNode
            public void onCancelPointerInput() {
                this.pointerInputNode.onCancelPointerInput();
            }

            @Override // androidx.compose.ui.input.key.KeyInputModifierNode
            /* renamed from: onPreKeyEvent-ZmokQxo */
            public boolean mo473onPreKeyEventZmokQxo(KeyEvent event) {
                return this.textFieldKeyEventHandler.mo1483onPreKeyEventMyFupTE(event, this.textFieldState, this.textFieldSelectionState, (FocusManager) CompositionLocalConsumerModifierNodeKt.currentValueOf(this, CompositionLocalsKt.getLocalFocusManager()), requireKeyboardController());
            }

            @Override // androidx.compose.ui.input.key.KeyInputModifierNode
            /* renamed from: onKeyEvent-ZmokQxo */
            public boolean mo471onKeyEventZmokQxo(KeyEvent event) {
                return this.textFieldKeyEventHandler.mo1482onKeyEventCJ9ybgU(event, this.textFieldState, this.textLayoutState, this.textFieldSelectionState, this.clipboardKeyCommandsHandler, this.enabled && !this.readOnly, this.singleLine, new Function0<Unit>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$onKeyEvent$1
                    /* JADX INFO: Access modifiers changed from: package-private */
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
                        TextFieldDecoratorModifierNode.this.m1551onImeActionPerformedKlQnJC8(TextFieldDecoratorModifierNode.this.getKeyboardOptions().m1334getImeActionOrDefaulteUduSuo$foundation_release());
                    }
                });
            }

            @Override // androidx.compose.ui.node.ObserverModifierNode
            public void onObservedReadsChanged() {
                ObserverModifierNodeKt.observeReads(this, new Function0<Unit>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$onObservedReadsChanged$1
                    /* JADX INFO: Access modifiers changed from: package-private */
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
                        TextFieldDecoratorModifierNode.this.windowInfo = (WindowInfo) CompositionLocalConsumerModifierNodeKt.currentValueOf(TextFieldDecoratorModifierNode.this, CompositionLocalsKt.getLocalWindowInfo());
                        TextFieldDecoratorModifierNode.this.onFocusChange();
                    }
                });
            }

            @Override // androidx.compose.ui.node.LayoutAwareModifierNode
            public void onPlaced(LayoutCoordinates coordinates) {
                this.dragAndDropNode.onPlaced(coordinates);
            }

            @Override // androidx.compose.ui.node.LayoutAwareModifierNode
            /* renamed from: onRemeasured-ozmzZPI */
            public void mo632onRemeasuredozmzZPI(long size) {
                this.dragAndDropNode.mo632onRemeasuredozmzZPI(size);
            }

            /* JADX INFO: Access modifiers changed from: private */
            public final void startInputSession(boolean fromTap) {
                Job launch$default;
                if (fromTap || this.keyboardOptions.getShowKeyboardOnFocusOrDefault$foundation_release()) {
                    ReceiveContentConfiguration receiveContentConfiguration = ReceiveContentConfigurationKt.getReceiveContentConfiguration(this);
                    launch$default = BuildersKt__Builders_commonKt.launch$default(getCoroutineScope(), null, null, new TextFieldDecoratorModifierNode$startInputSession$1(this, receiveContentConfiguration, null), 3, null);
                    this.inputSessionJob = launch$default;
                }
            }

            private final void disposeInputSession() {
                Job job = this.inputSessionJob;
                if (job != null) {
                    Job.DefaultImpls.cancel$default(job, (CancellationException) null, 1, (Object) null);
                }
                this.inputSessionJob = null;
                MutableSharedFlow<Unit> mutableSharedFlow = this.stylusHandwritingTrigger;
                if (mutableSharedFlow != null) {
                    mutableSharedFlow.resetReplayCache();
                }
            }

            /* JADX INFO: Access modifiers changed from: private */
            public final SoftwareKeyboardController requireKeyboardController() {
                SoftwareKeyboardController softwareKeyboardController = (SoftwareKeyboardController) CompositionLocalConsumerModifierNodeKt.currentValueOf(this, CompositionLocalsKt.getLocalSoftwareKeyboardController());
                if (softwareKeyboardController != null) {
                    return softwareKeyboardController;
                }
                throw new IllegalStateException("No software keyboard controller".toString());
            }

            /* JADX INFO: Access modifiers changed from: private */
            public final void emitDragExitEvent() {
                HoverInteraction.Enter it = this.dragEnterEvent;
                if (it != null) {
                    this.interactionSource.tryEmit(new HoverInteraction.Exit(it));
                    this.dragEnterEvent = null;
                }
            }

            /* JADX INFO: Access modifiers changed from: private */
            /* renamed from: onImeActionPerformed-KlQnJC8  reason: not valid java name */
            public final void m1551onImeActionPerformedKlQnJC8(final int imeAction) {
                if (ImeAction.m6505equalsimpl0(imeAction, ImeAction.Companion.m6522getNoneeUduSuo()) || ImeAction.m6505equalsimpl0(imeAction, ImeAction.Companion.m6518getDefaulteUduSuo()) || this.keyboardActionHandler == null) {
                    this.keyboardActionScope.mo1320defaultKeyboardActionKlQnJC8(imeAction);
                    return;
                }
                KeyboardActionHandler keyboardActionHandler = this.keyboardActionHandler;
                if (keyboardActionHandler != null) {
                    keyboardActionHandler.onKeyboardAction(new Function0<Unit>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldDecoratorModifierNode$onImeActionPerformed$1
                        /* JADX INFO: Access modifiers changed from: package-private */
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
                            TextFieldDecoratorModifierNode$keyboardActionScope$1 textFieldDecoratorModifierNode$keyboardActionScope$1;
                            textFieldDecoratorModifierNode$keyboardActionScope$1 = TextFieldDecoratorModifierNode.this.keyboardActionScope;
                            textFieldDecoratorModifierNode$keyboardActionScope$1.mo1320defaultKeyboardActionKlQnJC8(imeAction);
                        }
                    });
                }
            }
        }
