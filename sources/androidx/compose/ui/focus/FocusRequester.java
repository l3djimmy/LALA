package androidx.compose.ui.focus;

import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.NodeKind;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.ReplaceWith;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: FocusRequester.kt */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0007\u0018\u0000 \u00192\u00020\u0001:\u0001\u0019B\u0005¢\u0006\u0002\u0010\u0002J\u0006\u0010\b\u001a\u00020\tJ\u001d\u0010\n\u001a\u00020\t2\u0012\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\t0\fH\u0082\bJ!\u0010\u000e\u001a\u00020\t2\u0012\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\t0\fH\u0000¢\u0006\u0002\b\u000fJ\u0006\u0010\u0010\u001a\u00020\tJ\b\u0010\u0011\u001a\u00020\u0012H\u0007J\u001a\u0010\u0011\u001a\u00020\t2\b\b\u0002\u0010\u0013\u001a\u00020\u0014ø\u0001\u0000¢\u0006\u0004\b\u0015\u0010\u0016J\u0006\u0010\u0017\u001a\u00020\tJ\u0006\u0010\u0018\u001a\u00020\tR\u001a\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u001a"}, d2 = {"Landroidx/compose/ui/focus/FocusRequester;", "", "()V", "focusRequesterNodes", "Landroidx/compose/runtime/collection/MutableVector;", "Landroidx/compose/ui/focus/FocusRequesterModifierNode;", "getFocusRequesterNodes$ui_release", "()Landroidx/compose/runtime/collection/MutableVector;", "captureFocus", "", "findFocusTarget", "onFound", "Lkotlin/Function1;", "Landroidx/compose/ui/focus/FocusTargetNode;", "findFocusTargetNode", "findFocusTargetNode$ui_release", "freeFocus", "requestFocus", "", "focusDirection", "Landroidx/compose/ui/focus/FocusDirection;", "requestFocus-3ESFkO8", "(I)Z", "restoreFocusedChild", "saveFocusedChild", "Companion", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class FocusRequester {
    public static final int $stable = 0;
    private final MutableVector<FocusRequesterModifierNode> focusRequesterNodes = new MutableVector<>(new FocusRequesterModifierNode[16], 0);
    public static final Companion Companion = new Companion(null);
    private static final FocusRequester Default = new FocusRequester();
    private static final FocusRequester Cancel = new FocusRequester();
    private static final FocusRequester Redirect = new FocusRequester();

    public final MutableVector<FocusRequesterModifierNode> getFocusRequesterNodes$ui_release() {
        return this.focusRequesterNodes;
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "use the version the has a FocusDirection", replaceWith = @ReplaceWith(expression = "this.requestFocus()", imports = {}))
    public final /* synthetic */ void requestFocus() {
        m3960requestFocus3ESFkO8(FocusDirection.Companion.m3937getEnterdhqQ8s());
    }

    /* renamed from: requestFocus-3ESFkO8$default  reason: not valid java name */
    public static /* synthetic */ boolean m3959requestFocus3ESFkO8$default(FocusRequester focusRequester, int i, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            i = FocusDirection.Companion.m3937getEnterdhqQ8s();
        }
        return focusRequester.m3960requestFocus3ESFkO8(i);
    }

    /* renamed from: requestFocus-3ESFkO8  reason: not valid java name */
    public final boolean m3960requestFocus3ESFkO8(final int focusDirection) {
        return findFocusTargetNode$ui_release(new Function1<FocusTargetNode, Boolean>() { // from class: androidx.compose.ui.focus.FocusRequester$requestFocus$1
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
    }

    public final boolean findFocusTargetNode$ui_release(Function1<? super FocusTargetNode, Boolean> function1) {
        Modifier.Node child$iv$iv$iv;
        boolean m3994findChildCorrespondingToFocusEnterOMvw8;
        int i;
        DelegatingNode this_$iv$iv$iv$iv;
        int count$iv$iv$iv;
        MutableVector mutableVector;
        Function1<? super FocusTargetNode, Boolean> function12 = function1;
        FocusRequester this_$iv = this;
        int $i$f$findFocusTarget = 0;
        int i2 = 0;
        if (this_$iv != Companion.getDefault()) {
            if (this_$iv != Companion.getCancel()) {
                if (this_$iv.focusRequesterNodes.getSize() != 0) {
                    boolean success$iv = false;
                    MutableVector this_$iv$iv = this_$iv.focusRequesterNodes;
                    int i$iv$iv = 0;
                    Object[] content$iv$iv = this_$iv$iv.content;
                    int size$iv$iv = this_$iv$iv.getSize();
                    while (i$iv$iv < size$iv$iv) {
                        DelegatableNode node$iv = (FocusRequesterModifierNode) content$iv$iv[i$iv$iv];
                        DelegatableNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv$iv = node$iv;
                        int m5898constructorimpl = NodeKind.m5898constructorimpl(1024);
                        boolean value$iv$iv$iv$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv$iv.getNode().isAttached();
                        if (!value$iv$iv$iv$iv) {
                            InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
                        }
                        int i3 = 1;
                        FocusRequester this_$iv2 = this_$iv;
                        int $i$f$findFocusTarget2 = $i$f$findFocusTarget;
                        MutableVector branches$iv$iv$iv = new MutableVector(new Modifier.Node[16], i2);
                        Modifier.Node child$iv$iv$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv$iv.getNode().getChild$ui_release();
                        if (child$iv$iv$iv2 == null) {
                            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv$iv, $this$visitChildren_u2dY_u2dYKmho_u24default$iv$iv.getNode(), false);
                        } else {
                            branches$iv$iv$iv.add(child$iv$iv$iv2);
                        }
                        while (true) {
                            MutableVector this_$iv$iv$iv$iv2 = branches$iv$iv$iv;
                            if ((this_$iv$iv$iv$iv2.getSize() != 0 ? i3 : i2) != 0) {
                                MutableVector this_$iv$iv$iv$iv3 = branches$iv$iv$iv;
                                Modifier.Node branch$iv$iv$iv = (Modifier.Node) branches$iv$iv$iv.removeAt(this_$iv$iv$iv$iv3.getSize() - 1);
                                if ((branch$iv$iv$iv.getAggregateChildKindSet$ui_release() & m5898constructorimpl) == 0) {
                                    DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv$iv, branch$iv$iv$iv, false);
                                } else {
                                    Modifier.Node node$iv$iv$iv = branch$iv$iv$iv;
                                    while (true) {
                                        if (node$iv$iv$iv == null) {
                                            i2 = 0;
                                            function12 = function1;
                                            break;
                                        } else if ((node$iv$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                                            Modifier.Node it$iv$iv = node$iv$iv$iv;
                                            MutableVector mutableVector2 = null;
                                            Modifier.Node node = it$iv$iv;
                                            while (node != null) {
                                                MutableVector branches$iv$iv$iv2 = branches$iv$iv$iv;
                                                if (node instanceof FocusTargetNode) {
                                                    FocusTargetNode it$iv = (FocusTargetNode) node;
                                                    if (it$iv.fetchFocusProperties$ui_release().getCanFocus()) {
                                                        m3994findChildCorrespondingToFocusEnterOMvw8 = function12.invoke(it$iv).booleanValue();
                                                        child$iv$iv$iv = child$iv$iv$iv2;
                                                    } else {
                                                        child$iv$iv$iv = child$iv$iv$iv2;
                                                        m3994findChildCorrespondingToFocusEnterOMvw8 = TwoDimensionalFocusSearchKt.m3994findChildCorrespondingToFocusEnterOMvw8(it$iv, FocusDirection.Companion.m3937getEnterdhqQ8s(), function12);
                                                    }
                                                    if (!m3994findChildCorrespondingToFocusEnterOMvw8) {
                                                        i = i3;
                                                    } else {
                                                        success$iv = true;
                                                        break;
                                                    }
                                                } else {
                                                    child$iv$iv$iv = child$iv$iv$iv2;
                                                    Modifier.Node this_$iv$iv$iv$iv4 = node;
                                                    if (((this_$iv$iv$iv$iv4.getKindSet$ui_release() & m5898constructorimpl) != 0 ? i3 : 0) == 0 || !(node instanceof DelegatingNode)) {
                                                        i = i3;
                                                    } else {
                                                        int count$iv$iv$iv2 = 0;
                                                        DelegatingNode this_$iv$iv$iv$iv5 = (DelegatingNode) node;
                                                        Modifier.Node node$iv$iv$iv$iv = this_$iv$iv$iv$iv5.getDelegate$ui_release();
                                                        while (node$iv$iv$iv$iv != null) {
                                                            Modifier.Node next$iv$iv$iv = node$iv$iv$iv$iv;
                                                            if (((next$iv$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0 ? i3 : 0) == 0) {
                                                                this_$iv$iv$iv$iv = this_$iv$iv$iv$iv5;
                                                            } else {
                                                                count$iv$iv$iv2++;
                                                                if (count$iv$iv$iv2 == i3) {
                                                                    node = next$iv$iv$iv;
                                                                    this_$iv$iv$iv$iv = this_$iv$iv$iv$iv5;
                                                                } else {
                                                                    if (mutableVector2 == null) {
                                                                        count$iv$iv$iv = count$iv$iv$iv2;
                                                                        this_$iv$iv$iv$iv = this_$iv$iv$iv$iv5;
                                                                        mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                                    } else {
                                                                        count$iv$iv$iv = count$iv$iv$iv2;
                                                                        this_$iv$iv$iv$iv = this_$iv$iv$iv$iv5;
                                                                        mutableVector = mutableVector2;
                                                                    }
                                                                    Modifier.Node theNode$iv$iv$iv = node;
                                                                    if (theNode$iv$iv$iv != null) {
                                                                        if (mutableVector != null) {
                                                                            mutableVector.add(theNode$iv$iv$iv);
                                                                        }
                                                                        node = null;
                                                                    }
                                                                    if (mutableVector != null) {
                                                                        mutableVector.add(next$iv$iv$iv);
                                                                    }
                                                                    mutableVector2 = mutableVector;
                                                                    count$iv$iv$iv2 = count$iv$iv$iv;
                                                                }
                                                            }
                                                            node$iv$iv$iv$iv = node$iv$iv$iv$iv.getChild$ui_release();
                                                            this_$iv$iv$iv$iv5 = this_$iv$iv$iv$iv;
                                                            i3 = 1;
                                                        }
                                                        i = 1;
                                                        if (count$iv$iv$iv2 == 1) {
                                                            i3 = 1;
                                                            branches$iv$iv$iv = branches$iv$iv$iv2;
                                                            child$iv$iv$iv2 = child$iv$iv$iv;
                                                            function12 = function1;
                                                        }
                                                    }
                                                }
                                                node = DelegatableNodeKt.pop(mutableVector2);
                                                i3 = i;
                                                branches$iv$iv$iv = branches$iv$iv$iv2;
                                                child$iv$iv$iv2 = child$iv$iv$iv;
                                                function12 = function1;
                                            }
                                            i2 = 0;
                                            function12 = function1;
                                        } else {
                                            node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                            function12 = function1;
                                        }
                                    }
                                }
                            }
                        }
                        i$iv$iv++;
                        function12 = function1;
                        this_$iv = this_$iv2;
                        $i$f$findFocusTarget = $i$f$findFocusTarget2;
                        i2 = 0;
                    }
                    return success$iv;
                }
                throw new IllegalStateException("\n   FocusRequester is not initialized. Here are some possible fixes:\n\n   1. Remember the FocusRequester: val focusRequester = remember { FocusRequester() }\n   2. Did you forget to add a Modifier.focusRequester() ?\n   3. Are you attempting to request focus during composition? Focus requests should be made in\n   response to some event. Eg Modifier.clickable { focusRequester.requestFocus() }\n".toString());
            }
            throw new IllegalStateException("\n    Please check whether the focusRequester is FocusRequester.Cancel or FocusRequester.Default\n    before invoking any functions on the focusRequester.\n".toString());
        }
        throw new IllegalStateException("\n    Please check whether the focusRequester is FocusRequester.Cancel or FocusRequester.Default\n    before invoking any functions on the focusRequester.\n".toString());
    }

    public final boolean captureFocus() {
        MutableVector this_$iv = this.focusRequesterNodes;
        MutableVector this_$iv2 = this_$iv.getSize() != 0 ? 1 : null;
        if (this_$iv2 != null) {
            MutableVector this_$iv3 = this.focusRequesterNodes;
            Object[] content$iv = this_$iv3.content;
            int size$iv = this_$iv3.getSize();
            for (int i$iv = 0; i$iv < size$iv; i$iv++) {
                FocusRequesterModifierNode it = (FocusRequesterModifierNode) content$iv[i$iv];
                if (FocusRequesterModifierNodeKt.captureFocus(it)) {
                    return true;
                }
            }
            return false;
        }
        throw new IllegalStateException("\n   FocusRequester is not initialized. Here are some possible fixes:\n\n   1. Remember the FocusRequester: val focusRequester = remember { FocusRequester() }\n   2. Did you forget to add a Modifier.focusRequester() ?\n   3. Are you attempting to request focus during composition? Focus requests should be made in\n   response to some event. Eg Modifier.clickable { focusRequester.requestFocus() }\n".toString());
    }

    public final boolean freeFocus() {
        MutableVector this_$iv = this.focusRequesterNodes;
        MutableVector this_$iv2 = this_$iv.getSize() != 0 ? 1 : null;
        if (this_$iv2 != null) {
            MutableVector this_$iv3 = this.focusRequesterNodes;
            Object[] content$iv = this_$iv3.content;
            int size$iv = this_$iv3.getSize();
            for (int i$iv = 0; i$iv < size$iv; i$iv++) {
                FocusRequesterModifierNode it = (FocusRequesterModifierNode) content$iv[i$iv];
                if (FocusRequesterModifierNodeKt.freeFocus(it)) {
                    return true;
                }
            }
            return false;
        }
        throw new IllegalStateException("\n   FocusRequester is not initialized. Here are some possible fixes:\n\n   1. Remember the FocusRequester: val focusRequester = remember { FocusRequester() }\n   2. Did you forget to add a Modifier.focusRequester() ?\n   3. Are you attempting to request focus during composition? Focus requests should be made in\n   response to some event. Eg Modifier.clickable { focusRequester.requestFocus() }\n".toString());
    }

    public final boolean saveFocusedChild() {
        MutableVector this_$iv = this.focusRequesterNodes;
        MutableVector this_$iv2 = this_$iv.getSize() != 0 ? 1 : null;
        if (this_$iv2 != null) {
            MutableVector this_$iv3 = this.focusRequesterNodes;
            Object[] content$iv = this_$iv3.content;
            int size$iv = this_$iv3.getSize();
            for (int i$iv = 0; i$iv < size$iv; i$iv++) {
                FocusRequesterModifierNode it = (FocusRequesterModifierNode) content$iv[i$iv];
                if (FocusRequesterModifierNodeKt.saveFocusedChild(it)) {
                    return true;
                }
            }
            return false;
        }
        throw new IllegalStateException("\n   FocusRequester is not initialized. Here are some possible fixes:\n\n   1. Remember the FocusRequester: val focusRequester = remember { FocusRequester() }\n   2. Did you forget to add a Modifier.focusRequester() ?\n   3. Are you attempting to request focus during composition? Focus requests should be made in\n   response to some event. Eg Modifier.clickable { focusRequester.requestFocus() }\n".toString());
    }

    public final boolean restoreFocusedChild() {
        MutableVector this_$iv = this.focusRequesterNodes;
        MutableVector this_$iv2 = this_$iv.getSize() != 0 ? 1 : null;
        if (this_$iv2 != null) {
            boolean success = false;
            MutableVector this_$iv3 = this.focusRequesterNodes;
            Object[] content$iv = this_$iv3.content;
            int size$iv = this_$iv3.getSize();
            for (int i$iv = 0; i$iv < size$iv; i$iv++) {
                FocusRequesterModifierNode it = (FocusRequesterModifierNode) content$iv[i$iv];
                success = FocusRequesterModifierNodeKt.restoreFocusedChild(it) || success;
            }
            return success;
        }
        throw new IllegalStateException("\n   FocusRequester is not initialized. Here are some possible fixes:\n\n   1. Remember the FocusRequester: val focusRequester = remember { FocusRequester() }\n   2. Did you forget to add a Modifier.focusRequester() ?\n   3. Are you attempting to request focus during composition? Focus requests should be made in\n   response to some event. Eg Modifier.clickable { focusRequester.requestFocus() }\n".toString());
    }

    /* compiled from: FocusRequester.kt */
    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001:\u0001\rB\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0006\u0010\u000b\u001a\u00020\fR\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006R\u0011\u0010\u0007\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\u0006R\u0014\u0010\t\u001a\u00020\u0004X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u0006¨\u0006\u000e"}, d2 = {"Landroidx/compose/ui/focus/FocusRequester$Companion;", "", "()V", "Cancel", "Landroidx/compose/ui/focus/FocusRequester;", "getCancel", "()Landroidx/compose/ui/focus/FocusRequester;", "Default", "getDefault", "Redirect", "getRedirect$ui_release", "createRefs", "Landroidx/compose/ui/focus/FocusRequester$Companion$FocusRequesterFactory;", "FocusRequesterFactory", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final FocusRequester getDefault() {
            return FocusRequester.Default;
        }

        public final FocusRequester getCancel() {
            return FocusRequester.Cancel;
        }

        public final FocusRequester getRedirect$ui_release() {
            return FocusRequester.Redirect;
        }

        /* compiled from: FocusRequester.kt */
        @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0010\bÇ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\t\u0010\u0003\u001a\u00020\u0004H\u0086\u0002J\t\u0010\u0005\u001a\u00020\u0004H\u0086\u0002J\t\u0010\u0006\u001a\u00020\u0004H\u0086\u0002J\t\u0010\u0007\u001a\u00020\u0004H\u0086\u0002J\t\u0010\b\u001a\u00020\u0004H\u0086\u0002J\t\u0010\t\u001a\u00020\u0004H\u0086\u0002J\t\u0010\n\u001a\u00020\u0004H\u0086\u0002J\t\u0010\u000b\u001a\u00020\u0004H\u0086\u0002J\t\u0010\f\u001a\u00020\u0004H\u0086\u0002J\t\u0010\r\u001a\u00020\u0004H\u0086\u0002J\t\u0010\u000e\u001a\u00020\u0004H\u0086\u0002J\t\u0010\u000f\u001a\u00020\u0004H\u0086\u0002J\t\u0010\u0010\u001a\u00020\u0004H\u0086\u0002J\t\u0010\u0011\u001a\u00020\u0004H\u0086\u0002J\t\u0010\u0012\u001a\u00020\u0004H\u0086\u0002J\t\u0010\u0013\u001a\u00020\u0004H\u0086\u0002¨\u0006\u0014"}, d2 = {"Landroidx/compose/ui/focus/FocusRequester$Companion$FocusRequesterFactory;", "", "()V", "component1", "Landroidx/compose/ui/focus/FocusRequester;", "component10", "component11", "component12", "component13", "component14", "component15", "component16", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
        /* loaded from: classes11.dex */
        public static final class FocusRequesterFactory {
            public static final int $stable = 0;
            public static final FocusRequesterFactory INSTANCE = new FocusRequesterFactory();

            private FocusRequesterFactory() {
            }

            public final FocusRequester component1() {
                return new FocusRequester();
            }

            public final FocusRequester component2() {
                return new FocusRequester();
            }

            public final FocusRequester component3() {
                return new FocusRequester();
            }

            public final FocusRequester component4() {
                return new FocusRequester();
            }

            public final FocusRequester component5() {
                return new FocusRequester();
            }

            public final FocusRequester component6() {
                return new FocusRequester();
            }

            public final FocusRequester component7() {
                return new FocusRequester();
            }

            public final FocusRequester component8() {
                return new FocusRequester();
            }

            public final FocusRequester component9() {
                return new FocusRequester();
            }

            public final FocusRequester component10() {
                return new FocusRequester();
            }

            public final FocusRequester component11() {
                return new FocusRequester();
            }

            public final FocusRequester component12() {
                return new FocusRequester();
            }

            public final FocusRequester component13() {
                return new FocusRequester();
            }

            public final FocusRequester component14() {
                return new FocusRequester();
            }

            public final FocusRequester component15() {
                return new FocusRequester();
            }

            public final FocusRequester component16() {
                return new FocusRequester();
            }
        }

        public final FocusRequesterFactory createRefs() {
            return FocusRequesterFactory.INSTANCE;
        }
    }

    private final boolean findFocusTarget(Function1<? super FocusTargetNode, Boolean> function1) {
        Modifier.Node child$iv$iv;
        boolean success;
        Object node$iv$iv;
        int i;
        boolean success2;
        Object node$iv$iv2;
        int count$iv$iv;
        Object node$iv$iv3;
        MutableVector mutableVector;
        int $i$f$findFocusTarget = 0;
        int i2 = 0;
        if (this != Companion.getDefault()) {
            if (this != Companion.getCancel()) {
                if (this.focusRequesterNodes.getSize() != 0) {
                    boolean success3 = false;
                    MutableVector this_$iv = this.focusRequesterNodes;
                    int i$iv = 0;
                    Object[] content$iv = this_$iv.content;
                    int size$iv = this_$iv.getSize();
                    while (i$iv < size$iv) {
                        DelegatableNode node = (FocusRequesterModifierNode) content$iv[i$iv];
                        DelegatableNode $this$visitChildren_u2dY_u2dYKmho_u24default$iv = node;
                        int m5898constructorimpl = NodeKind.m5898constructorimpl(1024);
                        boolean value$iv$iv$iv = $this$visitChildren_u2dY_u2dYKmho_u24default$iv.getNode().isAttached();
                        if (!value$iv$iv$iv) {
                            InlineClassHelperKt.throwIllegalStateException("visitChildren called on an unattached node");
                        }
                        int i3 = 1;
                        int $i$f$findFocusTarget2 = $i$f$findFocusTarget;
                        MutableVector branches$iv$iv = new MutableVector(new Modifier.Node[16], i2);
                        Modifier.Node child$iv$iv2 = $this$visitChildren_u2dY_u2dYKmho_u24default$iv.getNode().getChild$ui_release();
                        if (child$iv$iv2 == null) {
                            DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, $this$visitChildren_u2dY_u2dYKmho_u24default$iv.getNode(), false);
                        } else {
                            branches$iv$iv.add(child$iv$iv2);
                        }
                        while (true) {
                            MutableVector this_$iv$iv$iv = branches$iv$iv;
                            if ((this_$iv$iv$iv.getSize() != 0 ? i3 : i2) != 0) {
                                MutableVector this_$iv$iv$iv2 = branches$iv$iv;
                                Modifier.Node branch$iv$iv = (Modifier.Node) branches$iv$iv.removeAt(this_$iv$iv$iv2.getSize() - 1);
                                if ((branch$iv$iv.getAggregateChildKindSet$ui_release() & m5898constructorimpl) == 0) {
                                    DelegatableNodeKt.addLayoutNodeChildren(branches$iv$iv, branch$iv$iv, false);
                                } else {
                                    Modifier.Node node$iv$iv4 = branch$iv$iv;
                                    while (true) {
                                        if (node$iv$iv4 == null) {
                                            child$iv$iv2 = child$iv$iv2;
                                            i2 = 0;
                                            break;
                                        } else if ((node$iv$iv4.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                                            Object it$iv = node$iv$iv4;
                                            MutableVector mutableVector2 = null;
                                            Object node$iv$iv5 = it$iv;
                                            while (node$iv$iv5 != null) {
                                                MutableVector branches$iv$iv2 = branches$iv$iv;
                                                if (node$iv$iv5 instanceof FocusTargetNode) {
                                                    FocusTargetNode it = (FocusTargetNode) node$iv$iv5;
                                                    child$iv$iv = child$iv$iv2;
                                                    if (function1.invoke(it).booleanValue()) {
                                                        success3 = true;
                                                        break;
                                                    }
                                                    success = success3;
                                                    node$iv$iv = node$iv$iv5;
                                                    i = i3;
                                                } else {
                                                    child$iv$iv = child$iv$iv2;
                                                    Modifier.Node this_$iv$iv$iv3 = node$iv$iv5;
                                                    if (((this_$iv$iv$iv3.getKindSet$ui_release() & m5898constructorimpl) != 0 ? i3 : 0) == 0 || !(node$iv$iv5 instanceof DelegatingNode)) {
                                                        success = success3;
                                                        node$iv$iv = node$iv$iv5;
                                                        i = i3;
                                                    } else {
                                                        int count$iv$iv2 = 0;
                                                        DelegatingNode this_$iv$iv$iv4 = (DelegatingNode) node$iv$iv5;
                                                        Modifier.Node node$iv$iv$iv = this_$iv$iv$iv4.getDelegate$ui_release();
                                                        while (node$iv$iv$iv != null) {
                                                            Modifier.Node next$iv$iv = node$iv$iv$iv;
                                                            if (((next$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0 ? i3 : 0) == 0) {
                                                                success2 = success3;
                                                                node$iv$iv2 = node$iv$iv5;
                                                            } else {
                                                                count$iv$iv2++;
                                                                if (count$iv$iv2 == i3) {
                                                                    success2 = success3;
                                                                    node$iv$iv2 = next$iv$iv;
                                                                } else {
                                                                    if (mutableVector2 == null) {
                                                                        count$iv$iv = count$iv$iv2;
                                                                        success2 = success3;
                                                                        node$iv$iv3 = node$iv$iv5;
                                                                        mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                                    } else {
                                                                        count$iv$iv = count$iv$iv2;
                                                                        success2 = success3;
                                                                        node$iv$iv3 = node$iv$iv5;
                                                                        mutableVector = mutableVector2;
                                                                    }
                                                                    Modifier.Node theNode$iv$iv = node$iv$iv3;
                                                                    if (theNode$iv$iv == null) {
                                                                        node$iv$iv2 = node$iv$iv3;
                                                                    } else {
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
                                                            node$iv$iv5 = node$iv$iv2;
                                                            success3 = success2;
                                                            i3 = 1;
                                                        }
                                                        success = success3;
                                                        node$iv$iv = node$iv$iv5;
                                                        i = 1;
                                                        if (count$iv$iv2 == 1) {
                                                            i3 = 1;
                                                            branches$iv$iv = branches$iv$iv2;
                                                            child$iv$iv2 = child$iv$iv;
                                                            success3 = success;
                                                            node$iv$iv5 = node$iv$iv;
                                                        }
                                                    }
                                                }
                                                node$iv$iv5 = DelegatableNodeKt.pop(mutableVector2);
                                                i3 = i;
                                                branches$iv$iv = branches$iv$iv2;
                                                child$iv$iv2 = child$iv$iv;
                                                success3 = success;
                                            }
                                            child$iv$iv2 = child$iv$iv2;
                                            i2 = 0;
                                        } else {
                                            node$iv$iv4 = node$iv$iv4.getChild$ui_release();
                                            child$iv$iv2 = child$iv$iv2;
                                        }
                                    }
                                }
                            }
                        }
                        i$iv++;
                        i2 = 0;
                        $i$f$findFocusTarget = $i$f$findFocusTarget2;
                    }
                    return success3;
                }
                throw new IllegalStateException("\n   FocusRequester is not initialized. Here are some possible fixes:\n\n   1. Remember the FocusRequester: val focusRequester = remember { FocusRequester() }\n   2. Did you forget to add a Modifier.focusRequester() ?\n   3. Are you attempting to request focus during composition? Focus requests should be made in\n   response to some event. Eg Modifier.clickable { focusRequester.requestFocus() }\n".toString());
            }
            throw new IllegalStateException("\n    Please check whether the focusRequester is FocusRequester.Cancel or FocusRequester.Default\n    before invoking any functions on the focusRequester.\n".toString());
        }
        throw new IllegalStateException("\n    Please check whether the focusRequester is FocusRequester.Cancel or FocusRequester.Default\n    before invoking any functions on the focusRequester.\n".toString());
    }
}
