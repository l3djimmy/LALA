package androidx.compose.foundation;

import androidx.compose.ui.draw.CacheDrawModifierNode;
import androidx.compose.ui.draw.CacheDrawScope;
import androidx.compose.ui.draw.DrawModifierKt;
import androidx.compose.ui.draw.DrawResult;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.RoundRectKt;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.graphics.Brush;
import androidx.compose.ui.graphics.ClipOp;
import androidx.compose.ui.graphics.Outline;
import androidx.compose.ui.graphics.Path;
import androidx.compose.ui.graphics.Shape;
import androidx.compose.ui.graphics.drawscope.ContentDrawScope;
import androidx.compose.ui.graphics.drawscope.DrawContext;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.graphics.drawscope.DrawTransform;
import androidx.compose.ui.graphics.drawscope.Stroke;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.unit.Dp;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Border.kt */
@Metadata(d1 = {"\u0000^\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bJ,\u0010\u001e\u001a\u00020\u001f*\u00020 2\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010!\u001a\u00020\"2\u0006\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020&H\u0002JF\u0010'\u001a\u00020\u001f*\u00020 2\u0006\u0010\f\u001a\u00020\u00052\u0006\u0010!\u001a\u00020(2\u0006\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020,2\u0006\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020&H\u0002ø\u0001\u0000¢\u0006\u0004\b-\u0010.R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e¢\u0006\u0002\n\u0000R$\u0010\f\u001a\u00020\u00052\u0006\u0010\u000b\u001a\u00020\u0005@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u0004¢\u0006\u0002\n\u0000R$\u0010\u0013\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\u0007@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017R,\u0010\u0018\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0003@FX\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\u001d\u001a\u0004\b\u0019\u0010\u001a\"\u0004\b\u001b\u0010\u001c\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006/"}, d2 = {"Landroidx/compose/foundation/BorderModifierNode;", "Landroidx/compose/ui/node/DelegatingNode;", "widthParameter", "Landroidx/compose/ui/unit/Dp;", "brushParameter", "Landroidx/compose/ui/graphics/Brush;", "shapeParameter", "Landroidx/compose/ui/graphics/Shape;", "(FLandroidx/compose/ui/graphics/Brush;Landroidx/compose/ui/graphics/Shape;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "borderCache", "Landroidx/compose/foundation/BorderCache;", "value", "brush", "getBrush", "()Landroidx/compose/ui/graphics/Brush;", "setBrush", "(Landroidx/compose/ui/graphics/Brush;)V", "drawWithCacheModifierNode", "Landroidx/compose/ui/draw/CacheDrawModifierNode;", "shape", "getShape", "()Landroidx/compose/ui/graphics/Shape;", "setShape", "(Landroidx/compose/ui/graphics/Shape;)V", "width", "getWidth-D9Ej5fM", "()F", "setWidth-0680j_4", "(F)V", "F", "drawGenericBorder", "Landroidx/compose/ui/draw/DrawResult;", "Landroidx/compose/ui/draw/CacheDrawScope;", "outline", "Landroidx/compose/ui/graphics/Outline$Generic;", "fillArea", "", "strokeWidth", "", "drawRoundRectBorder", "Landroidx/compose/ui/graphics/Outline$Rounded;", "topLeft", "Landroidx/compose/ui/geometry/Offset;", "borderSize", "Landroidx/compose/ui/geometry/Size;", "drawRoundRectBorder-JqoCqck", "(Landroidx/compose/ui/draw/CacheDrawScope;Landroidx/compose/ui/graphics/Brush;Landroidx/compose/ui/graphics/Outline$Rounded;JJZF)Landroidx/compose/ui/draw/DrawResult;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class BorderModifierNode extends DelegatingNode {
    public static final int $stable = 8;
    private BorderCache borderCache;
    private Brush brush;
    private final CacheDrawModifierNode drawWithCacheModifierNode;
    private Shape shape;
    private float width;

    public /* synthetic */ BorderModifierNode(float f, Brush brush, Shape shape, DefaultConstructorMarker defaultConstructorMarker) {
        this(f, brush, shape);
    }

    private BorderModifierNode(float widthParameter, Brush brushParameter, Shape shapeParameter) {
        this.width = widthParameter;
        this.brush = brushParameter;
        this.shape = shapeParameter;
        this.drawWithCacheModifierNode = (CacheDrawModifierNode) delegate(DrawModifierKt.CacheDrawModifierNode(new Function1<CacheDrawScope, DrawResult>() { // from class: androidx.compose.foundation.BorderModifierNode$drawWithCacheModifierNode$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final DrawResult invoke(CacheDrawScope $this$CacheDrawModifierNode) {
                DrawResult m516drawRectBorderNsqcLGU;
                DrawResult m519drawRoundRectBorderJqoCqck;
                DrawResult drawGenericBorder;
                DrawResult drawContentWithoutBorder;
                boolean hasValidBorderParams = $this$CacheDrawModifierNode.mo644toPx0680j_4(BorderModifierNode.this.m520getWidthD9Ej5fM()) >= 0.0f && Size.m4116getMinDimensionimpl($this$CacheDrawModifierNode.m3909getSizeNHjbRc()) > 0.0f;
                if (!hasValidBorderParams) {
                    drawContentWithoutBorder = BorderKt.drawContentWithoutBorder($this$CacheDrawModifierNode);
                    return drawContentWithoutBorder;
                }
                float strokeWidthPx = Math.min(Dp.m6878equalsimpl0(BorderModifierNode.this.m520getWidthD9Ej5fM(), Dp.Companion.m6891getHairlineD9Ej5fM()) ? 1.0f : (float) Math.ceil($this$CacheDrawModifierNode.mo644toPx0680j_4(BorderModifierNode.this.m520getWidthD9Ej5fM())), (float) Math.ceil(Size.m4116getMinDimensionimpl($this$CacheDrawModifierNode.m3909getSizeNHjbRc()) / 2.0f));
                float halfStroke = strokeWidthPx / 2.0f;
                long v1$iv$iv = Float.floatToRawIntBits(halfStroke);
                long v2$iv$iv = Float.floatToRawIntBits(halfStroke);
                long topLeft = Offset.m4040constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L));
                long arg0$iv = $this$CacheDrawModifierNode.m3909getSizeNHjbRc();
                int bits$iv$iv$iv = (int) (arg0$iv >> 32);
                float width$iv = Float.intBitsToFloat(bits$iv$iv$iv) - strokeWidthPx;
                long arg0$iv2 = $this$CacheDrawModifierNode.m3909getSizeNHjbRc();
                int bits$iv$iv$iv2 = (int) (arg0$iv2 & 4294967295L);
                float height$iv = Float.intBitsToFloat(bits$iv$iv$iv2) - strokeWidthPx;
                long v1$iv$iv2 = Float.floatToRawIntBits(width$iv);
                long v2$iv$iv2 = Float.floatToRawIntBits(height$iv);
                long borderSize = Size.m4108constructorimpl((v1$iv$iv2 << 32) | (v2$iv$iv2 & 4294967295L));
                boolean fillArea = strokeWidthPx * 2.0f > Size.m4116getMinDimensionimpl($this$CacheDrawModifierNode.m3909getSizeNHjbRc());
                Outline outline = BorderModifierNode.this.getShape().mo558createOutlinePq9zytI($this$CacheDrawModifierNode.m3909getSizeNHjbRc(), $this$CacheDrawModifierNode.getLayoutDirection(), $this$CacheDrawModifierNode);
                if (outline instanceof Outline.Generic) {
                    drawGenericBorder = BorderModifierNode.this.drawGenericBorder($this$CacheDrawModifierNode, BorderModifierNode.this.getBrush(), (Outline.Generic) outline, fillArea, strokeWidthPx);
                    return drawGenericBorder;
                } else if (outline instanceof Outline.Rounded) {
                    m519drawRoundRectBorderJqoCqck = BorderModifierNode.this.m519drawRoundRectBorderJqoCqck($this$CacheDrawModifierNode, BorderModifierNode.this.getBrush(), (Outline.Rounded) outline, topLeft, borderSize, fillArea, strokeWidthPx);
                    return m519drawRoundRectBorderJqoCqck;
                } else if (outline instanceof Outline.Rectangle) {
                    m516drawRectBorderNsqcLGU = BorderKt.m516drawRectBorderNsqcLGU($this$CacheDrawModifierNode, BorderModifierNode.this.getBrush(), topLeft, borderSize, fillArea, strokeWidthPx);
                    return m516drawRectBorderNsqcLGU;
                } else {
                    throw new NoWhenBranchMatchedException();
                }
            }
        }));
    }

    /* renamed from: getWidth-D9Ej5fM  reason: not valid java name */
    public final float m520getWidthD9Ej5fM() {
        return this.width;
    }

    /* renamed from: setWidth-0680j_4  reason: not valid java name */
    public final void m521setWidth0680j_4(float value) {
        if (!Dp.m6878equalsimpl0(this.width, value)) {
            this.width = value;
            this.drawWithCacheModifierNode.invalidateDrawCache();
        }
    }

    public final Brush getBrush() {
        return this.brush;
    }

    public final void setBrush(Brush value) {
        if (!Intrinsics.areEqual(this.brush, value)) {
            this.brush = value;
            this.drawWithCacheModifierNode.invalidateDrawCache();
        }
    }

    public final Shape getShape() {
        return this.shape;
    }

    public final void setShape(Shape value) {
        if (!Intrinsics.areEqual(this.shape, value)) {
            this.shape = value;
            this.drawWithCacheModifierNode.invalidateDrawCache();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Can't wrap try/catch for region: R(7:(4:(5:(2:26|(2:28|(25:31|32|(1:34)|35|36|37|38|39|40|41|42|43|45|46|47|48|49|50|51|52|53|54|55|56|57)))|54|55|56|57)|51|52|53)|45|46|47|48|49|50) */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0124, code lost:
        if (androidx.compose.ui.graphics.ImageBitmapConfig.m4503equalsimpl(r15, r0 != null ? androidx.compose.ui.graphics.ImageBitmapConfig.m4501boximpl(r0.mo4156getConfig_sVssgQ()) : null) != false) goto L88;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x03b3, code lost:
        r0 = th;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x03b4, code lost:
        r5 = r0;
        r1 = r8;
        r3 = r7;
     */
    /* JADX WARN: Removed duplicated region for block: B:41:0x01a5  */
    /* JADX WARN: Type inference failed for: r42v1, types: [T, androidx.compose.ui.graphics.ImageBitmap] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final androidx.compose.ui.draw.DrawResult drawGenericBorder(androidx.compose.ui.draw.CacheDrawScope r61, final androidx.compose.ui.graphics.Brush r62, final androidx.compose.ui.graphics.Outline.Generic r63, boolean r64, float r65) {
        /*
            Method dump skipped, instructions count: 1079
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.BorderModifierNode.drawGenericBorder(androidx.compose.ui.draw.CacheDrawScope, androidx.compose.ui.graphics.Brush, androidx.compose.ui.graphics.Outline$Generic, boolean, float):androidx.compose.ui.draw.DrawResult");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: drawRoundRectBorder-JqoCqck  reason: not valid java name */
    public final DrawResult m519drawRoundRectBorderJqoCqck(CacheDrawScope $this$drawRoundRectBorder_u2dJqoCqck, final Brush brush, Outline.Rounded outline, final long topLeft, final long borderSize, final boolean fillArea, final float strokeWidth) {
        final Path roundedRectPath;
        if (!RoundRectKt.isSimple(outline.getRoundRect())) {
            if (this.borderCache == null) {
                this.borderCache = new BorderCache(null, null, null, null, 15, null);
            }
            BorderCache borderCache = this.borderCache;
            Intrinsics.checkNotNull(borderCache);
            Path path = borderCache.obtainPath();
            roundedRectPath = BorderKt.createRoundRectPath(path, outline.getRoundRect(), strokeWidth, fillArea);
            return $this$drawRoundRectBorder_u2dJqoCqck.onDrawWithContent(new Function1<ContentDrawScope, Unit>() { // from class: androidx.compose.foundation.BorderModifierNode$drawRoundRectBorder$2
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(ContentDrawScope contentDrawScope) {
                    invoke2(contentDrawScope);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(ContentDrawScope $this$onDrawWithContent) {
                    $this$onDrawWithContent.drawContent();
                    DrawScope.m4829drawPathGBMwjPU$default($this$onDrawWithContent, Path.this, brush, 0.0f, null, null, 0, 60, null);
                }
            });
        }
        final long cornerRadius = outline.getRoundRect().m4098getTopLeftCornerRadiuskKHJgLs();
        final float halfStroke = strokeWidth / 2.0f;
        final Stroke borderStroke = new Stroke(strokeWidth, 0.0f, 0, 0, null, 30, null);
        return $this$drawRoundRectBorder_u2dJqoCqck.onDrawWithContent(new Function1<ContentDrawScope, Unit>() { // from class: androidx.compose.foundation.BorderModifierNode$drawRoundRectBorder$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(ContentDrawScope contentDrawScope) {
                invoke2(contentDrawScope);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(ContentDrawScope $this$onDrawWithContent) {
                long m517shrinkKibmq7A;
                $this$onDrawWithContent.drawContent();
                if (fillArea) {
                    DrawScope.m4835drawRoundRectZuiqVtQ$default($this$onDrawWithContent, brush, 0L, 0L, cornerRadius, 0.0f, null, null, 0, 246, null);
                    return;
                }
                long arg0$iv = cornerRadius;
                int bits$iv$iv$iv = (int) (arg0$iv >> 32);
                if (Float.intBitsToFloat(bits$iv$iv$iv) < halfStroke) {
                    ContentDrawScope $this$clipRect_u2drOu3jXo$iv = $this$onDrawWithContent;
                    float left$iv = strokeWidth;
                    float top$iv = strokeWidth;
                    long arg0$iv2 = $this$onDrawWithContent.mo4840getSizeNHjbRc();
                    int bits$iv$iv$iv2 = (int) (arg0$iv2 >> 32);
                    float right$iv = Float.intBitsToFloat(bits$iv$iv$iv2) - strokeWidth;
                    long arg0$iv3 = $this$onDrawWithContent.mo4840getSizeNHjbRc();
                    int bits$iv$iv$iv3 = (int) (4294967295L & arg0$iv3);
                    float bottom$iv = Float.intBitsToFloat(bits$iv$iv$iv3) - strokeWidth;
                    int clipOp$iv = ClipOp.Companion.m4277getDifferencertfAjoo();
                    Brush brush2 = brush;
                    long j = cornerRadius;
                    DrawContext $this$withTransform_u24lambda_u246$iv$iv = $this$clipRect_u2drOu3jXo$iv.getDrawContext();
                    long previousSize$iv$iv = $this$withTransform_u24lambda_u246$iv$iv.mo4761getSizeNHjbRc();
                    $this$withTransform_u24lambda_u246$iv$iv.getCanvas().save();
                    try {
                        DrawTransform $this$clipRect_rOu3jXo_u24lambda_u244$iv = $this$withTransform_u24lambda_u246$iv$iv.getTransform();
                        $this$clipRect_rOu3jXo_u24lambda_u244$iv.mo4764clipRectN_I0leg(left$iv, top$iv, right$iv, bottom$iv, clipOp$iv);
                        try {
                            DrawScope.m4835drawRoundRectZuiqVtQ$default($this$clipRect_u2drOu3jXo$iv, brush2, 0L, 0L, j, 0.0f, null, null, 0, 246, null);
                            $this$withTransform_u24lambda_u246$iv$iv.getCanvas().restore();
                            $this$withTransform_u24lambda_u246$iv$iv.mo4762setSizeuvyYCjk(previousSize$iv$iv);
                        } catch (Throwable th) {
                            th = th;
                            $this$withTransform_u24lambda_u246$iv$iv.getCanvas().restore();
                            $this$withTransform_u24lambda_u246$iv$iv.mo4762setSizeuvyYCjk(previousSize$iv$iv);
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                    }
                } else {
                    Brush brush3 = brush;
                    long j2 = topLeft;
                    long j3 = borderSize;
                    m517shrinkKibmq7A = BorderKt.m517shrinkKibmq7A(cornerRadius, halfStroke);
                    DrawScope.m4835drawRoundRectZuiqVtQ$default($this$onDrawWithContent, brush3, j2, j3, m517shrinkKibmq7A, 0.0f, borderStroke, null, 0, 208, null);
                }
            }
        });
    }
}
