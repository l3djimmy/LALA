package androidx.compose.ui.platform;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import androidx.collection.MutableObjectList;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
/* compiled from: FocusFinderCompat.android.kt */
@Metadata(d1 = {"\u0000.\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a\"\u0010\u0000\u001a\u0004\u0018\u00010\u00012\u0006\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u0005H\u0002\u001a\"\u0010\u0006\u001a\u00020\u0007*\u00020\u00012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00010\t2\u0006\u0010\n\u001a\u00020\u0005H\u0002\u001a*\u0010\u0006\u001a\u00020\u0007*\u00020\u00012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00010\t2\u0006\u0010\n\u001a\u00020\u00052\u0006\u0010\u000b\u001a\u00020\fH\u0002\u001a\u001e\u0010\r\u001a\u0004\u0018\u00010\u0001*\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00012\u0006\u0010\n\u001a\u00020\u0005H\u0002\u001a*\u0010\u000e\u001a\u0004\u0018\u00010\u0001*\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u00012\u0012\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\f0\u0010H\u0002\u001a,\u0010\u0011\u001a\u0004\u0018\u00010\u0001*\u00020\u00012\u0012\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\f0\u00102\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001H\u0002¨\u0006\u0013"}, d2 = {"findViewInsideOutShouldExist", "Landroid/view/View;", "root", "start", "id", "", "addFocusableViews", "", "views", "Landroidx/collection/MutableObjectList;", "direction", "inTouchMode", "", "findUserSetNextFocus", "findViewByPredicateInsideOut", "predicate", "Lkotlin/Function1;", "findViewByPredicateTraversal", "childToSkip", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class FocusFinderCompat_androidKt {
    /* JADX INFO: Access modifiers changed from: private */
    public static final View findUserSetNextFocus(final View $this$findUserSetNextFocus, final View root, int direction) {
        switch (direction) {
            case 1:
                if ($this$findUserSetNextFocus.getId() == -1) {
                    return null;
                }
                return findViewByPredicateInsideOut(root, $this$findUserSetNextFocus, new Function1<View, Boolean>() { // from class: androidx.compose.ui.platform.FocusFinderCompat_androidKt$findUserSetNextFocus$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public final Boolean invoke(View t) {
                        View findViewInsideOutShouldExist;
                        findViewInsideOutShouldExist = FocusFinderCompat_androidKt.findViewInsideOutShouldExist(root, t, t.getNextFocusForwardId());
                        return Boolean.valueOf(findViewInsideOutShouldExist == $this$findUserSetNextFocus);
                    }
                });
            case 2:
                int next = $this$findUserSetNextFocus.getNextFocusForwardId();
                if (next == -1) {
                    return null;
                }
                return findViewInsideOutShouldExist(root, $this$findUserSetNextFocus, next);
            default:
                return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final View findViewInsideOutShouldExist(View root, View start, final int id) {
        return findViewByPredicateInsideOut(root, start, new Function1<View, Boolean>() { // from class: androidx.compose.ui.platform.FocusFinderCompat_androidKt$findViewInsideOutShouldExist$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(View it) {
                return Boolean.valueOf(it.getId() == id);
            }
        });
    }

    private static final View findViewByPredicateInsideOut(View $this$findViewByPredicateInsideOut, View start, Function1<? super View, Boolean> function1) {
        View view;
        View next = start;
        View childToSkip = null;
        while (true) {
            view = findViewByPredicateTraversal(next, function1, childToSkip);
            if (view != null || next == $this$findViewByPredicateInsideOut) {
                break;
            }
            ViewParent parent = next.getParent();
            if (parent == null || !(parent instanceof View)) {
                return null;
            }
            childToSkip = next;
            next = (View) parent;
        }
        return view;
    }

    private static final View findViewByPredicateTraversal(View $this$findViewByPredicateTraversal, Function1<? super View, Boolean> function1, View childToSkip) {
        View v;
        if (function1.invoke($this$findViewByPredicateTraversal).booleanValue()) {
            return $this$findViewByPredicateTraversal;
        }
        if ($this$findViewByPredicateTraversal instanceof ViewGroup) {
            int childCount = ((ViewGroup) $this$findViewByPredicateTraversal).getChildCount();
            for (int i = 0; i < childCount; i++) {
                View child = ((ViewGroup) $this$findViewByPredicateTraversal).getChildAt(i);
                if (child != childToSkip && (v = findViewByPredicateTraversal(child, function1, childToSkip)) != null) {
                    return v;
                }
            }
            return null;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void addFocusableViews(View $this$addFocusableViews, MutableObjectList<View> mutableObjectList, int direction) {
        addFocusableViews($this$addFocusableViews, mutableObjectList, direction, $this$addFocusableViews.isInTouchMode());
    }

    private static final void addFocusableViews(View $this$addFocusableViews, MutableObjectList<View> mutableObjectList, int direction, boolean inTouchMode) {
        if (($this$addFocusableViews.getVisibility() == 0) && $this$addFocusableViews.isFocusable() && $this$addFocusableViews.isEnabled() && $this$addFocusableViews.getWidth() > 0 && $this$addFocusableViews.getHeight() > 0 && (!inTouchMode || $this$addFocusableViews.isFocusableInTouchMode())) {
            mutableObjectList.add($this$addFocusableViews);
        }
        if ($this$addFocusableViews instanceof ViewGroup) {
            int childCount = ((ViewGroup) $this$addFocusableViews).getChildCount();
            for (int i = 0; i < childCount; i++) {
                addFocusableViews(((ViewGroup) $this$addFocusableViews).getChildAt(i), mutableObjectList, direction, inTouchMode);
            }
        }
    }
}
