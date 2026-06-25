package androidx.compose.foundation;

import android.view.KeyEvent;
import androidx.collection.LongObjectMap;
import androidx.collection.LongObjectMapKt;
import androidx.collection.MutableLongObjectMap;
import androidx.compose.foundation.gestures.PressGestureScope;
import androidx.compose.foundation.interaction.HoverInteraction;
import androidx.compose.foundation.interaction.InteractionSourceKt;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.interaction.PressInteraction;
import androidx.compose.ui.focus.Focusability;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.input.key.KeyEvent_androidKt;
import androidx.compose.ui.input.key.KeyInputModifierNode;
import androidx.compose.ui.input.pointer.PointerEvent;
import androidx.compose.ui.input.pointer.PointerEventPass;
import androidx.compose.ui.input.pointer.PointerEventType;
import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import androidx.compose.ui.input.pointer.PointerInputScope;
import androidx.compose.ui.input.pointer.SuspendingPointerInputFilterKt;
import androidx.compose.ui.input.pointer.SuspendingPointerInputModifierNode;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.PointerInputModifierNode;
import androidx.compose.ui.node.SemanticsModifierNode;
import androidx.compose.ui.node.SemanticsModifierNodeKt;
import androidx.compose.ui.node.TraversableNode;
import androidx.compose.ui.semantics.Role;
import androidx.compose.ui.semantics.SemanticsPropertiesKt;
import androidx.compose.ui.semantics.SemanticsPropertyReceiver;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntSizeKt;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.core.app.NotificationCompat;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScopeKt;
/* compiled from: Clickable.kt */
@Metadata(d1 = {"\u0000°\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b \u0018\u0000 a2\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u00042\u00020\u0005:\u0001aBC\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f\u0012\f\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00120\u0011¢\u0006\u0002\u0010\u0013J\b\u00102\u001a\u00020\u000bH\u0002J\b\u00103\u001a\u00020\u0012H\u0004J\b\u00104\u001a\u00020\u0012H\u0002J\b\u00105\u001a\u00020\u0012H\u0002J\b\u00106\u001a\u00020\u0012H\u0002J\u0006\u00107\u001a\u00020\u0012J\b\u00108\u001a\u00020\u0012H\u0014J\u0006\u00109\u001a\u00020\u0012J\u001a\u0010:\u001a\u00020\u000b2\u0006\u0010;\u001a\u00020<H$ø\u0001\u0000¢\u0006\u0004\b=\u0010>J\u001a\u0010?\u001a\u00020\u000b2\u0006\u0010;\u001a\u00020<H$ø\u0001\u0000¢\u0006\u0004\b@\u0010>J\u0006\u0010A\u001a\u00020\u0012J\u0010\u0010B\u001a\u00020\u00122\u0006\u0010C\u001a\u00020\u000bH\u0002J\u0018\u0010D\u001a\u00020\u000b2\u0006\u0010;\u001a\u00020<ø\u0001\u0000¢\u0006\u0004\bE\u0010>J(\u0010F\u001a\u00020\u00122\u0006\u0010G\u001a\u00020H2\u0006\u0010I\u001a\u00020J2\u0006\u0010K\u001a\u00020Lø\u0001\u0000¢\u0006\u0004\bM\u0010NJ\u0018\u0010O\u001a\u00020\u000b2\u0006\u0010;\u001a\u00020<ø\u0001\u0000¢\u0006\u0004\bP\u0010>J\u000f\u0010Q\u001a\u0004\u0018\u00010\u0012H\u0004¢\u0006\u0002\u0010RJ\b\u0010S\u001a\u00020\u000bH\u0002JN\u0010T\u001a\u00020\u00122\b\u0010\u0006\u001a\u0004\u0018\u00010\u00072\b\u0010\b\u001a\u0004\u0018\u00010\t2\u0006\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\f\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00120\u0011H\u0004ø\u0001\u0000¢\u0006\u0002\bUJ\f\u0010V\u001a\u00020\u0012*\u00020WH\u0016J\n\u0010X\u001a\u00020\u0012*\u00020WJ\u0012\u0010Y\u001a\u00020\u0012*\u00020ZH¦@¢\u0006\u0002\u0010[J\u001f\u0010\\\u001a\u00020\u0012*\u00020]2\u0006\u0010^\u001a\u00020\u0015H\u0084@ø\u0001\u0000¢\u0006\u0004\b_\u0010`R\u0016\u0010\u0014\u001a\u00020\u0015X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0016R\u0014\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00190\u0018X\u0082\u0004¢\u0006\u0002\n\u0000R\u001e\u0010\n\u001a\u00020\u000b2\u0006\u0010\u001a\u001a\u00020\u000b@BX\u0084\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001cR\u000e\u0010\u001d\u001a\u00020\u001eX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u001f\u001a\u0004\u0018\u00010 X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010!\u001a\u0004\u0018\u00010\"X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\b\u001a\u0004\u0018\u00010\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010#\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R*\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00120\u00112\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00120\u0011@BX\u0084\u000e¢\u0006\b\n\u0000\u001a\u0004\b$\u0010%R\u0010\u0010\f\u001a\u0004\u0018\u00010\rX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010&\u001a\u0004\u0018\u00010'X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010(\u001a\u0004\u0018\u00010\u0019X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0002\n\u0000R\u0014\u0010)\u001a\u00020\u000bX\u0086D¢\u0006\b\n\u0000\u001a\u0004\b*\u0010\u001cR\u0011\u0010+\u001a\u00020\u000b8F¢\u0006\u0006\u001a\u0004\b,\u0010\u001cR\u0014\u0010-\u001a\u00020.X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b/\u00100R\u0010\u00101\u001a\u0004\u0018\u00010\u0007X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006b"}, d2 = {"Landroidx/compose/foundation/AbstractClickableNode;", "Landroidx/compose/ui/node/DelegatingNode;", "Landroidx/compose/ui/node/PointerInputModifierNode;", "Landroidx/compose/ui/input/key/KeyInputModifierNode;", "Landroidx/compose/ui/node/SemanticsModifierNode;", "Landroidx/compose/ui/node/TraversableNode;", "interactionSource", "Landroidx/compose/foundation/interaction/MutableInteractionSource;", "indicationNodeFactory", "Landroidx/compose/foundation/IndicationNodeFactory;", "enabled", "", "onClickLabel", "", "role", "Landroidx/compose/ui/semantics/Role;", "onClick", "Lkotlin/Function0;", "", "(Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/foundation/IndicationNodeFactory;ZLjava/lang/String;Landroidx/compose/ui/semantics/Role;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "centerOffset", "Landroidx/compose/ui/geometry/Offset;", "J", "currentKeyPressInteractions", "Landroidx/collection/MutableLongObjectMap;", "Landroidx/compose/foundation/interaction/PressInteraction$Press;", "<set-?>", "getEnabled", "()Z", "focusableNode", "Landroidx/compose/foundation/FocusableNode;", "hoverInteraction", "Landroidx/compose/foundation/interaction/HoverInteraction$Enter;", "indicationNode", "Landroidx/compose/ui/node/DelegatableNode;", "lazilyCreateIndication", "getOnClick", "()Lkotlin/jvm/functions/Function0;", "pointerInputNode", "Landroidx/compose/ui/input/pointer/SuspendingPointerInputModifierNode;", "pressInteraction", "shouldAutoInvalidate", "getShouldAutoInvalidate", "shouldMergeDescendantSemantics", "getShouldMergeDescendantSemantics", "traverseKey", "", "getTraverseKey", "()Ljava/lang/Object;", "userProvidedInteractionSource", "delayPressInteraction", "disposeInteractions", "emitHoverEnter", "emitHoverExit", "initializeIndicationAndInteractionSourceIfNeeded", "onAttach", "onCancelKeyInput", "onCancelPointerInput", "onClickKeyDownEvent", NotificationCompat.CATEGORY_EVENT, "Landroidx/compose/ui/input/key/KeyEvent;", "onClickKeyDownEvent-ZmokQxo", "(Landroid/view/KeyEvent;)Z", "onClickKeyUpEvent", "onClickKeyUpEvent-ZmokQxo", "onDetach", "onFocusChange", "isFocused", "onKeyEvent", "onKeyEvent-ZmokQxo", "onPointerEvent", "pointerEvent", "Landroidx/compose/ui/input/pointer/PointerEvent;", "pass", "Landroidx/compose/ui/input/pointer/PointerEventPass;", "bounds", "Landroidx/compose/ui/unit/IntSize;", "onPointerEvent-H0pRuoY", "(Landroidx/compose/ui/input/pointer/PointerEvent;Landroidx/compose/ui/input/pointer/PointerEventPass;J)V", "onPreKeyEvent", "onPreKeyEvent-ZmokQxo", "resetPointerInputHandler", "()Lkotlin/Unit;", "shouldLazilyCreateIndication", "updateCommon", "updateCommon-QzZPfjk", "applyAdditionalSemantics", "Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;", "applySemantics", "clickPointerInput", "Landroidx/compose/ui/input/pointer/PointerInputScope;", "(Landroidx/compose/ui/input/pointer/PointerInputScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "handlePressInteraction", "Landroidx/compose/foundation/gestures/PressGestureScope;", TypedValues.CycleType.S_WAVE_OFFSET, "handlePressInteraction-d-4ec7I", "(Landroidx/compose/foundation/gestures/PressGestureScope;JLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "TraverseKey", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public abstract class AbstractClickableNode extends DelegatingNode implements PointerInputModifierNode, KeyInputModifierNode, SemanticsModifierNode, TraversableNode {
    private long centerOffset;
    private final MutableLongObjectMap<PressInteraction.Press> currentKeyPressInteractions;
    private boolean enabled;
    private final FocusableNode focusableNode;
    private HoverInteraction.Enter hoverInteraction;
    private DelegatableNode indicationNode;
    private IndicationNodeFactory indicationNodeFactory;
    private MutableInteractionSource interactionSource;
    private boolean lazilyCreateIndication;
    private Function0<Unit> onClick;
    private String onClickLabel;
    private SuspendingPointerInputModifierNode pointerInputNode;
    private PressInteraction.Press pressInteraction;
    private Role role;
    private final boolean shouldAutoInvalidate;
    private final Object traverseKey;
    private MutableInteractionSource userProvidedInteractionSource;
    public static final TraverseKey TraverseKey = new TraverseKey(null);
    public static final int $stable = 8;

    public /* synthetic */ AbstractClickableNode(MutableInteractionSource mutableInteractionSource, IndicationNodeFactory indicationNodeFactory, boolean z, String str, Role role, Function0 function0, DefaultConstructorMarker defaultConstructorMarker) {
        this(mutableInteractionSource, indicationNodeFactory, z, str, role, function0);
    }

    public abstract Object clickPointerInput(PointerInputScope pointerInputScope, Continuation<? super Unit> continuation);

    /* renamed from: onClickKeyDownEvent-ZmokQxo  reason: not valid java name */
    protected abstract boolean mo469onClickKeyDownEventZmokQxo(KeyEvent keyEvent);

    /* renamed from: onClickKeyUpEvent-ZmokQxo  reason: not valid java name */
    protected abstract boolean mo470onClickKeyUpEventZmokQxo(KeyEvent keyEvent);

    private AbstractClickableNode(MutableInteractionSource interactionSource, IndicationNodeFactory indicationNodeFactory, boolean enabled, String onClickLabel, Role role, Function0<Unit> function0) {
        this.interactionSource = interactionSource;
        this.indicationNodeFactory = indicationNodeFactory;
        this.onClickLabel = onClickLabel;
        this.role = role;
        this.enabled = enabled;
        this.onClick = function0;
        this.focusableNode = new FocusableNode(this.interactionSource, Focusability.Companion.m3986getSystemDefinedLCbbffg(), new AbstractClickableNode$focusableNode$1(this), null);
        this.currentKeyPressInteractions = LongObjectMapKt.mutableLongObjectMapOf();
        this.centerOffset = Offset.Companion.m4064getZeroF1C5BW0();
        this.userProvidedInteractionSource = this.interactionSource;
        this.lazilyCreateIndication = shouldLazilyCreateIndication();
        this.traverseKey = TraverseKey;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final boolean getEnabled() {
        return this.enabled;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final Function0<Unit> getOnClick() {
        return this.onClick;
    }

    @Override // androidx.compose.ui.Modifier.Node
    public final boolean getShouldAutoInvalidate() {
        return this.shouldAutoInvalidate;
    }

    private final boolean shouldLazilyCreateIndication() {
        return this.userProvidedInteractionSource == null && this.indicationNodeFactory != null;
    }

    public void applyAdditionalSemantics(SemanticsPropertyReceiver $this$applyAdditionalSemantics) {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* renamed from: updateCommon-QzZPfjk  reason: not valid java name */
    public final void m474updateCommonQzZPfjk(MutableInteractionSource interactionSource, IndicationNodeFactory indicationNodeFactory, boolean enabled, String onClickLabel, Role role, Function0<Unit> function0) {
        boolean isIndicationNodeDirty = false;
        if (!Intrinsics.areEqual(this.userProvidedInteractionSource, interactionSource)) {
            disposeInteractions();
            this.userProvidedInteractionSource = interactionSource;
            this.interactionSource = interactionSource;
            isIndicationNodeDirty = true;
        }
        if (!Intrinsics.areEqual(this.indicationNodeFactory, indicationNodeFactory)) {
            this.indicationNodeFactory = indicationNodeFactory;
            isIndicationNodeDirty = true;
        }
        if (this.enabled != enabled) {
            FocusableNode focusableNode = this.focusableNode;
            if (enabled) {
                delegate(focusableNode);
            } else {
                undelegate(focusableNode);
                disposeInteractions();
            }
            SemanticsModifierNodeKt.invalidateSemantics(this);
            this.enabled = enabled;
        }
        if (!Intrinsics.areEqual(this.onClickLabel, onClickLabel)) {
            this.onClickLabel = onClickLabel;
            SemanticsModifierNodeKt.invalidateSemantics(this);
        }
        if (!Intrinsics.areEqual(this.role, role)) {
            this.role = role;
            SemanticsModifierNodeKt.invalidateSemantics(this);
        }
        this.onClick = function0;
        if (this.lazilyCreateIndication != shouldLazilyCreateIndication()) {
            this.lazilyCreateIndication = shouldLazilyCreateIndication();
            if (!this.lazilyCreateIndication && this.indicationNode == null) {
                isIndicationNodeDirty = true;
            }
        }
        if (isIndicationNodeDirty && (this.indicationNode != null || !this.lazilyCreateIndication)) {
            DelegatableNode it = this.indicationNode;
            if (it != null) {
                undelegate(it);
            }
            this.indicationNode = null;
            initializeIndicationAndInteractionSourceIfNeeded();
        }
        this.focusableNode.update(this.interactionSource);
    }

    @Override // androidx.compose.ui.Modifier.Node
    public final void onAttach() {
        if (!this.lazilyCreateIndication) {
            initializeIndicationAndInteractionSourceIfNeeded();
        }
        if (this.enabled) {
            delegate(this.focusableNode);
        }
    }

    @Override // androidx.compose.ui.Modifier.Node
    public final void onDetach() {
        disposeInteractions();
        if (this.userProvidedInteractionSource == null) {
            this.interactionSource = null;
        }
        DelegatableNode it = this.indicationNode;
        if (it != null) {
            undelegate(it);
        }
        this.indicationNode = null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void disposeInteractions() {
        int $i$f$forEachValue;
        int i;
        int $i$f$forEachValue2;
        MutableInteractionSource interactionSource = this.interactionSource;
        if (interactionSource != null) {
            int i2 = 0;
            PressInteraction.Press oldValue = this.pressInteraction;
            if (oldValue != null) {
                PressInteraction.Cancel interaction = new PressInteraction.Cancel(oldValue);
                interactionSource.tryEmit(interaction);
            }
            HoverInteraction.Enter oldValue2 = this.hoverInteraction;
            if (oldValue2 != null) {
                HoverInteraction.Exit interaction2 = new HoverInteraction.Exit(oldValue2);
                interactionSource.tryEmit(interaction2);
            }
            LongObjectMap this_$iv = this.currentKeyPressInteractions;
            int $i$f$forEachValue3 = 0;
            Object[] v$iv = this_$iv.values;
            long[] m$iv$iv = this_$iv.metadata;
            int lastIndex$iv$iv = m$iv$iv.length - 2;
            int i$iv$iv = 0;
            if (0 <= lastIndex$iv$iv) {
                while (true) {
                    long slot$iv$iv = m$iv$iv[i$iv$iv];
                    int i3 = i2;
                    LongObjectMap this_$iv2 = this_$iv;
                    if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                        $i$f$forEachValue = $i$f$forEachValue3;
                    } else {
                        int i4 = 8;
                        int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                        int j$iv$iv = 0;
                        while (j$iv$iv < bitCount$iv$iv) {
                            long value$iv$iv$iv = 255 & slot$iv$iv;
                            if (!(value$iv$iv$iv < 128)) {
                                i = i4;
                                $i$f$forEachValue2 = $i$f$forEachValue3;
                            } else {
                                int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                                i = i4;
                                PressInteraction.Press it = (PressInteraction.Press) v$iv[index$iv$iv];
                                $i$f$forEachValue2 = $i$f$forEachValue3;
                                interactionSource.tryEmit(new PressInteraction.Cancel(it));
                            }
                            slot$iv$iv >>= i;
                            j$iv$iv++;
                            i4 = i;
                            $i$f$forEachValue3 = $i$f$forEachValue2;
                        }
                        $i$f$forEachValue = $i$f$forEachValue3;
                        if (bitCount$iv$iv != i4) {
                            break;
                        }
                    }
                    if (i$iv$iv == lastIndex$iv$iv) {
                        break;
                    }
                    i$iv$iv++;
                    i2 = i3;
                    this_$iv = this_$iv2;
                    $i$f$forEachValue3 = $i$f$forEachValue;
                }
            }
        }
        this.pressInteraction = null;
        this.hoverInteraction = null;
        this.currentKeyPressInteractions.clear();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void onFocusChange(boolean isFocused) {
        LongObjectMap this_$iv;
        int $i$f$forEachValue;
        LongObjectMap this_$iv2;
        int $i$f$forEachValue2;
        int i;
        if (isFocused) {
            initializeIndicationAndInteractionSourceIfNeeded();
            return;
        }
        if (this.interactionSource != null) {
            LongObjectMap this_$iv3 = this.currentKeyPressInteractions;
            int $i$f$forEachValue3 = 0;
            Object[] v$iv = this_$iv3.values;
            long[] m$iv$iv = this_$iv3.metadata;
            int lastIndex$iv$iv = m$iv$iv.length - 2;
            int i$iv$iv = 0;
            if (0 <= lastIndex$iv$iv) {
                while (true) {
                    long slot$iv$iv = m$iv$iv[i$iv$iv];
                    long $this$maskEmptyOrDeleted$iv$iv$iv = ((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L);
                    if ($this$maskEmptyOrDeleted$iv$iv$iv == -9187201950435737472L) {
                        this_$iv = this_$iv3;
                        $i$f$forEachValue = $i$f$forEachValue3;
                    } else {
                        int i2 = 8;
                        int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                        int j$iv$iv = 0;
                        while (j$iv$iv < bitCount$iv$iv) {
                            long value$iv$iv$iv = 255 & slot$iv$iv;
                            if (!(value$iv$iv$iv < 128)) {
                                this_$iv2 = this_$iv3;
                                $i$f$forEachValue2 = $i$f$forEachValue3;
                                i = i2;
                            } else {
                                int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                                i = i2;
                                PressInteraction.Press it = (PressInteraction.Press) v$iv[index$iv$iv];
                                this_$iv2 = this_$iv3;
                                $i$f$forEachValue2 = $i$f$forEachValue3;
                                BuildersKt__Builders_commonKt.launch$default(getCoroutineScope(), null, null, new AbstractClickableNode$onFocusChange$1$1(this, it, null), 3, null);
                            }
                            slot$iv$iv >>= i;
                            j$iv$iv++;
                            i2 = i;
                            this_$iv3 = this_$iv2;
                            $i$f$forEachValue3 = $i$f$forEachValue2;
                        }
                        this_$iv = this_$iv3;
                        $i$f$forEachValue = $i$f$forEachValue3;
                        if (bitCount$iv$iv != i2) {
                            break;
                        }
                    }
                    if (i$iv$iv == lastIndex$iv$iv) {
                        break;
                    }
                    i$iv$iv++;
                    this_$iv3 = this_$iv;
                    $i$f$forEachValue3 = $i$f$forEachValue;
                }
            }
        }
        this.currentKeyPressInteractions.clear();
        onCancelKeyInput();
    }

    private final void initializeIndicationAndInteractionSourceIfNeeded() {
        IndicationNodeFactory indicationNodeFactory;
        if (this.indicationNode == null && (indicationNodeFactory = this.indicationNodeFactory) != null) {
            if (this.interactionSource == null) {
                this.interactionSource = InteractionSourceKt.MutableInteractionSource();
            }
            this.focusableNode.update(this.interactionSource);
            MutableInteractionSource mutableInteractionSource = this.interactionSource;
            Intrinsics.checkNotNull(mutableInteractionSource);
            DelegatableNode node = indicationNodeFactory.create(mutableInteractionSource);
            delegate(node);
            this.indicationNode = node;
        }
    }

    @Override // androidx.compose.ui.node.PointerInputModifierNode
    /* renamed from: onPointerEvent-H0pRuoY  reason: not valid java name */
    public final void mo472onPointerEventH0pRuoY(PointerEvent pointerEvent, PointerEventPass pass, long bounds) {
        long $this$toOffset_u2d_u2dgyyYBs$iv = IntSizeKt.m7050getCenterozmzZPI(bounds);
        float x$iv$iv = IntOffset.m7001getXimpl($this$toOffset_u2d_u2dgyyYBs$iv);
        float y$iv$iv = IntOffset.m7002getYimpl($this$toOffset_u2d_u2dgyyYBs$iv);
        long v1$iv$iv$iv = Float.floatToRawIntBits(x$iv$iv);
        long v2$iv$iv$iv = Float.floatToRawIntBits(y$iv$iv);
        this.centerOffset = Offset.m4040constructorimpl((v1$iv$iv$iv << 32) | (4294967295L & v2$iv$iv$iv));
        initializeIndicationAndInteractionSourceIfNeeded();
        if (this.enabled && pass == PointerEventPass.Main) {
            int m5454getType7fucELk = pointerEvent.m5454getType7fucELk();
            if (PointerEventType.m5461equalsimpl0(m5454getType7fucELk, PointerEventType.Companion.m5465getEnter7fucELk())) {
                BuildersKt__Builders_commonKt.launch$default(getCoroutineScope(), null, null, new AbstractClickableNode$onPointerEvent$1(this, null), 3, null);
            } else if (PointerEventType.m5461equalsimpl0(m5454getType7fucELk, PointerEventType.Companion.m5466getExit7fucELk())) {
                BuildersKt__Builders_commonKt.launch$default(getCoroutineScope(), null, null, new AbstractClickableNode$onPointerEvent$2(this, null), 3, null);
            }
        }
        if (this.pointerInputNode == null) {
            this.pointerInputNode = (SuspendingPointerInputModifierNode) delegate(SuspendingPointerInputFilterKt.SuspendingPointerInputModifierNode(new PointerInputEventHandler() { // from class: androidx.compose.foundation.AbstractClickableNode$onPointerEvent$3
                @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
                public final Object invoke(PointerInputScope $this$SuspendingPointerInputModifierNode, Continuation<? super Unit> continuation) {
                    Object clickPointerInput = AbstractClickableNode.this.clickPointerInput($this$SuspendingPointerInputModifierNode, continuation);
                    return clickPointerInput == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? clickPointerInput : Unit.INSTANCE;
                }
            }));
        }
        SuspendingPointerInputModifierNode suspendingPointerInputModifierNode = this.pointerInputNode;
        if (suspendingPointerInputModifierNode != null) {
            suspendingPointerInputModifierNode.mo472onPointerEventH0pRuoY(pointerEvent, pass, bounds);
        }
    }

    @Override // androidx.compose.ui.node.PointerInputModifierNode
    public final void onCancelPointerInput() {
        HoverInteraction.Enter oldValue;
        MutableInteractionSource interactionSource = this.interactionSource;
        if (interactionSource != null && (oldValue = this.hoverInteraction) != null) {
            HoverInteraction.Exit interaction = new HoverInteraction.Exit(oldValue);
            interactionSource.tryEmit(interaction);
        }
        this.hoverInteraction = null;
        SuspendingPointerInputModifierNode suspendingPointerInputModifierNode = this.pointerInputNode;
        if (suspendingPointerInputModifierNode != null) {
            suspendingPointerInputModifierNode.onCancelPointerInput();
        }
    }

    @Override // androidx.compose.ui.input.key.KeyInputModifierNode
    /* renamed from: onKeyEvent-ZmokQxo  reason: not valid java name */
    public final boolean mo471onKeyEventZmokQxo(KeyEvent event) {
        initializeIndicationAndInteractionSourceIfNeeded();
        long keyCode = KeyEvent_androidKt.m5368getKeyZmokQxo(event);
        if (this.enabled && ClickableKt.m532access$isPressZmokQxo(event)) {
            boolean wasInteractionHandled = false;
            if (!this.currentKeyPressInteractions.containsKey(keyCode)) {
                PressInteraction.Press press = new PressInteraction.Press(this.centerOffset, null);
                this.currentKeyPressInteractions.set(keyCode, press);
                if (this.interactionSource != null) {
                    BuildersKt__Builders_commonKt.launch$default(getCoroutineScope(), null, null, new AbstractClickableNode$onKeyEvent$1(this, press, null), 3, null);
                }
                wasInteractionHandled = true;
            }
            return mo469onClickKeyDownEventZmokQxo(event) || wasInteractionHandled;
        } else if (this.enabled && ClickableKt.m531access$isClickZmokQxo(event)) {
            PressInteraction.Press press2 = this.currentKeyPressInteractions.remove(keyCode);
            if (press2 != null) {
                if (this.interactionSource != null) {
                    BuildersKt__Builders_commonKt.launch$default(getCoroutineScope(), null, null, new AbstractClickableNode$onKeyEvent$2(this, press2, null), 3, null);
                }
                mo470onClickKeyUpEventZmokQxo(event);
            }
            return press2 != null;
        } else {
            return false;
        }
    }

    protected void onCancelKeyInput() {
    }

    @Override // androidx.compose.ui.input.key.KeyInputModifierNode
    /* renamed from: onPreKeyEvent-ZmokQxo  reason: not valid java name */
    public final boolean mo473onPreKeyEventZmokQxo(KeyEvent event) {
        return false;
    }

    @Override // androidx.compose.ui.node.SemanticsModifierNode
    public final boolean getShouldMergeDescendantSemantics() {
        return true;
    }

    @Override // androidx.compose.ui.node.SemanticsModifierNode
    public final void applySemantics(SemanticsPropertyReceiver $this$applySemantics) {
        if (this.role != null) {
            Role role = this.role;
            Intrinsics.checkNotNull(role);
            SemanticsPropertiesKt.m6122setRolekuIjeqM($this$applySemantics, role.m6102unboximpl());
        }
        SemanticsPropertiesKt.onClick($this$applySemantics, this.onClickLabel, new Function0<Boolean>() { // from class: androidx.compose.foundation.AbstractClickableNode$applySemantics$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Boolean invoke() {
                AbstractClickableNode.this.getOnClick().invoke();
                return true;
            }
        });
        if (this.enabled) {
            FocusableNode $this$applySemantics_u24lambda_u2410 = this.focusableNode;
            $this$applySemantics_u24lambda_u2410.applySemantics($this$applySemantics);
        } else {
            SemanticsPropertiesKt.disabled($this$applySemantics);
        }
        applyAdditionalSemantics($this$applySemantics);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final Unit resetPointerInputHandler() {
        SuspendingPointerInputModifierNode suspendingPointerInputModifierNode = this.pointerInputNode;
        if (suspendingPointerInputModifierNode != null) {
            suspendingPointerInputModifierNode.resetPointerInputHandler();
            return Unit.INSTANCE;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* renamed from: handlePressInteraction-d-4ec7I  reason: not valid java name */
    public final Object m468handlePressInteractiond4ec7I(PressGestureScope $this$handlePressInteraction_u2dd_u2d4ec7I, long offset, Continuation<? super Unit> continuation) {
        Object coroutineScope;
        MutableInteractionSource interactionSource = this.interactionSource;
        if (interactionSource != null && (coroutineScope = CoroutineScopeKt.coroutineScope(new AbstractClickableNode$handlePressInteraction$2$1($this$handlePressInteraction_u2dd_u2d4ec7I, offset, interactionSource, this, null), continuation)) == IntrinsicsKt.getCOROUTINE_SUSPENDED()) {
            return coroutineScope;
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean delayPressInteraction() {
        return ClickableKt.hasScrollableContainer(this) || Clickable_androidKt.isComposeRootInScrollableContainer(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void emitHoverEnter() {
        if (this.hoverInteraction == null) {
            HoverInteraction.Enter interaction = new HoverInteraction.Enter();
            MutableInteractionSource interactionSource = this.interactionSource;
            if (interactionSource != null) {
                BuildersKt__Builders_commonKt.launch$default(getCoroutineScope(), null, null, new AbstractClickableNode$emitHoverEnter$1$1(interactionSource, interaction, null), 3, null);
            }
            this.hoverInteraction = interaction;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void emitHoverExit() {
        HoverInteraction.Enter oldValue = this.hoverInteraction;
        if (oldValue != null) {
            HoverInteraction.Exit interaction = new HoverInteraction.Exit(oldValue);
            MutableInteractionSource interactionSource = this.interactionSource;
            if (interactionSource != null) {
                BuildersKt__Builders_commonKt.launch$default(getCoroutineScope(), null, null, new AbstractClickableNode$emitHoverExit$1$1$1(interactionSource, interaction, null), 3, null);
            }
            this.hoverInteraction = null;
        }
    }

    @Override // androidx.compose.ui.node.TraversableNode
    public Object getTraverseKey() {
        return this.traverseKey;
    }

    /* compiled from: Clickable.kt */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/AbstractClickableNode$TraverseKey;", "", "()V", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class TraverseKey {
        public /* synthetic */ TraverseKey(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private TraverseKey() {
        }
    }
}
