package androidx.compose.ui.draganddrop;

import androidx.compose.ui.Modifier;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.SizeKt;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.TraversableNode;
import androidx.compose.ui.node.TraversableNodeKt;
import androidx.compose.ui.unit.IntSize;
import androidx.compose.ui.unit.IntSizeKt;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.core.app.NotificationCompat;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
/* compiled from: DragAndDropNode.kt */
@Metadata(d1 = {"\u0000|\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u0000\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0000\u0018\u0000 D2\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u00042\u00020\u00052\u00020\u0006:\u0001DBB\u0012!\b\u0002\u0010\u0007\u001a\u001b\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\b¢\u0006\u0002\b\f\u0012\u0018\b\u0002\u0010\r\u001a\u0012\u0012\u0004\u0012\u00020\u000f\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0018\u00010\u000e¢\u0006\u0002\u0010\u0010J\u0010\u0010&\u001a\u00020\u00162\u0006\u0010'\u001a\u00020\u000fH\u0016J;\u0010(\u001a\u00020\u000b2\u0006\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020,2\u0017\u0010-\u001a\u0013\u0012\u0004\u0012\u00020.\u0012\u0004\u0012\u00020\u000b0\u000e¢\u0006\u0002\b\fH\u0017ø\u0001\u0000¢\u0006\u0004\b/\u00100J\u0010\u00101\u001a\u00020\u000b2\u0006\u00102\u001a\u00020\u000fH\u0016J\b\u00103\u001a\u00020\u000bH\u0016J\u0010\u00104\u001a\u00020\u00162\u0006\u00102\u001a\u00020\u000fH\u0016J\u0010\u00105\u001a\u00020\u000b2\u0006\u00102\u001a\u00020\u000fH\u0016J\u0010\u00106\u001a\u00020\u000b2\u0006\u00102\u001a\u00020\u000fH\u0016J\u0010\u00107\u001a\u00020\u000b2\u0006\u00102\u001a\u00020\u000fH\u0016J\u0010\u00108\u001a\u00020\u000b2\u0006\u00102\u001a\u00020\u000fH\u0016J\u001a\u00109\u001a\u00020\u000b2\u0006\u0010\u001a\u001a\u00020\u001bH\u0016ø\u0001\u0000¢\u0006\u0004\b:\u0010\u001fJ\u0010\u0010;\u001a\u00020\u000b2\u0006\u00102\u001a\u00020\u000fH\u0016J\u001a\u0010<\u001a\u00020\u000b2\u0006\u0010=\u001a\u00020\nH\u0016ø\u0001\u0000¢\u0006\u0004\b>\u0010\u001fJ*\u0010?\u001a\u00020\u000b*\u00020\t2\u0006\u0010=\u001a\u00020\n2\f\u0010@\u001a\b\u0012\u0004\u0012\u00020\u00160Aø\u0001\u0000¢\u0006\u0004\bB\u0010CR\u0014\u0010\u0011\u001a\u00020\u00128BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0013\u0010\u0014R\u0011\u0010\u0015\u001a\u00020\u00168G¢\u0006\u0006\u001a\u0004\b\u0015\u0010\u0017R\u0014\u0010\u0018\u001a\u00020\u00168VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u0017R\u0010\u0010\u0019\u001a\u0004\u0018\u00010\u0000X\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u0010\r\u001a\u0012\u0012\u0004\u0012\u00020\u000f\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0018\u00010\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R'\u0010\u0007\u001a\u001b\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\b¢\u0006\u0002\b\fX\u0082\u000e¢\u0006\u0002\n\u0000R\"\u0010\u001a\u001a\u00020\u001bX\u0080\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010 \u001a\u0004\b\u001c\u0010\u001d\"\u0004\b\u001e\u0010\u001fR\u0010\u0010!\u001a\u0004\u0018\u00010\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\"\u001a\u00020#X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b$\u0010%\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006E"}, d2 = {"Landroidx/compose/ui/draganddrop/DragAndDropNode;", "Landroidx/compose/ui/Modifier$Node;", "Landroidx/compose/ui/node/TraversableNode;", "Landroidx/compose/ui/draganddrop/DragAndDropModifierNode;", "Landroidx/compose/ui/draganddrop/DragAndDropSourceModifierNode;", "Landroidx/compose/ui/draganddrop/DragAndDropTargetModifierNode;", "Landroidx/compose/ui/draganddrop/DragAndDropTarget;", "onStartTransfer", "Lkotlin/Function2;", "Landroidx/compose/ui/draganddrop/DragAndDropStartTransferScope;", "Landroidx/compose/ui/geometry/Offset;", "", "Lkotlin/ExtensionFunctionType;", "onDropTargetValidate", "Lkotlin/Function1;", "Landroidx/compose/ui/draganddrop/DragAndDropEvent;", "(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;)V", "dragAndDropManager", "Landroidx/compose/ui/draganddrop/DragAndDropManager;", "getDragAndDropManager", "()Landroidx/compose/ui/draganddrop/DragAndDropManager;", "hasEligibleDropTarget", "", "()Z", "isRequestDragAndDropTransferRequired", "lastChildDragAndDropModifierNode", "size", "Landroidx/compose/ui/unit/IntSize;", "getSize-YbymL2g$ui_release", "()J", "setSize-ozmzZPI$ui_release", "(J)V", "J", "thisDragAndDropTarget", "traverseKey", "", "getTraverseKey", "()Ljava/lang/Object;", "acceptDragAndDropTransfer", "startEvent", "drag", "transferData", "Landroidx/compose/ui/draganddrop/DragAndDropTransferData;", "decorationSize", "Landroidx/compose/ui/geometry/Size;", "drawDragDecoration", "Landroidx/compose/ui/graphics/drawscope/DrawScope;", "drag-12SF9DM", "(Landroidx/compose/ui/draganddrop/DragAndDropTransferData;JLkotlin/jvm/functions/Function1;)V", "onChanged", NotificationCompat.CATEGORY_EVENT, "onDetach", "onDrop", "onEnded", "onEntered", "onExited", "onMoved", "onRemeasured", "onRemeasured-ozmzZPI", "onStarted", "requestDragAndDropTransfer", TypedValues.CycleType.S_WAVE_OFFSET, "requestDragAndDropTransfer-k-4lQ0M", "startDragAndDropTransfer", "isTransferStarted", "Lkotlin/Function0;", "startDragAndDropTransfer-d-4ec7I", "(Landroidx/compose/ui/draganddrop/DragAndDropStartTransferScope;JLkotlin/jvm/functions/Function0;)V", "Companion", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class DragAndDropNode extends Modifier.Node implements TraversableNode, DragAndDropModifierNode, DragAndDropSourceModifierNode, DragAndDropTargetModifierNode, DragAndDropTarget {
    private DragAndDropNode lastChildDragAndDropModifierNode;
    private final Function1<DragAndDropEvent, DragAndDropTarget> onDropTargetValidate;
    private Function2<? super DragAndDropStartTransferScope, ? super Offset, Unit> onStartTransfer;
    private long size;
    private DragAndDropTarget thisDragAndDropTarget;
    private final Object traverseKey;
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    public DragAndDropNode() {
        this(null, null, 3, null);
    }

    public /* synthetic */ DragAndDropNode(Function2 function2, Function1 function1, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this((i & 1) != 0 ? null : function2, (i & 2) != 0 ? null : function1);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public DragAndDropNode(Function2<? super DragAndDropStartTransferScope, ? super Offset, Unit> function2, Function1<? super DragAndDropEvent, ? extends DragAndDropTarget> function1) {
        this.onStartTransfer = function2;
        this.onDropTargetValidate = function1;
        this.traverseKey = Companion.DragAndDropTraversableKey.INSTANCE;
        this.size = IntSize.Companion.m7049getZeroYbymL2g();
    }

    /* compiled from: DragAndDropNode.kt */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0082\u0003\u0018\u00002\u00020\u0001:\u0001\u0003B\u0007\b\u0002¢\u0006\u0002\u0010\u0002¨\u0006\u0004"}, d2 = {"Landroidx/compose/ui/draganddrop/DragAndDropNode$Companion;", "", "()V", "DragAndDropTraversableKey", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    private static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* compiled from: DragAndDropNode.kt */
        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\bÂ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/draganddrop/DragAndDropNode$Companion$DragAndDropTraversableKey;", "", "()V", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
        /* loaded from: classes11.dex */
        private static final class DragAndDropTraversableKey {
            public static final DragAndDropTraversableKey INSTANCE = new DragAndDropTraversableKey();

            private DragAndDropTraversableKey() {
            }
        }

        private Companion() {
        }
    }

    @Override // androidx.compose.ui.node.TraversableNode
    public Object getTraverseKey() {
        return this.traverseKey;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final DragAndDropManager getDragAndDropManager() {
        return DelegatableNodeKt.requireOwner(this).getDragAndDropManager();
    }

    public final boolean hasEligibleDropTarget() {
        return (this.lastChildDragAndDropModifierNode == null && this.thisDragAndDropTarget == null) ? false : true;
    }

    /* renamed from: getSize-YbymL2g$ui_release  reason: not valid java name */
    public final long m3887getSizeYbymL2g$ui_release() {
        return this.size;
    }

    /* renamed from: setSize-ozmzZPI$ui_release  reason: not valid java name */
    public final void m3889setSizeozmzZPI$ui_release(long j) {
        this.size = j;
    }

    @Override // androidx.compose.ui.Modifier.Node
    public void onDetach() {
        this.thisDragAndDropTarget = null;
        this.lastChildDragAndDropModifierNode = null;
    }

    @Override // androidx.compose.ui.node.LayoutAwareModifierNode
    /* renamed from: onRemeasured-ozmzZPI */
    public void mo632onRemeasuredozmzZPI(long size) {
        this.size = size;
    }

    @Override // androidx.compose.ui.draganddrop.DragAndDropSourceModifierNode
    public boolean isRequestDragAndDropTransferRequired() {
        return getDragAndDropManager().isRequestDragAndDropTransferRequired();
    }

    @Override // androidx.compose.ui.draganddrop.DragAndDropSourceModifierNode
    /* renamed from: requestDragAndDropTransfer-k-4lQ0M  reason: not valid java name */
    public void mo3888requestDragAndDropTransferk4lQ0M(long offset) {
        boolean value$iv = this.onStartTransfer != null;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("Check failed.");
        }
        getDragAndDropManager().mo3884requestDragAndDropTransferUv8p0NA(this, offset);
    }

    /* renamed from: startDragAndDropTransfer-d-4ec7I  reason: not valid java name */
    public final void m3890startDragAndDropTransferd4ec7I(final DragAndDropStartTransferScope $this$startDragAndDropTransfer_u2dd_u2d4ec7I, final long offset, final Function0<Boolean> function0) {
        final LayoutCoordinates nodeCoordinates = DelegatableNodeKt.requireLayoutNode(this).getCoordinates();
        DragAndDropNodeKt.traverseSelfAndDescendants(this, new Function1<DragAndDropNode, TraversableNode.Companion.TraverseDescendantsAction>() { // from class: androidx.compose.ui.draganddrop.DragAndDropNode$startDragAndDropTransfer$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final TraversableNode.Companion.TraverseDescendantsAction invoke(DragAndDropNode currentNode) {
                Function2 onStartTransfer;
                if (currentNode.isAttached()) {
                    onStartTransfer = currentNode.onStartTransfer;
                    if (onStartTransfer == null) {
                        return TraversableNode.Companion.TraverseDescendantsAction.ContinueTraversal;
                    }
                    if (!Offset.m4045equalsimpl0(offset, Offset.Companion.m4063getUnspecifiedF1C5BW0())) {
                        LayoutCoordinates currentCoordinates = DelegatableNodeKt.requireLayoutNode(currentNode).getCoordinates();
                        long localPosition = currentCoordinates.mo5646localPositionOfR5De75A(nodeCoordinates, offset);
                        if (!SizeKt.m4138toRectuvyYCjk(IntSizeKt.m7056toSizeozmzZPI(currentNode.m3887getSizeYbymL2g$ui_release())).m4074containsk4lQ0M(localPosition)) {
                            return TraversableNode.Companion.TraverseDescendantsAction.ContinueTraversal;
                        }
                        onStartTransfer.invoke($this$startDragAndDropTransfer_u2dd_u2d4ec7I, Offset.m4037boximpl(localPosition));
                    } else {
                        onStartTransfer.invoke($this$startDragAndDropTransfer_u2dd_u2d4ec7I, Offset.m4037boximpl(Offset.Companion.m4063getUnspecifiedF1C5BW0()));
                    }
                    if (function0.invoke().booleanValue()) {
                        return TraversableNode.Companion.TraverseDescendantsAction.CancelTraversal;
                    }
                    return TraversableNode.Companion.TraverseDescendantsAction.ContinueTraversal;
                }
                return TraversableNode.Companion.TraverseDescendantsAction.SkipSubtreeAndContinueTraversal;
            }
        });
    }

    @Override // androidx.compose.ui.draganddrop.DragAndDropModifierNode
    @Deprecated(message = "Use DragAndDropSourceModifierNode.requestDragAndDropTransfer instead")
    /* renamed from: drag-12SF9DM */
    public void mo3886drag12SF9DM(final DragAndDropTransferData transferData, final long decorationSize, final Function1<? super DrawScope, Unit> function1) {
        boolean value$iv = this.onStartTransfer == null;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("Check failed.");
        }
        this.onStartTransfer = new Function2<DragAndDropStartTransferScope, Offset, Unit>() { // from class: androidx.compose.ui.draganddrop.DragAndDropNode$drag$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            {
                super(2);
            }

            @Override // kotlin.jvm.functions.Function2
            public /* bridge */ /* synthetic */ Unit invoke(DragAndDropStartTransferScope dragAndDropStartTransferScope, Offset offset) {
                m3891invokeUv8p0NA(dragAndDropStartTransferScope, offset.m4058unboximpl());
                return Unit.INSTANCE;
            }

            /* renamed from: invoke-Uv8p0NA  reason: not valid java name */
            public final void m3891invokeUv8p0NA(DragAndDropStartTransferScope $this$null, long it) {
                $this$null.mo3885startDragAndDropTransfer12SF9DM(DragAndDropTransferData.this, decorationSize, function1);
            }
        };
        getDragAndDropManager().mo3884requestDragAndDropTransferUv8p0NA(this, Offset.Companion.m4063getUnspecifiedF1C5BW0());
        this.onStartTransfer = null;
    }

    @Override // androidx.compose.ui.draganddrop.DragAndDropModifierNode
    public boolean acceptDragAndDropTransfer(final DragAndDropEvent startEvent) {
        final Ref.BooleanRef handled = new Ref.BooleanRef();
        DragAndDropNodeKt.traverseSelfAndDescendants(this, new Function1<DragAndDropNode, TraversableNode.Companion.TraverseDescendantsAction>() { // from class: androidx.compose.ui.draganddrop.DragAndDropNode$acceptDragAndDropTransfer$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final TraversableNode.Companion.TraverseDescendantsAction invoke(DragAndDropNode currentNode) {
                DragAndDropTarget dragAndDropTarget;
                Function1 function1;
                DragAndDropTarget dragAndDropTarget2;
                DragAndDropManager dragAndDropManager;
                if (currentNode.isAttached()) {
                    dragAndDropTarget = currentNode.thisDragAndDropTarget;
                    boolean z = true;
                    boolean value$iv = dragAndDropTarget == null;
                    if (!value$iv) {
                        InlineClassHelperKt.throwIllegalStateException("DragAndDropTarget self reference must be null at the start of a drag and drop session");
                    }
                    function1 = currentNode.onDropTargetValidate;
                    currentNode.thisDragAndDropTarget = function1 != null ? (DragAndDropTarget) function1.invoke(DragAndDropEvent.this) : null;
                    dragAndDropTarget2 = currentNode.thisDragAndDropTarget;
                    boolean accepted = dragAndDropTarget2 != null;
                    if (accepted) {
                        dragAndDropManager = this.getDragAndDropManager();
                        dragAndDropManager.registerTargetInterest(currentNode);
                    }
                    Ref.BooleanRef booleanRef = handled;
                    if (!handled.element && !accepted) {
                        z = false;
                    }
                    booleanRef.element = z;
                    return TraversableNode.Companion.TraverseDescendantsAction.ContinueTraversal;
                }
                return TraversableNode.Companion.TraverseDescendantsAction.SkipSubtreeAndContinueTraversal;
            }
        });
        return handled.element;
    }

    @Override // androidx.compose.ui.draganddrop.DragAndDropTarget
    public void onStarted(DragAndDropEvent event) {
        DragAndDropTarget self = this.thisDragAndDropTarget;
        if (self != null) {
            self.onStarted(event);
            return;
        }
        DragAndDropNode dragAndDropNode = this.lastChildDragAndDropModifierNode;
        if (dragAndDropNode != null) {
            dragAndDropNode.onStarted(event);
        }
    }

    @Override // androidx.compose.ui.draganddrop.DragAndDropTarget
    public void onEntered(DragAndDropEvent event) {
        DragAndDropTarget self = this.thisDragAndDropTarget;
        if (self != null) {
            self.onEntered(event);
            return;
        }
        DragAndDropNode dragAndDropNode = this.lastChildDragAndDropModifierNode;
        if (dragAndDropNode != null) {
            dragAndDropNode.onEntered(event);
        }
    }

    @Override // androidx.compose.ui.draganddrop.DragAndDropTarget
    public void onMoved(final DragAndDropEvent event) {
        Object obj;
        DragAndDropNode newChildNode;
        boolean m3893containsUv8p0NA;
        DragAndDropNode currentChildNode = this.lastChildDragAndDropModifierNode;
        boolean z = false;
        if (currentChildNode != null) {
            m3893containsUv8p0NA = DragAndDropNodeKt.m3893containsUv8p0NA(currentChildNode, DragAndDrop_androidKt.getPositionInRoot(event));
            if (m3893containsUv8p0NA) {
                z = true;
            }
        }
        if (z) {
            newChildNode = currentChildNode;
        } else {
            DragAndDropNode $this$firstDescendantOrNull$iv = this;
            if ($this$firstDescendantOrNull$iv.getNode().isAttached()) {
                final Ref.ObjectRef match$iv = new Ref.ObjectRef();
                TraversableNodeKt.traverseDescendants($this$firstDescendantOrNull$iv, new Function1<DragAndDropNode, TraversableNode.Companion.TraverseDescendantsAction>() { // from class: androidx.compose.ui.draganddrop.DragAndDropNode$onMoved$$inlined$firstDescendantOrNull$1
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(1);
                    }

                    /* JADX WARN: Multi-variable type inference failed */
                    /* JADX WARN: Removed duplicated region for block: B:11:0x002b  */
                    /* JADX WARN: Removed duplicated region for block: B:9:0x0024  */
                    @Override // kotlin.jvm.functions.Function1
                    /*
                        Code decompiled incorrectly, please refer to instructions dump.
                        To view partially-correct add '--show-bad-code' argument
                    */
                    public final androidx.compose.ui.node.TraversableNode.Companion.TraverseDescendantsAction invoke(androidx.compose.ui.draganddrop.DragAndDropNode r5) {
                        /*
                            r4 = this;
                            r0 = r5
                            androidx.compose.ui.draganddrop.DragAndDropNode r0 = (androidx.compose.ui.draganddrop.DragAndDropNode) r0
                            r1 = 0
                            androidx.compose.ui.draganddrop.DragAndDropNode r2 = r2
                            androidx.compose.ui.draganddrop.DragAndDropManager r2 = androidx.compose.ui.draganddrop.DragAndDropNode.access$getDragAndDropManager(r2)
                            r3 = r0
                            androidx.compose.ui.draganddrop.DragAndDropTarget r3 = (androidx.compose.ui.draganddrop.DragAndDropTarget) r3
                            boolean r2 = r2.isInterestedTarget(r3)
                            if (r2 == 0) goto L21
                            androidx.compose.ui.draganddrop.DragAndDropEvent r2 = r3
                            long r2 = androidx.compose.ui.draganddrop.DragAndDrop_androidKt.getPositionInRoot(r2)
                            boolean r2 = androidx.compose.ui.draganddrop.DragAndDropNodeKt.m3892access$containsUv8p0NA(r0, r2)
                            if (r2 == 0) goto L21
                            r2 = 1
                            goto L22
                        L21:
                            r2 = 0
                        L22:
                            if (r2 == 0) goto L2b
                            kotlin.jvm.internal.Ref$ObjectRef r0 = kotlin.jvm.internal.Ref.ObjectRef.this
                            r0.element = r5
                            androidx.compose.ui.node.TraversableNode$Companion$TraverseDescendantsAction r0 = androidx.compose.ui.node.TraversableNode.Companion.TraverseDescendantsAction.CancelTraversal
                            return r0
                        L2b:
                            androidx.compose.ui.node.TraversableNode$Companion$TraverseDescendantsAction r0 = androidx.compose.ui.node.TraversableNode.Companion.TraverseDescendantsAction.ContinueTraversal
                            return r0
                        */
                        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.draganddrop.DragAndDropNode$onMoved$$inlined$firstDescendantOrNull$1.invoke(androidx.compose.ui.node.TraversableNode):androidx.compose.ui.node.TraversableNode$Companion$TraverseDescendantsAction");
                    }
                });
                obj = (TraversableNode) match$iv.element;
            } else {
                obj = null;
            }
            newChildNode = (DragAndDropNode) obj;
        }
        if (newChildNode != null && currentChildNode == null) {
            DragAndDropNodeKt.dispatchEntered(newChildNode, event);
            DragAndDropTarget dragAndDropTarget = this.thisDragAndDropTarget;
            if (dragAndDropTarget != null) {
                dragAndDropTarget.onExited(event);
            }
        } else if (newChildNode == null && currentChildNode != null) {
            DragAndDropTarget dragAndDropTarget2 = this.thisDragAndDropTarget;
            if (dragAndDropTarget2 != null) {
                DragAndDropNodeKt.dispatchEntered(dragAndDropTarget2, event);
            }
            currentChildNode.onExited(event);
        } else if (!Intrinsics.areEqual(newChildNode, currentChildNode)) {
            if (newChildNode != null) {
                DragAndDropNodeKt.dispatchEntered(newChildNode, event);
            }
            if (currentChildNode != null) {
                currentChildNode.onExited(event);
            }
        } else if (newChildNode != null) {
            newChildNode.onMoved(event);
        } else {
            DragAndDropTarget dragAndDropTarget3 = this.thisDragAndDropTarget;
            if (dragAndDropTarget3 != null) {
                dragAndDropTarget3.onMoved(event);
            }
        }
        this.lastChildDragAndDropModifierNode = newChildNode;
    }

    @Override // androidx.compose.ui.draganddrop.DragAndDropTarget
    public void onChanged(DragAndDropEvent event) {
        DragAndDropTarget self = this.thisDragAndDropTarget;
        if (self != null) {
            self.onChanged(event);
            return;
        }
        DragAndDropNode dragAndDropNode = this.lastChildDragAndDropModifierNode;
        if (dragAndDropNode != null) {
            dragAndDropNode.onChanged(event);
        }
    }

    @Override // androidx.compose.ui.draganddrop.DragAndDropTarget
    public void onExited(DragAndDropEvent event) {
        DragAndDropTarget dragAndDropTarget = this.thisDragAndDropTarget;
        if (dragAndDropTarget != null) {
            dragAndDropTarget.onExited(event);
        }
        DragAndDropNode dragAndDropNode = this.lastChildDragAndDropModifierNode;
        if (dragAndDropNode != null) {
            dragAndDropNode.onExited(event);
        }
        this.lastChildDragAndDropModifierNode = null;
    }

    @Override // androidx.compose.ui.draganddrop.DragAndDropTarget
    public boolean onDrop(DragAndDropEvent event) {
        DragAndDropNode currentChildDropTarget = this.lastChildDragAndDropModifierNode;
        if (currentChildDropTarget == null) {
            DragAndDropTarget dragAndDropTarget = this.thisDragAndDropTarget;
            if (dragAndDropTarget != null) {
                return dragAndDropTarget.onDrop(event);
            }
            return false;
        }
        return currentChildDropTarget.onDrop(event);
    }

    @Override // androidx.compose.ui.draganddrop.DragAndDropTarget
    public void onEnded(final DragAndDropEvent event) {
        DragAndDropNodeKt.traverseSelfAndDescendants(this, new Function1<DragAndDropNode, TraversableNode.Companion.TraverseDescendantsAction>() { // from class: androidx.compose.ui.draganddrop.DragAndDropNode$onEnded$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final TraversableNode.Companion.TraverseDescendantsAction invoke(DragAndDropNode currentNode) {
                DragAndDropTarget dragAndDropTarget;
                if (currentNode.getNode().isAttached()) {
                    dragAndDropTarget = currentNode.thisDragAndDropTarget;
                    if (dragAndDropTarget != null) {
                        dragAndDropTarget.onEnded(DragAndDropEvent.this);
                    }
                    currentNode.thisDragAndDropTarget = null;
                    currentNode.lastChildDragAndDropModifierNode = null;
                    return TraversableNode.Companion.TraverseDescendantsAction.ContinueTraversal;
                }
                return TraversableNode.Companion.TraverseDescendantsAction.SkipSubtreeAndContinueTraversal;
            }
        });
    }
}
