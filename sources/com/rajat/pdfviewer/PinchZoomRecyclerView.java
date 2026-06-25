package com.rajat.pdfviewer;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewParent;
import android.view.animation.AccelerateDecelerateInterpolator;
import androidx.autofill.HintConstants;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.recyclerview.widget.RecyclerView;
import com.google.android.gms.common.internal.ServiceSpecificExtraArgs;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import kotlin.ranges.RangesKt;
/* compiled from: PinchZoomRecyclerView.kt */
@Metadata(d1 = {"\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u001c\b\u0007\u0018\u0000 X2\u00020\u0001:\u0003VWXB'\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\u000e\u0010)\u001a\u00020&2\u0006\u0010*\u001a\u00020\u0012J\u0006\u0010+\u001a\u00020\u0012J\u0006\u0010,\u001a\u00020\u0010J\u0006\u0010-\u001a\u00020\u0010J\u000e\u0010.\u001a\u00020&2\u0006\u0010/\u001a\u00020\u0010J>\u00100\u001a\u00020&26\u00101\u001a2\u0012\u0013\u0012\u00110\u0012¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(+\u0012\u0013\u0012\u00110\u0010¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(4\u0012\u0004\u0012\u00020&0%J)\u00105\u001a\u00020&2!\u00101\u001a\u001d\u0012\u0013\u0012\u00110\u0010¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(4\u0012\u0004\u0012\u00020&0(J)\u00106\u001a\u00020&2!\u00101\u001a\u001d\u0012\u0013\u0012\u00110\u0010¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(4\u0012\u0004\u0012\u00020&0(J\u0010\u00107\u001a\u00020\u00122\u0006\u00108\u001a\u000209H\u0016J\u0010\u0010:\u001a\u00020\u00122\u0006\u00108\u001a\u000209H\u0016J\u0010\u0010;\u001a\u00020&2\u0006\u0010<\u001a\u00020=H\u0016J\u0010\u0010>\u001a\u00020&2\u0006\u0010<\u001a\u00020=H\u0014J\u0010\u0010?\u001a\u00020\u00122\u0006\u0010@\u001a\u00020\u0007H\u0016J\b\u0010A\u001a\u00020\u0007H\u0016J\b\u0010B\u001a\u00020\u0007H\u0016J\u0018\u0010C\u001a\u00020\u00122\u0006\u0010D\u001a\u00020\u00072\u0006\u0010E\u001a\u00020\u0007H\u0016J\b\u0010F\u001a\u00020&H\u0002J\b\u0010G\u001a\u00020\u0010H\u0002J\b\u0010H\u001a\u00020\u0012H\u0002J\b\u0010I\u001a\u00020\u0010H\u0002J\u0010\u0010J\u001a\u00020&2\u0006\u0010K\u001a\u00020\u0010H\u0002J\b\u0010L\u001a\u00020\u0010H\u0002J\b\u0010M\u001a\u00020\u0012H\u0002J\u0006\u0010N\u001a\u00020&J\u0006\u0010O\u001a\u00020&J\u0006\u0010P\u001a\u00020&J(\u0010Q\u001a\u00020&2\u0006\u0010R\u001a\u00020\u00102\u0006\u0010S\u001a\u00020\u00102\u0006\u0010T\u001a\u00020\u00102\u0006\u0010U\u001a\u00020\u0015H\u0002R\u000e\u0010\n\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0012X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u0012X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010#\u001a\u00020\u0012X\u0082\u000e¢\u0006\u0002\n\u0000R\"\u0010$\u001a\u0016\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020&\u0018\u00010%X\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u0010'\u001a\u0010\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020&\u0018\u00010(X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006Y"}, d2 = {"Lcom/rajat/pdfviewer/PinchZoomRecyclerView;", "Landroidx/recyclerview/widget/RecyclerView;", "context", "Landroid/content/Context;", "attrs", "Landroid/util/AttributeSet;", "defStyleAttr", "", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;I)V", "activePointerId", "scaleDetector", "Landroid/view/ScaleGestureDetector;", "gestureDetector", "Landroid/view/GestureDetector;", "scaleFactor", "", "isZoomEnabled", "", "maxZoom", "zoomDuration", "", "isZoomingInProgress", "lastTouchX", "lastTouchY", "posX", "posY", "ignoreScaleAfterPointerUp", "pinchStartScale", "pinchStartSpan", "pinchStartFocusX", "pinchStartFocusY", "pinchContentFocusX", "pinchContentFocusY", "multiPageScrollResidualY", "blockPanUntilNextDown", "zoomChangeListener", "Lkotlin/Function2;", "", "zoomEndListener", "Lkotlin/Function1;", "setZoomEnabled", "enabled", "isZoomedIn", "getZoomScale", "getMaxZoomScale", "setMaxZoomScale", "maxZoomScale", "setOnZoomChangeListener", ServiceSpecificExtraArgs.CastExtraArgs.LISTENER, "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "scale", "setOnZoomEndListener", "setOnZoomSettledListener", "onTouchEvent", "ev", "Landroid/view/MotionEvent;", "onInterceptTouchEvent", "onDraw", "canvas", "Landroid/graphics/Canvas;", "dispatchDraw", "canScrollVertically", "direction", "computeVerticalScrollOffset", "computeVerticalScrollRange", "fling", "velocityX", "velocityY", "clampPosition", "getSinglePageContentHeight", "isVerticallyScrollable", "getCurrentMultiPageVisualOffset", "applyMultiPageVisualOffsetDelta", "delta", "getBaseScrollOffset", "isSinglePage", "zoomIn", "zoomOut", "resetZoom", "zoomTo", "targetScale", "focusX", "focusY", TypedValues.TransitionType.S_DURATION, "ScaleListener", "GestureListener", "Companion", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class PinchZoomRecyclerView extends RecyclerView {
    private static final float HARD_MAX_ZOOM = 5.0f;
    private static final int INVALID_POINTER_ID = -1;
    private static final float MAX_ZOOM = 3.0f;
    private static final long ZOOM_DURATION = 300;
    private int activePointerId;
    private boolean blockPanUntilNextDown;
    private final GestureDetector gestureDetector;
    private boolean ignoreScaleAfterPointerUp;
    private boolean isZoomEnabled;
    private boolean isZoomingInProgress;
    private float lastTouchX;
    private float lastTouchY;
    private float maxZoom;
    private float multiPageScrollResidualY;
    private float pinchContentFocusX;
    private float pinchContentFocusY;
    private float pinchStartFocusX;
    private float pinchStartFocusY;
    private float pinchStartScale;
    private float pinchStartSpan;
    private float posX;
    private float posY;
    private final ScaleGestureDetector scaleDetector;
    private float scaleFactor;
    private Function2<? super Boolean, ? super Float, Unit> zoomChangeListener;
    private long zoomDuration;
    private Function1<? super Float, Unit> zoomEndListener;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    public /* synthetic */ PinchZoomRecyclerView(Context context, AttributeSet attributeSet, int i, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, (i2 & 2) != 0 ? null : attributeSet, (i2 & 4) != 0 ? 0 : i);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public PinchZoomRecyclerView(Context context) {
        this(context, null, 0, 6, null);
        Intrinsics.checkNotNullParameter(context, "context");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public PinchZoomRecyclerView(Context context, AttributeSet attrs) {
        this(context, attrs, 0, 4, null);
        Intrinsics.checkNotNullParameter(context, "context");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PinchZoomRecyclerView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        Intrinsics.checkNotNullParameter(context, "context");
        this.activePointerId = -1;
        this.scaleDetector = new ScaleGestureDetector(context, new ScaleListener());
        this.gestureDetector = new GestureDetector(context, new GestureListener());
        this.scaleFactor = 1.0f;
        this.isZoomEnabled = true;
        this.maxZoom = 3.0f;
        this.zoomDuration = ZOOM_DURATION;
        this.pinchStartScale = 1.0f;
        this.pinchStartSpan = 1.0f;
        setWillNotDraw(false);
        setLayoutManager(new ZoomableLinearLayoutManager(context, new Function0() { // from class: com.rajat.pdfviewer.PinchZoomRecyclerView$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                float zoomScale;
                zoomScale = PinchZoomRecyclerView.this.getZoomScale();
                return Float.valueOf(zoomScale);
            }
        }));
    }

    public final void setZoomEnabled(boolean enabled) {
        this.isZoomEnabled = enabled;
    }

    public final boolean isZoomedIn() {
        return this.scaleFactor > 1.0f;
    }

    public final float getZoomScale() {
        return this.scaleFactor;
    }

    public final float getMaxZoomScale() {
        return this.maxZoom;
    }

    public final void setMaxZoomScale(float maxZoomScale) {
        this.maxZoom = RangesKt.coerceIn(maxZoomScale, 1.0f, (float) HARD_MAX_ZOOM);
        if (this.scaleFactor > this.maxZoom) {
            this.scaleFactor = this.maxZoom;
            clampPosition();
            invalidate();
            Function2<? super Boolean, ? super Float, Unit> function2 = this.zoomChangeListener;
            if (function2 != null) {
                function2.invoke(Boolean.valueOf(isZoomedIn()), Float.valueOf(this.scaleFactor));
            }
        }
    }

    public final void setOnZoomChangeListener(Function2<? super Boolean, ? super Float, Unit> listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.zoomChangeListener = listener;
    }

    public final void setOnZoomEndListener(Function1<? super Float, Unit> listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.zoomEndListener = listener;
    }

    public final void setOnZoomSettledListener(Function1<? super Float, Unit> listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.zoomEndListener = listener;
    }

    @Override // androidx.recyclerview.widget.RecyclerView, android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        ViewParent parent;
        ViewParent parent2;
        int pointerIndex;
        Intrinsics.checkNotNullParameter(ev, "ev");
        if (this.isZoomEnabled) {
            if (ev.getActionMasked() == 6) {
                this.ignoreScaleAfterPointerUp = true;
            }
            this.gestureDetector.onTouchEvent(ev);
            this.scaleDetector.onTouchEvent(ev);
            if (this.isZoomingInProgress) {
                return true;
            }
            boolean superHandled = this.scaleFactor <= 1.0f ? super.onTouchEvent(ev) : false;
            switch (ev.getActionMasked()) {
                case 0:
                    if ((isVerticallyScrollable() || this.scaleFactor > 1.0f) && (parent = getParent()) != null) {
                        parent.requestDisallowInterceptTouchEvent(true);
                    }
                    this.multiPageScrollResidualY = 0.0f;
                    this.blockPanUntilNextDown = false;
                    this.lastTouchX = ev.getX();
                    this.lastTouchY = ev.getY();
                    this.activePointerId = ev.getPointerId(0);
                    break;
                case 1:
                    ViewParent parent3 = getParent();
                    if (parent3 != null) {
                        parent3.requestDisallowInterceptTouchEvent(false);
                    }
                    this.activePointerId = -1;
                    this.ignoreScaleAfterPointerUp = false;
                    this.multiPageScrollResidualY = 0.0f;
                    this.blockPanUntilNextDown = false;
                    break;
                case 2:
                    if ((isVerticallyScrollable() || this.scaleFactor > 1.0f) && (parent2 = getParent()) != null) {
                        parent2.requestDisallowInterceptTouchEvent(true);
                    }
                    if (!this.scaleDetector.isInProgress() && this.scaleFactor > 1.0f && (pointerIndex = ev.findPointerIndex(this.activePointerId)) != -1) {
                        float x = ev.getX(pointerIndex);
                        float y = ev.getY(pointerIndex);
                        if (this.blockPanUntilNextDown) {
                            this.lastTouchX = x;
                            this.lastTouchY = y;
                            return superHandled || this.scaleFactor > 1.0f;
                        }
                        float dx = x - this.lastTouchX;
                        float dy = y - this.lastTouchY;
                        this.posX += dx;
                        if (isSinglePage()) {
                            this.posY += dy;
                        } else {
                            applyMultiPageVisualOffsetDelta(-dy);
                        }
                        clampPosition();
                        invalidate();
                        this.lastTouchX = x;
                        this.lastTouchY = y;
                        break;
                    }
                    break;
                case 3:
                    ViewParent parent4 = getParent();
                    if (parent4 != null) {
                        parent4.requestDisallowInterceptTouchEvent(false);
                    }
                    this.activePointerId = -1;
                    this.ignoreScaleAfterPointerUp = false;
                    this.multiPageScrollResidualY = 0.0f;
                    this.blockPanUntilNextDown = false;
                    break;
                case 6:
                    int pointerIndex2 = ev.getActionIndex();
                    int pointerId = ev.getPointerId(pointerIndex2);
                    if (pointerId == this.activePointerId) {
                        int newPointerIndex = pointerIndex2 == 0 ? 1 : 0;
                        this.lastTouchX = ev.getX(newPointerIndex);
                        this.lastTouchY = ev.getY(newPointerIndex);
                        this.activePointerId = ev.getPointerId(newPointerIndex);
                    }
                    this.blockPanUntilNextDown = true;
                    break;
            }
            return superHandled || this.scaleFactor > 1.0f;
        }
        return super.onTouchEvent(ev);
    }

    @Override // androidx.recyclerview.widget.RecyclerView, android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        Intrinsics.checkNotNullParameter(ev, "ev");
        if (this.isZoomingInProgress) {
            return true;
        }
        return super.onInterceptTouchEvent(ev);
    }

    @Override // androidx.recyclerview.widget.RecyclerView, android.view.View
    public void onDraw(Canvas canvas) {
        Intrinsics.checkNotNullParameter(canvas, "canvas");
        float x$iv = this.posX;
        float y$iv = this.posY;
        int checkpoint$iv = canvas.save();
        canvas.translate(x$iv, y$iv);
        try {
            canvas.scale(this.scaleFactor, this.scaleFactor);
            super.onDraw(canvas);
        } finally {
            canvas.restoreToCount(checkpoint$iv);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas canvas) {
        Intrinsics.checkNotNullParameter(canvas, "canvas");
        float x$iv = this.posX;
        float y$iv = this.posY;
        int checkpoint$iv = canvas.save();
        canvas.translate(x$iv, y$iv);
        try {
            canvas.scale(this.scaleFactor, this.scaleFactor);
            super.dispatchDraw(canvas);
        } finally {
            canvas.restoreToCount(checkpoint$iv);
        }
    }

    @Override // android.view.View
    public boolean canScrollVertically(int direction) {
        if (this.scaleFactor <= 1.0f) {
            return !isSinglePage() && super.canScrollVertically(direction);
        } else if (!isSinglePage()) {
            boolean hasBottomOverflowRoom = this.posY > (-RangesKt.coerceAtLeast(((float) getHeight()) * (this.scaleFactor - 1.0f), 0.0f));
            if (direction > 0) {
                return super.canScrollVertically(direction) || hasBottomOverflowRoom;
            } else if (direction < 0) {
                return super.canScrollVertically(direction) || this.posY < 0.0f;
            } else {
                if (!super.canScrollVertically(1) && !super.canScrollVertically(-1)) {
                    if (this.posY == 0.0f) {
                        return false;
                    }
                }
                return true;
            }
        } else {
            boolean hasBottomOverflowRoom2 = super.canScrollVertically(direction);
            return hasBottomOverflowRoom2;
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView, android.view.View, androidx.core.view.ScrollingView
    public int computeVerticalScrollOffset() {
        return MathKt.roundToInt((getBaseScrollOffset() * this.scaleFactor) - this.posY);
    }

    @Override // androidx.recyclerview.widget.RecyclerView, android.view.View, androidx.core.view.ScrollingView
    public int computeVerticalScrollRange() {
        return MathKt.roundToInt(super.computeVerticalScrollRange() * this.scaleFactor);
    }

    /* compiled from: PinchZoomRecyclerView.kt */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\b\u0082\u0004\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\b\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\t\u001a\u00020\n2\u0006\u0010\u0006\u001a\u00020\u0007H\u0016¨\u0006\u000b"}, d2 = {"Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;", "Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;", "<init>", "(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V", "onScaleBegin", "", "detector", "Landroid/view/ScaleGestureDetector;", "onScale", "onScaleEnd", "", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    private final class ScaleListener extends ScaleGestureDetector.SimpleOnScaleGestureListener {
        public ScaleListener() {
        }

        @Override // android.view.ScaleGestureDetector.SimpleOnScaleGestureListener, android.view.ScaleGestureDetector.OnScaleGestureListener
        public boolean onScaleBegin(ScaleGestureDetector detector) {
            Intrinsics.checkNotNullParameter(detector, "detector");
            PinchZoomRecyclerView.this.isZoomingInProgress = true;
            PinchZoomRecyclerView.this.ignoreScaleAfterPointerUp = false;
            PinchZoomRecyclerView.this.pinchStartScale = PinchZoomRecyclerView.this.scaleFactor;
            PinchZoomRecyclerView pinchZoomRecyclerView = PinchZoomRecyclerView.this;
            Float valueOf = Float.valueOf(detector.getCurrentSpan());
            float it = valueOf.floatValue();
            if (!(it > 0.0f)) {
                valueOf = null;
            }
            pinchZoomRecyclerView.pinchStartSpan = valueOf != null ? valueOf.floatValue() : 1.0f;
            PinchZoomRecyclerView.this.pinchStartFocusX = detector.getFocusX();
            PinchZoomRecyclerView.this.pinchStartFocusY = detector.getFocusY();
            PinchZoomRecyclerView.this.multiPageScrollResidualY = 0.0f;
            PinchZoomRecyclerView.this.pinchContentFocusX = (PinchZoomRecyclerView.this.pinchStartFocusX - PinchZoomRecyclerView.this.posX) / PinchZoomRecyclerView.this.scaleFactor;
            PinchZoomRecyclerView pinchZoomRecyclerView2 = PinchZoomRecyclerView.this;
            boolean isSinglePage = PinchZoomRecyclerView.this.isSinglePage();
            PinchZoomRecyclerView pinchZoomRecyclerView3 = PinchZoomRecyclerView.this;
            pinchZoomRecyclerView2.pinchContentFocusY = isSinglePage ? (pinchZoomRecyclerView3.pinchStartFocusY - PinchZoomRecyclerView.this.posY) / PinchZoomRecyclerView.this.scaleFactor : (pinchZoomRecyclerView3.getCurrentMultiPageVisualOffset() + PinchZoomRecyclerView.this.pinchStartFocusY) / PinchZoomRecyclerView.this.scaleFactor;
            PinchZoomRecyclerView.this.suppressLayout(true);
            return true;
        }

        @Override // android.view.ScaleGestureDetector.SimpleOnScaleGestureListener, android.view.ScaleGestureDetector.OnScaleGestureListener
        public boolean onScale(ScaleGestureDetector detector) {
            Intrinsics.checkNotNullParameter(detector, "detector");
            if (PinchZoomRecyclerView.this.ignoreScaleAfterPointerUp) {
                return true;
            }
            float spanRatio = detector.getCurrentSpan() / PinchZoomRecyclerView.this.pinchStartSpan;
            if (0.98f <= spanRatio && spanRatio <= 1.02f) {
                return true;
            }
            float newScale = RangesKt.coerceIn(PinchZoomRecyclerView.this.pinchStartScale * spanRatio, 1.0f, PinchZoomRecyclerView.this.maxZoom);
            if (!(newScale == PinchZoomRecyclerView.this.scaleFactor)) {
                PinchZoomRecyclerView.this.scaleFactor = newScale;
                PinchZoomRecyclerView.this.posX = PinchZoomRecyclerView.this.pinchStartFocusX - (PinchZoomRecyclerView.this.pinchContentFocusX * PinchZoomRecyclerView.this.scaleFactor);
                boolean isSinglePage = PinchZoomRecyclerView.this.isSinglePage();
                PinchZoomRecyclerView pinchZoomRecyclerView = PinchZoomRecyclerView.this;
                if (isSinglePage) {
                    pinchZoomRecyclerView.posY = PinchZoomRecyclerView.this.pinchStartFocusY - (PinchZoomRecyclerView.this.pinchContentFocusY * PinchZoomRecyclerView.this.scaleFactor);
                } else {
                    float desiredVisualOffset = (pinchZoomRecyclerView.pinchContentFocusY * PinchZoomRecyclerView.this.scaleFactor) - PinchZoomRecyclerView.this.pinchStartFocusY;
                    float visualDelta = desiredVisualOffset - PinchZoomRecyclerView.this.getCurrentMultiPageVisualOffset();
                    PinchZoomRecyclerView.this.applyMultiPageVisualOffsetDelta(visualDelta);
                }
                PinchZoomRecyclerView.this.clampPosition();
                PinchZoomRecyclerView.this.invalidate();
                PinchZoomRecyclerView.this.awakenScrollBars();
                Function2 function2 = PinchZoomRecyclerView.this.zoomChangeListener;
                if (function2 != null) {
                    function2.invoke(Boolean.valueOf(PinchZoomRecyclerView.this.isZoomedIn()), Float.valueOf(PinchZoomRecyclerView.this.scaleFactor));
                }
            }
            return true;
        }

        @Override // android.view.ScaleGestureDetector.SimpleOnScaleGestureListener, android.view.ScaleGestureDetector.OnScaleGestureListener
        public void onScaleEnd(ScaleGestureDetector detector) {
            Intrinsics.checkNotNullParameter(detector, "detector");
            PinchZoomRecyclerView.this.isZoomingInProgress = false;
            PinchZoomRecyclerView.this.ignoreScaleAfterPointerUp = false;
            PinchZoomRecyclerView.this.suppressLayout(false);
            Function1 function1 = PinchZoomRecyclerView.this.zoomEndListener;
            if (function1 != null) {
                function1.invoke(Float.valueOf(PinchZoomRecyclerView.this.scaleFactor));
            }
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView
    public boolean fling(int velocityX, int velocityY) {
        if (this.scaleFactor > 1.0f) {
            return super.fling(0, velocityY);
        }
        return super.fling(velocityX, velocityY);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void clampPosition() {
        float contentWidth = getWidth() * this.scaleFactor;
        this.posX = RangesKt.coerceIn(this.posX, -RangesKt.coerceAtLeast(contentWidth - getWidth(), 0.0f), 0.0f);
        if (!isSinglePage()) {
            float maxBottomOverflow = RangesKt.coerceAtLeast(getHeight() * (this.scaleFactor - 1.0f), 0.0f);
            this.posY = RangesKt.coerceIn(this.posY, -maxBottomOverflow, 0.0f);
            return;
        }
        float contentHeight = getSinglePageContentHeight();
        float maxPosY = RangesKt.coerceAtLeast(contentHeight - getHeight(), 0.0f);
        this.posY = RangesKt.coerceIn(this.posY, -maxPosY, maxPosY);
    }

    private final float getSinglePageContentHeight() {
        View childAt = getChildAt(0);
        int childHeight = childAt != null ? childAt.getHeight() : getHeight();
        return childHeight * this.scaleFactor;
    }

    private final boolean isVerticallyScrollable() {
        if (isSinglePage()) {
            return false;
        }
        return super.canScrollVertically(1) || super.canScrollVertically(-1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final float getCurrentMultiPageVisualOffset() {
        return (getBaseScrollOffset() * this.scaleFactor) - this.posY;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void applyMultiPageVisualOffsetDelta(float delta) {
        if (isSinglePage()) {
            return;
        }
        if (delta == 0.0f) {
            return;
        }
        float remainingDelta = delta;
        if (this.posY < 0.0f && remainingDelta < 0.0f) {
            float overflowToConsume = Math.min(-this.posY, -remainingDelta);
            this.posY += overflowToConsume;
            remainingDelta += overflowToConsume;
        }
        float desiredScrollDelta = this.multiPageScrollResidualY + remainingDelta;
        int requestedScroll = (int) desiredScrollDelta;
        if (requestedScroll != 0) {
            float beforeOffset = getBaseScrollOffset();
            scrollBy(0, requestedScroll);
            float consumedScroll = (getBaseScrollOffset() - beforeOffset) * this.scaleFactor;
            this.multiPageScrollResidualY = desiredScrollDelta - consumedScroll;
        } else {
            this.multiPageScrollResidualY = desiredScrollDelta;
        }
        if (this.multiPageScrollResidualY > 0.0f) {
            this.posY -= this.multiPageScrollResidualY;
            this.multiPageScrollResidualY = 0.0f;
        } else if (this.multiPageScrollResidualY < 0.0f && !super.canScrollVertically(-1)) {
            this.multiPageScrollResidualY = 0.0f;
        }
    }

    private final float getBaseScrollOffset() {
        return super.computeVerticalScrollOffset();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean isSinglePage() {
        RecyclerView.Adapter adapter = getAdapter();
        return (adapter != null ? adapter.getItemCount() : 0) <= 1;
    }

    /* compiled from: PinchZoomRecyclerView.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0082\u0004\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016¨\u0006\b"}, d2 = {"Lcom/rajat/pdfviewer/PinchZoomRecyclerView$GestureListener;", "Landroid/view/GestureDetector$SimpleOnGestureListener;", "<init>", "(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V", "onDoubleTap", "", "e", "Landroid/view/MotionEvent;", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    private final class GestureListener extends GestureDetector.SimpleOnGestureListener {
        public GestureListener() {
        }

        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
        public boolean onDoubleTap(MotionEvent e) {
            Intrinsics.checkNotNullParameter(e, "e");
            if (PinchZoomRecyclerView.this.isZoomEnabled) {
                float f = 1.5f;
                if (PinchZoomRecyclerView.this.scaleFactor >= 1.5f) {
                    if (PinchZoomRecyclerView.this.scaleFactor < PinchZoomRecyclerView.this.maxZoom) {
                        f = PinchZoomRecyclerView.this.maxZoom;
                    } else {
                        f = 1.0f;
                    }
                }
                float targetScale = f;
                PinchZoomRecyclerView.this.zoomTo(targetScale, e.getX(), e.getY(), PinchZoomRecyclerView.this.zoomDuration);
                return true;
            }
            return false;
        }
    }

    public final void zoomIn() {
        if (this.isZoomEnabled) {
            float targetScale = RangesKt.coerceAtMost(this.scaleFactor + 0.5f, this.maxZoom);
            zoomTo(targetScale, getWidth() / 2.0f, getHeight() / 2.0f, this.zoomDuration);
        }
    }

    public final void zoomOut() {
        if (this.isZoomEnabled) {
            float targetScale = RangesKt.coerceAtLeast(this.scaleFactor - 0.5f, 1.0f);
            zoomTo(targetScale, getWidth() / 2.0f, getHeight() / 2.0f, this.zoomDuration);
        }
    }

    public final void resetZoom() {
        if (this.isZoomEnabled) {
            zoomTo(1.0f, getWidth() / 2.0f, getHeight() / 2.0f, this.zoomDuration);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zoomTo(final float targetScale, final float focusX, final float focusY, long duration) {
        final float startScale = this.scaleFactor;
        final float focusXInContent = (focusX - this.posX) / this.scaleFactor;
        final float focusYInContent = (focusY - this.posY) / this.scaleFactor;
        ValueAnimator $this$zoomTo_u24lambda_u244 = ValueAnimator.ofFloat(0.0f, 1.0f);
        $this$zoomTo_u24lambda_u244.setDuration(duration);
        $this$zoomTo_u24lambda_u244.setInterpolator(new AccelerateDecelerateInterpolator());
        $this$zoomTo_u24lambda_u244.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.rajat.pdfviewer.PinchZoomRecyclerView$$ExternalSyntheticLambda1
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                PinchZoomRecyclerView.zoomTo$lambda$4$lambda$3(startScale, targetScale, this, focusX, focusXInContent, focusY, focusYInContent, valueAnimator);
            }
        });
        $this$zoomTo_u24lambda_u244.addListener(new AnimatorListenerAdapter() { // from class: com.rajat.pdfviewer.PinchZoomRecyclerView$zoomTo$1$2
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                Intrinsics.checkNotNullParameter(animation, "animation");
                Function1 function1 = PinchZoomRecyclerView.this.zoomEndListener;
                if (function1 != null) {
                    function1.invoke(Float.valueOf(PinchZoomRecyclerView.this.scaleFactor));
                }
            }
        });
        $this$zoomTo_u24lambda_u244.start();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void zoomTo$lambda$4$lambda$3(float $startScale, float $targetScale, PinchZoomRecyclerView this$0, float $focusX, float $focusXInContent, float $focusY, float $focusYInContent, ValueAnimator animator) {
        Intrinsics.checkNotNullParameter(animator, "animator");
        Object animatedValue = animator.getAnimatedValue();
        Intrinsics.checkNotNull(animatedValue, "null cannot be cast to non-null type kotlin.Float");
        float fraction = ((Float) animatedValue).floatValue();
        float scale = (($targetScale - $startScale) * fraction) + $startScale;
        this$0.scaleFactor = scale;
        this$0.posX = $focusX - (this$0.scaleFactor * $focusXInContent);
        this$0.posY = $focusY - (this$0.scaleFactor * $focusYInContent);
        this$0.clampPosition();
        this$0.invalidate();
        this$0.awakenScrollBars();
        Function2<? super Boolean, ? super Float, Unit> function2 = this$0.zoomChangeListener;
        if (function2 != null) {
            function2.invoke(Boolean.valueOf(this$0.isZoomedIn()), Float.valueOf(this$0.scaleFactor));
        }
    }

    /* compiled from: PinchZoomRecyclerView.kt */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0007X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082T¢\u0006\u0002\n\u0000¨\u0006\u000b"}, d2 = {"Lcom/rajat/pdfviewer/PinchZoomRecyclerView$Companion;", "", "<init>", "()V", "INVALID_POINTER_ID", "", "MAX_ZOOM", "", "HARD_MAX_ZOOM", "ZOOM_DURATION", "", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }
}
