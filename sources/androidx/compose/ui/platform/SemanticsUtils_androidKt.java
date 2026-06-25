package androidx.compose.ui.platform;

import android.graphics.Region;
import android.view.View;
import androidx.collection.IntObjectMap;
import androidx.collection.IntObjectMapKt;
import androidx.collection.MutableIntObjectMap;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.layout.LayoutInfo;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.semantics.AccessibilityAction;
import androidx.compose.ui.semantics.Role;
import androidx.compose.ui.semantics.SemanticsActions;
import androidx.compose.ui.semantics.SemanticsConfiguration;
import androidx.compose.ui.semantics.SemanticsConfigurationKt;
import androidx.compose.ui.semantics.SemanticsNode;
import androidx.compose.ui.semantics.SemanticsOwner;
import androidx.compose.ui.semantics.SemanticsProperties;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.viewinterop.AndroidViewHolder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
/* compiled from: SemanticsUtils.android.kt */
@Metadata(d1 = {"\u0000`\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a\u0017\u0010\n\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\f\u001a\u00020\rH\u0001¢\u0006\u0002\u0010\u000e\u001a\u0012\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0006\u0010\f\u001a\u00020\rH\u0000\u001a\u001c\u0010\u0011\u001a\u0004\u0018\u00010\u0012*\b\u0012\u0004\u0012\u00020\u00120\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0000\u001a\u0012\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00180\u0017*\u00020\u0019H\u0000\u001a\f\u0010\u001a\u001a\u00020\u0005*\u00020\u0006H\u0000\u001a\u0016\u0010\u001b\u001a\u0004\u0018\u00010\u001c*\u00020\u001d2\u0006\u0010\u0014\u001a\u00020\u0015H\u0000\u001a\u0018\u0010\u001e\u001a\u0004\u0018\u00010\u001f*\u00020 H\u0000ø\u0001\u0000¢\u0006\u0004\b!\u0010\"\"\u0014\u0010\u0000\u001a\u00020\u0001X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0002\u0010\u0003\"\u001e\u0010\u0004\u001a\u00020\u0005*\u00020\u00068@X\u0080\u0004¢\u0006\f\u0012\u0004\b\u0007\u0010\b\u001a\u0004\b\u0004\u0010\t\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006#"}, d2 = {"DefaultFakeNodeBounds", "Landroidx/compose/ui/geometry/Rect;", "getDefaultFakeNodeBounds", "()Landroidx/compose/ui/geometry/Rect;", "isHidden", "", "Landroidx/compose/ui/semantics/SemanticsNode;", "isHidden$annotations", "(Landroidx/compose/ui/semantics/SemanticsNode;)V", "(Landroidx/compose/ui/semantics/SemanticsNode;)Z", "getScrollViewportLength", "", "configuration", "Landroidx/compose/ui/semantics/SemanticsConfiguration;", "(Landroidx/compose/ui/semantics/SemanticsConfiguration;)Ljava/lang/Float;", "getTextLayoutResult", "Landroidx/compose/ui/text/TextLayoutResult;", "findById", "Landroidx/compose/ui/platform/ScrollObservationScope;", "", "id", "", "getAllUncoveredSemanticsNodesToIntObjectMap", "Landroidx/collection/IntObjectMap;", "Landroidx/compose/ui/platform/SemanticsNodeWithAdjustedBounds;", "Landroidx/compose/ui/semantics/SemanticsOwner;", "isImportantForAccessibility", "semanticsIdToView", "Landroid/view/View;", "Landroidx/compose/ui/platform/AndroidViewsHandler;", "toLegacyClassName", "", "Landroidx/compose/ui/semantics/Role;", "toLegacyClassName-V4PA4sw", "(I)Ljava/lang/String;", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SemanticsUtils_androidKt {
    private static final Rect DefaultFakeNodeBounds = new Rect(0.0f, 0.0f, 10.0f, 10.0f);

    public static /* synthetic */ void isHidden$annotations(SemanticsNode semanticsNode) {
    }

    public static final TextLayoutResult getTextLayoutResult(SemanticsConfiguration configuration) {
        Function1 function1;
        ArrayList arrayList = new ArrayList();
        AccessibilityAction accessibilityAction = (AccessibilityAction) SemanticsConfigurationKt.getOrNull(configuration, SemanticsActions.INSTANCE.getGetTextLayoutResult());
        if (accessibilityAction == null || (function1 = (Function1) accessibilityAction.getAction()) == null) {
            return null;
        }
        boolean getLayoutResult = ((Boolean) function1.invoke(arrayList)).booleanValue();
        if (!getLayoutResult) {
            return null;
        }
        return (TextLayoutResult) arrayList.get(0);
    }

    public static final Float getScrollViewportLength(SemanticsConfiguration configuration) {
        Function1 function1;
        ArrayList arrayList = new ArrayList();
        AccessibilityAction accessibilityAction = (AccessibilityAction) SemanticsConfigurationKt.getOrNull(configuration, SemanticsActions.INSTANCE.getGetScrollViewportLength());
        if (accessibilityAction == null || (function1 = (Function1) accessibilityAction.getAction()) == null) {
            return null;
        }
        boolean actionResult = ((Boolean) function1.invoke(arrayList)).booleanValue();
        if (!actionResult) {
            return null;
        }
        return (Float) arrayList.get(0);
    }

    public static final ScrollObservationScope findById(List<ScrollObservationScope> list, int id) {
        int size = list.size();
        for (int index = 0; index < size; index++) {
            if (list.get(index).getSemanticsNodeId() == id) {
                return list.get(index);
            }
        }
        return null;
    }

    /* renamed from: toLegacyClassName-V4PA4sw  reason: not valid java name */
    public static final String m6079toLegacyClassNameV4PA4sw(int $this$toLegacyClassName_u2dV4PA4sw) {
        if (Role.m6099equalsimpl0($this$toLegacyClassName_u2dV4PA4sw, Role.Companion.m6103getButtono7Vup1c())) {
            return "android.widget.Button";
        }
        if (Role.m6099equalsimpl0($this$toLegacyClassName_u2dV4PA4sw, Role.Companion.m6105getCheckboxo7Vup1c())) {
            return "android.widget.CheckBox";
        }
        if (Role.m6099equalsimpl0($this$toLegacyClassName_u2dV4PA4sw, Role.Companion.m6108getRadioButtono7Vup1c())) {
            return "android.widget.RadioButton";
        }
        if (Role.m6099equalsimpl0($this$toLegacyClassName_u2dV4PA4sw, Role.Companion.m6107getImageo7Vup1c())) {
            return "android.widget.ImageView";
        }
        if (Role.m6099equalsimpl0($this$toLegacyClassName_u2dV4PA4sw, Role.Companion.m6106getDropdownListo7Vup1c())) {
            return "android.widget.Spinner";
        }
        if (Role.m6099equalsimpl0($this$toLegacyClassName_u2dV4PA4sw, Role.Companion.m6111getValuePickero7Vup1c())) {
            return "android.widget.NumberPicker";
        }
        return null;
    }

    public static final boolean isImportantForAccessibility(SemanticsNode $this$isImportantForAccessibility) {
        return !isHidden($this$isImportantForAccessibility) && ($this$isImportantForAccessibility.getUnmergedConfig$ui_release().isMergingSemanticsOfDescendants() || $this$isImportantForAccessibility.getUnmergedConfig$ui_release().containsImportantForAccessibility$ui_release());
    }

    public static final boolean isHidden(SemanticsNode $this$isHidden) {
        return $this$isHidden.isTransparent$ui_release() || $this$isHidden.getUnmergedConfig$ui_release().contains(SemanticsProperties.INSTANCE.getHideFromAccessibility()) || $this$isHidden.getUnmergedConfig$ui_release().contains(SemanticsProperties.INSTANCE.getInvisibleToUser());
    }

    public static final Rect getDefaultFakeNodeBounds() {
        return DefaultFakeNodeBounds;
    }

    public static final View semanticsIdToView(AndroidViewsHandler $this$semanticsIdToView, int id) {
        Object element$iv;
        boolean z;
        Iterable $this$firstOrNull$iv = $this$semanticsIdToView.getLayoutNodeToHolder().entrySet();
        Iterator<T> it = $this$firstOrNull$iv.iterator();
        while (true) {
            if (it.hasNext()) {
                element$iv = it.next();
                Map.Entry it2 = (Map.Entry) element$iv;
                if (((LayoutNode) it2.getKey()).getSemanticsId() == id) {
                    z = true;
                    continue;
                } else {
                    z = false;
                    continue;
                }
                if (z) {
                    break;
                }
            } else {
                element$iv = null;
                break;
            }
        }
        Map.Entry entry = (Map.Entry) element$iv;
        return entry != null ? (AndroidViewHolder) entry.getValue() : null;
    }

    public static final IntObjectMap<SemanticsNodeWithAdjustedBounds> getAllUncoveredSemanticsNodesToIntObjectMap(SemanticsOwner $this$getAllUncoveredSemanticsNodesToIntObjectMap) {
        SemanticsNode root = $this$getAllUncoveredSemanticsNodesToIntObjectMap.getUnmergedRootSemanticsNode();
        if (!root.getLayoutNode$ui_release().isPlaced() || !root.getLayoutNode$ui_release().isAttached()) {
            return IntObjectMapKt.emptyIntObjectMap();
        }
        MutableIntObjectMap nodes = new MutableIntObjectMap(48);
        Rect $this$getAllUncoveredSemanticsNodesToIntObjectMap_u24lambda_u241 = root.getBoundsInRoot();
        float $this$fastRoundToInt$iv = $this$getAllUncoveredSemanticsNodesToIntObjectMap_u24lambda_u241.getLeft();
        int round = Math.round($this$fastRoundToInt$iv);
        float $this$fastRoundToInt$iv2 = $this$getAllUncoveredSemanticsNodesToIntObjectMap_u24lambda_u241.getTop();
        int round2 = Math.round($this$fastRoundToInt$iv2);
        float $this$fastRoundToInt$iv3 = $this$getAllUncoveredSemanticsNodesToIntObjectMap_u24lambda_u241.getRight();
        int round3 = Math.round($this$fastRoundToInt$iv3);
        float $this$fastRoundToInt$iv4 = $this$getAllUncoveredSemanticsNodesToIntObjectMap_u24lambda_u241.getBottom();
        Region unaccountedSpace = new Region(round, round2, round3, Math.round($this$fastRoundToInt$iv4));
        getAllUncoveredSemanticsNodesToIntObjectMap$findAllSemanticNodesRecursive(unaccountedSpace, root, nodes, root, new Region());
        return nodes;
    }

    private static final void getAllUncoveredSemanticsNodesToIntObjectMap$findAllSemanticNodesRecursive(Region unaccountedSpace, SemanticsNode root, MutableIntObjectMap<SemanticsNodeWithAdjustedBounds> mutableIntObjectMap, SemanticsNode currentNode, Region region) {
        int virtualViewId;
        Rect boundsForFakeNode;
        LayoutInfo layoutInfo;
        boolean z = false;
        boolean notAttachedOrPlaced = (currentNode.getLayoutNode$ui_release().isPlaced() && currentNode.getLayoutNode$ui_release().isAttached()) ? false : true;
        if (!unaccountedSpace.isEmpty() || currentNode.getId() == root.getId()) {
            if (notAttachedOrPlaced && !currentNode.isFake$ui_release()) {
                return;
            }
            Rect touchBoundsInRoot = currentNode.getTouchBoundsInRoot();
            float $this$fastRoundToInt$iv = touchBoundsInRoot.getLeft();
            int left = Math.round($this$fastRoundToInt$iv);
            float $this$fastRoundToInt$iv2 = touchBoundsInRoot.getTop();
            int top = Math.round($this$fastRoundToInt$iv2);
            float $this$fastRoundToInt$iv3 = touchBoundsInRoot.getRight();
            int right = Math.round($this$fastRoundToInt$iv3);
            float $this$fastRoundToInt$iv4 = touchBoundsInRoot.getBottom();
            int bottom = Math.round($this$fastRoundToInt$iv4);
            region.set(left, top, right, bottom);
            if (currentNode.getId() == root.getId()) {
                virtualViewId = -1;
            } else {
                virtualViewId = currentNode.getId();
            }
            if (region.op(unaccountedSpace, Region.Op.INTERSECT)) {
                mutableIntObjectMap.set(virtualViewId, new SemanticsNodeWithAdjustedBounds(currentNode, region.getBounds()));
                List children = currentNode.getReplacedChildren$ui_release();
                for (int i = children.size() - 1; -1 < i; i--) {
                    if (!children.get(i).getConfig().contains(SemanticsProperties.INSTANCE.getLinkTestMarker())) {
                        getAllUncoveredSemanticsNodesToIntObjectMap$findAllSemanticNodesRecursive(unaccountedSpace, root, mutableIntObjectMap, children.get(i), region);
                    }
                }
                if (isImportantForAccessibility(currentNode)) {
                    unaccountedSpace.op(left, top, right, bottom, Region.Op.DIFFERENCE);
                }
            } else if (!currentNode.isFake$ui_release()) {
                if (virtualViewId == -1) {
                    mutableIntObjectMap.set(virtualViewId, new SemanticsNodeWithAdjustedBounds(currentNode, region.getBounds()));
                }
            } else {
                SemanticsNode parentNode = currentNode.getParent();
                if (parentNode != null && (layoutInfo = parentNode.getLayoutInfo()) != null && layoutInfo.isPlaced()) {
                    z = true;
                }
                if (z) {
                    boundsForFakeNode = parentNode.getBoundsInRoot();
                } else {
                    boundsForFakeNode = DefaultFakeNodeBounds;
                }
                float $this$fastRoundToInt$iv5 = boundsForFakeNode.getLeft();
                int round = Math.round($this$fastRoundToInt$iv5);
                float $this$fastRoundToInt$iv6 = boundsForFakeNode.getTop();
                int round2 = Math.round($this$fastRoundToInt$iv6);
                float $this$fastRoundToInt$iv7 = boundsForFakeNode.getRight();
                int left2 = Math.round($this$fastRoundToInt$iv7);
                float $this$fastRoundToInt$iv8 = boundsForFakeNode.getBottom();
                mutableIntObjectMap.set(virtualViewId, new SemanticsNodeWithAdjustedBounds(currentNode, new android.graphics.Rect(round, round2, left2, Math.round($this$fastRoundToInt$iv8))));
            }
        }
    }
}
