package androidx.compose.ui.platform;

import android.os.Build;
import androidx.autofill.HintConstants;
import androidx.compose.ui.geometry.MutableRect;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.SizeKt;
import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.graphics.CompositingStrategy;
import androidx.compose.ui.graphics.Fields;
import androidx.compose.ui.graphics.GraphicsContext;
import androidx.compose.ui.graphics.Matrix;
import androidx.compose.ui.graphics.MatrixKt;
import androidx.compose.ui.graphics.Outline;
import androidx.compose.ui.graphics.Paint;
import androidx.compose.ui.graphics.ReusableGraphicsLayerScope;
import androidx.compose.ui.graphics.TransformOrigin;
import androidx.compose.ui.graphics.drawscope.CanvasDrawScope;
import androidx.compose.ui.graphics.drawscope.DrawContext;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.graphics.layer.GraphicsLayer;
import androidx.compose.ui.graphics.layer.GraphicsLayerKt;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.layout.GraphicLayerInfo;
import androidx.compose.ui.node.OwnedLayer;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.DensityKt;
import androidx.compose.ui.unit.IntSize;
import androidx.compose.ui.unit.IntSizeKt;
import androidx.compose.ui.unit.LayoutDirection;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: GraphicsLayerOwnerLayer.android.kt */
@Metadata(d1 = {"\u0000º\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u00012\u00020\u0002Bg\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u00128\u0010\t\u001a4\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b\f\u0012\b\b\r\u0012\u0004\b\b(\u000e\u0012\u0015\u0012\u0013\u0018\u00010\u0004¢\u0006\f\b\f\u0012\b\b\r\u0012\u0004\b\b(\u000f\u0012\u0004\u0012\u00020\u00100\n\u0012\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00100\u0012¢\u0006\u0002\u0010\u0013J\b\u0010@\u001a\u00020\u0010H\u0016J\u001a\u0010A\u001a\u00020\u00102\u0006\u0010\u000e\u001a\u00020\u000b2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0004H\u0016J\u0017\u0010B\u001a\u0004\u0018\u00010\u0019H\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\bC\u0010?J\u0015\u0010D\u001a\u00020\u0019H\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\bE\u0010?J\b\u0010F\u001a\u00020\u0010H\u0016J\u001a\u0010G\u001a\u00020\u00102\u0006\u0010H\u001a\u00020\u0019H\u0016ø\u0001\u0000¢\u0006\u0004\bI\u0010JJ\u001a\u0010K\u001a\u00020\u00172\u0006\u0010L\u001a\u00020MH\u0016ø\u0001\u0000¢\u0006\u0004\bN\u0010OJ\u0018\u0010P\u001a\u00020\u00102\u0006\u0010Q\u001a\u00020R2\u0006\u0010S\u001a\u00020\u0017H\u0016J\"\u0010T\u001a\u00020M2\u0006\u0010U\u001a\u00020M2\u0006\u0010S\u001a\u00020\u0017H\u0016ø\u0001\u0000¢\u0006\u0004\bV\u0010WJ\u001a\u0010X\u001a\u00020\u00102\u0006\u0010L\u001a\u00020YH\u0016ø\u0001\u0000¢\u0006\u0004\bZ\u0010[J\u001a\u0010\\\u001a\u00020\u00102\u0006\u00106\u001a\u000207H\u0016ø\u0001\u0000¢\u0006\u0004\b]\u0010[JP\u0010^\u001a\u00020\u001028\u0010\t\u001a4\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b\f\u0012\b\b\r\u0012\u0004\b\b(\u000e\u0012\u0015\u0012\u0013\u0018\u00010\u0004¢\u0006\f\b\f\u0012\b\b\r\u0012\u0004\b\b(\u000f\u0012\u0004\u0012\u00020\u00100\n2\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00100\u0012H\u0016J\u001a\u0010_\u001a\u00020\u00102\u0006\u0010H\u001a\u00020\u0019H\u0016ø\u0001\u0000¢\u0006\u0004\b`\u0010JJ\b\u0010a\u001a\u00020\u0010H\u0002J\b\u0010b\u001a\u00020\u0010H\u0016J\u0010\u0010c\u001a\u00020\u00102\u0006\u00104\u001a\u00020dH\u0016J\b\u0010e\u001a\u00020\u0010H\u0002J\b\u0010f\u001a\u00020\u0010H\u0002R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000RB\u0010\t\u001a6\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b\f\u0012\b\b\r\u0012\u0004\b\b(\u000e\u0012\u0015\u0012\u0013\u0018\u00010\u0004¢\u0006\f\b\f\u0012\b\b\r\u0012\u0004\b\b(\u000f\u0012\u0004\u0012\u00020\u0010\u0018\u00010\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\u0011\u001a\n\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u0012X\u0082\u000e¢\u0006\u0002\n\u0000R\u0018\u0010\u0018\u001a\u0004\u0018\u00010\u0019X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u001aR\u000e\u0010\u001b\u001a\u00020\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u0010\u001d\u001a\u00020\u00172\u0006\u0010\u001c\u001a\u00020\u0017@BX\u0082\u000e¢\u0006\b\n\u0000\"\u0004\b\u001e\u0010\u001fR\u000e\u0010 \u001a\u00020\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010#\u001a\u00020$8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b%\u0010&R\u000e\u0010'\u001a\u00020(X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010)\u001a\u00020\u0019X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u001aR\u000e\u0010*\u001a\u00020+X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010,\u001a\u0004\u0018\u00010-X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010.\u001a\u00020$8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b/\u0010&R\u001f\u00100\u001a\u0013\u0012\u0004\u0012\u000202\u0012\u0004\u0012\u00020\u001001¢\u0006\u0002\b3X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u00104\u001a\u000205X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u00106\u001a\u000207X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u00108R\u0010\u00109\u001a\u0004\u0018\u00010:X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010;\u001a\u00020<X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u00108R\u001a\u0010=\u001a\u00020\u00198VX\u0096\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b>\u0010?\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006g"}, d2 = {"Landroidx/compose/ui/platform/GraphicsLayerOwnerLayer;", "Landroidx/compose/ui/node/OwnedLayer;", "Landroidx/compose/ui/layout/GraphicLayerInfo;", "graphicsLayer", "Landroidx/compose/ui/graphics/layer/GraphicsLayer;", "context", "Landroidx/compose/ui/graphics/GraphicsContext;", "ownerView", "Landroidx/compose/ui/platform/AndroidComposeView;", "drawBlock", "Lkotlin/Function2;", "Landroidx/compose/ui/graphics/Canvas;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "canvas", "parentLayer", "", "invalidateParentLayer", "Lkotlin/Function0;", "(Landroidx/compose/ui/graphics/layer/GraphicsLayer;Landroidx/compose/ui/graphics/GraphicsContext;Landroidx/compose/ui/platform/AndroidComposeView;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;)V", "density", "Landroidx/compose/ui/unit/Density;", "drawnWithEnabledZ", "", "inverseMatrixCache", "Landroidx/compose/ui/graphics/Matrix;", "[F", "isDestroyed", "value", "isDirty", "setDirty", "(Z)V", "isIdentity", "isInverseMatrixDirty", "isMatrixDirty", "layerId", "", "getLayerId", "()J", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "matrixCache", "mutatedFields", "", "outline", "Landroidx/compose/ui/graphics/Outline;", "ownerViewId", "getOwnerViewId", "recordLambda", "Lkotlin/Function1;", "Landroidx/compose/ui/graphics/drawscope/DrawScope;", "Lkotlin/ExtensionFunctionType;", "scope", "Landroidx/compose/ui/graphics/drawscope/CanvasDrawScope;", "size", "Landroidx/compose/ui/unit/IntSize;", "J", "softwareLayerPaint", "Landroidx/compose/ui/graphics/Paint;", "transformOrigin", "Landroidx/compose/ui/graphics/TransformOrigin;", "underlyingMatrix", "getUnderlyingMatrix-sQKQjiQ", "()[F", "destroy", "drawLayer", "getInverseMatrix", "getInverseMatrix-3i98HWw", "getMatrix", "getMatrix-sQKQjiQ", "invalidate", "inverseTransform", "matrix", "inverseTransform-58bKbWc", "([F)V", "isInLayer", "position", "Landroidx/compose/ui/geometry/Offset;", "isInLayer-k-4lQ0M", "(J)Z", "mapBounds", "rect", "Landroidx/compose/ui/geometry/MutableRect;", "inverse", "mapOffset", "point", "mapOffset-8S9VItk", "(JZ)J", "move", "Landroidx/compose/ui/unit/IntOffset;", "move--gyyYBs", "(J)V", "resize", "resize-ozmzZPI", "reuseLayer", "transform", "transform-58bKbWc", "triggerRepaint", "updateDisplayList", "updateLayerProperties", "Landroidx/compose/ui/graphics/ReusableGraphicsLayerScope;", "updateMatrix", "updateOutline", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class GraphicsLayerOwnerLayer implements OwnedLayer, GraphicLayerInfo {
    public static final int $stable = 8;
    private final GraphicsContext context;
    private Function2<? super Canvas, ? super GraphicsLayer, Unit> drawBlock;
    private boolean drawnWithEnabledZ;
    private GraphicsLayer graphicsLayer;
    private Function0<Unit> invalidateParentLayer;
    private float[] inverseMatrixCache;
    private boolean isDestroyed;
    private boolean isDirty;
    private boolean isInverseMatrixDirty;
    private boolean isMatrixDirty;
    private int mutatedFields;
    private Outline outline;
    private final AndroidComposeView ownerView;
    private Paint softwareLayerPaint;
    private long size = IntSize.m7039constructorimpl((Integer.MAX_VALUE << 32) | (Integer.MAX_VALUE & 4294967295L));
    private final float[] matrixCache = Matrix.m4519constructorimpl$default(null, 1, null);
    private Density density = DensityKt.Density$default(1.0f, 0.0f, 2, null);
    private LayoutDirection layoutDirection = LayoutDirection.Ltr;
    private final CanvasDrawScope scope = new CanvasDrawScope();
    private long transformOrigin = TransformOrigin.Companion.m4680getCenterSzJe1aQ();
    private boolean isIdentity = true;
    private final Function1<DrawScope, Unit> recordLambda = new Function1<DrawScope, Unit>() { // from class: androidx.compose.ui.platform.GraphicsLayerOwnerLayer$recordLambda$1
        /* JADX INFO: Access modifiers changed from: package-private */
        {
            super(1);
        }

        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ Unit invoke(DrawScope drawScope) {
            invoke2(drawScope);
            return Unit.INSTANCE;
        }

        /* renamed from: invoke  reason: avoid collision after fix types in other method */
        public final void invoke2(DrawScope $this$null) {
            Function2 it;
            GraphicsLayerOwnerLayer graphicsLayerOwnerLayer = GraphicsLayerOwnerLayer.this;
            Canvas canvas = $this$null.getDrawContext().getCanvas();
            it = graphicsLayerOwnerLayer.drawBlock;
            if (it != null) {
                it.invoke(canvas, $this$null.getDrawContext().getGraphicsLayer());
            }
        }
    };

    public GraphicsLayerOwnerLayer(GraphicsLayer graphicsLayer, GraphicsContext context, AndroidComposeView ownerView, Function2<? super Canvas, ? super GraphicsLayer, Unit> function2, Function0<Unit> function0) {
        this.graphicsLayer = graphicsLayer;
        this.context = context;
        this.ownerView = ownerView;
        this.drawBlock = function2;
        this.invalidateParentLayer = function0;
    }

    private final void setDirty(boolean value) {
        if (value != this.isDirty) {
            this.isDirty = value;
            this.ownerView.notifyLayerIsDirty$ui_release(this, value);
        }
    }

    @Override // androidx.compose.ui.node.OwnedLayer
    public void updateLayerProperties(ReusableGraphicsLayerScope scope) {
        int m4921getModulateAlphake2Ky5w;
        Function0<Unit> function0;
        int maybeChangedFields = scope.getMutatedFields$ui_release() | this.mutatedFields;
        this.layoutDirection = scope.getLayoutDirection$ui_release();
        this.density = scope.getGraphicsDensity$ui_release();
        if ((maybeChangedFields & 4096) != 0) {
            this.transformOrigin = scope.mo4477getTransformOriginSzJe1aQ();
        }
        if ((maybeChangedFields & 1) != 0) {
            this.graphicsLayer.setScaleX(scope.getScaleX());
        }
        if ((maybeChangedFields & 2) != 0) {
            this.graphicsLayer.setScaleY(scope.getScaleY());
        }
        if ((maybeChangedFields & 4) != 0) {
            this.graphicsLayer.setAlpha(scope.getAlpha());
        }
        if ((maybeChangedFields & 8) != 0) {
            this.graphicsLayer.setTranslationX(scope.getTranslationX());
        }
        if ((maybeChangedFields & 16) != 0) {
            this.graphicsLayer.setTranslationY(scope.getTranslationY());
        }
        if ((maybeChangedFields & 32) != 0) {
            this.graphicsLayer.setShadowElevation(scope.getShadowElevation());
            if (scope.getShadowElevation() > 0.0f && !this.drawnWithEnabledZ && (function0 = this.invalidateParentLayer) != null) {
                function0.invoke();
            }
        }
        if ((maybeChangedFields & 64) != 0) {
            this.graphicsLayer.m4935setAmbientShadowColor8_81llA(scope.mo4473getAmbientShadowColor0d7_KjU());
        }
        if ((maybeChangedFields & 128) != 0) {
            this.graphicsLayer.m4941setSpotShadowColor8_81llA(scope.mo4476getSpotShadowColor0d7_KjU());
        }
        if ((maybeChangedFields & 1024) != 0) {
            this.graphicsLayer.setRotationZ(scope.getRotationZ());
        }
        if ((maybeChangedFields & 256) != 0) {
            this.graphicsLayer.setRotationX(scope.getRotationX());
        }
        if ((maybeChangedFields & 512) != 0) {
            this.graphicsLayer.setRotationY(scope.getRotationY());
        }
        if ((maybeChangedFields & 2048) != 0) {
            this.graphicsLayer.setCameraDistance(scope.getCameraDistance());
        }
        if ((maybeChangedFields & 4096) != 0) {
            boolean m4674equalsimpl0 = TransformOrigin.m4674equalsimpl0(this.transformOrigin, TransformOrigin.Companion.m4680getCenterSzJe1aQ());
            GraphicsLayer graphicsLayer = this.graphicsLayer;
            if (m4674equalsimpl0) {
                graphicsLayer.m4938setPivotOffsetk4lQ0M(Offset.Companion.m4063getUnspecifiedF1C5BW0());
            } else {
                float m4675getPivotFractionXimpl = TransformOrigin.m4675getPivotFractionXimpl(this.transformOrigin);
                long arg0$iv = this.size;
                float x$iv = m4675getPivotFractionXimpl * ((int) (arg0$iv >> 32));
                float m4676getPivotFractionYimpl = TransformOrigin.m4676getPivotFractionYimpl(this.transformOrigin);
                long arg0$iv2 = this.size;
                float y$iv = m4676getPivotFractionYimpl * ((int) (arg0$iv2 & 4294967295L));
                long v1$iv$iv = Float.floatToRawIntBits(x$iv);
                long v2$iv$iv = Float.floatToRawIntBits(y$iv);
                graphicsLayer.m4938setPivotOffsetk4lQ0M(Offset.m4040constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L)));
            }
        }
        if ((maybeChangedFields & 16384) != 0) {
            this.graphicsLayer.setClip(scope.getClip());
        }
        if ((131072 & maybeChangedFields) != 0) {
            this.graphicsLayer.setRenderEffect(scope.getRenderEffect());
        }
        if ((32768 & maybeChangedFields) != 0) {
            GraphicsLayer graphicsLayer2 = this.graphicsLayer;
            int mo4474getCompositingStrategyNrFUSI = scope.mo4474getCompositingStrategyNrFUSI();
            if (CompositingStrategy.m4373equalsimpl0(mo4474getCompositingStrategyNrFUSI, CompositingStrategy.Companion.m4377getAutoNrFUSI())) {
                m4921getModulateAlphake2Ky5w = androidx.compose.ui.graphics.layer.CompositingStrategy.Companion.m4920getAutoke2Ky5w();
            } else if (CompositingStrategy.m4373equalsimpl0(mo4474getCompositingStrategyNrFUSI, CompositingStrategy.Companion.m4379getOffscreenNrFUSI())) {
                m4921getModulateAlphake2Ky5w = androidx.compose.ui.graphics.layer.CompositingStrategy.Companion.m4922getOffscreenke2Ky5w();
            } else if (!CompositingStrategy.m4373equalsimpl0(mo4474getCompositingStrategyNrFUSI, CompositingStrategy.Companion.m4378getModulateAlphaNrFUSI())) {
                throw new IllegalStateException("Not supported composition strategy");
            } else {
                m4921getModulateAlphake2Ky5w = androidx.compose.ui.graphics.layer.CompositingStrategy.Companion.m4921getModulateAlphake2Ky5w();
            }
            graphicsLayer2.m4937setCompositingStrategyWpw9cng(m4921getModulateAlphake2Ky5w);
        }
        if ((maybeChangedFields & Fields.MatrixAffectingFields) != 0) {
            this.isMatrixDirty = true;
            this.isInverseMatrixDirty = true;
        }
        boolean outlineChanged = false;
        if (!Intrinsics.areEqual(this.outline, scope.getOutline$ui_release())) {
            outlineChanged = true;
            this.outline = scope.getOutline$ui_release();
            updateOutline();
        }
        this.mutatedFields = scope.getMutatedFields$ui_release();
        if (maybeChangedFields != 0 || outlineChanged) {
            triggerRepaint();
        }
    }

    private final void triggerRepaint() {
        WrapperRenderNodeLayerHelperMethods.INSTANCE.onDescendantInvalidated(this.ownerView);
    }

    private final void updateOutline() {
        Function0<Unit> function0;
        Outline outline = this.outline;
        if (outline == null) {
            return;
        }
        GraphicsLayerKt.setOutline(this.graphicsLayer, outline);
        if (!(outline instanceof Outline.Generic) || Build.VERSION.SDK_INT >= 33 || (function0 = this.invalidateParentLayer) == null) {
            return;
        }
        function0.invoke();
    }

    @Override // androidx.compose.ui.node.OwnedLayer
    /* renamed from: isInLayer-k-4lQ0M */
    public boolean mo5951isInLayerk4lQ0M(long position) {
        int bits$iv$iv$iv = (int) (position >> 32);
        float x = Float.intBitsToFloat(bits$iv$iv$iv);
        int bits$iv$iv$iv2 = (int) (4294967295L & position);
        float y = Float.intBitsToFloat(bits$iv$iv$iv2);
        if (this.graphicsLayer.getClip()) {
            return ShapeContainingUtilKt.isInOutline$default(this.graphicsLayer.getOutline(), x, y, null, null, 24, null);
        }
        return true;
    }

    @Override // androidx.compose.ui.node.OwnedLayer
    /* renamed from: move--gyyYBs */
    public void mo5953movegyyYBs(long position) {
        this.graphicsLayer.m4942setTopLeftgyyYBs(position);
        triggerRepaint();
    }

    @Override // androidx.compose.ui.node.OwnedLayer
    /* renamed from: resize-ozmzZPI */
    public void mo5954resizeozmzZPI(long size) {
        if (!IntSize.m7042equalsimpl0(size, this.size)) {
            this.size = size;
            invalidate();
        }
    }

    @Override // androidx.compose.ui.node.OwnedLayer
    public void drawLayer(Canvas canvas, GraphicsLayer parentLayer) {
        updateDisplayList();
        this.drawnWithEnabledZ = this.graphicsLayer.getShadowElevation() > 0.0f;
        DrawContext it = this.scope.getDrawContext();
        it.setCanvas(canvas);
        it.setGraphicsLayer(parentLayer);
        GraphicsLayerKt.drawLayer(this.scope, this.graphicsLayer);
    }

    @Override // androidx.compose.ui.node.OwnedLayer
    public void updateDisplayList() {
        if (this.isDirty) {
            if (!TransformOrigin.m4674equalsimpl0(this.transformOrigin, TransformOrigin.Companion.m4680getCenterSzJe1aQ()) && !IntSize.m7042equalsimpl0(this.graphicsLayer.m4931getSizeYbymL2g(), this.size)) {
                GraphicsLayer graphicsLayer = this.graphicsLayer;
                float m4675getPivotFractionXimpl = TransformOrigin.m4675getPivotFractionXimpl(this.transformOrigin);
                long arg0$iv = this.size;
                float x$iv = m4675getPivotFractionXimpl * ((int) (arg0$iv >> 32));
                float m4676getPivotFractionYimpl = TransformOrigin.m4676getPivotFractionYimpl(this.transformOrigin);
                long arg0$iv2 = this.size;
                float y$iv = m4676getPivotFractionYimpl * ((int) (arg0$iv2 & 4294967295L));
                long v1$iv$iv = Float.floatToRawIntBits(x$iv);
                long v2$iv$iv = Float.floatToRawIntBits(y$iv);
                graphicsLayer.m4938setPivotOffsetk4lQ0M(Offset.m4040constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L)));
            }
            this.graphicsLayer.m4934recordmLhObY(this.density, this.layoutDirection, this.size, this.recordLambda);
            setDirty(false);
        }
    }

    @Override // androidx.compose.ui.node.OwnedLayer
    public void invalidate() {
        if (!this.isDirty && !this.isDestroyed) {
            this.ownerView.invalidate();
            setDirty(true);
        }
    }

    @Override // androidx.compose.ui.node.OwnedLayer
    public void destroy() {
        this.drawBlock = null;
        this.invalidateParentLayer = null;
        this.isDestroyed = true;
        setDirty(false);
        if (this.context != null) {
            this.context.releaseGraphicsLayer(this.graphicsLayer);
            this.ownerView.recycle$ui_release(this);
        }
    }

    @Override // androidx.compose.ui.node.OwnedLayer
    /* renamed from: mapOffset-8S9VItk */
    public long mo5952mapOffset8S9VItk(long point, boolean inverse) {
        float[] matrix;
        if (inverse) {
            matrix = m6045getInverseMatrix3i98HWw();
            if (matrix == null) {
                return Offset.Companion.m4062getInfiniteF1C5BW0();
            }
        } else {
            matrix = m6046getMatrixsQKQjiQ();
        }
        if (this.isIdentity) {
            return point;
        }
        return Matrix.m4525mapMKHz9U(matrix, point);
    }

    @Override // androidx.compose.ui.node.OwnedLayer
    public void mapBounds(MutableRect rect, boolean inverse) {
        float[] matrix = inverse ? m6045getInverseMatrix3i98HWw() : m6046getMatrixsQKQjiQ();
        if (!this.isIdentity) {
            if (matrix == null) {
                rect.set(0.0f, 0.0f, 0.0f, 0.0f);
            } else {
                Matrix.m4527mapimpl(matrix, rect);
            }
        }
    }

    @Override // androidx.compose.ui.node.OwnedLayer
    public void reuseLayer(Function2<? super Canvas, ? super GraphicsLayer, Unit> function2, Function0<Unit> function0) {
        GraphicsContext context = this.context;
        if (context != null) {
            boolean value$iv = this.graphicsLayer.isReleased();
            if (!value$iv) {
                InlineClassHelperKt.throwIllegalArgumentException("layer should have been released before reuse");
            }
            this.graphicsLayer = context.createGraphicsLayer();
            this.isDestroyed = false;
            this.drawBlock = function2;
            this.invalidateParentLayer = function0;
            this.isMatrixDirty = false;
            this.isInverseMatrixDirty = false;
            this.isIdentity = true;
            Matrix.m4528resetimpl(this.matrixCache);
            float[] fArr = this.inverseMatrixCache;
            if (fArr != null) {
                Matrix.m4528resetimpl(fArr);
            }
            this.transformOrigin = TransformOrigin.Companion.m4680getCenterSzJe1aQ();
            this.drawnWithEnabledZ = false;
            this.size = IntSize.m7039constructorimpl((Integer.MAX_VALUE << 32) | (Integer.MAX_VALUE & 4294967295L));
            this.outline = null;
            this.mutatedFields = 0;
            return;
        }
        InlineClassHelperKt.throwIllegalStateExceptionForNullCheck("currently reuse is only supported when we manage the layer lifecycle");
        throw new KotlinNothingValueException();
    }

    @Override // androidx.compose.ui.node.OwnedLayer
    /* renamed from: transform-58bKbWc */
    public void mo5955transform58bKbWc(float[] matrix) {
        Matrix.m4538timesAssign58bKbWc(matrix, m6046getMatrixsQKQjiQ());
    }

    @Override // androidx.compose.ui.node.OwnedLayer
    /* renamed from: inverseTransform-58bKbWc */
    public void mo5950inverseTransform58bKbWc(float[] matrix) {
        float[] inverse = m6045getInverseMatrix3i98HWw();
        if (inverse != null) {
            Matrix.m4538timesAssign58bKbWc(matrix, inverse);
        }
    }

    @Override // androidx.compose.ui.layout.GraphicLayerInfo
    public long getLayerId() {
        return this.graphicsLayer.getLayerId();
    }

    @Override // androidx.compose.ui.layout.GraphicLayerInfo
    public long getOwnerViewId() {
        return this.graphicsLayer.getOwnerViewId();
    }

    /* renamed from: getMatrix-sQKQjiQ  reason: not valid java name */
    private final float[] m6046getMatrixsQKQjiQ() {
        updateMatrix();
        return this.matrixCache;
    }

    @Override // androidx.compose.ui.node.OwnedLayer
    /* renamed from: getUnderlyingMatrix-sQKQjiQ */
    public float[] mo5949getUnderlyingMatrixsQKQjiQ() {
        return m6046getMatrixsQKQjiQ();
    }

    /* renamed from: getInverseMatrix-3i98HWw  reason: not valid java name */
    private final float[] m6045getInverseMatrix3i98HWw() {
        float[] it = this.inverseMatrixCache;
        if (it == null) {
            it = Matrix.m4519constructorimpl$default(null, 1, null);
            this.inverseMatrixCache = it;
        }
        if (!this.isInverseMatrixDirty) {
            if (Float.isNaN(it[(0 * 4) + 0])) {
                return null;
            }
            return it;
        }
        this.isInverseMatrixDirty = false;
        float[] matrix = m6046getMatrixsQKQjiQ();
        if (this.isIdentity) {
            return matrix;
        }
        if (InvertMatrixKt.m6047invertToJiSxe2E(matrix, it)) {
            return it;
        }
        it[(0 * 4) + 0] = Float.NaN;
        return null;
    }

    private final void updateMatrix() {
        long value$iv$iv$iv;
        if (this.isMatrixDirty) {
            GraphicsLayer $this$updateMatrix_u24lambda_u244 = this.graphicsLayer;
            long $this$isUnspecified$iv = $this$updateMatrix_u24lambda_u244.m4930getPivotOffsetF1C5BW0();
            if ((9223372034707292159L & $this$isUnspecified$iv) == androidx.compose.ui.geometry.InlineClassHelperKt.UnspecifiedPackedFloats) {
                value$iv$iv$iv = SizeKt.m4127getCenteruvyYCjk(IntSizeKt.m7056toSizeozmzZPI(this.size));
            } else {
                value$iv$iv$iv = $this$updateMatrix_u24lambda_u244.m4930getPivotOffsetF1C5BW0();
            }
            int bits$iv$iv$iv$iv = (int) (value$iv$iv$iv >> 32);
            float x = Float.intBitsToFloat(bits$iv$iv$iv$iv);
            int bits$iv$iv$iv$iv2 = (int) (4294967295L & value$iv$iv$iv);
            float y = Float.intBitsToFloat(bits$iv$iv$iv$iv2);
            Matrix.m4529resetToPivotedTransformimpl(this.matrixCache, x, y, $this$updateMatrix_u24lambda_u244.getTranslationX(), $this$updateMatrix_u24lambda_u244.getTranslationY(), 1.0f, $this$updateMatrix_u24lambda_u244.getRotationX(), $this$updateMatrix_u24lambda_u244.getRotationY(), $this$updateMatrix_u24lambda_u244.getRotationZ(), $this$updateMatrix_u24lambda_u244.getScaleX(), $this$updateMatrix_u24lambda_u244.getScaleY(), 1.0f);
            this.isMatrixDirty = false;
            this.isIdentity = MatrixKt.m4544isIdentity58bKbWc(this.matrixCache);
        }
    }
}
