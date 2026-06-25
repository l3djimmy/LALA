package androidx.compose.ui.node;

import androidx.compose.ui.Modifier;
import kotlin.Metadata;
/* compiled from: LayoutNodeDrawScope.kt */
@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u000e\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u0002H\u0002¨\u0006\u0003"}, d2 = {"nextDrawNode", "Landroidx/compose/ui/Modifier$Node;", "Landroidx/compose/ui/node/DelegatableNode;", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class LayoutNodeDrawScopeKt {
    /* JADX INFO: Access modifiers changed from: private */
    public static final Modifier.Node nextDrawNode(DelegatableNode $this$nextDrawNode) {
        int m5898constructorimpl = NodeKind.m5898constructorimpl(4);
        int m5898constructorimpl2 = NodeKind.m5898constructorimpl(2);
        Modifier.Node child = $this$nextDrawNode.getNode().getChild$ui_release();
        if (child == null || (child.getAggregateChildKindSet$ui_release() & m5898constructorimpl) == 0) {
            return null;
        }
        for (Modifier.Node next = child; next != null && (next.getKindSet$ui_release() & m5898constructorimpl2) == 0; next = next.getChild$ui_release()) {
            if ((next.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                return next;
            }
        }
        return null;
    }
}
