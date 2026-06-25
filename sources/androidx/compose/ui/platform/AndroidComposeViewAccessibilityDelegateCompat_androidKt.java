package androidx.compose.ui.platform;

import android.content.res.Resources;
import androidx.collection.IntObjectMap;
import androidx.collection.IntObjectMapKt;
import androidx.collection.MutableIntIntMap;
import androidx.collection.MutableIntObjectMap;
import androidx.compose.ui.R;
import androidx.compose.ui.contentcapture.ContentCaptureManager;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.semantics.AccessibilityAction;
import androidx.compose.ui.semantics.ProgressBarRangeInfo;
import androidx.compose.ui.semantics.Role;
import androidx.compose.ui.semantics.SemanticsConfiguration;
import androidx.compose.ui.semantics.SemanticsConfigurationKt;
import androidx.compose.ui.semantics.SemanticsNode;
import androidx.compose.ui.semantics.SemanticsProperties;
import androidx.compose.ui.semantics.SemanticsPropertyKey;
import androidx.compose.ui.state.ToggleableState;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.unit.LayoutDirection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.ReplaceWith;
import kotlin.collections.CollectionsKt;
import kotlin.comparisons.ComparisonsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.ClosedFloatingPointRange;
import kotlin.ranges.RangesKt;
/* compiled from: AndroidComposeViewAccessibilityDelegateCompat.android.kt */
@Metadata(d1 = {"\u0000¢\u0001\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010!\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u001a\u0010\u0014\u001a\u0004\u0018\u00010\u00152\u0006\u0010\u0016\u001a\u00020\u000b2\u0006\u0010\u0017\u001a\u00020\u0018H\u0002\u001aR\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u000b2\u0016\u0010\u001c\u001a\u0012\u0012\u0004\u0012\u00020\u000b0\u001dj\b\u0012\u0004\u0012\u00020\u000b`\u001e2\u0012\u0010\u001f\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000b0!0 2\f\u0010\"\u001a\b\u0012\u0004\u0012\u00020$0#2\u0006\u0010\u0017\u001a\u00020\u0018H\u0002\u001a\u0010\u0010%\u001a\u00020\u00012\u0006\u0010\u0016\u001a\u00020\u000bH\u0002\u001a\u001a\u0010&\u001a\u0004\u0018\u00010\u00152\u0006\u0010\u0016\u001a\u00020\u000b2\u0006\u0010\u0017\u001a\u00020\u0018H\u0002\u001a\u0012\u0010'\u001a\u0004\u0018\u00010(2\u0006\u0010\u0016\u001a\u00020\u000bH\u0002\u001a\u0018\u0010)\u001a\u00020\u00012\u0006\u0010\u0016\u001a\u00020\u000b2\u0006\u0010\u0017\u001a\u00020\u0018H\u0002\u001aL\u0010*\u001a\u00020\u00012:\u0010+\u001a6\u0012\u0016\u0012\u0014\u0012\u0004\u0012\u00020-\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000b0!0,0\u001dj\u001a\u0012\u0016\u0012\u0014\u0012\u0004\u0012\u00020-\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000b0!0,`\u001e2\u0006\u0010\u0016\u001a\u00020\u000bH\u0002\u001a.\u0010.\u001a\u00020\u001a2\f\u0010\"\u001a\b\u0012\u0004\u0012\u00020$0#2\u0006\u0010/\u001a\u0002002\u0006\u00101\u001a\u0002002\u0006\u0010\u0017\u001a\u00020\u0018H\u0002\u001aL\u00102\u001a\b\u0012\u0004\u0012\u00020\u000b0!2\u0006\u00103\u001a\u00020\u00012\u0016\u00104\u001a\u0012\u0012\u0004\u0012\u00020\u000b0\u001dj\b\u0012\u0004\u0012\u00020\u000b`\u001e2\u0006\u0010\u0017\u001a\u00020\u00182\u0014\b\u0002\u00105\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000b0!0 H\u0002\u001a:\u00106\u001a\b\u0012\u0004\u0012\u00020\u000b0!2\u0006\u00103\u001a\u00020\u00012\f\u00107\u001a\b\u0012\u0004\u0012\u00020\u000b082\f\u0010\"\u001a\b\u0012\u0004\u0012\u00020$0#2\u0006\u0010\u0017\u001a\u00020\u0018H\u0002\u001a\u001a\u00109\u001a\u00020\u0001*\u0006\u0012\u0002\b\u00030:2\b\u0010;\u001a\u0004\u0018\u00010<H\u0002\u001a\f\u0010=\u001a\u00020\u0001*\u00020\u000bH\u0002\u001a\f\u0010>\u001a\u00020\u0001*\u00020\u000bH\u0002\u001a\"\u0010?\u001a\u0004\u0018\u00010@*\u00020@2\u0012\u0010A\u001a\u000e\u0012\u0004\u0012\u00020@\u0012\u0004\u0012\u00020\u00010BH\u0002\u001a\u0014\u0010C\u001a\u00020\u0001*\u00020\u000b2\u0006\u0010D\u001a\u00020EH\u0002\"*\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0000\u001a\u00020\u00018G@GX\u0087\u000e¢\u0006\u0012\u0012\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\b\" \u0010\t\u001a\u0014\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\f0\nX\u0082\u0004¢\u0006\u0002\n\u0000\"&\u0010\r\u001a\u0018\u0012\u0014\u0012\u0012\u0012\u0004\u0012\u00020\u000b0\u000fj\b\u0012\u0004\u0012\u00020\u000b`\u00100\u000eX\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0011\"\u0018\u0010\u0012\u001a\u00020\u0001*\u00020\u000b8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013¨\u0006F"}, d2 = {"value", "", "DisableContentCapture", "getDisableContentCapture$annotations", "()V", "getDisableContentCapture", "()Z", "setDisableContentCapture", "(Z)V", "UnmergedConfigComparator", "Lkotlin/Function2;", "Landroidx/compose/ui/semantics/SemanticsNode;", "", "semanticComparators", "", "Ljava/util/Comparator;", "Lkotlin/Comparator;", "[Ljava/util/Comparator;", "isRtl", "(Landroidx/compose/ui/semantics/SemanticsNode;)Z", "createStateDescriptionForTextField", "", "node", "resources", "Landroid/content/res/Resources;", "geometryDepthFirstSearch", "", "currNode", "geometryList", "Ljava/util/ArrayList;", "Lkotlin/collections/ArrayList;", "containerMapToChildren", "Landroidx/collection/MutableIntObjectMap;", "", "currentSemanticsNodes", "Landroidx/collection/IntObjectMap;", "Landroidx/compose/ui/platform/SemanticsNodeWithAdjustedBounds;", "getInfoIsCheckable", "getInfoStateDescriptionOrNull", "getInfoText", "Landroidx/compose/ui/text/AnnotatedString;", "isScreenReaderFocusable", "placedEntryRowOverlaps", "rowGroupings", "Lkotlin/Pair;", "Landroidx/compose/ui/geometry/Rect;", "setTraversalValues", "outputBeforeMap", "Landroidx/collection/MutableIntIntMap;", "outputAfterMap", "sortByGeometryGroupings", "layoutIsRtl", "parentListToSort", "containerChildrenMapping", "subtreeSortedByGeometryGrouping", "listToSort", "", "accessibilityEquals", "Landroidx/compose/ui/semantics/AccessibilityAction;", "other", "", "enabled", "excludeLineAndPageGranularities", "findClosestParentNode", "Landroidx/compose/ui/node/LayoutNode;", "selector", "Lkotlin/Function1;", "propertiesDeleted", "oldConfig", "Landroidx/compose/ui/semantics/SemanticsConfiguration;", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class AndroidComposeViewAccessibilityDelegateCompat_androidKt {
    private static final Function2<SemanticsNode, SemanticsNode, Integer> UnmergedConfigComparator;
    private static final Comparator<SemanticsNode>[] semanticComparators;

    /* compiled from: AndroidComposeViewAccessibilityDelegateCompat.android.kt */
    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[ToggleableState.values().length];
            try {
                iArr[ToggleableState.On.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[ToggleableState.Off.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[ToggleableState.Indeterminate.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    @Deprecated(level = DeprecationLevel.WARNING, message = "Use ContentCapture.isEnabled instead", replaceWith = @ReplaceWith(expression = "!ContentCaptureManager.isEnabled", imports = {"androidx.compose.ui.contentcapture.ContentCaptureManager.Companion.isEnabled"}))
    public static /* synthetic */ void getDisableContentCapture$annotations() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final LayoutNode findClosestParentNode(LayoutNode $this$findClosestParentNode, Function1<? super LayoutNode, Boolean> function1) {
        for (LayoutNode currentParent = $this$findClosestParentNode.getParent$ui_release(); currentParent != null; currentParent = currentParent.getParent$ui_release()) {
            if (function1.invoke(currentParent).booleanValue()) {
                return currentParent;
            }
        }
        return null;
    }

    static {
        Comparator<SemanticsNode>[] comparatorArr = new Comparator[2];
        int i = 0;
        while (i < 2) {
            final Comparator comparator = i == 0 ? RtlBoundsComparator.INSTANCE : LtrBoundsComparator.INSTANCE;
            final Comparator<LayoutNode> zComparator$ui_release = LayoutNode.Companion.getZComparator$ui_release();
            final Comparator comparator2 = new Comparator() { // from class: androidx.compose.ui.platform.AndroidComposeViewAccessibilityDelegateCompat_androidKt$special$$inlined$thenBy$1
                @Override // java.util.Comparator
                public final int compare(T t, T t2) {
                    int previousCompare = comparator.compare(t, t2);
                    if (previousCompare != 0) {
                        return previousCompare;
                    }
                    SemanticsNode it = (SemanticsNode) t;
                    SemanticsNode it2 = (SemanticsNode) t2;
                    return zComparator$ui_release.compare(it.getLayoutNode$ui_release(), it2.getLayoutNode$ui_release());
                }
            };
            comparatorArr[i] = new Comparator() { // from class: androidx.compose.ui.platform.AndroidComposeViewAccessibilityDelegateCompat_androidKt$special$$inlined$thenBy$2
                @Override // java.util.Comparator
                public final int compare(T t, T t2) {
                    int previousCompare = comparator2.compare(t, t2);
                    if (previousCompare != 0) {
                        return previousCompare;
                    }
                    SemanticsNode it = (SemanticsNode) t;
                    SemanticsNode it2 = (SemanticsNode) t2;
                    return ComparisonsKt.compareValues(Integer.valueOf(it.getId()), Integer.valueOf(it2.getId()));
                }
            };
            i++;
        }
        semanticComparators = comparatorArr;
        UnmergedConfigComparator = new Function2<SemanticsNode, SemanticsNode, Integer>() { // from class: androidx.compose.ui.platform.AndroidComposeViewAccessibilityDelegateCompat_androidKt$UnmergedConfigComparator$1
            @Override // kotlin.jvm.functions.Function2
            public final Integer invoke(SemanticsNode a, SemanticsNode b) {
                return Integer.valueOf(Float.compare(((Number) a.getUnmergedConfig$ui_release().getOrElse(SemanticsProperties.INSTANCE.getTraversalIndex(), new Function0<Float>() { // from class: androidx.compose.ui.platform.AndroidComposeViewAccessibilityDelegateCompat_androidKt$UnmergedConfigComparator$1.1
                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // kotlin.jvm.functions.Function0
                    public final Float invoke() {
                        return Float.valueOf(0.0f);
                    }
                })).floatValue(), ((Number) b.getUnmergedConfig$ui_release().getOrElse(SemanticsProperties.INSTANCE.getTraversalIndex(), new Function0<Float>() { // from class: androidx.compose.ui.platform.AndroidComposeViewAccessibilityDelegateCompat_androidKt$UnmergedConfigComparator$1.2
                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // kotlin.jvm.functions.Function0
                    public final Float invoke() {
                        return Float.valueOf(0.0f);
                    }
                })).floatValue()));
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void setTraversalValues(IntObjectMap<SemanticsNodeWithAdjustedBounds> intObjectMap, MutableIntIntMap outputBeforeMap, MutableIntIntMap outputAfterMap, Resources resources) {
        outputBeforeMap.clear();
        outputAfterMap.clear();
        SemanticsNodeWithAdjustedBounds semanticsNodeWithAdjustedBounds = intObjectMap.get(-1);
        SemanticsNode hostSemanticsNode = semanticsNodeWithAdjustedBounds != null ? semanticsNodeWithAdjustedBounds.getSemanticsNode() : null;
        Intrinsics.checkNotNull(hostSemanticsNode);
        boolean hostLayoutIsRtl = isRtl(hostSemanticsNode);
        List semanticsOrderList = subtreeSortedByGeometryGrouping(hostLayoutIsRtl, CollectionsKt.listOf(hostSemanticsNode), intObjectMap, resources);
        int i = 1;
        int lastIndex = CollectionsKt.getLastIndex(semanticsOrderList);
        if (1 > lastIndex) {
            return;
        }
        while (true) {
            int prevId = semanticsOrderList.get(i - 1).getId();
            int currId = semanticsOrderList.get(i).getId();
            outputBeforeMap.set(prevId, currId);
            outputAfterMap.set(currId, prevId);
            if (i == lastIndex) {
                return;
            }
            i++;
        }
    }

    private static final List<SemanticsNode> subtreeSortedByGeometryGrouping(boolean layoutIsRtl, List<SemanticsNode> list, IntObjectMap<SemanticsNodeWithAdjustedBounds> intObjectMap, Resources resources) {
        MutableIntObjectMap containerMapToChildren = IntObjectMapKt.mutableIntObjectMapOf();
        ArrayList geometryList = new ArrayList();
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = list.get(index$iv);
            SemanticsNode node = (SemanticsNode) item$iv;
            geometryDepthFirstSearch(node, geometryList, containerMapToChildren, intObjectMap, resources);
        }
        List $this$fastForEach$iv = sortByGeometryGroupings(layoutIsRtl, geometryList, resources, containerMapToChildren);
        return $this$fastForEach$iv;
    }

    private static final void geometryDepthFirstSearch(SemanticsNode currNode, ArrayList<SemanticsNode> arrayList, MutableIntObjectMap<List<SemanticsNode>> mutableIntObjectMap, IntObjectMap<SemanticsNodeWithAdjustedBounds> intObjectMap, Resources resources) {
        boolean currRTL = isRtl(currNode);
        boolean isTraversalGroup = ((Boolean) currNode.getUnmergedConfig$ui_release().getOrElse(SemanticsProperties.INSTANCE.getIsTraversalGroup(), new Function0<Boolean>() { // from class: androidx.compose.ui.platform.AndroidComposeViewAccessibilityDelegateCompat_androidKt$geometryDepthFirstSearch$isTraversalGroup$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Boolean invoke() {
                return false;
            }
        })).booleanValue();
        if ((isTraversalGroup || isScreenReaderFocusable(currNode, resources)) && intObjectMap.containsKey(currNode.getId())) {
            arrayList.add(currNode);
        }
        if (isTraversalGroup) {
            mutableIntObjectMap.set(currNode.getId(), subtreeSortedByGeometryGrouping(currRTL, currNode.getChildren(), intObjectMap, resources));
            return;
        }
        List $this$fastForEach$iv = currNode.getChildren();
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            SemanticsNode child = (SemanticsNode) item$iv;
            geometryDepthFirstSearch(child, arrayList, mutableIntObjectMap, intObjectMap, resources);
        }
    }

    static /* synthetic */ List sortByGeometryGroupings$default(boolean z, ArrayList arrayList, Resources resources, MutableIntObjectMap mutableIntObjectMap, int i, Object obj) {
        if ((i & 8) != 0) {
            mutableIntObjectMap = IntObjectMapKt.mutableIntObjectMapOf();
        }
        return sortByGeometryGroupings(z, arrayList, resources, mutableIntObjectMap);
    }

    private static final List<SemanticsNode> sortByGeometryGroupings(boolean layoutIsRtl, ArrayList<SemanticsNode> arrayList, Resources resources, MutableIntObjectMap<List<SemanticsNode>> mutableIntObjectMap) {
        ArrayList rowGroupings = new ArrayList(arrayList.size() / 2);
        int entryIndex = 0;
        int lastIndex = CollectionsKt.getLastIndex(arrayList);
        if (0 <= lastIndex) {
            while (true) {
                SemanticsNode currEntry = arrayList.get(entryIndex);
                if (entryIndex == 0 || !placedEntryRowOverlaps(rowGroupings, currEntry)) {
                    Rect newRect = currEntry.getBoundsInWindow();
                    rowGroupings.add(new Pair(newRect, CollectionsKt.mutableListOf(currEntry)));
                }
                if (entryIndex == lastIndex) {
                    break;
                }
                entryIndex++;
            }
        }
        CollectionsKt.sortWith(rowGroupings, TopBottomBoundsComparator.INSTANCE);
        ArrayList returnList = new ArrayList();
        Comparator comparator = semanticComparators[!layoutIsRtl ? 1 : 0];
        ArrayList $this$fastForEach$iv = rowGroupings;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            Pair row = (Pair) item$iv;
            CollectionsKt.sortWith((List) row.getSecond(), comparator);
            returnList.addAll((Collection) row.getSecond());
        }
        final Function2<SemanticsNode, SemanticsNode, Integer> function2 = UnmergedConfigComparator;
        CollectionsKt.sortWith(returnList, new Comparator() { // from class: androidx.compose.ui.platform.AndroidComposeViewAccessibilityDelegateCompat_androidKt$$ExternalSyntheticLambda0
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                int intValue;
                intValue = ((Number) Function2.this.invoke(obj, obj2)).intValue();
                return intValue;
            }
        });
        int i = 0;
        while (i <= CollectionsKt.getLastIndex(returnList)) {
            int currNodeId = ((SemanticsNode) returnList.get(i)).getId();
            List containersChildrenList = mutableIntObjectMap.get(currNodeId);
            if (containersChildrenList != null) {
                boolean containerIsScreenReaderFocusable = isScreenReaderFocusable((SemanticsNode) returnList.get(i), resources);
                if (!containerIsScreenReaderFocusable) {
                    returnList.remove(i);
                } else {
                    i++;
                }
                returnList.addAll(i, containersChildrenList);
                i += containersChildrenList.size();
            } else {
                i++;
            }
        }
        return returnList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean isScreenReaderFocusable(SemanticsNode node, Resources resources) {
        List list = (List) SemanticsConfigurationKt.getOrNull(node.getUnmergedConfig$ui_release(), SemanticsProperties.INSTANCE.getContentDescription());
        String nodeContentDescriptionOrNull = list != null ? (String) CollectionsKt.firstOrNull((List<? extends Object>) list) : null;
        boolean isSpeakingNode = (nodeContentDescriptionOrNull == null && getInfoText(node) == null && getInfoStateDescriptionOrNull(node, resources) == null && !getInfoIsCheckable(node)) ? false : true;
        if (SemanticsUtils_androidKt.isHidden(node)) {
            return false;
        }
        return node.getUnmergedConfig$ui_release().isMergingSemanticsOfDescendants() || (node.isUnmergedLeafNode$ui_release() && isSpeakingNode);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final AnnotatedString getInfoText(SemanticsNode node) {
        AnnotatedString editableTextToAssign = (AnnotatedString) SemanticsConfigurationKt.getOrNull(node.getUnmergedConfig$ui_release(), SemanticsProperties.INSTANCE.getEditableText());
        List list = (List) SemanticsConfigurationKt.getOrNull(node.getUnmergedConfig$ui_release(), SemanticsProperties.INSTANCE.getText());
        AnnotatedString textToAssign = list != null ? (AnnotatedString) CollectionsKt.firstOrNull((List<? extends Object>) list) : null;
        return editableTextToAssign == null ? textToAssign : editableTextToAssign;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String getInfoStateDescriptionOrNull(SemanticsNode node, Resources resources) {
        Object stateDescription = SemanticsConfigurationKt.getOrNull(node.getUnmergedConfig$ui_release(), SemanticsProperties.INSTANCE.getStateDescription());
        ToggleableState toggleState = (ToggleableState) SemanticsConfigurationKt.getOrNull(node.getUnmergedConfig$ui_release(), SemanticsProperties.INSTANCE.getToggleableState());
        Role role = (Role) SemanticsConfigurationKt.getOrNull(node.getUnmergedConfig$ui_release(), SemanticsProperties.INSTANCE.getRole());
        if (toggleState != null) {
            switch (WhenMappings.$EnumSwitchMapping$0[toggleState.ordinal()]) {
                case 1:
                    if ((role == null ? false : Role.m6099equalsimpl0(role.m6102unboximpl(), Role.Companion.m6109getSwitcho7Vup1c())) && stateDescription == null) {
                        stateDescription = resources.getString(R.string.state_on);
                        break;
                    }
                    break;
                case 2:
                    if ((role == null ? false : Role.m6099equalsimpl0(role.m6102unboximpl(), Role.Companion.m6109getSwitcho7Vup1c())) && stateDescription == null) {
                        stateDescription = resources.getString(R.string.state_off);
                        break;
                    }
                    break;
                case 3:
                    if (stateDescription == null) {
                        stateDescription = resources.getString(R.string.indeterminate);
                        break;
                    }
                    break;
            }
        }
        Boolean bool = (Boolean) SemanticsConfigurationKt.getOrNull(node.getUnmergedConfig$ui_release(), SemanticsProperties.INSTANCE.getSelected());
        if (bool != null) {
            boolean it = bool.booleanValue();
            if (!(role == null ? false : Role.m6099equalsimpl0(role.m6102unboximpl(), Role.Companion.m6110getTabo7Vup1c())) && stateDescription == null) {
                stateDescription = it ? resources.getString(R.string.selected) : resources.getString(R.string.not_selected);
            }
        }
        ProgressBarRangeInfo rangeInfo = (ProgressBarRangeInfo) SemanticsConfigurationKt.getOrNull(node.getUnmergedConfig$ui_release(), SemanticsProperties.INSTANCE.getProgressBarRangeInfo());
        if (rangeInfo != null) {
            if (rangeInfo != ProgressBarRangeInfo.Companion.getIndeterminate()) {
                if (stateDescription == null) {
                    ClosedFloatingPointRange valueRange = rangeInfo.getRange();
                    float $this$fastCoerceIn$iv = ((valueRange.getEndInclusive().floatValue() - valueRange.getStart().floatValue()) > 0.0f ? 1 : ((valueRange.getEndInclusive().floatValue() - valueRange.getStart().floatValue()) == 0.0f ? 0 : -1)) == 0 ? 0.0f : (rangeInfo.getCurrent() - valueRange.getStart().floatValue()) / (valueRange.getEndInclusive().floatValue() - valueRange.getStart().floatValue());
                    float $this$fastCoerceAtLeast$iv$iv = $this$fastCoerceIn$iv;
                    if ($this$fastCoerceAtLeast$iv$iv < 0.0f) {
                        $this$fastCoerceAtLeast$iv$iv = 0.0f;
                    }
                    if ($this$fastCoerceAtLeast$iv$iv > 1.0f) {
                        $this$fastCoerceAtLeast$iv$iv = 1.0f;
                    }
                    if (!($this$fastCoerceAtLeast$iv$iv == 0.0f)) {
                        percent = $this$fastCoerceAtLeast$iv$iv == 1.0f ? 1 : 0;
                        if (percent != 0) {
                            percent = 100;
                        } else {
                            float $this$fastRoundToInt$iv = 100.0f * $this$fastCoerceAtLeast$iv$iv;
                            percent = RangesKt.coerceIn(Math.round($this$fastRoundToInt$iv), 1, 99);
                        }
                    }
                    stateDescription = resources.getString(R.string.template_percent, Integer.valueOf(percent));
                }
            } else if (stateDescription == null) {
                stateDescription = resources.getString(R.string.in_progress);
            }
        }
        if (node.getUnmergedConfig$ui_release().contains(SemanticsProperties.INSTANCE.getEditableText())) {
            stateDescription = createStateDescriptionForTextField(node, resources);
        }
        return (String) stateDescription;
    }

    private static final String createStateDescriptionForTextField(SemanticsNode node, Resources resources) {
        SemanticsConfiguration mergedConfig = node.copyWithMergingEnabled$ui_release().getConfig();
        Collection collection = (Collection) SemanticsConfigurationKt.getOrNull(mergedConfig, SemanticsProperties.INSTANCE.getContentDescription());
        boolean mergedNodeIsUnspeakable = false;
        if (collection == null || collection.isEmpty()) {
            Collection collection2 = (Collection) SemanticsConfigurationKt.getOrNull(mergedConfig, SemanticsProperties.INSTANCE.getText());
            if (collection2 == null || collection2.isEmpty()) {
                CharSequence charSequence = (CharSequence) SemanticsConfigurationKt.getOrNull(mergedConfig, SemanticsProperties.INSTANCE.getEditableText());
                if (charSequence == null || charSequence.length() == 0) {
                    mergedNodeIsUnspeakable = true;
                }
            }
        }
        if (mergedNodeIsUnspeakable) {
            return resources.getString(R.string.state_empty);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean getInfoIsCheckable(SemanticsNode node) {
        boolean isCheckable = false;
        ToggleableState toggleState = (ToggleableState) SemanticsConfigurationKt.getOrNull(node.getUnmergedConfig$ui_release(), SemanticsProperties.INSTANCE.getToggleableState());
        Role role = (Role) SemanticsConfigurationKt.getOrNull(node.getUnmergedConfig$ui_release(), SemanticsProperties.INSTANCE.getRole());
        if (toggleState != null) {
            isCheckable = true;
        }
        Boolean bool = (Boolean) SemanticsConfigurationKt.getOrNull(node.getUnmergedConfig$ui_release(), SemanticsProperties.INSTANCE.getSelected());
        if (bool != null) {
            bool.booleanValue();
            if (!(role == null ? false : Role.m6099equalsimpl0(role.m6102unboximpl(), Role.Companion.m6110getTabo7Vup1c()))) {
                return true;
            }
            return isCheckable;
        }
        return isCheckable;
    }

    private static final boolean placedEntryRowOverlaps(ArrayList<Pair<Rect, List<SemanticsNode>>> arrayList, SemanticsNode node) {
        float entryTopCoord = node.getBoundsInWindow().getTop();
        float entryBottomCoord = node.getBoundsInWindow().getBottom();
        boolean entryIsEmpty = entryTopCoord >= entryBottomCoord;
        int currIndex = 0;
        int lastIndex = CollectionsKt.getLastIndex(arrayList);
        if (0 <= lastIndex) {
            while (true) {
                Rect currRect = arrayList.get(currIndex).getFirst();
                boolean groupIsEmpty = currRect.getTop() >= currRect.getBottom();
                boolean groupOverlapsEntry = (entryIsEmpty || groupIsEmpty || Math.max(entryTopCoord, currRect.getTop()) >= Math.min(entryBottomCoord, currRect.getBottom())) ? false : true;
                if (!groupOverlapsEntry) {
                    if (currIndex == lastIndex) {
                        break;
                    }
                    currIndex++;
                } else {
                    Rect newRect = currRect.intersect(0.0f, entryTopCoord, Float.POSITIVE_INFINITY, entryBottomCoord);
                    arrayList.set(currIndex, new Pair<>(newRect, arrayList.get(currIndex).getSecond()));
                    arrayList.get(currIndex).getSecond().add(node);
                    return true;
                }
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean enabled(SemanticsNode $this$enabled) {
        return !$this$enabled.getConfig().contains(SemanticsProperties.INSTANCE.getDisabled());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean propertiesDeleted(SemanticsNode $this$propertiesDeleted, SemanticsConfiguration oldConfig) {
        Iterator<Map.Entry<? extends SemanticsPropertyKey<?>, ? extends Object>> it = oldConfig.iterator();
        while (it.hasNext()) {
            Map.Entry entry = it.next();
            if (!$this$propertiesDeleted.getConfig().contains(entry.getKey())) {
                return true;
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean isRtl(SemanticsNode $this$isRtl) {
        return $this$isRtl.getLayoutInfo().getLayoutDirection() == LayoutDirection.Rtl;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean excludeLineAndPageGranularities(SemanticsNode $this$excludeLineAndPageGranularities) {
        boolean z;
        if (!$this$excludeLineAndPageGranularities.getUnmergedConfig$ui_release().contains(SemanticsProperties.INSTANCE.getEditableText()) || Intrinsics.areEqual(SemanticsConfigurationKt.getOrNull($this$excludeLineAndPageGranularities.getUnmergedConfig$ui_release(), SemanticsProperties.INSTANCE.getFocused()), (Object) true)) {
            LayoutNode ancestor = findClosestParentNode($this$excludeLineAndPageGranularities.getLayoutNode$ui_release(), new Function1<LayoutNode, Boolean>() { // from class: androidx.compose.ui.platform.AndroidComposeViewAccessibilityDelegateCompat_androidKt$excludeLineAndPageGranularities$ancestor$1
                @Override // kotlin.jvm.functions.Function1
                public final Boolean invoke(LayoutNode it) {
                    SemanticsConfiguration ancestorSemanticsConfiguration = it.getSemanticsConfiguration();
                    boolean z2 = true;
                    if (!(ancestorSemanticsConfiguration != null && ancestorSemanticsConfiguration.isMergingSemanticsOfDescendants()) || !ancestorSemanticsConfiguration.contains(SemanticsProperties.INSTANCE.getEditableText())) {
                        z2 = false;
                    }
                    return Boolean.valueOf(z2);
                }
            });
            if (ancestor != null) {
                SemanticsConfiguration semanticsConfiguration = ancestor.getSemanticsConfiguration();
                if (semanticsConfiguration != null) {
                    z = Intrinsics.areEqual(SemanticsConfigurationKt.getOrNull(semanticsConfiguration, SemanticsProperties.INSTANCE.getFocused()), (Object) true);
                } else {
                    z = false;
                }
                if (!z) {
                    return true;
                }
            }
            return false;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean accessibilityEquals(AccessibilityAction<?> accessibilityAction, Object other) {
        if (accessibilityAction == other) {
            return true;
        }
        if ((other instanceof AccessibilityAction) && Intrinsics.areEqual(accessibilityAction.getLabel(), ((AccessibilityAction) other).getLabel())) {
            if (accessibilityAction.getAction() != null || ((AccessibilityAction) other).getAction() == null) {
                return accessibilityAction.getAction() == null || ((AccessibilityAction) other).getAction() != null;
            }
            return false;
        }
        return false;
    }

    public static final boolean getDisableContentCapture() {
        return ContentCaptureManager.Companion.isEnabled();
    }

    public static final void setDisableContentCapture(boolean value) {
        ContentCaptureManager.Companion.setEnabled(value);
    }
}
