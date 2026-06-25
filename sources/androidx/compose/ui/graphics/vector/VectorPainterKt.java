package androidx.compose.ui.graphics.vector;

import androidx.autofill.HintConstants;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.graphics.BlendMode;
import androidx.compose.ui.graphics.Brush;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.ColorFilter;
import androidx.compose.ui.graphics.drawscope.DrawContext;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.graphics.drawscope.DrawTransform;
import androidx.compose.ui.graphics.vector.VectorProperty;
import androidx.compose.ui.platform.CompositionLocalsKt;
import androidx.compose.ui.unit.Density;
import com.itextpdf.layout.properties.Property;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.ReplaceWith;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;
/* compiled from: VectorPainter.kt */
@Metadata(d1 = {"\u0000\u0092\u0001\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\u001a+\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0014\b\u0002\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\b0\u0007H\u0007¢\u0006\u0002\u0010\t\u001a$\u0010\n\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0002ø\u0001\u0000¢\u0006\u0004\b\u0010\u0010\u0011\u001a \u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0019H\u0000\u001a*\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001b2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020\u001eH\u0002ø\u0001\u0000¢\u0006\u0004\b \u0010!\u001a\u0015\u0010\"\u001a\u00020\u00132\u0006\u0010#\u001a\u00020\u0017H\u0007¢\u0006\u0002\u0010$\u001a\u0096\u0001\u0010\"\u001a\u00020\u00132\u0006\u0010%\u001a\u00020&2\u0006\u0010'\u001a\u00020&2\b\b\u0002\u0010\u001d\u001a\u00020\u001e2\b\b\u0002\u0010\u001f\u001a\u00020\u001e2\b\b\u0002\u0010(\u001a\u00020\u00012\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2@\u0010)\u001a<\u0012\u0013\u0012\u00110\u001e¢\u0006\f\b+\u0012\b\b(\u0012\u0004\b\b(\u001d\u0012\u0013\u0012\u00110\u001e¢\u0006\f\b+\u0012\b\b(\u0012\u0004\b\b(\u001f\u0012\u0004\u0012\u00020\u00030*¢\u0006\u0002\b,¢\u0006\u0002\b-H\u0007ø\u0001\u0000¢\u0006\u0004\b.\u0010/\u001a \u0001\u0010\"\u001a\u00020\u00132\u0006\u0010%\u001a\u00020&2\u0006\u0010'\u001a\u00020&2\b\b\u0002\u0010\u001d\u001a\u00020\u001e2\b\b\u0002\u0010\u001f\u001a\u00020\u001e2\b\b\u0002\u0010(\u001a\u00020\u00012\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u00100\u001a\u0002012@\u0010)\u001a<\u0012\u0013\u0012\u00110\u001e¢\u0006\f\b+\u0012\b\b(\u0012\u0004\b\b(\u001d\u0012\u0013\u0012\u00110\u001e¢\u0006\f\b+\u0012\b\b(\u0012\u0004\b\b(\u001f\u0012\u0004\u0012\u00020\u00030*¢\u0006\u0002\b,¢\u0006\u0002\b-H\u0007ø\u0001\u0000¢\u0006\u0004\b2\u00103\u001aD\u00104\u001a\u00020\u0013*\u00020\u00132\u0006\u0010\u001c\u001a\u00020\u001b2\u0006\u00105\u001a\u00020\u001b2\b\b\u0002\u0010(\u001a\u00020\u00012\b\u00106\u001a\u0004\u0018\u00010\u000b2\b\b\u0002\u00100\u001a\u000201H\u0000ø\u0001\u0000¢\u0006\u0004\b7\u00108\u001a\u0014\u00109\u001a\u00020\u0019*\u00020\u00192\u0006\u0010:\u001a\u00020\u0005H\u0000\u001a&\u0010;\u001a\u00020\u0003*\u00020<2\u0017\u0010=\u001a\u0013\u0012\u0004\u0012\u00020<\u0012\u0004\u0012\u00020\u00030>¢\u0006\u0002\b?H\u0082\b\u001a&\u0010@\u001a\u00020\u001b*\u00020\u00152\u0006\u0010%\u001a\u00020&2\u0006\u0010'\u001a\u00020&H\u0002ø\u0001\u0000¢\u0006\u0004\bA\u0010B\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0086T¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006C"}, d2 = {"RootGroupName", "", "RenderVectorGroup", "", "group", "Landroidx/compose/ui/graphics/vector/VectorGroup;", "configs", "", "Landroidx/compose/ui/graphics/vector/VectorConfig;", "(Landroidx/compose/ui/graphics/vector/VectorGroup;Ljava/util/Map;Landroidx/compose/runtime/Composer;II)V", "createColorFilter", "Landroidx/compose/ui/graphics/ColorFilter;", "tintColor", "Landroidx/compose/ui/graphics/Color;", "tintBlendMode", "Landroidx/compose/ui/graphics/BlendMode;", "createColorFilter-xETnrds", "(JI)Landroidx/compose/ui/graphics/ColorFilter;", "createVectorPainterFromImageVector", "Landroidx/compose/ui/graphics/vector/VectorPainter;", "density", "Landroidx/compose/ui/unit/Density;", "imageVector", "Landroidx/compose/ui/graphics/vector/ImageVector;", "root", "Landroidx/compose/ui/graphics/vector/GroupComponent;", "obtainViewportSize", "Landroidx/compose/ui/geometry/Size;", "defaultSize", "viewportWidth", "", "viewportHeight", "obtainViewportSize-Pq9zytI", "(JFF)J", "rememberVectorPainter", "image", "(Landroidx/compose/ui/graphics/vector/ImageVector;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/graphics/vector/VectorPainter;", "defaultWidth", "Landroidx/compose/ui/unit/Dp;", "defaultHeight", HintConstants.AUTOFILL_HINT_NAME, "content", "Lkotlin/Function2;", "Lkotlin/ParameterName;", "Landroidx/compose/runtime/Composable;", "Landroidx/compose/ui/graphics/vector/VectorComposable;", "rememberVectorPainter-mlNsNFs", "(FFFFLjava/lang/String;JILkotlin/jvm/functions/Function4;Landroidx/compose/runtime/Composer;II)Landroidx/compose/ui/graphics/vector/VectorPainter;", "autoMirror", "", "rememberVectorPainter-vIP8VLU", "(FFFFLjava/lang/String;JIZLkotlin/jvm/functions/Function4;Landroidx/compose/runtime/Composer;II)Landroidx/compose/ui/graphics/vector/VectorPainter;", "configureVectorPainter", "viewportSize", "intrinsicColorFilter", "configureVectorPainter-T4PVSW8", "(Landroidx/compose/ui/graphics/vector/VectorPainter;JJLjava/lang/String;Landroidx/compose/ui/graphics/ColorFilter;Z)Landroidx/compose/ui/graphics/vector/VectorPainter;", "createGroupComponent", "currentGroup", "mirror", "Landroidx/compose/ui/graphics/drawscope/DrawScope;", "block", "Lkotlin/Function1;", "Lkotlin/ExtensionFunctionType;", "obtainSizePx", "obtainSizePx-VpY3zN4", "(Landroidx/compose/ui/unit/Density;FF)J", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class VectorPainterKt {
    public static final String RootGroupName = "VectorRootGroup";

    @Deprecated(message = "Replace rememberVectorPainter graphicsLayer that consumes the auto mirror flag", replaceWith = @ReplaceWith(expression = "rememberVectorPainter(defaultWidth, defaultHeight, viewportWidth, viewportHeight, name, tintColor, tintBlendMode, false, content)", imports = {"androidx.compose.ui.graphics.vector"}))
    /* renamed from: rememberVectorPainter-mlNsNFs  reason: not valid java name */
    public static final VectorPainter m5002rememberVectorPaintermlNsNFs(float defaultWidth, float defaultHeight, float viewportWidth, float viewportHeight, String name, long tintColor, int tintBlendMode, Function4<? super Float, ? super Float, ? super Composer, ? super Integer, Unit> function4, Composer $composer, int $changed, int i) {
        ComposerKt.sourceInformationMarkerStart($composer, -964365210, "C(rememberVectorPainter)P(2:c#ui.unit.Dp,1:c#ui.unit.Dp,7,6,3,5:c#ui.graphics.Color,4:c#ui.graphics.BlendMode)85@3804L207:VectorPainter.kt#huu6hf");
        float viewportWidth2 = (i & 4) != 0 ? Float.NaN : viewportWidth;
        float viewportHeight2 = (i & 8) != 0 ? Float.NaN : viewportHeight;
        String name2 = (i & 16) != 0 ? RootGroupName : name;
        long tintColor2 = (i & 32) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : tintColor;
        int tintBlendMode2 = (i & 64) != 0 ? BlendMode.Companion.m4229getSrcIn0nO6VwU() : tintBlendMode;
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-964365210, $changed, -1, "androidx.compose.ui.graphics.vector.rememberVectorPainter (VectorPainter.kt:85)");
        }
        VectorPainter m5003rememberVectorPaintervIP8VLU = m5003rememberVectorPaintervIP8VLU(defaultWidth, defaultHeight, viewportWidth2, viewportHeight2, name2, tintColor2, tintBlendMode2, false, function4, $composer, ($changed & 14) | 12582912 | ($changed & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($changed & 896) | ($changed & 7168) | (57344 & $changed) | (458752 & $changed) | (3670016 & $changed) | (($changed << 3) & 234881024), 0);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return m5003rememberVectorPaintervIP8VLU;
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x0225, code lost:
        if (r5 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L64;
     */
    /* JADX WARN: Removed duplicated region for block: B:103:0x0229  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x024e  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x01a7  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x01ba  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x021d  */
    /* renamed from: rememberVectorPainter-vIP8VLU  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final androidx.compose.ui.graphics.vector.VectorPainter m5003rememberVectorPaintervIP8VLU(float r24, float r25, float r26, float r27, java.lang.String r28, long r29, int r31, boolean r32, kotlin.jvm.functions.Function4<? super java.lang.Float, ? super java.lang.Float, ? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r33, androidx.compose.runtime.Composer r34, int r35, int r36) {
        /*
            Method dump skipped, instructions count: 597
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.graphics.vector.VectorPainterKt.m5003rememberVectorPaintervIP8VLU(float, float, float, float, java.lang.String, long, int, boolean, kotlin.jvm.functions.Function4, androidx.compose.runtime.Composer, int, int):androidx.compose.ui.graphics.vector.VectorPainter");
    }

    public static final VectorPainter rememberVectorPainter(ImageVector image, Composer $composer, int $changed) {
        ComposerKt.sourceInformationMarkerStart($composer, 1413834416, "C(rememberVectorPainter)170@7429L7,172@7513L187:VectorPainter.kt#huu6hf");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(1413834416, $changed, -1, "androidx.compose.ui.graphics.vector.rememberVectorPainter (VectorPainter.kt:169)");
        }
        ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
        Object consume = $composer.consume(CompositionLocalsKt.getLocalDensity());
        ComposerKt.sourceInformationMarkerEnd($composer);
        Density density = (Density) consume;
        float val1$iv = image.getGenId$ui_release();
        float val2$iv = density.getDensity();
        long v1$iv = Float.floatToRawIntBits(val1$iv);
        long v2$iv = Float.floatToRawIntBits(val2$iv);
        long key = (v1$iv << 32) | (4294967295L & v2$iv);
        ComposerKt.sourceInformationMarkerStart($composer, -1837461227, "CC(remember):VectorPainter.kt#9igjgp");
        boolean invalid$iv = $composer.changed(key);
        Object it$iv = $composer.rememberedValue();
        if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
            GroupComponent $this$rememberVectorPainter_u24lambda_u246_u24lambda_u245 = new GroupComponent();
            createGroupComponent($this$rememberVectorPainter_u24lambda_u246_u24lambda_u245, image.getRoot());
            Unit unit = Unit.INSTANCE;
            Object value$iv = createVectorPainterFromImageVector(density, image, $this$rememberVectorPainter_u24lambda_u246_u24lambda_u245);
            $composer.updateRememberedValue(value$iv);
            it$iv = value$iv;
        }
        VectorPainter vectorPainter = (VectorPainter) it$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return vectorPainter;
    }

    private static final void mirror(DrawScope $this$mirror, Function1<? super DrawScope, Unit> function1) {
        long pivot$iv = $this$mirror.mo4839getCenterF1C5BW0();
        DrawContext $this$withTransform_u24lambda_u246$iv$iv = $this$mirror.getDrawContext();
        long previousSize$iv$iv = $this$withTransform_u24lambda_u246$iv$iv.mo4761getSizeNHjbRc();
        $this$withTransform_u24lambda_u246$iv$iv.getCanvas().save();
        try {
            DrawTransform $this$scale_Fgt4K4Q_u24lambda_u242$iv = $this$withTransform_u24lambda_u246$iv$iv.getTransform();
            $this$scale_Fgt4K4Q_u24lambda_u242$iv.mo4768scale0AR0LA0(-1.0f, 1.0f, pivot$iv);
        } catch (Throwable th) {
            th = th;
        }
        try {
            function1.invoke($this$mirror);
            $this$withTransform_u24lambda_u246$iv$iv.getCanvas().restore();
            $this$withTransform_u24lambda_u246$iv$iv.mo4762setSizeuvyYCjk(previousSize$iv$iv);
        } catch (Throwable th2) {
            th = th2;
            $this$withTransform_u24lambda_u246$iv$iv.getCanvas().restore();
            $this$withTransform_u24lambda_u246$iv$iv.mo4762setSizeuvyYCjk(previousSize$iv$iv);
            throw th;
        }
    }

    /* renamed from: obtainSizePx-VpY3zN4  reason: not valid java name */
    private static final long m5000obtainSizePxVpY3zN4(Density $this$obtainSizePx_u2dVpY3zN4, float defaultWidth, float defaultHeight) {
        float width$iv = $this$obtainSizePx_u2dVpY3zN4.mo644toPx0680j_4(defaultWidth);
        float height$iv = $this$obtainSizePx_u2dVpY3zN4.mo644toPx0680j_4(defaultHeight);
        long v1$iv$iv = Float.floatToRawIntBits(width$iv);
        long v2$iv$iv = Float.floatToRawIntBits(height$iv);
        return Size.m4108constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
    }

    /* renamed from: obtainViewportSize-Pq9zytI  reason: not valid java name */
    private static final long m5001obtainViewportSizePq9zytI(long defaultSize, float viewportWidth, float viewportHeight) {
        float width$iv;
        float height$iv;
        if (!Float.isNaN(viewportWidth)) {
            width$iv = viewportWidth;
        } else {
            int bits$iv$iv$iv = (int) (defaultSize >> 32);
            width$iv = Float.intBitsToFloat(bits$iv$iv$iv);
        }
        if (!Float.isNaN(viewportHeight)) {
            height$iv = viewportHeight;
        } else {
            int bits$iv$iv$iv2 = (int) (defaultSize & 4294967295L);
            height$iv = Float.intBitsToFloat(bits$iv$iv$iv2);
        }
        long v1$iv$iv = Float.floatToRawIntBits(width$iv);
        long v2$iv$iv = Float.floatToRawIntBits(height$iv);
        return Size.m4108constructorimpl((v2$iv$iv & 4294967295L) | (v1$iv$iv << 32));
    }

    /* renamed from: createColorFilter-xETnrds  reason: not valid java name */
    private static final ColorFilter m4999createColorFilterxETnrds(long tintColor, int tintBlendMode) {
        if (tintColor != 16) {
            return ColorFilter.Companion.m4333tintxETnrds(tintColor, tintBlendMode);
        }
        return null;
    }

    /* renamed from: configureVectorPainter-T4PVSW8$default  reason: not valid java name */
    public static /* synthetic */ VectorPainter m4998configureVectorPainterT4PVSW8$default(VectorPainter vectorPainter, long j, long j2, String str, ColorFilter colorFilter, boolean z, int i, Object obj) {
        String str2;
        boolean z2;
        if ((i & 4) == 0) {
            str2 = str;
        } else {
            str2 = RootGroupName;
        }
        if ((i & 16) == 0) {
            z2 = z;
        } else {
            z2 = false;
        }
        return m4997configureVectorPainterT4PVSW8(vectorPainter, j, j2, str2, colorFilter, z2);
    }

    /* renamed from: configureVectorPainter-T4PVSW8  reason: not valid java name */
    public static final VectorPainter m4997configureVectorPainterT4PVSW8(VectorPainter $this$configureVectorPainter_u2dT4PVSW8, long defaultSize, long viewportSize, String name, ColorFilter intrinsicColorFilter, boolean autoMirror) {
        $this$configureVectorPainter_u2dT4PVSW8.m4995setSizeuvyYCjk$ui_release(defaultSize);
        $this$configureVectorPainter_u2dT4PVSW8.setAutoMirror$ui_release(autoMirror);
        $this$configureVectorPainter_u2dT4PVSW8.setIntrinsicColorFilter$ui_release(intrinsicColorFilter);
        $this$configureVectorPainter_u2dT4PVSW8.m4996setViewportSizeuvyYCjk$ui_release(viewportSize);
        $this$configureVectorPainter_u2dT4PVSW8.setName$ui_release(name);
        return $this$configureVectorPainter_u2dT4PVSW8;
    }

    public static final VectorPainter createVectorPainterFromImageVector(Density density, ImageVector imageVector, GroupComponent root) {
        long defaultSize = m5000obtainSizePxVpY3zN4(density, imageVector.m4971getDefaultWidthD9Ej5fM(), imageVector.m4970getDefaultHeightD9Ej5fM());
        long viewport = m5001obtainViewportSizePq9zytI(defaultSize, imageVector.getViewportWidth(), imageVector.getViewportHeight());
        return m4997configureVectorPainterT4PVSW8(new VectorPainter(root), defaultSize, viewport, imageVector.getName(), m4999createColorFilterxETnrds(imageVector.m4973getTintColor0d7_KjU(), imageVector.m4972getTintBlendMode0nO6VwU()), imageVector.getAutoMirror());
    }

    public static final GroupComponent createGroupComponent(GroupComponent $this$createGroupComponent, VectorGroup currentGroup) {
        int size = currentGroup.getSize();
        for (int index = 0; index < size; index++) {
            VectorNode vectorNode = currentGroup.get(index);
            if (vectorNode instanceof VectorPath) {
                PathComponent $this$createGroupComponent_u24lambda_u248 = new PathComponent();
                $this$createGroupComponent_u24lambda_u248.setPathData(((VectorPath) vectorNode).getPathData());
                $this$createGroupComponent_u24lambda_u248.m4981setPathFillTypeoQ8Xj4U(((VectorPath) vectorNode).m5004getPathFillTypeRgk1Os());
                $this$createGroupComponent_u24lambda_u248.setName(((VectorPath) vectorNode).getName());
                $this$createGroupComponent_u24lambda_u248.setFill(((VectorPath) vectorNode).getFill());
                $this$createGroupComponent_u24lambda_u248.setFillAlpha(((VectorPath) vectorNode).getFillAlpha());
                $this$createGroupComponent_u24lambda_u248.setStroke(((VectorPath) vectorNode).getStroke());
                $this$createGroupComponent_u24lambda_u248.setStrokeAlpha(((VectorPath) vectorNode).getStrokeAlpha());
                $this$createGroupComponent_u24lambda_u248.setStrokeLineWidth(((VectorPath) vectorNode).getStrokeLineWidth());
                $this$createGroupComponent_u24lambda_u248.m4982setStrokeLineCapBeK7IIE(((VectorPath) vectorNode).m5005getStrokeLineCapKaPHkGw());
                $this$createGroupComponent_u24lambda_u248.m4983setStrokeLineJoinWw9F2mQ(((VectorPath) vectorNode).m5006getStrokeLineJoinLxFBmk8());
                $this$createGroupComponent_u24lambda_u248.setStrokeLineMiter(((VectorPath) vectorNode).getStrokeLineMiter());
                $this$createGroupComponent_u24lambda_u248.setTrimPathStart(((VectorPath) vectorNode).getTrimPathStart());
                $this$createGroupComponent_u24lambda_u248.setTrimPathEnd(((VectorPath) vectorNode).getTrimPathEnd());
                $this$createGroupComponent_u24lambda_u248.setTrimPathOffset(((VectorPath) vectorNode).getTrimPathOffset());
                $this$createGroupComponent.insertAt(index, $this$createGroupComponent_u24lambda_u248);
            } else if (vectorNode instanceof VectorGroup) {
                GroupComponent $this$createGroupComponent_u24lambda_u249 = new GroupComponent();
                $this$createGroupComponent_u24lambda_u249.setName(((VectorGroup) vectorNode).getName());
                $this$createGroupComponent_u24lambda_u249.setRotation(((VectorGroup) vectorNode).getRotation());
                $this$createGroupComponent_u24lambda_u249.setScaleX(((VectorGroup) vectorNode).getScaleX());
                $this$createGroupComponent_u24lambda_u249.setScaleY(((VectorGroup) vectorNode).getScaleY());
                $this$createGroupComponent_u24lambda_u249.setTranslationX(((VectorGroup) vectorNode).getTranslationX());
                $this$createGroupComponent_u24lambda_u249.setTranslationY(((VectorGroup) vectorNode).getTranslationY());
                $this$createGroupComponent_u24lambda_u249.setPivotX(((VectorGroup) vectorNode).getPivotX());
                $this$createGroupComponent_u24lambda_u249.setPivotY(((VectorGroup) vectorNode).getPivotY());
                $this$createGroupComponent_u24lambda_u249.setClipPathData(((VectorGroup) vectorNode).getClipPathData());
                createGroupComponent($this$createGroupComponent_u24lambda_u249, (VectorGroup) vectorNode);
                $this$createGroupComponent.insertAt(index, $this$createGroupComponent_u24lambda_u249);
            }
        }
        return $this$createGroupComponent;
    }

    public static final void RenderVectorGroup(final VectorGroup group, Map<String, ? extends VectorConfig> map, Composer $composer, final int $changed, final int i) {
        final Map configs;
        Composer $composer2 = $composer.startRestartGroup(-446179233);
        ComposerKt.sourceInformation($composer2, "C(RenderVectorGroup)P(1):VectorPainter.kt#huu6hf");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
        } else if (($changed & 6) == 0) {
            $dirty |= $composer2.changed(group) ? 4 : 2;
        }
        int i2 = i & 2;
        if (i2 != 0) {
            $dirty |= 48;
            configs = map;
        } else if (($changed & 48) == 0) {
            configs = map;
            $dirty |= $composer2.changedInstance(configs) ? 32 : 16;
        } else {
            configs = map;
        }
        if ($composer2.shouldExecute(($dirty & 19) != 18, $dirty & 1)) {
            Map configs2 = i2 != 0 ? MapsKt.emptyMap() : configs;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-446179233, $dirty, -1, "androidx.compose.ui.graphics.vector.RenderVectorGroup (VectorPainter.kt:428)");
            }
            Iterator<VectorNode> it = group.iterator();
            while (it.hasNext()) {
                final VectorNode vectorNode = it.next();
                if (vectorNode instanceof VectorPath) {
                    $composer2.startReplaceGroup(-23302778);
                    ComposerKt.sourceInformation($composer2, "432@16447L1297");
                    VectorConfig config = configs2.get(((VectorPath) vectorNode).getName());
                    if (config == null) {
                        config = new VectorConfig() { // from class: androidx.compose.ui.graphics.vector.VectorPainterKt$RenderVectorGroup$config$1
                        };
                    }
                    Composer $composer3 = $composer2;
                    VectorComposeKt.m4987Path9cdaXJ4((List) config.getOrDefault(VectorProperty.PathData.INSTANCE, ((VectorPath) vectorNode).getPathData()), ((VectorPath) vectorNode).m5004getPathFillTypeRgk1Os(), ((VectorPath) vectorNode).getName(), (Brush) config.getOrDefault(VectorProperty.Fill.INSTANCE, ((VectorPath) vectorNode).getFill()), ((Number) config.getOrDefault(VectorProperty.FillAlpha.INSTANCE, Float.valueOf(((VectorPath) vectorNode).getFillAlpha()))).floatValue(), (Brush) config.getOrDefault(VectorProperty.Stroke.INSTANCE, ((VectorPath) vectorNode).getStroke()), ((Number) config.getOrDefault(VectorProperty.StrokeAlpha.INSTANCE, Float.valueOf(((VectorPath) vectorNode).getStrokeAlpha()))).floatValue(), ((Number) config.getOrDefault(VectorProperty.StrokeLineWidth.INSTANCE, Float.valueOf(((VectorPath) vectorNode).getStrokeLineWidth()))).floatValue(), ((VectorPath) vectorNode).m5005getStrokeLineCapKaPHkGw(), ((VectorPath) vectorNode).m5006getStrokeLineJoinLxFBmk8(), ((VectorPath) vectorNode).getStrokeLineMiter(), ((Number) config.getOrDefault(VectorProperty.TrimPathStart.INSTANCE, Float.valueOf(((VectorPath) vectorNode).getTrimPathStart()))).floatValue(), ((Number) config.getOrDefault(VectorProperty.TrimPathEnd.INSTANCE, Float.valueOf(((VectorPath) vectorNode).getTrimPathEnd()))).floatValue(), ((Number) config.getOrDefault(VectorProperty.TrimPathOffset.INSTANCE, Float.valueOf(((VectorPath) vectorNode).getTrimPathOffset()))).floatValue(), $composer3, 0, 0, 0);
                    $composer2 = $composer3;
                    $composer2.endReplaceGroup();
                    it = it;
                    configs2 = configs2;
                    $dirty = $dirty;
                } else {
                    Iterator<VectorNode> it2 = it;
                    int $dirty2 = $dirty;
                    final Map configs3 = configs2;
                    if (vectorNode instanceof VectorGroup) {
                        $composer2.startReplaceGroup(-21889209);
                        ComposerKt.sourceInformation($composer2, "467@18739L88,455@17883L944");
                        VectorConfig config2 = configs3.get(((VectorGroup) vectorNode).getName());
                        if (config2 == null) {
                            config2 = new VectorConfig() { // from class: androidx.compose.ui.graphics.vector.VectorPainterKt$RenderVectorGroup$config$2
                            };
                        }
                        VectorComposeKt.Group(((VectorGroup) vectorNode).getName(), ((Number) config2.getOrDefault(VectorProperty.Rotation.INSTANCE, Float.valueOf(((VectorGroup) vectorNode).getRotation()))).floatValue(), ((Number) config2.getOrDefault(VectorProperty.PivotX.INSTANCE, Float.valueOf(((VectorGroup) vectorNode).getPivotX()))).floatValue(), ((Number) config2.getOrDefault(VectorProperty.PivotY.INSTANCE, Float.valueOf(((VectorGroup) vectorNode).getPivotY()))).floatValue(), ((Number) config2.getOrDefault(VectorProperty.ScaleX.INSTANCE, Float.valueOf(((VectorGroup) vectorNode).getScaleX()))).floatValue(), ((Number) config2.getOrDefault(VectorProperty.ScaleY.INSTANCE, Float.valueOf(((VectorGroup) vectorNode).getScaleY()))).floatValue(), ((Number) config2.getOrDefault(VectorProperty.TranslateX.INSTANCE, Float.valueOf(((VectorGroup) vectorNode).getTranslationX()))).floatValue(), ((Number) config2.getOrDefault(VectorProperty.TranslateY.INSTANCE, Float.valueOf(((VectorGroup) vectorNode).getTranslationY()))).floatValue(), (List) config2.getOrDefault(VectorProperty.PathData.INSTANCE, ((VectorGroup) vectorNode).getClipPathData()), ComposableLambdaKt.rememberComposableLambda(1450046638, true, new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorPainterKt$RenderVectorGroup$1
                            /* JADX INFO: Access modifiers changed from: package-private */
                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            /* JADX WARN: Multi-variable type inference failed */
                            {
                                super(2);
                            }

                            @Override // kotlin.jvm.functions.Function2
                            public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                                invoke(composer, num.intValue());
                                return Unit.INSTANCE;
                            }

                            public final void invoke(Composer $composer4, int $changed2) {
                                ComposerKt.sourceInformation($composer4, "C468@18757L56:VectorPainter.kt#huu6hf");
                                if (!$composer4.shouldExecute(($changed2 & 3) != 2, $changed2 & 1)) {
                                    $composer4.skipToGroupEnd();
                                    return;
                                }
                                if (ComposerKt.isTraceInProgress()) {
                                    ComposerKt.traceEventStart(1450046638, $changed2, -1, "androidx.compose.ui.graphics.vector.RenderVectorGroup.<anonymous> (VectorPainter.kt:468)");
                                }
                                VectorPainterKt.RenderVectorGroup((VectorGroup) VectorNode.this, configs3, $composer4, 0, 0);
                                if (ComposerKt.isTraceInProgress()) {
                                    ComposerKt.traceEventEnd();
                                }
                            }
                        }, $composer2, 54), $composer2, 805306368, 0);
                        $composer2.endReplaceGroup();
                        it = it2;
                        configs2 = configs3;
                        $dirty = $dirty2;
                    } else {
                        $composer2.startReplaceGroup(-20884003);
                        $composer2.endReplaceGroup();
                        it = it2;
                        configs2 = configs3;
                        $dirty = $dirty2;
                    }
                }
            }
            Map configs4 = configs2;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            configs = configs4;
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorPainterKt$RenderVectorGroup$2
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i3) {
                    VectorPainterKt.RenderVectorGroup(VectorGroup.this, configs, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }
}
