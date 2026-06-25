package androidx.compose.ui.window;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import androidx.autofill.HintConstants;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.CompositionContext;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.platform.AbstractComposeView;
import androidx.core.app.NotificationCompat;
import androidx.core.graphics.Insets;
import androidx.core.view.OnApplyWindowInsetsListener;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsAnimationCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.exifinterface.media.ExifInterface;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;
import kotlin.math.MathKt;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: AndroidDialog.android.kt */
@Metadata(d1 = {"\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0002\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003B\u0015\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bJ\r\u0010\u001d\u001a\u00020\u000bH\u0017¢\u0006\u0002\u0010\u001eJ~\u0010\u001f\u001a\u0002H \"\u0004\b\u0000\u0010 2\u0006\u0010!\u001a\u0002H 2`\u0010\"\u001a\\\u0012\u0013\u0012\u00110$¢\u0006\f\b%\u0012\b\b&\u0012\u0004\b\b('\u0012\u0013\u0012\u00110$¢\u0006\f\b%\u0012\b\b&\u0012\u0004\b\b((\u0012\u0013\u0012\u00110$¢\u0006\f\b%\u0012\b\b&\u0012\u0004\b\b()\u0012\u0013\u0012\u00110$¢\u0006\f\b%\u0012\b\b&\u0012\u0004\b\b(*\u0012\u0004\u0012\u0002H 0#H\u0082\b¢\u0006\u0002\u0010+J5\u0010,\u001a\u00020\u000b2\u0006\u0010-\u001a\u00020\u00152\u0006\u0010'\u001a\u00020$2\u0006\u0010(\u001a\u00020$2\u0006\u0010)\u001a\u00020$2\u0006\u0010*\u001a\u00020$H\u0010¢\u0006\u0002\b.J\u001d\u0010/\u001a\u00020\u000b2\u0006\u00100\u001a\u00020$2\u0006\u00101\u001a\u00020$H\u0010¢\u0006\u0002\b2J\u000e\u00103\u001a\u00020\u00152\u0006\u00104\u001a\u000205J\u0018\u00106\u001a\u0002072\u0006\u00108\u001a\u0002092\u0006\u0010:\u001a\u000207H\u0016J&\u0010\u0010\u001a\u00020\u000b2\u0006\u0010;\u001a\u00020<2\u0011\u0010\r\u001a\r\u0012\u0004\u0012\u00020\u000b0\n¢\u0006\u0002\b\f¢\u0006\u0002\u0010=J\u0016\u0010>\u001a\u00020\u000b2\u0006\u0010\u001a\u001a\u00020\u00152\u0006\u0010\u0014\u001a\u00020\u0015RA\u0010\r\u001a\r\u0012\u0004\u0012\u00020\u000b0\n¢\u0006\u0002\b\f2\u0011\u0010\t\u001a\r\u0012\u0004\u0012\u00020\u000b0\n¢\u0006\u0002\b\f8B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\b\u0012\u0010\u0013\u001a\u0004\b\u000e\u0010\u000f\"\u0004\b\u0010\u0010\u0011R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u0010\u0017\u001a\u00020\u00152\u0006\u0010\t\u001a\u00020\u0015@RX\u0094\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u000e\u0010\u001a\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u00020\u0007X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001c¨\u0006?"}, d2 = {"Landroidx/compose/ui/window/DialogLayout;", "Landroidx/compose/ui/platform/AbstractComposeView;", "Landroidx/compose/ui/window/DialogWindowProvider;", "Landroidx/core/view/OnApplyWindowInsetsListener;", "context", "Landroid/content/Context;", "window", "Landroid/view/Window;", "(Landroid/content/Context;Landroid/view/Window;)V", "<set-?>", "Lkotlin/Function0;", "", "Landroidx/compose/runtime/Composable;", "content", "getContent", "()Lkotlin/jvm/functions/Function2;", "setContent", "(Lkotlin/jvm/functions/Function2;)V", "content$delegate", "Landroidx/compose/runtime/MutableState;", "decorFitsSystemWindows", "", "hasCalledSetLayout", "shouldCreateCompositionOnAttachedToWindow", "getShouldCreateCompositionOnAttachedToWindow", "()Z", "usePlatformDefaultWidth", "getWindow", "()Landroid/view/Window;", "Content", "(Landroidx/compose/runtime/Composer;I)V", "insetValue", ExifInterface.GPS_DIRECTION_TRUE, "unchangedValue", "block", "Lkotlin/Function4;", "", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "left", "top", "right", "bottom", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function4;)Ljava/lang/Object;", "internalOnLayout", "changed", "internalOnLayout$ui_release", "internalOnMeasure", "widthMeasureSpec", "heightMeasureSpec", "internalOnMeasure$ui_release", "isInsideContent", NotificationCompat.CATEGORY_EVENT, "Landroid/view/MotionEvent;", "onApplyWindowInsets", "Landroidx/core/view/WindowInsetsCompat;", "v", "Landroid/view/View;", "insets", "parent", "Landroidx/compose/runtime/CompositionContext;", "(Landroidx/compose/runtime/CompositionContext;Lkotlin/jvm/functions/Function2;)V", "updateProperties", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class DialogLayout extends AbstractComposeView implements DialogWindowProvider, OnApplyWindowInsetsListener {
    private final MutableState content$delegate;
    private boolean decorFitsSystemWindows;
    private boolean hasCalledSetLayout;
    private boolean shouldCreateCompositionOnAttachedToWindow;
    private boolean usePlatformDefaultWidth;
    private final Window window;

    @Override // androidx.compose.ui.window.DialogWindowProvider
    public Window getWindow() {
        return this.window;
    }

    public DialogLayout(Context context, Window window) {
        super(context, null, 0, 6, null);
        MutableState mutableStateOf$default;
        this.window = window;
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(ComposableSingletons$AndroidDialog_androidKt.INSTANCE.m7127getLambda1$ui_release(), null, 2, null);
        this.content$delegate = mutableStateOf$default;
        ViewCompat.setOnApplyWindowInsetsListener(this, this);
        ViewCompat.setWindowInsetsAnimationCallback(this, new WindowInsetsAnimationCompat.Callback() { // from class: androidx.compose.ui.window.DialogLayout.1
            {
                super(1);
            }

            @Override // androidx.core.view.WindowInsetsAnimationCompat.Callback
            public WindowInsetsAnimationCompat.BoundsCompat onStart(WindowInsetsAnimationCompat animation, WindowInsetsAnimationCompat.BoundsCompat bounds) {
                DialogLayout this_$iv = DialogLayout.this;
                if (this_$iv.decorFitsSystemWindows) {
                    return bounds;
                }
                View child$iv = this_$iv.getChildAt(0);
                int left$iv = Math.max(0, child$iv.getLeft());
                int top$iv = Math.max(0, child$iv.getTop());
                int right$iv = Math.max(0, this_$iv.getWidth() - child$iv.getRight());
                int bottom$iv = Math.max(0, this_$iv.getHeight() - child$iv.getBottom());
                if (left$iv != 0 || top$iv != 0 || right$iv != 0 || bottom$iv != 0) {
                    return bounds.inset(Insets.of(left$iv, top$iv, right$iv, bottom$iv));
                }
                return bounds;
            }

            @Override // androidx.core.view.WindowInsetsAnimationCompat.Callback
            public WindowInsetsCompat onProgress(WindowInsetsCompat insets, List<WindowInsetsAnimationCompat> list) {
                DialogLayout this_$iv = DialogLayout.this;
                if (this_$iv.decorFitsSystemWindows) {
                    return insets;
                }
                View child$iv = this_$iv.getChildAt(0);
                int left$iv = Math.max(0, child$iv.getLeft());
                int top$iv = Math.max(0, child$iv.getTop());
                int right$iv = Math.max(0, this_$iv.getWidth() - child$iv.getRight());
                int bottom$iv = Math.max(0, this_$iv.getHeight() - child$iv.getBottom());
                if (left$iv != 0 || top$iv != 0 || right$iv != 0 || bottom$iv != 0) {
                    return insets.inset(left$iv, top$iv, right$iv, bottom$iv);
                }
                return insets;
            }
        });
    }

    private final Function2<Composer, Integer, Unit> getContent() {
        State $this$getValue$iv = this.content$delegate;
        return (Function2) $this$getValue$iv.getValue();
    }

    private final void setContent(Function2<? super Composer, ? super Integer, Unit> function2) {
        MutableState $this$setValue$iv = this.content$delegate;
        $this$setValue$iv.setValue(function2);
    }

    @Override // androidx.compose.ui.platform.AbstractComposeView
    protected boolean getShouldCreateCompositionOnAttachedToWindow() {
        return this.shouldCreateCompositionOnAttachedToWindow;
    }

    public final void updateProperties(boolean usePlatformDefaultWidth, boolean decorFitsSystemWindows) {
        boolean callSetLayout = (this.hasCalledSetLayout && usePlatformDefaultWidth == this.usePlatformDefaultWidth && decorFitsSystemWindows == this.decorFitsSystemWindows) ? false : true;
        this.usePlatformDefaultWidth = usePlatformDefaultWidth;
        this.decorFitsSystemWindows = decorFitsSystemWindows;
        if (callSetLayout) {
            WindowManager.LayoutParams attrs = getWindow().getAttributes();
            int measurementWidth = usePlatformDefaultWidth ? -2 : -1;
            if (measurementWidth != attrs.width || !this.hasCalledSetLayout) {
                getWindow().setLayout(measurementWidth, -2);
                this.hasCalledSetLayout = true;
            }
        }
    }

    @Override // androidx.compose.ui.platform.AbstractComposeView
    public void internalOnMeasure$ui_release(int widthMeasureSpec, int heightMeasureSpec) {
        int targetHeight;
        int childWidthSpec;
        int childHeightSpec;
        int measuredWidth;
        int measuredHeight;
        View child = getChildAt(0);
        if (child == null) {
            super.internalOnMeasure$ui_release(widthMeasureSpec, heightMeasureSpec);
            return;
        }
        int width = View.MeasureSpec.getSize(widthMeasureSpec);
        int height = View.MeasureSpec.getSize(heightMeasureSpec);
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        if (heightMode == Integer.MIN_VALUE && !this.usePlatformDefaultWidth && !this.decorFitsSystemWindows && getWindow().getAttributes().height == -2) {
            targetHeight = height + 1;
        } else {
            targetHeight = height;
        }
        int horizontalPadding = getPaddingLeft() + getPaddingRight();
        int verticalPadding = getPaddingTop() + getPaddingBottom();
        int $this$fastCoerceAtLeast$iv = width - horizontalPadding;
        if ($this$fastCoerceAtLeast$iv < 0) {
            $this$fastCoerceAtLeast$iv = 0;
        }
        int $this$fastCoerceAtLeast$iv2 = targetHeight - verticalPadding;
        if ($this$fastCoerceAtLeast$iv2 < 0) {
            $this$fastCoerceAtLeast$iv2 = 0;
        }
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        if (widthMode == 0) {
            childWidthSpec = widthMeasureSpec;
        } else {
            childWidthSpec = View.MeasureSpec.makeMeasureSpec($this$fastCoerceAtLeast$iv, Integer.MIN_VALUE);
        }
        if (heightMode == 0) {
            childHeightSpec = heightMeasureSpec;
        } else {
            childHeightSpec = View.MeasureSpec.makeMeasureSpec($this$fastCoerceAtLeast$iv2, Integer.MIN_VALUE);
        }
        child.measure(childWidthSpec, childHeightSpec);
        switch (widthMode) {
            case Integer.MIN_VALUE:
                measuredWidth = Math.min(width, child.getMeasuredWidth() + horizontalPadding);
                break;
            case 1073741824:
                measuredWidth = width;
                break;
            default:
                measuredWidth = child.getMeasuredWidth() + horizontalPadding;
                break;
        }
        switch (heightMode) {
            case Integer.MIN_VALUE:
                measuredHeight = Math.min(height, child.getMeasuredHeight() + verticalPadding);
                break;
            case 1073741824:
                measuredHeight = height;
                break;
            default:
                measuredHeight = child.getMeasuredHeight() + verticalPadding;
                break;
        }
        setMeasuredDimension(measuredWidth, measuredHeight);
        if (!this.usePlatformDefaultWidth && !this.decorFitsSystemWindows && child.getMeasuredHeight() + verticalPadding > height && getWindow().getAttributes().height == -2) {
            getWindow().setLayout(-1, -1);
        }
    }

    @Override // androidx.compose.ui.platform.AbstractComposeView
    public void internalOnLayout$ui_release(boolean changed, int left, int top, int right, int bottom) {
        View child = getChildAt(0);
        if (child == null) {
            return;
        }
        int hPadding = getPaddingLeft() + getPaddingRight();
        int vPadding = getPaddingTop() + getPaddingBottom();
        int width = right - left;
        int height = bottom - top;
        int childWidth = child.getMeasuredWidth();
        int childHeight = child.getMeasuredHeight();
        int extraWidth = (width - childWidth) - hPadding;
        int extraHeight = (height - childHeight) - vPadding;
        int l = getPaddingLeft() + (extraWidth / 2);
        int t = getPaddingTop() + (extraHeight / 2);
        int r = l + childWidth;
        int b = t + childHeight;
        child.layout(l, t, r, b);
    }

    public final void setContent(CompositionContext parent, Function2<? super Composer, ? super Integer, Unit> function2) {
        setParentCompositionContext(parent);
        setContent(function2);
        this.shouldCreateCompositionOnAttachedToWindow = true;
        createComposition();
    }

    @Override // androidx.core.view.OnApplyWindowInsetsListener
    public WindowInsetsCompat onApplyWindowInsets(View v, WindowInsetsCompat insets) {
        if (!this.decorFitsSystemWindows) {
            View child$iv = getChildAt(0);
            int left$iv = Math.max(0, child$iv.getLeft());
            int top$iv = Math.max(0, child$iv.getTop());
            int right$iv = Math.max(0, getWidth() - child$iv.getRight());
            int bottom$iv = Math.max(0, getHeight() - child$iv.getBottom());
            if (left$iv != 0 || top$iv != 0 || right$iv != 0 || bottom$iv != 0) {
                return insets.inset(left$iv, top$iv, right$iv, bottom$iv);
            }
            return insets;
        }
        return insets;
    }

    private final <T> T insetValue(T t, Function4<? super Integer, ? super Integer, ? super Integer, ? super Integer, ? extends T> function4) {
        if (this.decorFitsSystemWindows) {
            return t;
        }
        View child = getChildAt(0);
        int left = Math.max(0, child.getLeft());
        int top = Math.max(0, child.getTop());
        int right = Math.max(0, getWidth() - child.getRight());
        int bottom = Math.max(0, getHeight() - child.getBottom());
        if (left == 0 && top == 0 && right == 0 && bottom == 0) {
            return t;
        }
        return function4.invoke(Integer.valueOf(left), Integer.valueOf(top), Integer.valueOf(right), Integer.valueOf(bottom));
    }

    public final boolean isInsideContent(MotionEvent event) {
        View child;
        float x = event.getX();
        if ((Float.isInfinite(x) || Float.isNaN(x)) ? false : true) {
            float y = event.getY();
            if (((Float.isInfinite(y) || Float.isNaN(y)) ? false : true) && (child = getChildAt(0)) != null) {
                int left = getLeft() + child.getLeft();
                int right = child.getWidth() + left;
                int top = getTop() + child.getTop();
                int bottom = child.getHeight() + top;
                int roundToInt = MathKt.roundToInt(event.getX());
                if (left <= roundToInt && roundToInt <= right) {
                    int roundToInt2 = MathKt.roundToInt(event.getY());
                    if (top <= roundToInt2 && roundToInt2 <= bottom) {
                        return true;
                    }
                }
                return false;
            }
            return false;
        }
        return false;
    }

    @Override // androidx.compose.ui.platform.AbstractComposeView
    public void Content(Composer $composer, int $changed) {
        $composer.startReplaceGroup(1735448596);
        ComposerKt.sourceInformation($composer, "C(Content)411@16815L9:AndroidDialog.android.kt#2oxthz");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(1735448596, $changed, -1, "androidx.compose.ui.window.DialogLayout.Content (AndroidDialog.android.kt:410)");
        }
        getContent().invoke($composer, 0);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        $composer.endReplaceGroup();
    }
}
