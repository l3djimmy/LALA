package androidx.compose.ui.focus;

import android.view.KeyEvent;
import androidx.autofill.HintConstants;
import androidx.collection.MutableLongSet;
import androidx.collection.MutableObjectList;
import androidx.collection.ObjectList;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.ComposeUiFlags;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.input.key.KeyEventType;
import androidx.compose.ui.input.key.KeyEvent_androidKt;
import androidx.compose.ui.input.key.SoftKeyboardInterceptionModifierNode;
import androidx.compose.ui.input.rotary.RotaryInputModifierNode;
import androidx.compose.ui.input.rotary.RotaryScrollEvent;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.ModifierNodeElement;
import androidx.compose.ui.node.NodeChain;
import androidx.compose.ui.node.NodeKind;
import androidx.compose.ui.platform.InspectorInfo;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.core.app.NotificationCompat;
import androidx.exifinterface.media.ExifInterface;
import com.itextpdf.kernel.xmp.PdfConst;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.MutablePropertyReference0Impl;
import kotlin.jvm.internal.PropertyReference0Impl;
import kotlin.jvm.internal.Ref;
/* compiled from: FocusOwnerImpl.kt */
@Metadata(d1 = {"\u0000¬\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\b\u0000\u0018\u00002\u00020\u0001Bª\u0001\u0012\u0018\u0010\u0002\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00050\u0004\u0012\u0004\u0012\u00020\u00050\u0003\u0012:\u0010\u0006\u001a6\u0012\u0015\u0012\u0013\u0018\u00010\b¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\u000b\u0012\u0015\u0012\u0013\u0018\u00010\f¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\r\u0012\u0004\u0012\u00020\u000e0\u0007\u0012!\u0010\u000f\u001a\u001d\u0012\u0013\u0012\u00110\b¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\u000b\u0012\u0004\u0012\u00020\u000e0\u0003\u0012\f\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004\u0012\u000e\u0010\u0011\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\f0\u0004\u0012\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00130\u0004¢\u0006\u0002\u0010\u0014J\u0010\u00108\u001a\u00020\u00052\u0006\u00109\u001a\u00020\u000eH\u0016J\u001a\u00108\u001a\u00020\u000e2\b\b\u0002\u0010:\u001a\u00020\u000e2\u0006\u0010;\u001a\u00020\u000eH\u0002J2\u00108\u001a\u00020\u000e2\u0006\u00109\u001a\u00020\u000e2\u0006\u0010;\u001a\u00020\u000e2\u0006\u0010<\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\bH\u0016ø\u0001\u0000¢\u0006\u0004\b=\u0010>J\u001a\u0010?\u001a\u00020\u000e2\u0006\u0010@\u001a\u00020AH\u0016ø\u0001\u0000¢\u0006\u0004\bB\u0010CJ(\u0010D\u001a\u00020\u000e2\u0006\u0010@\u001a\u00020A2\f\u0010E\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0004H\u0016ø\u0001\u0000¢\u0006\u0004\bF\u0010GJ\u001e\u0010H\u001a\u00020\u000e2\u0006\u0010I\u001a\u00020J2\f\u0010E\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0004H\u0016J\n\u0010K\u001a\u0004\u0018\u00010\u0016H\u0002J:\u0010L\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u000b\u001a\u00020\b2\b\u0010M\u001a\u0004\u0018\u00010\f2\u0012\u0010N\u001a\u000e\u0012\u0004\u0012\u00020\u0016\u0012\u0004\u0012\u00020\u000e0\u0003H\u0016ø\u0001\u0000¢\u0006\u0004\bO\u0010PJ\n\u0010Q\u001a\u0004\u0018\u00010\fH\u0016J\b\u0010R\u001a\u00020\u0005H\u0002J\u001a\u0010S\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\bH\u0016ø\u0001\u0000¢\u0006\u0004\bT\u0010UJ\b\u0010V\u001a\u00020\u0005H\u0016J$\u0010W\u001a\u00020\u000e2\b\u0010\u000b\u001a\u0004\u0018\u00010\b2\b\u0010\r\u001a\u0004\u0018\u00010\fH\u0016ø\u0001\u0000¢\u0006\u0002\bXJ\u0010\u0010Y\u001a\u00020\u00052\u0006\u0010Z\u001a\u00020[H\u0016J\u0010\u0010Y\u001a\u00020\u00052\u0006\u0010Z\u001a\u00020\\H\u0016J\u0010\u0010Y\u001a\u00020\u00052\u0006\u0010Z\u001a\u00020\u0016H\u0016J\b\u0010]\u001a\u00020\u0005H\u0016J$\u0010^\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\b2\b\u0010\r\u001a\u0004\u0018\u00010\fH\u0016ø\u0001\u0000¢\u0006\u0004\b_\u0010`J\u001a\u0010a\u001a\u00020\u000e2\u0006\u0010@\u001a\u00020AH\u0002ø\u0001\u0000¢\u0006\u0004\bb\u0010CJ\u000e\u0010c\u001a\u0004\u0018\u00010d*\u00020eH\u0002J3\u0010f\u001a\u0004\u0018\u0001Hg\"\n\b\u0000\u0010g\u0018\u0001*\u00020h*\u00020e2\f\u0010i\u001a\b\u0012\u0004\u0012\u0002Hg0jH\u0082\bø\u0001\u0000¢\u0006\u0004\bk\u0010lJg\u0010m\u001a\u00020\u0005\"\n\b\u0000\u0010g\u0018\u0001*\u00020e*\u00020e2\f\u0010i\u001a\b\u0012\u0004\u0012\u0002Hg0j2\u0012\u0010n\u001a\u000e\u0012\u0004\u0012\u0002Hg\u0012\u0004\u0012\u00020\u00050\u00032\f\u0010o\u001a\b\u0012\u0004\u0012\u00020\u00050\u00042\u0012\u0010p\u001a\u000e\u0012\u0004\u0012\u0002Hg\u0012\u0004\u0012\u00020\u00050\u0003H\u0082\bø\u0001\u0000¢\u0006\u0004\bq\u0010rR(\u0010\u0017\u001a\u0004\u0018\u00010\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0016@VX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0018\u0010\u0019\"\u0004\b\u001a\u0010\u001bR\u000e\u0010\u001c\u001a\u00020\u001dX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u001e\u001a\u00020\u001fX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b \u0010!R$\u0010\"\u001a\u00020\u000e2\u0006\u0010\u0015\u001a\u00020\u000e@VX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\"\u0010#\"\u0004\b$\u0010%R\u0010\u0010&\u001a\u0004\u0018\u00010'X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010(\u001a\b\u0012\u0004\u0012\u00020*0)X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b+\u0010,R\u0014\u0010-\u001a\u00020.X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b/\u00100R\u0014\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010\u0011\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\f0\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00130\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R)\u0010\u000f\u001a\u001d\u0012\u0013\u0012\u00110\b¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\u000b\u0012\u0004\u0012\u00020\u000e0\u0003X\u0082\u0004¢\u0006\u0002\n\u0000RB\u0010\u0006\u001a6\u0012\u0015\u0012\u0013\u0018\u00010\b¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\u000b\u0012\u0015\u0012\u0013\u0018\u00010\f¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\r\u0012\u0004\u0012\u00020\u000e0\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u00101\u001a\u00020\u0016X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b2\u0010\u0019\"\u0004\b3\u0010\u001bR\u0014\u00104\u001a\u0002058VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b6\u00107\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006s"}, d2 = {"Landroidx/compose/ui/focus/FocusOwnerImpl;", "Landroidx/compose/ui/focus/FocusOwner;", "onRequestApplyChangesListener", "Lkotlin/Function1;", "Lkotlin/Function0;", "", "onRequestFocusForOwner", "Lkotlin/Function2;", "Landroidx/compose/ui/focus/FocusDirection;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "focusDirection", "Landroidx/compose/ui/geometry/Rect;", "previouslyFocusedRect", "", "onMoveFocusInterop", "onClearFocusForOwner", "onFocusRectInterop", "onLayoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V", "value", "Landroidx/compose/ui/focus/FocusTargetNode;", "activeFocusTargetNode", "getActiveFocusTargetNode", "()Landroidx/compose/ui/focus/FocusTargetNode;", "setActiveFocusTargetNode", "(Landroidx/compose/ui/focus/FocusTargetNode;)V", "focusInvalidationManager", "Landroidx/compose/ui/focus/FocusInvalidationManager;", "focusTransactionManager", "Landroidx/compose/ui/focus/FocusTransactionManager;", "getFocusTransactionManager", "()Landroidx/compose/ui/focus/FocusTransactionManager;", "isFocusCaptured", "()Z", "setFocusCaptured", "(Z)V", "keysCurrentlyDown", "Landroidx/collection/MutableLongSet;", "listeners", "Landroidx/collection/MutableObjectList;", "Landroidx/compose/ui/focus/FocusListener;", "getListeners", "()Landroidx/collection/MutableObjectList;", "modifier", "Landroidx/compose/ui/Modifier;", "getModifier", "()Landroidx/compose/ui/Modifier;", "rootFocusNode", "getRootFocusNode$ui_release", "setRootFocusNode$ui_release", "rootState", "Landroidx/compose/ui/focus/FocusState;", "getRootState", "()Landroidx/compose/ui/focus/FocusState;", "clearFocus", "force", "forced", "refreshFocusEvents", "clearOwnerFocus", "clearFocus-I7lrPNg", "(ZZZI)Z", "dispatchInterceptedSoftKeyboardEvent", "keyEvent", "Landroidx/compose/ui/input/key/KeyEvent;", "dispatchInterceptedSoftKeyboardEvent-ZmokQxo", "(Landroid/view/KeyEvent;)Z", "dispatchKeyEvent", "onFocusedItem", "dispatchKeyEvent-YhN2O0w", "(Landroid/view/KeyEvent;Lkotlin/jvm/functions/Function0;)Z", "dispatchRotaryEvent", NotificationCompat.CATEGORY_EVENT, "Landroidx/compose/ui/input/rotary/RotaryScrollEvent;", "findFocusTargetNode", "focusSearch", "focusedRect", "onFound", "focusSearch-ULY8qGw", "(ILandroidx/compose/ui/geometry/Rect;Lkotlin/jvm/functions/Function1;)Ljava/lang/Boolean;", "getFocusRect", "invalidateOwnerFocusState", "moveFocus", "moveFocus-3ESFkO8", "(I)Z", "releaseFocus", "requestFocusForOwner", "requestFocusForOwner-7o62pno", "scheduleInvalidation", "node", "Landroidx/compose/ui/focus/FocusEventModifierNode;", "Landroidx/compose/ui/focus/FocusPropertiesModifierNode;", "scheduleInvalidationForOwner", "takeFocus", "takeFocus-aToIllA", "(ILandroidx/compose/ui/geometry/Rect;)Z", "validateKeyEvent", "validateKeyEvent-ZmokQxo", "lastLocalKeyInputNode", "Landroidx/compose/ui/Modifier$Node;", "Landroidx/compose/ui/node/DelegatableNode;", "nearestAncestorIncludingSelf", ExifInterface.GPS_DIRECTION_TRUE, "", PdfConst.Type, "Landroidx/compose/ui/node/NodeKind;", "nearestAncestorIncludingSelf-64DMado", "(Landroidx/compose/ui/node/DelegatableNode;I)Ljava/lang/Object;", "traverseAncestorsIncludingSelf", "onPreVisit", "onVisit", "onPostVisit", "traverseAncestorsIncludingSelf-QFhIj7k", "(Landroidx/compose/ui/node/DelegatableNode;ILkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class FocusOwnerImpl implements FocusOwner {
    public static final int $stable = 8;
    private FocusTargetNode activeFocusTargetNode;
    private final FocusInvalidationManager focusInvalidationManager;
    private boolean isFocusCaptured;
    private MutableLongSet keysCurrentlyDown;
    private final Function0<Unit> onClearFocusForOwner;
    private final Function0<Rect> onFocusRectInterop;
    private final Function0<LayoutDirection> onLayoutDirection;
    private final Function1<FocusDirection, Boolean> onMoveFocusInterop;
    private final Function2<FocusDirection, Rect, Boolean> onRequestFocusForOwner;
    private FocusTargetNode rootFocusNode = new FocusTargetNode(Focusability.Companion.m3985getNeverLCbbffg(), null, null, 6, null);
    private final FocusTransactionManager focusTransactionManager = new FocusTransactionManager();
    private final Modifier modifier = new ModifierNodeElement<FocusTargetNode>() { // from class: androidx.compose.ui.focus.FocusOwnerImpl$modifier$1
        @Override // androidx.compose.ui.node.ModifierNodeElement
        public FocusTargetNode create() {
            return FocusOwnerImpl.this.getRootFocusNode$ui_release();
        }

        @Override // androidx.compose.ui.node.ModifierNodeElement
        public void update(FocusTargetNode node) {
        }

        @Override // androidx.compose.ui.node.ModifierNodeElement
        public void inspectableProperties(InspectorInfo $this$inspectableProperties) {
            $this$inspectableProperties.setName("RootFocusTarget");
        }

        @Override // androidx.compose.ui.node.ModifierNodeElement
        public int hashCode() {
            return FocusOwnerImpl.this.getRootFocusNode$ui_release().hashCode();
        }

        @Override // androidx.compose.ui.node.ModifierNodeElement
        public boolean equals(Object other) {
            return other == this;
        }
    };
    private final MutableObjectList<FocusListener> listeners = new MutableObjectList<>(1);

    /* compiled from: FocusOwnerImpl.kt */
    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[CustomDestinationResult.values().length];
            try {
                iArr[CustomDestinationResult.Redirected.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[CustomDestinationResult.Cancelled.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[CustomDestinationResult.RedirectCancelled.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[CustomDestinationResult.None.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public FocusOwnerImpl(Function1<? super Function0<Unit>, Unit> function1, Function2<? super FocusDirection, ? super Rect, Boolean> function2, Function1<? super FocusDirection, Boolean> function12, Function0<Unit> function0, Function0<Rect> function02, Function0<? extends LayoutDirection> function03) {
        this.onRequestFocusForOwner = function2;
        this.onMoveFocusInterop = function12;
        this.onClearFocusForOwner = function0;
        this.onFocusRectInterop = function02;
        this.onLayoutDirection = function03;
        this.focusInvalidationManager = new FocusInvalidationManager(function1, new FocusOwnerImpl$focusInvalidationManager$1(this), new PropertyReference0Impl(this) { // from class: androidx.compose.ui.focus.FocusOwnerImpl$focusInvalidationManager$2
            @Override // kotlin.jvm.internal.PropertyReference0Impl, kotlin.reflect.KProperty0
            public Object get() {
                return ((FocusOwnerImpl) this.receiver).getRootState();
            }
        }, new MutablePropertyReference0Impl(this) { // from class: androidx.compose.ui.focus.FocusOwnerImpl$focusInvalidationManager$3
            @Override // kotlin.jvm.internal.MutablePropertyReference0Impl, kotlin.reflect.KProperty0
            public Object get() {
                return ((FocusOwnerImpl) this.receiver).getActiveFocusTargetNode();
            }

            @Override // kotlin.jvm.internal.MutablePropertyReference0Impl, kotlin.reflect.KMutableProperty0
            public void set(Object value) {
                ((FocusOwnerImpl) this.receiver).setActiveFocusTargetNode((FocusTargetNode) value);
            }
        });
    }

    public final FocusTargetNode getRootFocusNode$ui_release() {
        return this.rootFocusNode;
    }

    public final void setRootFocusNode$ui_release(FocusTargetNode focusTargetNode) {
        this.rootFocusNode = focusTargetNode;
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public FocusTransactionManager getFocusTransactionManager() {
        return this.focusTransactionManager;
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public Modifier getModifier() {
        return this.modifier;
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    /* renamed from: requestFocusForOwner-7o62pno */
    public boolean mo3951requestFocusForOwner7o62pno(FocusDirection focusDirection, Rect previouslyFocusedRect) {
        return this.onRequestFocusForOwner.invoke(focusDirection, previouslyFocusedRect).booleanValue();
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    /* renamed from: takeFocus-aToIllA */
    public boolean mo3952takeFocusaToIllA(final int focusDirection, Rect previouslyFocusedRect) {
        Boolean mo3950focusSearchULY8qGw = mo3950focusSearchULY8qGw(focusDirection, previouslyFocusedRect, new Function1<FocusTargetNode, Boolean>() { // from class: androidx.compose.ui.focus.FocusOwnerImpl$takeFocus$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(FocusTargetNode it) {
                return Boolean.valueOf(it.mo3963requestFocus3ESFkO8(focusDirection));
            }
        });
        if (mo3950focusSearchULY8qGw != null) {
            return mo3950focusSearchULY8qGw.booleanValue();
        }
        return false;
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public void releaseFocus() {
        if (ComposeUiFlags.isTrackFocusEnabled) {
            FocusTransactionsKt.clearFocus(this.rootFocusNode, true, true);
            return;
        }
        FocusTransactionManager $this$iv = getFocusTransactionManager();
        if (!$this$iv.getOngoingTransaction()) {
            try {
                $this$iv.beginTransaction();
                FocusTransactionsKt.clearFocus(this.rootFocusNode, true, true);
                return;
            } finally {
                $this$iv.commitTransaction();
            }
        }
        FocusTransactionsKt.clearFocus(this.rootFocusNode, true, true);
    }

    @Override // androidx.compose.ui.focus.FocusManager
    public void clearFocus(boolean force) {
        mo3947clearFocusI7lrPNg(force, true, true, FocusDirection.Companion.m3938getExitdhqQ8s());
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    /* renamed from: clearFocus-I7lrPNg */
    public boolean mo3947clearFocusI7lrPNg(boolean force, boolean refreshFocusEvents, boolean clearOwnerFocus, int focusDirection) {
        boolean clearedFocusSuccessfully = false;
        if (ComposeUiFlags.isTrackFocusEnabled) {
            if (!force) {
                switch (WhenMappings.$EnumSwitchMapping$0[FocusTransactionsKt.m3970performCustomClearFocusMxy_nc0(this.rootFocusNode, focusDirection).ordinal()]) {
                    case 1:
                    case 2:
                    case 3:
                        break;
                    default:
                        throw new NoWhenBranchMatchedException();
                    case 4:
                        clearedFocusSuccessfully = clearFocus(force, refreshFocusEvents);
                        break;
                }
            } else {
                clearedFocusSuccessfully = clearFocus(force, refreshFocusEvents);
            }
        } else {
            FocusTransactionManager this_$iv = getFocusTransactionManager();
            FocusOwnerImpl$clearFocus$clearedFocusSuccessfully$1 focusOwnerImpl$clearFocus$clearedFocusSuccessfully$1 = new Function0<Unit>() { // from class: androidx.compose.ui.focus.FocusOwnerImpl$clearFocus$clearedFocusSuccessfully$1
                @Override // kotlin.jvm.functions.Function0
                public /* bridge */ /* synthetic */ Unit invoke() {
                    invoke2();
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2() {
                }
            };
            try {
                if (this_$iv.getOngoingTransaction()) {
                    this_$iv.cancelTransaction();
                }
                this_$iv.beginTransaction();
                if (focusOwnerImpl$clearFocus$clearedFocusSuccessfully$1 != null) {
                    MutableVector this_$iv$iv = this_$iv.cancellationListener;
                    this_$iv$iv.add(focusOwnerImpl$clearFocus$clearedFocusSuccessfully$1);
                }
                if (!force) {
                    switch (WhenMappings.$EnumSwitchMapping$0[FocusTransactionsKt.m3970performCustomClearFocusMxy_nc0(this.rootFocusNode, focusDirection).ordinal()]) {
                    }
                }
                clearedFocusSuccessfully = FocusTransactionsKt.clearFocus(this.rootFocusNode, force, refreshFocusEvents);
            } finally {
                this_$iv.commitTransaction();
            }
        }
        if (clearedFocusSuccessfully && clearOwnerFocus) {
            this.onClearFocusForOwner.invoke();
        }
        return clearedFocusSuccessfully;
    }

    static /* synthetic */ boolean clearFocus$default(FocusOwnerImpl focusOwnerImpl, boolean z, boolean z2, int i, Object obj) {
        if ((i & 1) != 0) {
            z = false;
        }
        return focusOwnerImpl.clearFocus(z, z2);
    }

    private final boolean clearFocus(boolean forced, boolean refreshFocusEvents) {
        FocusTargetNode previousActiveFocusTargetNode;
        Object obj;
        NodeChain nodes$ui_release;
        FocusTargetNode previousActiveFocusTargetNode2;
        FocusTargetNode previousActiveFocusTargetNode3;
        Object node$iv$iv;
        DelegatingNode this_$iv$iv$iv;
        boolean z;
        Object node$iv$iv2;
        int count$iv$iv;
        MutableVector mutableVector;
        if (getActiveFocusTargetNode() == null) {
            return true;
        }
        Object obj2 = null;
        if (!isFocusCaptured() || forced) {
            FocusTargetNode previousActiveFocusTargetNode4 = getActiveFocusTargetNode();
            setActiveFocusTargetNode(null);
            if (refreshFocusEvents && previousActiveFocusTargetNode4 != null) {
                previousActiveFocusTargetNode4.dispatchFocusCallbacks$ui_release(isFocusCaptured() ? FocusStateImpl.Captured : FocusStateImpl.Active, FocusStateImpl.Inactive);
                FocusTargetNode $this$visitAncestors_u2dY_u2dYKmho_u24default$iv = previousActiveFocusTargetNode4;
                int m5898constructorimpl = NodeKind.m5898constructorimpl(1024);
                boolean value$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv.getNode().isAttached();
                if (!value$iv$iv$iv) {
                    InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
                }
                Modifier.Node node$iv$iv3 = $this$visitAncestors_u2dY_u2dYKmho_u24default$iv.getNode().getParent$ui_release();
                LayoutNode layout$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitAncestors_u2dY_u2dYKmho_u24default$iv);
                while (layout$iv$iv != null) {
                    Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
                    if ((head$iv$iv.getAggregateChildKindSet$ui_release() & m5898constructorimpl) == 0) {
                        previousActiveFocusTargetNode = previousActiveFocusTargetNode4;
                        obj = obj2;
                    } else {
                        while (node$iv$iv3 != null) {
                            if ((node$iv$iv3.getKindSet$ui_release() & m5898constructorimpl) == 0) {
                                previousActiveFocusTargetNode2 = previousActiveFocusTargetNode4;
                            } else {
                                Object it$iv = node$iv$iv3;
                                MutableVector mutableVector2 = null;
                                Object node$iv$iv4 = it$iv;
                                while (node$iv$iv4 != null) {
                                    if (node$iv$iv4 instanceof FocusTargetNode) {
                                        FocusTargetNode it = (FocusTargetNode) node$iv$iv4;
                                        previousActiveFocusTargetNode3 = previousActiveFocusTargetNode4;
                                        it.dispatchFocusCallbacks$ui_release(FocusStateImpl.ActiveParent, FocusStateImpl.Inactive);
                                        node$iv$iv = null;
                                    } else {
                                        previousActiveFocusTargetNode3 = previousActiveFocusTargetNode4;
                                        if (((node$iv$iv4.getKindSet$ui_release() & m5898constructorimpl) != 0) && (node$iv$iv4 instanceof DelegatingNode)) {
                                            int count$iv$iv2 = 0;
                                            DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node$iv$iv4;
                                            boolean z2 = false;
                                            Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                            while (node$iv$iv$iv != null) {
                                                Modifier.Node next$iv$iv = node$iv$iv$iv;
                                                if (!((next$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0)) {
                                                    this_$iv$iv$iv = this_$iv$iv$iv2;
                                                    z = z2;
                                                    node$iv$iv2 = node$iv$iv4;
                                                } else {
                                                    count$iv$iv2++;
                                                    this_$iv$iv$iv = this_$iv$iv$iv2;
                                                    if (count$iv$iv2 == 1) {
                                                        z = z2;
                                                        node$iv$iv2 = next$iv$iv;
                                                    } else {
                                                        if (mutableVector2 != null) {
                                                            count$iv$iv = count$iv$iv2;
                                                            z = z2;
                                                            node$iv$iv2 = node$iv$iv4;
                                                            mutableVector = mutableVector2;
                                                        } else {
                                                            count$iv$iv = count$iv$iv2;
                                                            z = z2;
                                                            node$iv$iv2 = node$iv$iv4;
                                                            mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                        }
                                                        Modifier.Node theNode$iv$iv = node$iv$iv2;
                                                        if (theNode$iv$iv != null) {
                                                            if (mutableVector != null) {
                                                                mutableVector.add(theNode$iv$iv);
                                                            }
                                                            node$iv$iv2 = null;
                                                        }
                                                        if (mutableVector != null) {
                                                            mutableVector.add(next$iv$iv);
                                                        }
                                                        mutableVector2 = mutableVector;
                                                        count$iv$iv2 = count$iv$iv;
                                                    }
                                                }
                                                node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                                this_$iv$iv$iv2 = this_$iv$iv$iv;
                                                z2 = z;
                                                node$iv$iv4 = node$iv$iv2;
                                            }
                                            Object node$iv$iv5 = node$iv$iv4;
                                            node$iv$iv = null;
                                            if (count$iv$iv2 == 1) {
                                                obj2 = null;
                                                previousActiveFocusTargetNode4 = previousActiveFocusTargetNode3;
                                                node$iv$iv4 = node$iv$iv5;
                                            }
                                        } else {
                                            node$iv$iv = null;
                                        }
                                    }
                                    obj2 = node$iv$iv;
                                    node$iv$iv4 = DelegatableNodeKt.pop(mutableVector2);
                                    previousActiveFocusTargetNode4 = previousActiveFocusTargetNode3;
                                }
                                previousActiveFocusTargetNode2 = previousActiveFocusTargetNode4;
                            }
                            node$iv$iv3 = node$iv$iv3.getParent$ui_release();
                            obj2 = obj2;
                            previousActiveFocusTargetNode4 = previousActiveFocusTargetNode2;
                        }
                        previousActiveFocusTargetNode = previousActiveFocusTargetNode4;
                        obj = obj2;
                    }
                    layout$iv$iv = layout$iv$iv.getParent$ui_release();
                    node$iv$iv3 = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
                    obj2 = obj;
                    previousActiveFocusTargetNode4 = previousActiveFocusTargetNode;
                }
                return true;
            }
            return true;
        }
        return false;
    }

    /* JADX WARN: Type inference failed for: r4v0, types: [T, java.lang.Boolean] */
    @Override // androidx.compose.ui.focus.FocusManager
    /* renamed from: moveFocus-3ESFkO8 */
    public boolean mo3945moveFocus3ESFkO8(final int focusDirection) {
        if (ComposeUiFlags.isViewFocusFixEnabled && this.onMoveFocusInterop.invoke(FocusDirection.m3929boximpl(focusDirection)).booleanValue()) {
            return true;
        }
        final Ref.ObjectRef requestFocusSuccess = new Ref.ObjectRef();
        requestFocusSuccess.element = false;
        int generationBefore = getFocusTransactionManager().getGeneration();
        FocusTargetNode activeNodeBefore = getActiveFocusTargetNode();
        Boolean focusSearchSuccess = mo3950focusSearchULY8qGw(focusDirection, this.onFocusRectInterop.invoke(), new Function1<FocusTargetNode, Boolean>() { // from class: androidx.compose.ui.focus.FocusOwnerImpl$moveFocus$focusSearchSuccess$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            /* JADX WARN: Type inference failed for: r1v2, types: [T, java.lang.Boolean] */
            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(FocusTargetNode it) {
                requestFocusSuccess.element = Boolean.valueOf(it.mo3963requestFocus3ESFkO8(focusDirection));
                Boolean bool = requestFocusSuccess.element;
                return Boolean.valueOf(bool != null ? bool.booleanValue() : false);
            }
        });
        int generationAfter = getFocusTransactionManager().getGeneration();
        if (!Intrinsics.areEqual((Object) focusSearchSuccess, (Object) true) || (generationBefore == generationAfter && (!ComposeUiFlags.isTrackFocusEnabled || activeNodeBefore == getActiveFocusTargetNode()))) {
            if (focusSearchSuccess == null || requestFocusSuccess.element == 0) {
                return false;
            }
            if (Intrinsics.areEqual((Object) focusSearchSuccess, (Object) true) && Intrinsics.areEqual((Object) requestFocusSuccess.element, (Object) true)) {
                return true;
            }
            if (FocusOwnerImplKt.m3956is1dFocusSearch3ESFkO8(focusDirection)) {
                boolean clearFocus = mo3947clearFocusI7lrPNg(false, true, false, focusDirection);
                return clearFocus && mo3952takeFocusaToIllA(focusDirection, null);
            }
            boolean clearFocus2 = ComposeUiFlags.isViewFocusFixEnabled;
            return !clearFocus2 && this.onMoveFocusInterop.invoke(FocusDirection.m3929boximpl(focusDirection)).booleanValue();
        }
        return true;
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    /* renamed from: focusSearch-ULY8qGw */
    public Boolean mo3950focusSearchULY8qGw(int focusDirection, Rect focusedRect, final Function1<? super FocusTargetNode, Boolean> function1) {
        final FocusTargetNode source = findFocusTargetNode();
        if (source != null) {
            FocusRequester customDest = FocusTraversalKt.m3974customFocusSearchOMvw8(source, focusDirection, this.onLayoutDirection.invoke());
            if (Intrinsics.areEqual(customDest, FocusRequester.Companion.getCancel())) {
                return null;
            }
            if (Intrinsics.areEqual(customDest, FocusRequester.Companion.getRedirect$ui_release())) {
                FocusTargetNode findFocusTargetNode = findFocusTargetNode();
                if (findFocusTargetNode != null) {
                    return function1.invoke(findFocusTargetNode);
                }
                return null;
            } else if (!Intrinsics.areEqual(customDest, FocusRequester.Companion.getDefault())) {
                return Boolean.valueOf(customDest.findFocusTargetNode$ui_release(function1));
            }
        } else {
            source = null;
        }
        return FocusTraversalKt.m3975focusSearch0X8WOeE(this.rootFocusNode, focusDirection, this.onLayoutDirection.invoke(), focusedRect, new Function1<FocusTargetNode, Boolean>() { // from class: androidx.compose.ui.focus.FocusOwnerImpl$focusSearch$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(FocusTargetNode it) {
                boolean booleanValue;
                if (Intrinsics.areEqual(it, FocusTargetNode.this)) {
                    booleanValue = false;
                } else if (Intrinsics.areEqual(it, this.getRootFocusNode$ui_release())) {
                    throw new IllegalStateException("Focus search landed at the root.".toString());
                } else {
                    booleanValue = function1.invoke(it).booleanValue();
                }
                return Boolean.valueOf(booleanValue);
            }
        });
    }

    /* JADX WARN: Code restructure failed: missing block: B:312:0x0628, code lost:
        if (r45.invoke().booleanValue() == false) goto L194;
     */
    /* JADX WARN: Code restructure failed: missing block: B:314:0x062c, code lost:
        r0 = r25.getNode();
        r1 = false;
        r3 = new kotlin.jvm.internal.Ref.ObjectRef();
        r4 = new kotlin.jvm.internal.Ref.ObjectRef();
        r4.element = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:316:0x0640, code lost:
        if (r4.element == null) goto L255;
     */
    /* JADX WARN: Code restructure failed: missing block: B:318:0x0646, code lost:
        if ((r4.element instanceof androidx.compose.ui.input.key.KeyInputModifierNode) == false) goto L199;
     */
    /* JADX WARN: Code restructure failed: missing block: B:319:0x0648, code lost:
        r7 = (androidx.compose.ui.input.key.KeyInputModifierNode) r4.element;
     */
    /* JADX WARN: Code restructure failed: missing block: B:320:0x0651, code lost:
        if (r7.mo471onKeyEventZmokQxo(r44) == false) goto L252;
     */
    /* JADX WARN: Code restructure failed: missing block: B:322:0x0655, code lost:
        r16 = r0;
        r18 = r1;
        r19 = r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:323:0x065e, code lost:
        r7 = (androidx.compose.ui.Modifier.Node) r4.element;
     */
    /* JADX WARN: Code restructure failed: missing block: B:324:0x0669, code lost:
        if ((r7.getKindSet$ui_release() & r37) == 0) goto L248;
     */
    /* JADX WARN: Code restructure failed: missing block: B:325:0x066b, code lost:
        r7 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:326:0x066d, code lost:
        r7 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:327:0x066e, code lost:
        if (r7 == false) goto L247;
     */
    /* JADX WARN: Code restructure failed: missing block: B:329:0x0674, code lost:
        if ((r4.element instanceof androidx.compose.ui.node.DelegatingNode) == false) goto L245;
     */
    /* JADX WARN: Code restructure failed: missing block: B:330:0x0676, code lost:
        r7 = 0;
        r8 = (androidx.compose.ui.node.DelegatingNode) r4.element;
        r12 = r8.getDelegate$ui_release();
        r0 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:331:0x0680, code lost:
        if (r12 == null) goto L235;
     */
    /* JADX WARN: Code restructure failed: missing block: B:332:0x0682, code lost:
        r13 = r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:333:0x068d, code lost:
        if ((r13.getKindSet$ui_release() & r37) == 0) goto L234;
     */
    /* JADX WARN: Code restructure failed: missing block: B:334:0x068f, code lost:
        r15 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:335:0x0691, code lost:
        r15 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:336:0x0692, code lost:
        if (r15 == false) goto L232;
     */
    /* JADX WARN: Code restructure failed: missing block: B:337:0x0694, code lost:
        r7 = r7 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:338:0x0697, code lost:
        if (r7 != 1) goto L216;
     */
    /* JADX WARN: Code restructure failed: missing block: B:339:0x0699, code lost:
        r4.element = r13;
        r16 = r0;
        r18 = r1;
        r19 = r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:340:0x06a3, code lost:
        r15 = (androidx.compose.runtime.collection.MutableVector) r3.element;
     */
    /* JADX WARN: Code restructure failed: missing block: B:341:0x06a7, code lost:
        if (r15 != null) goto L231;
     */
    /* JADX WARN: Code restructure failed: missing block: B:342:0x06a9, code lost:
        r16 = r0;
        r18 = r1;
        r19 = r5;
        r15 = new androidx.compose.runtime.collection.MutableVector(new androidx.compose.ui.Modifier.Node[16], 0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:343:0x06c1, code lost:
        r16 = r0;
        r18 = r1;
        r19 = r5;
        r15 = r15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:344:0x06c7, code lost:
        r3.element = r15;
        r0 = (androidx.compose.ui.Modifier.Node) r4.element;
     */
    /* JADX WARN: Code restructure failed: missing block: B:345:0x06cd, code lost:
        if (r0 == null) goto L230;
     */
    /* JADX WARN: Code restructure failed: missing block: B:346:0x06cf, code lost:
        r1 = (androidx.compose.runtime.collection.MutableVector) r3.element;
     */
    /* JADX WARN: Code restructure failed: missing block: B:347:0x06d3, code lost:
        if (r1 == null) goto L224;
     */
    /* JADX WARN: Code restructure failed: missing block: B:348:0x06d5, code lost:
        java.lang.Boolean.valueOf(r1.add(r0));
     */
    /* JADX WARN: Code restructure failed: missing block: B:349:0x06dc, code lost:
        r4.element = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:351:0x06e1, code lost:
        r5 = (androidx.compose.runtime.collection.MutableVector) r3.element;
     */
    /* JADX WARN: Code restructure failed: missing block: B:352:0x06e5, code lost:
        if (r5 == null) goto L229;
     */
    /* JADX WARN: Code restructure failed: missing block: B:353:0x06e7, code lost:
        java.lang.Boolean.valueOf(r5.add(r13));
     */
    /* JADX WARN: Code restructure failed: missing block: B:354:0x06ef, code lost:
        r16 = r0;
        r18 = r1;
        r19 = r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:355:0x06f6, code lost:
        r12 = r12.getChild$ui_release();
        r0 = r16;
        r1 = r18;
        r5 = r19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:356:0x0705, code lost:
        r16 = r0;
        r18 = r1;
        r19 = r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:357:0x070d, code lost:
        if (r7 != 1) goto L242;
     */
    /* JADX WARN: Code restructure failed: missing block: B:358:0x070f, code lost:
        r0 = r16;
        r1 = r18;
        r5 = r19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:359:0x0717, code lost:
        r16 = r0;
        r18 = r1;
        r19 = r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:360:0x071e, code lost:
        r4.element = androidx.compose.ui.node.DelegatableNodeKt.pop((androidx.compose.runtime.collection.MutableVector) r3.element);
        r0 = r16;
        r1 = r18;
        r5 = r19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:362:0x0736, code lost:
        if (r10 == null) goto L267;
     */
    /* JADX WARN: Code restructure failed: missing block: B:363:0x0738, code lost:
        r0 = r10;
        r3 = 0;
        r4 = r0.size();
     */
    /* JADX WARN: Code restructure failed: missing block: B:364:0x0743, code lost:
        if (r3 >= r4) goto L265;
     */
    /* JADX WARN: Code restructure failed: missing block: B:365:0x0745, code lost:
        r5 = r0.get(r3);
        r7 = (androidx.compose.ui.input.key.KeyInputModifierNode) r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:366:0x0751, code lost:
        if (r7.mo471onKeyEventZmokQxo(r44) == false) goto L262;
     */
    /* JADX WARN: Code restructure failed: missing block: B:368:0x0755, code lost:
        r3 = r3 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:369:0x075b, code lost:
        r0 = kotlin.Unit.INSTANCE;
     */
    /* JADX WARN: Code restructure failed: missing block: B:370:0x075e, code lost:
        r0 = kotlin.Unit.INSTANCE;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v104 */
    /* JADX WARN: Type inference failed for: r0v133 */
    /* JADX WARN: Type inference failed for: r0v62, types: [T, androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r0v63 */
    /* JADX WARN: Type inference failed for: r0v65, types: [T, androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r0v66 */
    /* JADX WARN: Type inference failed for: r0v72, types: [T, androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r0v74 */
    /* JADX WARN: Type inference failed for: r0v77 */
    /* JADX WARN: Type inference failed for: r0v85 */
    /* JADX WARN: Type inference failed for: r0v88, types: [T, androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r0v89 */
    /* JADX WARN: Type inference failed for: r0v92 */
    /* JADX WARN: Type inference failed for: r0v98, types: [T] */
    /* JADX WARN: Type inference failed for: r13v3, types: [T, java.lang.Object, androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r14v11, types: [T, java.lang.Object, androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r15v12, types: [T] */
    /* JADX WARN: Type inference failed for: r15v14 */
    /* JADX WARN: Type inference failed for: r15v16 */
    @Override // androidx.compose.ui.focus.FocusOwner
    /* renamed from: dispatchKeyEvent-YhN2O0w */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean mo3949dispatchKeyEventYhN2O0w(android.view.KeyEvent r44, kotlin.jvm.functions.Function0<java.lang.Boolean> r45) {
        /*
            Method dump skipped, instructions count: 1916
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.focus.FocusOwnerImpl.mo3949dispatchKeyEventYhN2O0w(android.view.KeyEvent, kotlin.jvm.functions.Function0):boolean");
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    /* renamed from: dispatchInterceptedSoftKeyboardEvent-ZmokQxo */
    public boolean mo3948dispatchInterceptedSoftKeyboardEventZmokQxo(KeyEvent keyEvent) {
        int i;
        SoftKeyboardInterceptionModifierNode focusedSoftKeyboardInterceptionNode;
        Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv$iv;
        boolean z;
        Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv$iv2;
        boolean z2;
        MutableVector mutableVector;
        Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv$iv3;
        boolean z3;
        Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv$iv4;
        boolean z4;
        MutableVector mutableVector2;
        DelegatableNode $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv;
        int type$iv;
        NodeChain nodes$ui_release;
        int type$iv2;
        int type$iv3;
        Modifier.Node node;
        int count$iv$iv$iv$iv;
        Modifier.Node node2;
        MutableVector mutableVector3;
        Modifier.Node node3;
        Modifier.Node node4;
        Modifier.Node node5;
        DelegatableNode $this$nearestAncestorIncludingSelf_u2d64DMado$iv;
        int i2;
        NodeChain nodes$ui_release2;
        DelegatableNode $this$nearestAncestorIncludingSelf_u2d64DMado$iv2;
        DelegatableNode $this$nearestAncestorIncludingSelf_u2d64DMado$iv3;
        DelegatableNode $this$nearestAncestorIncludingSelf_u2d64DMado$iv4;
        MutableVector mutableVector4;
        if (this.focusInvalidationManager.hasPendingInvalidation()) {
            System.out.println((Object) "FocusRelatedWarning: Dispatching intercepted soft keyboard event while the focus system is invalidated.");
            return false;
        }
        DelegatableNode findActiveFocusNode = FocusTraversalKt.findActiveFocusNode(this.rootFocusNode);
        int i3 = 131072;
        int i4 = 1;
        if (findActiveFocusNode != null) {
            DelegatableNode $this$nearestAncestorIncludingSelf_u2d64DMado$iv5 = findActiveFocusNode;
            int m5898constructorimpl = NodeKind.m5898constructorimpl(131072);
            boolean value$iv$iv$iv$iv = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5.getNode().isAttached();
            if (!value$iv$iv$iv$iv) {
                InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
            }
            Modifier.Node node$iv$iv$iv = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5.getNode();
            LayoutNode layout$iv$iv$iv = DelegatableNodeKt.requireLayoutNode($this$nearestAncestorIncludingSelf_u2d64DMado$iv5);
            loop0: while (true) {
                if (layout$iv$iv$iv == null) {
                    i = i3;
                    node5 = null;
                    break;
                }
                Modifier.Node head$iv$iv$iv = layout$iv$iv$iv.getNodes$ui_release().getHead$ui_release();
                if ((head$iv$iv$iv.getAggregateChildKindSet$ui_release() & m5898constructorimpl) != 0) {
                    while (node$iv$iv$iv != null) {
                        if ((node$iv$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                            Modifier.Node it$iv$iv = node$iv$iv$iv;
                            MutableVector mutableVector5 = null;
                            i = i3;
                            Modifier.Node node6 = it$iv$iv;
                            while (node6 != null) {
                                if (node6 instanceof SoftKeyboardInterceptionModifierNode) {
                                    node5 = node6;
                                    break loop0;
                                }
                                Modifier.Node this_$iv$iv$iv$iv = node6;
                                if (((this_$iv$iv$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0 ? i4 : 0) == 0 || !(node6 instanceof DelegatingNode)) {
                                    $this$nearestAncestorIncludingSelf_u2d64DMado$iv3 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                                } else {
                                    int count$iv$iv$iv = 0;
                                    DelegatingNode this_$iv$iv$iv$iv2 = (DelegatingNode) node6;
                                    Modifier.Node node$iv$iv$iv$iv = this_$iv$iv$iv$iv2.getDelegate$ui_release();
                                    while (node$iv$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv$iv = node$iv$iv$iv$iv;
                                        if (((next$iv$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0 ? i4 : 0) != 0) {
                                            count$iv$iv$iv++;
                                            if (count$iv$iv$iv == i4) {
                                                node6 = next$iv$iv$iv;
                                                $this$nearestAncestorIncludingSelf_u2d64DMado$iv4 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                                            } else {
                                                if (mutableVector5 == null) {
                                                    $this$nearestAncestorIncludingSelf_u2d64DMado$iv4 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                                                    mutableVector4 = new MutableVector(new Modifier.Node[16], 0);
                                                } else {
                                                    $this$nearestAncestorIncludingSelf_u2d64DMado$iv4 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                                                    mutableVector4 = mutableVector5;
                                                }
                                                Modifier.Node theNode$iv$iv$iv = node6;
                                                if (theNode$iv$iv$iv != null) {
                                                    if (mutableVector4 != null) {
                                                        mutableVector4.add(theNode$iv$iv$iv);
                                                    }
                                                    node6 = null;
                                                }
                                                if (mutableVector4 != null) {
                                                    mutableVector4.add(next$iv$iv$iv);
                                                }
                                                mutableVector5 = mutableVector4;
                                            }
                                        } else {
                                            $this$nearestAncestorIncludingSelf_u2d64DMado$iv4 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                                        }
                                        node$iv$iv$iv$iv = node$iv$iv$iv$iv.getChild$ui_release();
                                        $this$nearestAncestorIncludingSelf_u2d64DMado$iv5 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv4;
                                        i4 = 1;
                                    }
                                    $this$nearestAncestorIncludingSelf_u2d64DMado$iv3 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                                    if (count$iv$iv$iv == 1) {
                                        $this$nearestAncestorIncludingSelf_u2d64DMado$iv5 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv3;
                                        i4 = 1;
                                    }
                                }
                                node6 = DelegatableNodeKt.pop(mutableVector5);
                                $this$nearestAncestorIncludingSelf_u2d64DMado$iv5 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv3;
                                i4 = 1;
                            }
                            $this$nearestAncestorIncludingSelf_u2d64DMado$iv2 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                        } else {
                            $this$nearestAncestorIncludingSelf_u2d64DMado$iv2 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                            i = i3;
                        }
                        node$iv$iv$iv = node$iv$iv$iv.getParent$ui_release();
                        i4 = 1;
                        i3 = i;
                        $this$nearestAncestorIncludingSelf_u2d64DMado$iv5 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv2;
                    }
                    $this$nearestAncestorIncludingSelf_u2d64DMado$iv = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                    i2 = i3;
                } else {
                    $this$nearestAncestorIncludingSelf_u2d64DMado$iv = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                    i2 = i3;
                }
                layout$iv$iv$iv = layout$iv$iv$iv.getParent$ui_release();
                node$iv$iv$iv = (layout$iv$iv$iv == null || (nodes$ui_release2 = layout$iv$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release2.getTail$ui_release();
                i4 = 1;
                i3 = i2;
                $this$nearestAncestorIncludingSelf_u2d64DMado$iv5 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv;
            }
            focusedSoftKeyboardInterceptionNode = (SoftKeyboardInterceptionModifierNode) node5;
        } else {
            i = 131072;
            focusedSoftKeyboardInterceptionNode = null;
        }
        if (focusedSoftKeyboardInterceptionNode != null) {
            SoftKeyboardInterceptionModifierNode $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2 = focusedSoftKeyboardInterceptionNode;
            int type$iv4 = NodeKind.m5898constructorimpl(i);
            List ancestors$iv = null;
            boolean value$iv$iv$iv$iv$iv = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2.getNode().isAttached();
            if (!value$iv$iv$iv$iv$iv) {
                InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
            }
            Modifier.Node node$iv$iv$iv$iv2 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2.getNode().getParent$ui_release();
            LayoutNode layout$iv$iv$iv$iv = DelegatableNodeKt.requireLayoutNode($this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2);
            while (layout$iv$iv$iv$iv != null) {
                Modifier.Node head$iv$iv$iv$iv = layout$iv$iv$iv$iv.getNodes$ui_release().getHead$ui_release();
                if ((head$iv$iv$iv$iv.getAggregateChildKindSet$ui_release() & type$iv4) != 0) {
                    while (node$iv$iv$iv$iv2 != null) {
                        if ((node$iv$iv$iv$iv2.getKindSet$ui_release() & type$iv4) != 0) {
                            Modifier.Node it$iv$iv$iv = node$iv$iv$iv$iv2;
                            MutableVector mutableVector6 = null;
                            Modifier.Node node7 = it$iv$iv$iv;
                            while (node7 != null) {
                                DelegatableNode $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv3 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2;
                                if (node7 instanceof SoftKeyboardInterceptionModifierNode) {
                                    Modifier.Node node8 = node7;
                                    if (ancestors$iv == null) {
                                        Object result$iv$iv = new ArrayList();
                                        ancestors$iv = (List) result$iv$iv;
                                    }
                                    ancestors$iv.add(node8);
                                    type$iv2 = type$iv4;
                                } else {
                                    Modifier.Node this_$iv$iv$iv$iv$iv = node7;
                                    if (((this_$iv$iv$iv$iv$iv.getKindSet$ui_release() & type$iv4) != 0) && (node7 instanceof DelegatingNode)) {
                                        int count$iv$iv$iv$iv2 = 0;
                                        DelegatingNode this_$iv$iv$iv$iv$iv2 = (DelegatingNode) node7;
                                        Modifier.Node node$iv$iv$iv$iv$iv = this_$iv$iv$iv$iv$iv2.getDelegate$ui_release();
                                        while (node$iv$iv$iv$iv$iv != null) {
                                            Modifier.Node next$iv$iv$iv$iv = node$iv$iv$iv$iv$iv;
                                            if ((next$iv$iv$iv$iv.getKindSet$ui_release() & type$iv4) != 0) {
                                                count$iv$iv$iv$iv2++;
                                                type$iv3 = type$iv4;
                                                if (count$iv$iv$iv$iv2 == 1) {
                                                    node = next$iv$iv$iv$iv;
                                                } else {
                                                    if (mutableVector6 == null) {
                                                        count$iv$iv$iv$iv = count$iv$iv$iv$iv2;
                                                        node2 = node7;
                                                        mutableVector3 = new MutableVector(new Modifier.Node[16], 0);
                                                    } else {
                                                        count$iv$iv$iv$iv = count$iv$iv$iv$iv2;
                                                        node2 = node7;
                                                        mutableVector3 = mutableVector6;
                                                    }
                                                    Modifier.Node theNode$iv$iv$iv$iv = node2;
                                                    if (theNode$iv$iv$iv$iv != null) {
                                                        if (mutableVector3 != null) {
                                                            mutableVector3.add(theNode$iv$iv$iv$iv);
                                                        }
                                                        node3 = null;
                                                    } else {
                                                        node3 = node2;
                                                    }
                                                    if (mutableVector3 != null) {
                                                        node4 = node3;
                                                        mutableVector3.add(next$iv$iv$iv$iv);
                                                    } else {
                                                        node4 = node3;
                                                    }
                                                    node = node4;
                                                    count$iv$iv$iv$iv2 = count$iv$iv$iv$iv;
                                                    mutableVector6 = mutableVector3;
                                                }
                                            } else {
                                                type$iv3 = type$iv4;
                                                node = node7;
                                            }
                                            node$iv$iv$iv$iv$iv = node$iv$iv$iv$iv$iv.getChild$ui_release();
                                            type$iv4 = type$iv3;
                                            node7 = node;
                                        }
                                        type$iv2 = type$iv4;
                                        Modifier.Node node9 = node7;
                                        if (count$iv$iv$iv$iv2 == 1) {
                                            $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv3;
                                            type$iv4 = type$iv2;
                                            node7 = node9;
                                        }
                                    } else {
                                        type$iv2 = type$iv4;
                                    }
                                }
                                node7 = DelegatableNodeKt.pop(mutableVector6);
                                $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv3;
                                type$iv4 = type$iv2;
                            }
                        }
                        node$iv$iv$iv$iv2 = node$iv$iv$iv$iv2.getParent$ui_release();
                        $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2;
                        type$iv4 = type$iv4;
                    }
                    $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2;
                    type$iv = type$iv4;
                } else {
                    $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2;
                    type$iv = type$iv4;
                }
                layout$iv$iv$iv$iv = layout$iv$iv$iv$iv.getParent$ui_release();
                node$iv$iv$iv$iv2 = (layout$iv$iv$iv$iv == null || (nodes$ui_release = layout$iv$iv$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
                $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv;
                type$iv4 = type$iv;
            }
            DelegatableNode $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv4 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2;
            int type$iv5 = type$iv4;
            if (ancestors$iv != null) {
                List $this$fastForEachReversed$iv$iv = ancestors$iv;
                int size = $this$fastForEachReversed$iv$iv.size() - 1;
                if (size >= 0) {
                    do {
                        int index$iv$iv = size;
                        size--;
                        Object item$iv$iv = $this$fastForEachReversed$iv$iv.get(index$iv$iv);
                        SoftKeyboardInterceptionModifierNode it = (SoftKeyboardInterceptionModifierNode) item$iv$iv;
                        if (it.mo5056onPreInterceptKeyBeforeSoftKeyboardZmokQxo(keyEvent)) {
                            return true;
                        }
                    } while (size >= 0);
                }
            }
            Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv$iv5 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv4.getNode();
            boolean z5 = false;
            MutableVector mutableVector7 = null;
            Modifier.Node node10 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
            while (node10 != null) {
                if (node10 instanceof SoftKeyboardInterceptionModifierNode) {
                    SoftKeyboardInterceptionModifierNode it2 = (SoftKeyboardInterceptionModifierNode) node10;
                    if (it2.mo5056onPreInterceptKeyBeforeSoftKeyboardZmokQxo(keyEvent)) {
                        return true;
                    }
                    $this$dispatchForKind_u2d6rFNWt0$iv$iv3 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
                    z3 = z5;
                } else {
                    Modifier.Node this_$iv$iv$iv = node10;
                    if (((this_$iv$iv$iv.getKindSet$ui_release() & type$iv5) != 0) && (node10 instanceof DelegatingNode)) {
                        int count$iv$iv = 0;
                        DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node10;
                        Modifier.Node node$iv$iv$iv2 = this_$iv$iv$iv2.getDelegate$ui_release();
                        while (node$iv$iv$iv2 != null) {
                            Modifier.Node next$iv$iv = node$iv$iv$iv2;
                            if ((next$iv$iv.getKindSet$ui_release() & type$iv5) != 0) {
                                count$iv$iv++;
                                if (count$iv$iv == 1) {
                                    node10 = next$iv$iv;
                                    $this$dispatchForKind_u2d6rFNWt0$iv$iv4 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
                                    z4 = z5;
                                } else {
                                    if (mutableVector7 == null) {
                                        $this$dispatchForKind_u2d6rFNWt0$iv$iv4 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
                                        z4 = z5;
                                        mutableVector2 = new MutableVector(new Modifier.Node[16], 0);
                                    } else {
                                        $this$dispatchForKind_u2d6rFNWt0$iv$iv4 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
                                        z4 = z5;
                                        mutableVector2 = mutableVector7;
                                    }
                                    mutableVector7 = mutableVector2;
                                    Modifier.Node theNode$iv$iv = node10;
                                    if (theNode$iv$iv != null) {
                                        if (mutableVector7 != null) {
                                            mutableVector7.add(theNode$iv$iv);
                                        }
                                        node10 = null;
                                    }
                                    if (mutableVector7 != null) {
                                        mutableVector7.add(next$iv$iv);
                                    }
                                }
                            } else {
                                $this$dispatchForKind_u2d6rFNWt0$iv$iv4 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
                                z4 = z5;
                            }
                            node$iv$iv$iv2 = node$iv$iv$iv2.getChild$ui_release();
                            $this$dispatchForKind_u2d6rFNWt0$iv$iv5 = $this$dispatchForKind_u2d6rFNWt0$iv$iv4;
                            z5 = z4;
                        }
                        $this$dispatchForKind_u2d6rFNWt0$iv$iv3 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
                        z3 = z5;
                        MutableVector mutableVector8 = mutableVector7;
                        if (count$iv$iv == 1) {
                            $this$dispatchForKind_u2d6rFNWt0$iv$iv5 = $this$dispatchForKind_u2d6rFNWt0$iv$iv3;
                            z5 = z3;
                            mutableVector7 = mutableVector8;
                        } else {
                            mutableVector7 = mutableVector8;
                        }
                    } else {
                        $this$dispatchForKind_u2d6rFNWt0$iv$iv3 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
                        z3 = z5;
                    }
                }
                node10 = DelegatableNodeKt.pop(mutableVector7);
                $this$dispatchForKind_u2d6rFNWt0$iv$iv5 = $this$dispatchForKind_u2d6rFNWt0$iv$iv3;
                z5 = z3;
            }
            Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv$iv6 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv4.getNode();
            boolean z6 = false;
            MutableVector mutableVector9 = null;
            Modifier.Node node11 = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
            while (node11 != null) {
                if (node11 instanceof SoftKeyboardInterceptionModifierNode) {
                    SoftKeyboardInterceptionModifierNode it3 = (SoftKeyboardInterceptionModifierNode) node11;
                    if (it3.mo5055onInterceptKeyBeforeSoftKeyboardZmokQxo(keyEvent)) {
                        return true;
                    }
                    $this$dispatchForKind_u2d6rFNWt0$iv$iv = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
                    z = z6;
                } else {
                    Modifier.Node this_$iv$iv$iv3 = node11;
                    if (((this_$iv$iv$iv3.getKindSet$ui_release() & type$iv5) != 0) && (node11 instanceof DelegatingNode)) {
                        int count$iv$iv2 = 0;
                        DelegatingNode this_$iv$iv$iv4 = (DelegatingNode) node11;
                        Modifier.Node node$iv$iv$iv3 = this_$iv$iv$iv4.getDelegate$ui_release();
                        while (node$iv$iv$iv3 != null) {
                            Modifier.Node next$iv$iv2 = node$iv$iv$iv3;
                            if ((next$iv$iv2.getKindSet$ui_release() & type$iv5) != 0) {
                                count$iv$iv2++;
                                if (count$iv$iv2 == 1) {
                                    node11 = next$iv$iv2;
                                    $this$dispatchForKind_u2d6rFNWt0$iv$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
                                    z2 = z6;
                                } else {
                                    if (mutableVector9 == null) {
                                        $this$dispatchForKind_u2d6rFNWt0$iv$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
                                        z2 = z6;
                                        mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                    } else {
                                        $this$dispatchForKind_u2d6rFNWt0$iv$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
                                        z2 = z6;
                                        mutableVector = mutableVector9;
                                    }
                                    mutableVector9 = mutableVector;
                                    Modifier.Node theNode$iv$iv2 = node11;
                                    if (theNode$iv$iv2 != null) {
                                        if (mutableVector9 != null) {
                                            mutableVector9.add(theNode$iv$iv2);
                                        }
                                        node11 = null;
                                    }
                                    if (mutableVector9 != null) {
                                        mutableVector9.add(next$iv$iv2);
                                    }
                                }
                            } else {
                                $this$dispatchForKind_u2d6rFNWt0$iv$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
                                z2 = z6;
                            }
                            node$iv$iv$iv3 = node$iv$iv$iv3.getChild$ui_release();
                            $this$dispatchForKind_u2d6rFNWt0$iv$iv6 = $this$dispatchForKind_u2d6rFNWt0$iv$iv2;
                            z6 = z2;
                        }
                        $this$dispatchForKind_u2d6rFNWt0$iv$iv = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
                        z = z6;
                        MutableVector mutableVector10 = mutableVector9;
                        if (count$iv$iv2 == 1) {
                            $this$dispatchForKind_u2d6rFNWt0$iv$iv6 = $this$dispatchForKind_u2d6rFNWt0$iv$iv;
                            z6 = z;
                            mutableVector9 = mutableVector10;
                        } else {
                            mutableVector9 = mutableVector10;
                        }
                    } else {
                        $this$dispatchForKind_u2d6rFNWt0$iv$iv = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
                        z = z6;
                    }
                }
                node11 = DelegatableNodeKt.pop(mutableVector9);
                $this$dispatchForKind_u2d6rFNWt0$iv$iv6 = $this$dispatchForKind_u2d6rFNWt0$iv$iv;
                z6 = z;
            }
            if (ancestors$iv != null) {
                List $this$fastForEach$iv$iv = ancestors$iv;
                int size2 = $this$fastForEach$iv$iv.size();
                for (int index$iv$iv2 = 0; index$iv$iv2 < size2; index$iv$iv2++) {
                    Object item$iv$iv2 = $this$fastForEach$iv$iv.get(index$iv$iv2);
                    SoftKeyboardInterceptionModifierNode it4 = (SoftKeyboardInterceptionModifierNode) item$iv$iv2;
                    if (it4.mo5055onInterceptKeyBeforeSoftKeyboardZmokQxo(keyEvent)) {
                        return true;
                    }
                }
                return false;
            }
            return false;
        }
        return false;
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public boolean dispatchRotaryEvent(RotaryScrollEvent event, Function0<Boolean> function0) {
        int i;
        RotaryInputModifierNode focusedRotaryInputNode;
        Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv$iv;
        boolean z;
        Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv$iv2;
        boolean z2;
        MutableVector mutableVector;
        Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv$iv3;
        boolean z3;
        Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv$iv4;
        boolean z4;
        MutableVector mutableVector2;
        DelegatableNode $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv;
        int type$iv;
        NodeChain nodes$ui_release;
        int type$iv2;
        int type$iv3;
        Modifier.Node node;
        int count$iv$iv$iv$iv;
        Modifier.Node node2;
        MutableVector mutableVector3;
        Modifier.Node node3;
        Modifier.Node node4;
        Modifier.Node node5;
        DelegatableNode $this$nearestAncestorIncludingSelf_u2d64DMado$iv;
        int i2;
        NodeChain nodes$ui_release2;
        DelegatableNode $this$nearestAncestorIncludingSelf_u2d64DMado$iv2;
        DelegatableNode $this$nearestAncestorIncludingSelf_u2d64DMado$iv3;
        DelegatableNode $this$nearestAncestorIncludingSelf_u2d64DMado$iv4;
        MutableVector mutableVector4;
        if (this.focusInvalidationManager.hasPendingInvalidation()) {
            System.out.println((Object) "FocusRelatedWarning: Dispatching rotary event while the focus system is invalidated.");
            return false;
        }
        DelegatableNode findFocusTargetNode = findFocusTargetNode();
        int i3 = 16384;
        int i4 = 1;
        if (findFocusTargetNode != null) {
            DelegatableNode $this$nearestAncestorIncludingSelf_u2d64DMado$iv5 = findFocusTargetNode;
            int m5898constructorimpl = NodeKind.m5898constructorimpl(16384);
            boolean value$iv$iv$iv$iv = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5.getNode().isAttached();
            if (!value$iv$iv$iv$iv) {
                InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
            }
            Modifier.Node node$iv$iv$iv = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5.getNode();
            LayoutNode layout$iv$iv$iv = DelegatableNodeKt.requireLayoutNode($this$nearestAncestorIncludingSelf_u2d64DMado$iv5);
            loop0: while (true) {
                if (layout$iv$iv$iv == null) {
                    i = i3;
                    node5 = null;
                    break;
                }
                Modifier.Node head$iv$iv$iv = layout$iv$iv$iv.getNodes$ui_release().getHead$ui_release();
                if ((head$iv$iv$iv.getAggregateChildKindSet$ui_release() & m5898constructorimpl) != 0) {
                    while (node$iv$iv$iv != null) {
                        if ((node$iv$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                            Modifier.Node it$iv$iv = node$iv$iv$iv;
                            MutableVector mutableVector5 = null;
                            i = i3;
                            Modifier.Node node6 = it$iv$iv;
                            while (node6 != null) {
                                if (node6 instanceof RotaryInputModifierNode) {
                                    node5 = node6;
                                    break loop0;
                                }
                                Modifier.Node this_$iv$iv$iv$iv = node6;
                                if (((this_$iv$iv$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0 ? i4 : 0) == 0 || !(node6 instanceof DelegatingNode)) {
                                    $this$nearestAncestorIncludingSelf_u2d64DMado$iv3 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                                } else {
                                    int count$iv$iv$iv = 0;
                                    DelegatingNode this_$iv$iv$iv$iv2 = (DelegatingNode) node6;
                                    Modifier.Node node$iv$iv$iv$iv = this_$iv$iv$iv$iv2.getDelegate$ui_release();
                                    while (node$iv$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv$iv = node$iv$iv$iv$iv;
                                        if (((next$iv$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0 ? i4 : 0) != 0) {
                                            count$iv$iv$iv++;
                                            if (count$iv$iv$iv == i4) {
                                                node6 = next$iv$iv$iv;
                                                $this$nearestAncestorIncludingSelf_u2d64DMado$iv4 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                                            } else {
                                                if (mutableVector5 == null) {
                                                    $this$nearestAncestorIncludingSelf_u2d64DMado$iv4 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                                                    mutableVector4 = new MutableVector(new Modifier.Node[16], 0);
                                                } else {
                                                    $this$nearestAncestorIncludingSelf_u2d64DMado$iv4 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                                                    mutableVector4 = mutableVector5;
                                                }
                                                Modifier.Node theNode$iv$iv$iv = node6;
                                                if (theNode$iv$iv$iv != null) {
                                                    if (mutableVector4 != null) {
                                                        mutableVector4.add(theNode$iv$iv$iv);
                                                    }
                                                    node6 = null;
                                                }
                                                if (mutableVector4 != null) {
                                                    mutableVector4.add(next$iv$iv$iv);
                                                }
                                                mutableVector5 = mutableVector4;
                                            }
                                        } else {
                                            $this$nearestAncestorIncludingSelf_u2d64DMado$iv4 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                                        }
                                        node$iv$iv$iv$iv = node$iv$iv$iv$iv.getChild$ui_release();
                                        $this$nearestAncestorIncludingSelf_u2d64DMado$iv5 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv4;
                                        i4 = 1;
                                    }
                                    $this$nearestAncestorIncludingSelf_u2d64DMado$iv3 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                                    if (count$iv$iv$iv == 1) {
                                        $this$nearestAncestorIncludingSelf_u2d64DMado$iv5 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv3;
                                        i4 = 1;
                                    }
                                }
                                node6 = DelegatableNodeKt.pop(mutableVector5);
                                $this$nearestAncestorIncludingSelf_u2d64DMado$iv5 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv3;
                                i4 = 1;
                            }
                            $this$nearestAncestorIncludingSelf_u2d64DMado$iv2 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                        } else {
                            $this$nearestAncestorIncludingSelf_u2d64DMado$iv2 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                            i = i3;
                        }
                        node$iv$iv$iv = node$iv$iv$iv.getParent$ui_release();
                        i4 = 1;
                        i3 = i;
                        $this$nearestAncestorIncludingSelf_u2d64DMado$iv5 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv2;
                    }
                    $this$nearestAncestorIncludingSelf_u2d64DMado$iv = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                    i2 = i3;
                } else {
                    $this$nearestAncestorIncludingSelf_u2d64DMado$iv = $this$nearestAncestorIncludingSelf_u2d64DMado$iv5;
                    i2 = i3;
                }
                layout$iv$iv$iv = layout$iv$iv$iv.getParent$ui_release();
                node$iv$iv$iv = (layout$iv$iv$iv == null || (nodes$ui_release2 = layout$iv$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release2.getTail$ui_release();
                i4 = 1;
                i3 = i2;
                $this$nearestAncestorIncludingSelf_u2d64DMado$iv5 = $this$nearestAncestorIncludingSelf_u2d64DMado$iv;
            }
            focusedRotaryInputNode = (RotaryInputModifierNode) node5;
        } else {
            i = 16384;
            focusedRotaryInputNode = null;
        }
        if (focusedRotaryInputNode != null) {
            RotaryInputModifierNode $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2 = focusedRotaryInputNode;
            int type$iv4 = NodeKind.m5898constructorimpl(i);
            List ancestors$iv = null;
            boolean value$iv$iv$iv$iv$iv = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2.getNode().isAttached();
            if (!value$iv$iv$iv$iv$iv) {
                InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
            }
            Modifier.Node node$iv$iv$iv$iv2 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2.getNode().getParent$ui_release();
            LayoutNode layout$iv$iv$iv$iv = DelegatableNodeKt.requireLayoutNode($this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2);
            while (layout$iv$iv$iv$iv != null) {
                Modifier.Node head$iv$iv$iv$iv = layout$iv$iv$iv$iv.getNodes$ui_release().getHead$ui_release();
                if ((head$iv$iv$iv$iv.getAggregateChildKindSet$ui_release() & type$iv4) != 0) {
                    while (node$iv$iv$iv$iv2 != null) {
                        if ((node$iv$iv$iv$iv2.getKindSet$ui_release() & type$iv4) != 0) {
                            Modifier.Node it$iv$iv$iv = node$iv$iv$iv$iv2;
                            MutableVector mutableVector6 = null;
                            Modifier.Node node7 = it$iv$iv$iv;
                            while (node7 != null) {
                                DelegatableNode $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv3 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2;
                                if (node7 instanceof RotaryInputModifierNode) {
                                    Modifier.Node node8 = node7;
                                    if (ancestors$iv == null) {
                                        Object result$iv$iv = new ArrayList();
                                        ancestors$iv = (List) result$iv$iv;
                                    }
                                    ancestors$iv.add(node8);
                                    type$iv2 = type$iv4;
                                } else {
                                    Modifier.Node this_$iv$iv$iv$iv$iv = node7;
                                    if (((this_$iv$iv$iv$iv$iv.getKindSet$ui_release() & type$iv4) != 0) && (node7 instanceof DelegatingNode)) {
                                        int count$iv$iv$iv$iv2 = 0;
                                        DelegatingNode this_$iv$iv$iv$iv$iv2 = (DelegatingNode) node7;
                                        Modifier.Node node$iv$iv$iv$iv$iv = this_$iv$iv$iv$iv$iv2.getDelegate$ui_release();
                                        while (node$iv$iv$iv$iv$iv != null) {
                                            Modifier.Node next$iv$iv$iv$iv = node$iv$iv$iv$iv$iv;
                                            if ((next$iv$iv$iv$iv.getKindSet$ui_release() & type$iv4) != 0) {
                                                count$iv$iv$iv$iv2++;
                                                type$iv3 = type$iv4;
                                                if (count$iv$iv$iv$iv2 == 1) {
                                                    node = next$iv$iv$iv$iv;
                                                } else {
                                                    if (mutableVector6 == null) {
                                                        count$iv$iv$iv$iv = count$iv$iv$iv$iv2;
                                                        node2 = node7;
                                                        mutableVector3 = new MutableVector(new Modifier.Node[16], 0);
                                                    } else {
                                                        count$iv$iv$iv$iv = count$iv$iv$iv$iv2;
                                                        node2 = node7;
                                                        mutableVector3 = mutableVector6;
                                                    }
                                                    Modifier.Node theNode$iv$iv$iv$iv = node2;
                                                    if (theNode$iv$iv$iv$iv != null) {
                                                        if (mutableVector3 != null) {
                                                            mutableVector3.add(theNode$iv$iv$iv$iv);
                                                        }
                                                        node3 = null;
                                                    } else {
                                                        node3 = node2;
                                                    }
                                                    if (mutableVector3 != null) {
                                                        node4 = node3;
                                                        mutableVector3.add(next$iv$iv$iv$iv);
                                                    } else {
                                                        node4 = node3;
                                                    }
                                                    node = node4;
                                                    count$iv$iv$iv$iv2 = count$iv$iv$iv$iv;
                                                    mutableVector6 = mutableVector3;
                                                }
                                            } else {
                                                type$iv3 = type$iv4;
                                                node = node7;
                                            }
                                            node$iv$iv$iv$iv$iv = node$iv$iv$iv$iv$iv.getChild$ui_release();
                                            type$iv4 = type$iv3;
                                            node7 = node;
                                        }
                                        type$iv2 = type$iv4;
                                        Modifier.Node node9 = node7;
                                        if (count$iv$iv$iv$iv2 == 1) {
                                            $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv3;
                                            type$iv4 = type$iv2;
                                            node7 = node9;
                                        }
                                    } else {
                                        type$iv2 = type$iv4;
                                    }
                                }
                                node7 = DelegatableNodeKt.pop(mutableVector6);
                                $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv3;
                                type$iv4 = type$iv2;
                            }
                        }
                        node$iv$iv$iv$iv2 = node$iv$iv$iv$iv2.getParent$ui_release();
                        $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2;
                        type$iv4 = type$iv4;
                    }
                    $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2;
                    type$iv = type$iv4;
                } else {
                    $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2;
                    type$iv = type$iv4;
                }
                layout$iv$iv$iv$iv = layout$iv$iv$iv$iv.getParent$ui_release();
                node$iv$iv$iv$iv2 = (layout$iv$iv$iv$iv == null || (nodes$ui_release = layout$iv$iv$iv$iv.getNodes$ui_release()) == null) ? null : nodes$ui_release.getTail$ui_release();
                $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv;
                type$iv4 = type$iv;
            }
            DelegatableNode $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv4 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv2;
            int type$iv5 = type$iv4;
            if (ancestors$iv != null) {
                List $this$fastForEachReversed$iv$iv = ancestors$iv;
                int size = $this$fastForEachReversed$iv$iv.size() - 1;
                if (size >= 0) {
                    do {
                        int index$iv$iv = size;
                        size--;
                        Object item$iv$iv = $this$fastForEachReversed$iv$iv.get(index$iv$iv);
                        RotaryInputModifierNode it = (RotaryInputModifierNode) item$iv$iv;
                        if (it.onPreRotaryScrollEvent(event)) {
                            return true;
                        }
                    } while (size >= 0);
                }
            }
            Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv$iv5 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv4.getNode();
            boolean z5 = false;
            MutableVector mutableVector7 = null;
            Modifier.Node node10 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
            while (node10 != null) {
                if (node10 instanceof RotaryInputModifierNode) {
                    RotaryInputModifierNode it2 = (RotaryInputModifierNode) node10;
                    if (it2.onPreRotaryScrollEvent(event)) {
                        return true;
                    }
                    $this$dispatchForKind_u2d6rFNWt0$iv$iv3 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
                    z3 = z5;
                } else {
                    Modifier.Node this_$iv$iv$iv = node10;
                    if (((this_$iv$iv$iv.getKindSet$ui_release() & type$iv5) != 0) && (node10 instanceof DelegatingNode)) {
                        int count$iv$iv = 0;
                        DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node10;
                        Modifier.Node node$iv$iv$iv2 = this_$iv$iv$iv2.getDelegate$ui_release();
                        while (node$iv$iv$iv2 != null) {
                            Modifier.Node next$iv$iv = node$iv$iv$iv2;
                            if ((next$iv$iv.getKindSet$ui_release() & type$iv5) != 0) {
                                count$iv$iv++;
                                if (count$iv$iv == 1) {
                                    node10 = next$iv$iv;
                                    $this$dispatchForKind_u2d6rFNWt0$iv$iv4 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
                                    z4 = z5;
                                } else {
                                    if (mutableVector7 == null) {
                                        $this$dispatchForKind_u2d6rFNWt0$iv$iv4 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
                                        z4 = z5;
                                        mutableVector2 = new MutableVector(new Modifier.Node[16], 0);
                                    } else {
                                        $this$dispatchForKind_u2d6rFNWt0$iv$iv4 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
                                        z4 = z5;
                                        mutableVector2 = mutableVector7;
                                    }
                                    mutableVector7 = mutableVector2;
                                    Modifier.Node theNode$iv$iv = node10;
                                    if (theNode$iv$iv != null) {
                                        if (mutableVector7 != null) {
                                            mutableVector7.add(theNode$iv$iv);
                                        }
                                        node10 = null;
                                    }
                                    if (mutableVector7 != null) {
                                        mutableVector7.add(next$iv$iv);
                                    }
                                }
                            } else {
                                $this$dispatchForKind_u2d6rFNWt0$iv$iv4 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
                                z4 = z5;
                            }
                            node$iv$iv$iv2 = node$iv$iv$iv2.getChild$ui_release();
                            $this$dispatchForKind_u2d6rFNWt0$iv$iv5 = $this$dispatchForKind_u2d6rFNWt0$iv$iv4;
                            z5 = z4;
                        }
                        $this$dispatchForKind_u2d6rFNWt0$iv$iv3 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
                        z3 = z5;
                        MutableVector mutableVector8 = mutableVector7;
                        if (count$iv$iv == 1) {
                            $this$dispatchForKind_u2d6rFNWt0$iv$iv5 = $this$dispatchForKind_u2d6rFNWt0$iv$iv3;
                            z5 = z3;
                            mutableVector7 = mutableVector8;
                        } else {
                            mutableVector7 = mutableVector8;
                        }
                    } else {
                        $this$dispatchForKind_u2d6rFNWt0$iv$iv3 = $this$dispatchForKind_u2d6rFNWt0$iv$iv5;
                        z3 = z5;
                    }
                }
                node10 = DelegatableNodeKt.pop(mutableVector7);
                $this$dispatchForKind_u2d6rFNWt0$iv$iv5 = $this$dispatchForKind_u2d6rFNWt0$iv$iv3;
                z5 = z3;
            }
            if (function0.invoke().booleanValue()) {
                return true;
            }
            Modifier.Node $this$dispatchForKind_u2d6rFNWt0$iv$iv6 = $this$traverseAncestorsIncludingSelf_u2dQFhIj7k$iv4.getNode();
            boolean z6 = false;
            MutableVector mutableVector9 = null;
            Modifier.Node node11 = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
            while (node11 != null) {
                if (node11 instanceof RotaryInputModifierNode) {
                    RotaryInputModifierNode it3 = (RotaryInputModifierNode) node11;
                    if (it3.onRotaryScrollEvent(event)) {
                        return true;
                    }
                    $this$dispatchForKind_u2d6rFNWt0$iv$iv = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
                    z = z6;
                } else {
                    Modifier.Node this_$iv$iv$iv3 = node11;
                    if (((this_$iv$iv$iv3.getKindSet$ui_release() & type$iv5) != 0) && (node11 instanceof DelegatingNode)) {
                        int count$iv$iv2 = 0;
                        DelegatingNode this_$iv$iv$iv4 = (DelegatingNode) node11;
                        Modifier.Node node$iv$iv$iv3 = this_$iv$iv$iv4.getDelegate$ui_release();
                        while (node$iv$iv$iv3 != null) {
                            Modifier.Node next$iv$iv2 = node$iv$iv$iv3;
                            if ((next$iv$iv2.getKindSet$ui_release() & type$iv5) != 0) {
                                count$iv$iv2++;
                                if (count$iv$iv2 == 1) {
                                    node11 = next$iv$iv2;
                                    $this$dispatchForKind_u2d6rFNWt0$iv$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
                                    z2 = z6;
                                } else {
                                    if (mutableVector9 == null) {
                                        $this$dispatchForKind_u2d6rFNWt0$iv$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
                                        z2 = z6;
                                        mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                    } else {
                                        $this$dispatchForKind_u2d6rFNWt0$iv$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
                                        z2 = z6;
                                        mutableVector = mutableVector9;
                                    }
                                    mutableVector9 = mutableVector;
                                    Modifier.Node theNode$iv$iv2 = node11;
                                    if (theNode$iv$iv2 != null) {
                                        if (mutableVector9 != null) {
                                            mutableVector9.add(theNode$iv$iv2);
                                        }
                                        node11 = null;
                                    }
                                    if (mutableVector9 != null) {
                                        mutableVector9.add(next$iv$iv2);
                                    }
                                }
                            } else {
                                $this$dispatchForKind_u2d6rFNWt0$iv$iv2 = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
                                z2 = z6;
                            }
                            node$iv$iv$iv3 = node$iv$iv$iv3.getChild$ui_release();
                            $this$dispatchForKind_u2d6rFNWt0$iv$iv6 = $this$dispatchForKind_u2d6rFNWt0$iv$iv2;
                            z6 = z2;
                        }
                        $this$dispatchForKind_u2d6rFNWt0$iv$iv = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
                        z = z6;
                        MutableVector mutableVector10 = mutableVector9;
                        if (count$iv$iv2 == 1) {
                            $this$dispatchForKind_u2d6rFNWt0$iv$iv6 = $this$dispatchForKind_u2d6rFNWt0$iv$iv;
                            z6 = z;
                            mutableVector9 = mutableVector10;
                        } else {
                            mutableVector9 = mutableVector10;
                        }
                    } else {
                        $this$dispatchForKind_u2d6rFNWt0$iv$iv = $this$dispatchForKind_u2d6rFNWt0$iv$iv6;
                        z = z6;
                    }
                }
                node11 = DelegatableNodeKt.pop(mutableVector9);
                $this$dispatchForKind_u2d6rFNWt0$iv$iv6 = $this$dispatchForKind_u2d6rFNWt0$iv$iv;
                z6 = z;
            }
            if (ancestors$iv != null) {
                List $this$fastForEach$iv$iv = ancestors$iv;
                int size2 = $this$fastForEach$iv$iv.size();
                for (int index$iv$iv2 = 0; index$iv$iv2 < size2; index$iv$iv2++) {
                    Object item$iv$iv2 = $this$fastForEach$iv$iv.get(index$iv$iv2);
                    RotaryInputModifierNode it4 = (RotaryInputModifierNode) item$iv$iv2;
                    if (it4.onRotaryScrollEvent(event)) {
                        return true;
                    }
                }
                return false;
            }
            return false;
        }
        return false;
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public void scheduleInvalidation(FocusTargetNode node) {
        this.focusInvalidationManager.scheduleInvalidation(node);
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public void scheduleInvalidation(FocusEventModifierNode node) {
        this.focusInvalidationManager.scheduleInvalidation(node);
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public void scheduleInvalidation(FocusPropertiesModifierNode node) {
        this.focusInvalidationManager.scheduleInvalidation(node);
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public void scheduleInvalidationForOwner() {
        this.focusInvalidationManager.scheduleInvalidationForOwner();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void invalidateOwnerFocusState() {
        if ((ComposeUiFlags.isTrackFocusEnabled && getActiveFocusTargetNode() == null) || this.rootFocusNode.getFocusState() == FocusStateImpl.Inactive) {
            this.onClearFocusForOwner.invoke();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:123:0x0298  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x035b  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x0374 A[ORIG_RETURN, RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:81:0x01cb  */
    /* renamed from: traverseAncestorsIncludingSelf-QFhIj7k  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final /* synthetic */ <T extends androidx.compose.ui.node.DelegatableNode> void m3954traverseAncestorsIncludingSelfQFhIj7k(androidx.compose.ui.node.DelegatableNode r36, int r37, kotlin.jvm.functions.Function1<? super T, kotlin.Unit> r38, kotlin.jvm.functions.Function0<kotlin.Unit> r39, kotlin.jvm.functions.Function1<? super T, kotlin.Unit> r40) {
        /*
            Method dump skipped, instructions count: 885
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.focus.FocusOwnerImpl.m3954traverseAncestorsIncludingSelfQFhIj7k(androidx.compose.ui.node.DelegatableNode, int, kotlin.jvm.functions.Function1, kotlin.jvm.functions.Function0, kotlin.jvm.functions.Function1):void");
    }

    /* renamed from: nearestAncestorIncludingSelf-64DMado  reason: not valid java name */
    private final /* synthetic */ <T> T m3953nearestAncestorIncludingSelf64DMado(DelegatableNode $this$nearestAncestorIncludingSelf_u2d64DMado, int type) {
        int i;
        int includeSelf$iv;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho$iv;
        int i2;
        int mask$iv$iv;
        Modifier.Node node;
        NodeChain nodes$ui_release;
        int i3;
        int includeSelf$iv2;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho$iv2;
        int i4;
        int mask$iv$iv2;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho$iv3;
        int i5;
        int mask$iv$iv3;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho$iv4;
        int i6;
        int mask$iv$iv4;
        int count$iv$iv;
        int i7 = 0;
        int count$iv$iv2 = 1;
        DelegatableNode $this$visitAncestors_u2dY_u2dYKmho$iv5 = $this$nearestAncestorIncludingSelf_u2d64DMado;
        int i8 = 0;
        int mask$iv$iv5 = type;
        boolean value$iv$iv$iv = $this$visitAncestors_u2dY_u2dYKmho$iv5.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitAncestors called on an unattached node");
        }
        Modifier.Node node$iv$iv = $this$visitAncestors_u2dY_u2dYKmho$iv5.getNode();
        LayoutNode layout$iv$iv = DelegatableNodeKt.requireLayoutNode($this$visitAncestors_u2dY_u2dYKmho$iv5);
        while (layout$iv$iv != null) {
            Modifier.Node head$iv$iv = layout$iv$iv.getNodes$ui_release().getHead$ui_release();
            if ((head$iv$iv.getAggregateChildKindSet$ui_release() & mask$iv$iv5) == 0) {
                i = i7;
                includeSelf$iv = count$iv$iv2;
                $this$visitAncestors_u2dY_u2dYKmho$iv = $this$visitAncestors_u2dY_u2dYKmho$iv5;
                i2 = i8;
                mask$iv$iv = mask$iv$iv5;
                node = null;
            } else {
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & mask$iv$iv5) == 0) {
                        i3 = i7;
                        includeSelf$iv2 = count$iv$iv2;
                        $this$visitAncestors_u2dY_u2dYKmho$iv2 = $this$visitAncestors_u2dY_u2dYKmho$iv5;
                        i4 = i8;
                        mask$iv$iv2 = mask$iv$iv5;
                    } else {
                        Object it$iv = node$iv$iv;
                        Object stack$iv$iv = null;
                        Object node$iv$iv2 = it$iv;
                        while (node$iv$iv2 != null) {
                            int i9 = i7;
                            int includeSelf$iv3 = count$iv$iv2;
                            Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                            if (node$iv$iv2 instanceof Object) {
                                return (T) node$iv$iv2;
                            }
                            Object it = node$iv$iv2;
                            Modifier.Node this_$iv$iv$iv = (Modifier.Node) it;
                            if (((this_$iv$iv$iv.getKindSet$ui_release() & type) != 0 ? 1 : 0) == 0 || !(node$iv$iv2 instanceof DelegatingNode)) {
                                $this$visitAncestors_u2dY_u2dYKmho$iv3 = $this$visitAncestors_u2dY_u2dYKmho$iv5;
                                i5 = i8;
                                mask$iv$iv3 = mask$iv$iv5;
                            } else {
                                int count$iv$iv3 = 0;
                                DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node$iv$iv2;
                                Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                while (node$iv$iv$iv != null) {
                                    Modifier.Node next$iv$iv = node$iv$iv$iv;
                                    if (!((next$iv$iv.getKindSet$ui_release() & type) != 0)) {
                                        $this$visitAncestors_u2dY_u2dYKmho$iv4 = $this$visitAncestors_u2dY_u2dYKmho$iv5;
                                        i6 = i8;
                                        mask$iv$iv4 = mask$iv$iv5;
                                    } else {
                                        count$iv$iv3++;
                                        $this$visitAncestors_u2dY_u2dYKmho$iv4 = $this$visitAncestors_u2dY_u2dYKmho$iv5;
                                        if (count$iv$iv3 == 1) {
                                            node$iv$iv2 = next$iv$iv;
                                            i6 = i8;
                                            mask$iv$iv4 = mask$iv$iv5;
                                        } else {
                                            Object obj = (MutableVector) stack$iv$iv;
                                            if (obj != null) {
                                                count$iv$iv = count$iv$iv3;
                                                i6 = i8;
                                                mask$iv$iv4 = mask$iv$iv5;
                                            } else {
                                                count$iv$iv = count$iv$iv3;
                                                i6 = i8;
                                                mask$iv$iv4 = mask$iv$iv5;
                                                obj = new MutableVector(new Modifier.Node[16], 0);
                                                MutableVector mutableVector = (MutableVector) obj;
                                            }
                                            stack$iv$iv = obj;
                                            Modifier.Node theNode$iv$iv = (Modifier.Node) node$iv$iv2;
                                            if (theNode$iv$iv != null) {
                                                MutableVector mutableVector2 = (MutableVector) stack$iv$iv;
                                                if (mutableVector2 != null) {
                                                    mutableVector2.add(theNode$iv$iv);
                                                }
                                                node$iv$iv2 = null;
                                            }
                                            MutableVector mutableVector3 = (MutableVector) stack$iv$iv;
                                            if (mutableVector3 != null) {
                                                mutableVector3.add(next$iv$iv);
                                            }
                                            count$iv$iv3 = count$iv$iv;
                                        }
                                    }
                                    node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                    $this$visitAncestors_u2dY_u2dYKmho$iv5 = $this$visitAncestors_u2dY_u2dYKmho$iv4;
                                    i8 = i6;
                                    mask$iv$iv5 = mask$iv$iv4;
                                }
                                $this$visitAncestors_u2dY_u2dYKmho$iv3 = $this$visitAncestors_u2dY_u2dYKmho$iv5;
                                i5 = i8;
                                mask$iv$iv3 = mask$iv$iv5;
                                if (count$iv$iv3 == 1) {
                                    i7 = i9;
                                    count$iv$iv2 = includeSelf$iv3;
                                    $this$visitAncestors_u2dY_u2dYKmho$iv5 = $this$visitAncestors_u2dY_u2dYKmho$iv3;
                                    i8 = i5;
                                    mask$iv$iv5 = mask$iv$iv3;
                                }
                            }
                            node$iv$iv2 = DelegatableNodeKt.pop((MutableVector) stack$iv$iv);
                            i7 = i9;
                            count$iv$iv2 = includeSelf$iv3;
                            $this$visitAncestors_u2dY_u2dYKmho$iv5 = $this$visitAncestors_u2dY_u2dYKmho$iv3;
                            i8 = i5;
                            mask$iv$iv5 = mask$iv$iv3;
                        }
                        i3 = i7;
                        includeSelf$iv2 = count$iv$iv2;
                        $this$visitAncestors_u2dY_u2dYKmho$iv2 = $this$visitAncestors_u2dY_u2dYKmho$iv5;
                        i4 = i8;
                        mask$iv$iv2 = mask$iv$iv5;
                    }
                    node$iv$iv = node$iv$iv.getParent$ui_release();
                    i7 = i3;
                    count$iv$iv2 = includeSelf$iv2;
                    $this$visitAncestors_u2dY_u2dYKmho$iv5 = $this$visitAncestors_u2dY_u2dYKmho$iv2;
                    i8 = i4;
                    mask$iv$iv5 = mask$iv$iv2;
                }
                i = i7;
                includeSelf$iv = count$iv$iv2;
                $this$visitAncestors_u2dY_u2dYKmho$iv = $this$visitAncestors_u2dY_u2dYKmho$iv5;
                i2 = i8;
                mask$iv$iv = mask$iv$iv5;
                node = null;
            }
            layout$iv$iv = layout$iv$iv.getParent$ui_release();
            node$iv$iv = (layout$iv$iv == null || (nodes$ui_release = layout$iv$iv.getNodes$ui_release()) == null) ? node : nodes$ui_release.getTail$ui_release();
            i7 = i;
            count$iv$iv2 = includeSelf$iv;
            $this$visitAncestors_u2dY_u2dYKmho$iv5 = $this$visitAncestors_u2dY_u2dYKmho$iv;
            i8 = i2;
            mask$iv$iv5 = mask$iv$iv;
        }
        return null;
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public Rect getFocusRect() {
        FocusTargetNode findFocusTargetNode = findFocusTargetNode();
        if (findFocusTargetNode != null) {
            return FocusTraversalKt.focusRect(findFocusTargetNode);
        }
        return null;
    }

    private final FocusTargetNode findFocusTargetNode() {
        return FocusTraversalKt.findActiveFocusNode(this.rootFocusNode);
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public FocusState getRootState() {
        return this.rootFocusNode.getFocusState();
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public MutableObjectList<FocusListener> getListeners() {
        return this.listeners;
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public FocusTargetNode getActiveFocusTargetNode() {
        return this.activeFocusTargetNode;
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public void setActiveFocusTargetNode(FocusTargetNode value) {
        FocusTargetNode previousValue = this.activeFocusTargetNode;
        this.activeFocusTargetNode = value;
        if (value == null || previousValue != value) {
            setFocusCaptured(false);
        }
        if (ComposeUiFlags.isSemanticAutofillEnabled) {
            ObjectList this_$iv = getListeners();
            Object[] content$iv = this_$iv.content;
            int i = this_$iv._size;
            for (int i$iv = 0; i$iv < i; i$iv++) {
                FocusListener it = (FocusListener) content$iv[i$iv];
                it.onFocusChanged(previousValue, value);
            }
        }
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public boolean isFocusCaptured() {
        return this.isFocusCaptured;
    }

    @Override // androidx.compose.ui.focus.FocusOwner
    public void setFocusCaptured(boolean value) {
        boolean value$iv = (value && getActiveFocusTargetNode() == null) ? false : true;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("Cannot capture focus when the active focus target node is unset");
        }
        this.isFocusCaptured = value;
    }

    private final Modifier.Node lastLocalKeyInputNode(DelegatableNode $this$lastLocalKeyInputNode) {
        Modifier.Node node = null;
        int mask$iv = NodeKind.m5898constructorimpl(1024) | NodeKind.m5898constructorimpl(8192);
        boolean value$iv$iv$iv = $this$lastLocalKeyInputNode.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitLocalDescendants called on an unattached node");
        }
        Modifier.Node self$iv$iv = $this$lastLocalKeyInputNode.getNode();
        if ((self$iv$iv.getAggregateChildKindSet$ui_release() & mask$iv) != 0) {
            for (Modifier.Node next$iv$iv = self$iv$iv.getChild$ui_release(); next$iv$iv != null; next$iv$iv = next$iv$iv.getChild$ui_release()) {
                if ((next$iv$iv.getKindSet$ui_release() & mask$iv) != 0) {
                    Modifier.Node modifierNode = next$iv$iv;
                    if ((modifierNode.getKindSet$ui_release() & NodeKind.m5898constructorimpl(1024)) != 0) {
                        return node;
                    }
                    node = modifierNode;
                }
            }
        }
        return node;
    }

    /* renamed from: validateKeyEvent-ZmokQxo  reason: not valid java name */
    private final boolean m3955validateKeyEventZmokQxo(KeyEvent keyEvent) {
        long keyCode = KeyEvent_androidKt.m5368getKeyZmokQxo(keyEvent);
        int m5369getTypeZmokQxo = KeyEvent_androidKt.m5369getTypeZmokQxo(keyEvent);
        if (KeyEventType.m5361equalsimpl0(m5369getTypeZmokQxo, KeyEventType.Companion.m5365getKeyDownCS__XNY())) {
            MutableLongSet it = this.keysCurrentlyDown;
            if (it == null) {
                it = new MutableLongSet(3);
                this.keysCurrentlyDown = it;
            }
            it.plusAssign(keyCode);
        } else if (KeyEventType.m5361equalsimpl0(m5369getTypeZmokQxo, KeyEventType.Companion.m5366getKeyUpCS__XNY())) {
            MutableLongSet mutableLongSet = this.keysCurrentlyDown;
            if (!(mutableLongSet != null && mutableLongSet.contains(keyCode))) {
                return false;
            }
            MutableLongSet mutableLongSet2 = this.keysCurrentlyDown;
            if (mutableLongSet2 != null) {
                mutableLongSet2.remove(keyCode);
            }
        }
        return true;
    }
}
