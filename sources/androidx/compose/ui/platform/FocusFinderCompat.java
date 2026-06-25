package androidx.compose.ui.platform;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import androidx.collection.MutableObjectIntMap;
import androidx.collection.MutableObjectList;
import androidx.collection.MutableScatterMap;
import androidx.collection.MutableScatterSet;
import androidx.collection.ObjectIntMapKt;
import androidx.collection.ObjectList;
import androidx.collection.ScatterMapKt;
import androidx.collection.ScatterSetKt;
import java.util.Collections;
import java.util.Comparator;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;
import kotlin.ranges.RangesKt;
/* compiled from: FocusFinderCompat.android.kt */
@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0018\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0000\u0018\u0000  2\u00020\u0001:\u0002 !B\u0005¢\u0006\u0002\u0010\u0002J\b\u0010\n\u001a\u00020\u000bH\u0002J0\u0010\f\u001a\u0004\u0018\u00010\u00072\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00072\u0006\u0010\u0010\u001a\u00020\u00112\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006H\u0002J \u0010\u0013\u001a\u0004\u0018\u00010\u00072\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00072\u0006\u0010\u0010\u001a\u00020\u0011J2\u0010\u0014\u001a\u0004\u0018\u00010\u00072\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00070\u00062\b\u0010\r\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u000f\u001a\u00020\u00072\u0006\u0010\u0010\u001a\u00020\u0011H\u0003J\"\u0010\u0015\u001a\u0004\u0018\u00010\u00072\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00072\u0006\u0010\u0010\u001a\u00020\u0011H\u0002J\u001a\u0010\u0016\u001a\u00020\u000e2\u0006\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0007H\u0002J0\u0010\u0017\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u000f\u001a\u00020\u00072\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00070\u00182\u0006\u0010\u0019\u001a\u00020\u00112\u0006\u0010\u001a\u001a\u00020\u001bH\u0002J2\u0010\u001c\u001a\u0004\u0018\u00010\u00072\b\u0010\u000f\u001a\u0004\u0018\u00010\u00072\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00070\u00182\u0006\u0010\u0019\u001a\u00020\u00112\u0006\u0010\u001a\u001a\u00020\u001bH\u0002J\u0010\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020\u0011H\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\""}, d2 = {"Landroidx/compose/ui/platform/FocusFinderCompat;", "", "()V", "focusedRect", "Landroid/graphics/Rect;", "tmpList", "Landroidx/collection/MutableObjectList;", "Landroid/view/View;", "userSpecifiedFocusComparator", "Landroidx/compose/ui/platform/FocusFinderCompat$UserSpecifiedFocusComparator;", "FocusFinder", "", "findNextFocus", "root", "Landroid/view/ViewGroup;", "focused", "direction", "", "focusables", "findNextFocus1d", "findNextFocusInRelativeDirection", "findNextUserSpecifiedFocus", "getEffectiveRoot", "getNextFocusable", "Landroidx/collection/ObjectList;", "count", "outLooped", "", "getPreviousFocusable", "isValidId", "", "id", "Companion", "UserSpecifiedFocusComparator", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class FocusFinderCompat {
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;
    private static final FocusFinderCompat$Companion$FocusFinderThreadLocal$1 FocusFinderThreadLocal = new ThreadLocal<FocusFinderCompat>() { // from class: androidx.compose.ui.platform.FocusFinderCompat$Companion$FocusFinderThreadLocal$1
        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.lang.ThreadLocal
        public FocusFinderCompat initialValue() {
            return new FocusFinderCompat();
        }
    };
    private final Rect focusedRect = new Rect();
    private final UserSpecifiedFocusComparator userSpecifiedFocusComparator = new UserSpecifiedFocusComparator(new UserSpecifiedFocusComparator.NextFocusGetter() { // from class: androidx.compose.ui.platform.FocusFinderCompat$$ExternalSyntheticLambda0
        @Override // androidx.compose.ui.platform.FocusFinderCompat.UserSpecifiedFocusComparator.NextFocusGetter
        public final View get(View view, View view2) {
            return FocusFinderCompat.userSpecifiedFocusComparator$lambda$0(FocusFinderCompat.this, view, view2);
        }
    });
    private final MutableObjectList<View> tmpList = new MutableObjectList<>(0, 1, null);

    /* compiled from: FocusFinderCompat.android.kt */
    @Metadata(d1 = {"\u0000\u001b\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003*\u0001\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0010\u0010\u0003\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0005R\u0011\u0010\u0006\u001a\u00020\u00078F¢\u0006\u0006\u001a\u0004\b\b\u0010\t¨\u0006\n"}, d2 = {"Landroidx/compose/ui/platform/FocusFinderCompat$Companion;", "", "()V", "FocusFinderThreadLocal", "androidx/compose/ui/platform/FocusFinderCompat$Companion$FocusFinderThreadLocal$1", "Landroidx/compose/ui/platform/FocusFinderCompat$Companion$FocusFinderThreadLocal$1;", "instance", "Landroidx/compose/ui/platform/FocusFinderCompat;", "getInstance", "()Landroidx/compose/ui/platform/FocusFinderCompat;", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final FocusFinderCompat getInstance() {
            FocusFinderCompat focusFinderCompat = FocusFinderCompat.FocusFinderThreadLocal.get();
            Intrinsics.checkNotNull(focusFinderCompat);
            return focusFinderCompat;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final View userSpecifiedFocusComparator$lambda$0(FocusFinderCompat this$0, View r, View v) {
        View findUserSetNextFocus;
        if (this$0.isValidId(v.getNextFocusForwardId())) {
            findUserSetNextFocus = FocusFinderCompat_androidKt.findUserSetNextFocus(v, r, 2);
            return findUserSetNextFocus;
        }
        return null;
    }

    private final void FocusFinder() {
    }

    public final View findNextFocus1d(ViewGroup root, View focused, int direction) {
        ViewGroup effectiveRoot = getEffectiveRoot(root, focused);
        View next = findNextUserSpecifiedFocus(effectiveRoot, focused, direction);
        if (next != null) {
            return next;
        }
        MutableObjectList focusables = this.tmpList;
        try {
            focusables.clear();
            FocusFinderCompat_androidKt.addFocusableViews(effectiveRoot, focusables, direction);
            if (!focusables.isEmpty()) {
                next = findNextFocus(effectiveRoot, focused, direction, focusables);
            }
            return next;
        } finally {
            focusables.clear();
        }
    }

    private final ViewGroup getEffectiveRoot(ViewGroup root, View focused) {
        if (focused == null || focused == root) {
            return root;
        }
        ViewGroup effective = null;
        for (ViewParent nextParent = focused.getParent(); nextParent instanceof ViewGroup; nextParent = ((ViewGroup) nextParent).getParent()) {
            if (nextParent == root) {
                return effective == null ? root : effective;
            }
            ViewParent vg = nextParent;
            if (((ViewGroup) vg).getTouchscreenBlocksFocus() && focused.getContext().getPackageManager().hasSystemFeature("android.hardware.touchscreen")) {
                effective = (ViewGroup) vg;
            }
        }
        return root;
    }

    private final View findNextUserSpecifiedFocus(ViewGroup root, View focused, int direction) {
        View userSetNextFocus;
        View view;
        userSetNextFocus = FocusFinderCompat_androidKt.findUserSetNextFocus(focused, root, direction);
        View cycleCheck = userSetNextFocus;
        boolean cycleStep = true;
        while (userSetNextFocus != null) {
            if (!userSetNextFocus.isFocusable() || userSetNextFocus.getVisibility() != 0 || (userSetNextFocus.isInTouchMode() && !userSetNextFocus.isFocusableInTouchMode())) {
                userSetNextFocus = FocusFinderCompat_androidKt.findUserSetNextFocus(userSetNextFocus, root, direction);
                boolean z = !cycleStep;
                boolean it = z;
                cycleStep = it;
                if (z) {
                    if (cycleCheck != null) {
                        view = FocusFinderCompat_androidKt.findUserSetNextFocus(cycleCheck, root, direction);
                    } else {
                        view = null;
                    }
                    cycleCheck = view;
                    if (cycleCheck == userSetNextFocus) {
                        break;
                    }
                }
            } else {
                return userSetNextFocus;
            }
        }
        return null;
    }

    private final View findNextFocus(ViewGroup root, View focused, int direction, MutableObjectList<View> mutableObjectList) {
        Rect focusedRect = this.focusedRect;
        focused.getFocusedRect(focusedRect);
        root.offsetDescendantRectToMyCoords(focused, focusedRect);
        return findNextFocusInRelativeDirection(mutableObjectList, root, focused, direction);
    }

    private final View findNextFocusInRelativeDirection(MutableObjectList<View> mutableObjectList, ViewGroup root, View focused, int direction) {
        try {
            Intrinsics.checkNotNull(root);
            this.userSpecifiedFocusComparator.setFocusables(mutableObjectList, root);
            Collections.sort(mutableObjectList.asMutableList(), this.userSpecifiedFocusComparator);
            this.userSpecifiedFocusComparator.recycle();
            int count = mutableObjectList.getSize();
            if (count < 2) {
                return null;
            }
            View next = null;
            boolean[] looped = new boolean[1];
            switch (direction) {
                case 1:
                    next = getPreviousFocusable(focused, mutableObjectList, count, looped);
                    break;
                case 2:
                    next = getNextFocusable(focused, mutableObjectList, count, looped);
                    break;
            }
            return next == null ? mutableObjectList.get(count - 1) : next;
        } catch (Throwable th) {
            this.userSpecifiedFocusComparator.recycle();
            throw th;
        }
    }

    private final View getNextFocusable(View focused, ObjectList<View> objectList, int count, boolean[] outLooped) {
        if (count < 2) {
            return null;
        }
        int position = objectList.lastIndexOf(focused);
        if (position >= 0 && position + 1 < count) {
            return objectList.get(position + 1);
        }
        outLooped[0] = true;
        return objectList.get(0);
    }

    private final View getPreviousFocusable(View focused, ObjectList<View> objectList, int count, boolean[] outLooped) {
        int position;
        if (count < 2) {
            return null;
        }
        if (focused != null && (position = objectList.indexOf(focused)) > 0) {
            return objectList.get(position - 1);
        }
        outLooped[0] = true;
        return objectList.get(count - 1);
    }

    private final boolean isValidId(int id) {
        return (id == 0 || id == -1) ? false : true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: FocusFinderCompat.android.kt */
    @Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0002\u0018\u00002\u0016\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0001j\n\u0012\u0006\u0012\u0004\u0018\u00010\u0002`\u0003:\u0001\u001aB\r\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\u001c\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u00022\b\u0010\u0012\u001a\u0004\u0018\u00010\u0002H\u0016J\u0006\u0010\u0013\u001a\u00020\u0014J\u001c\u0010\u0015\u001a\u00020\u00142\f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u00172\u0006\u0010\u000e\u001a\u00020\u0002J\u000e\u0010\u0018\u001a\u00020\u00142\u0006\u0010\u0019\u001a\u00020\u0002R\u001a\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00020\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0002X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u001b"}, d2 = {"Landroidx/compose/ui/platform/FocusFinderCompat$UserSpecifiedFocusComparator;", "Ljava/util/Comparator;", "Landroid/view/View;", "Lkotlin/Comparator;", "mNextFocusGetter", "Landroidx/compose/ui/platform/FocusFinderCompat$UserSpecifiedFocusComparator$NextFocusGetter;", "(Landroidx/compose/ui/platform/FocusFinderCompat$UserSpecifiedFocusComparator$NextFocusGetter;)V", "headsOfChains", "Landroidx/collection/MutableScatterMap;", "isConnectedTo", "Landroidx/collection/MutableScatterSet;", "nextFoci", "originalOrdinal", "Landroidx/collection/MutableObjectIntMap;", "root", "compare", "", "first", "second", "recycle", "", "setFocusables", "focusables", "Landroidx/collection/ObjectList;", "setHeadOfChain", "head", "NextFocusGetter", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class UserSpecifiedFocusComparator implements Comparator<View> {
        private final NextFocusGetter mNextFocusGetter;
        private View root;
        private final MutableScatterMap<View, View> nextFoci = ScatterMapKt.mutableScatterMapOf();
        private final MutableScatterSet<View> isConnectedTo = ScatterSetKt.mutableScatterSetOf();
        private final MutableScatterMap<View, View> headsOfChains = ScatterMapKt.mutableScatterMapOf();
        private final MutableObjectIntMap<View> originalOrdinal = ObjectIntMapKt.mutableObjectIntMapOf();

        /* compiled from: FocusFinderCompat.android.kt */
        @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bæ\u0080\u0001\u0018\u00002\u00020\u0001J\u001a\u0010\u0002\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u0003H&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0006À\u0006\u0001"}, d2 = {"Landroidx/compose/ui/platform/FocusFinderCompat$UserSpecifiedFocusComparator$NextFocusGetter;", "", "get", "Landroid/view/View;", "root", "view", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
        /* loaded from: classes11.dex */
        public interface NextFocusGetter {
            View get(View view, View view2);
        }

        public UserSpecifiedFocusComparator(NextFocusGetter mNextFocusGetter) {
            this.mNextFocusGetter = mNextFocusGetter;
        }

        public final void recycle() {
            this.root = null;
            this.headsOfChains.clear();
            this.isConnectedTo.clear();
            this.originalOrdinal.clear();
            this.nextFoci.clear();
        }

        public final void setFocusables(ObjectList<View> objectList, View root) {
            this.root = root;
            Object[] content$iv = objectList.content;
            int i = objectList._size;
            for (int i$iv = 0; i$iv < i; i$iv++) {
                int index = i$iv;
                this.originalOrdinal.set((View) content$iv[i$iv], index);
            }
            IntRange until = RangesKt.until(0, objectList._size);
            int $i$f$getIndices = until.getFirst();
            int i2 = until.getLast();
            if ($i$f$getIndices <= i2) {
                while (true) {
                    View view = objectList.get(i2);
                    View next = this.mNextFocusGetter.get(root, view);
                    if (next != null && this.originalOrdinal.containsKey(next)) {
                        this.nextFoci.set(view, next);
                        this.isConnectedTo.add(next);
                    }
                    if (i2 == $i$f$getIndices) {
                        break;
                    }
                    i2--;
                }
            }
            IntRange until2 = RangesKt.until(0, objectList._size);
            int $i$f$getIndices2 = until2.getFirst();
            int i3 = until2.getLast();
            if ($i$f$getIndices2 > i3) {
                return;
            }
            while (true) {
                View view2 = objectList.get(i3);
                if (this.nextFoci.get(view2) != null && !this.isConnectedTo.contains(view2)) {
                    setHeadOfChain(view2);
                }
                if (i3 == $i$f$getIndices2) {
                    return;
                }
                i3--;
            }
        }

        public final void setHeadOfChain(View head) {
            View newHead = head;
            View view = newHead;
            while (view != null) {
                View otherHead = this.headsOfChains.get(view);
                if (otherHead != null) {
                    if (otherHead == newHead) {
                        return;
                    }
                    view = newHead;
                    newHead = otherHead;
                }
                this.headsOfChains.set(view, newHead);
                view = this.nextFoci.get(view);
            }
        }

        @Override // java.util.Comparator
        public int compare(View first, View second) {
            if (first == second) {
                return 0;
            }
            if (first == null) {
                return -1;
            }
            if (second == null) {
                return 1;
            }
            View firstHead = this.headsOfChains.get(first);
            View secondHead = this.headsOfChains.get(second);
            if (firstHead == secondHead && firstHead != null) {
                if (first == firstHead) {
                    return -1;
                }
                if (second != firstHead && this.nextFoci.get(first) != null) {
                    return -1;
                }
                return 1;
            }
            View chainedFirst = firstHead == null ? first : firstHead;
            View chainedSecond = secondHead == null ? second : secondHead;
            if (firstHead == null && secondHead == null) {
                return 0;
            }
            if (this.originalOrdinal.get(chainedFirst) < this.originalOrdinal.get(chainedSecond)) {
                return -1;
            }
            return 1;
        }
    }
}
