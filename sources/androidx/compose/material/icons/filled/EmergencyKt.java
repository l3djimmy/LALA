package androidx.compose.material.icons.filled;

import androidx.compose.material.icons.Icons;
import androidx.compose.ui.graphics.Brush;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.SolidColor;
import androidx.compose.ui.graphics.StrokeCap;
import androidx.compose.ui.graphics.StrokeJoin;
import androidx.compose.ui.graphics.vector.ImageVector;
import androidx.compose.ui.graphics.vector.PathBuilder;
import androidx.compose.ui.graphics.vector.VectorKt;
import androidx.compose.ui.unit.Dp;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Emergency.kt */
@Metadata(d1 = {"\u0000\u0010\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\"\u0010\u0010\u0000\u001a\u0004\u0018\u00010\u0001X\u0082\u000e¢\u0006\u0002\n\u0000\"\u0015\u0010\u0002\u001a\u00020\u0001*\u00020\u00038F¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"_emergency", "Landroidx/compose/ui/graphics/vector/ImageVector;", "Emergency", "Landroidx/compose/material/icons/Icons$Filled;", "getEmergency", "(Landroidx/compose/material/icons/Icons$Filled;)Landroidx/compose/ui/graphics/vector/ImageVector;", "material-icons-extended_release"}, k = 2, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes.dex */
public final class EmergencyKt {
    private static ImageVector _emergency;

    public static final ImageVector getEmergency(Icons.Filled $this$Emergency) {
        ImageVector.Builder m4975addPathoIyEayM;
        if (_emergency != null) {
            ImageVector imageVector = _emergency;
            Intrinsics.checkNotNull(imageVector);
            return imageVector;
        }
        float $this$dp$iv$iv = Dp.m6873constructorimpl(24.0f);
        float $this$dp$iv$iv2 = Dp.m6873constructorimpl(24.0f);
        ImageVector.Builder $this$_get_Emergency__u24lambda_u241 = new ImageVector.Builder("Filled.Emergency", $this$dp$iv$iv, $this$dp$iv$iv2, 24.0f, 24.0f, 0L, 0, false, 96, null);
        int pathFillType$iv = VectorKt.getDefaultFillType();
        Brush fill$iv$iv = new SolidColor(Color.Companion.m4315getBlack0d7_KjU(), null);
        int strokeLineCap$iv$iv = StrokeCap.Companion.m4642getButtKaPHkGw();
        int strokeLineJoin$iv$iv = StrokeJoin.Companion.m4652getBevelLxFBmk8();
        PathBuilder $this$PathData_u24lambda_u240$iv$iv$iv = new PathBuilder();
        $this$PathData_u24lambda_u240$iv$iv$iv.moveTo(20.79f, 9.23f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(-2.0f, -3.46f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(-4.79f, 2.77f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(0.0f, -5.54f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(-4.0f, 0.0f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(0.0f, 5.54f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(-4.79f, -2.77f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(-2.0f, 3.46f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(4.79f, 2.77f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(-4.79f, 2.77f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(2.0f, 3.46f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(4.79f, -2.77f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(0.0f, 5.54f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(4.0f, 0.0f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(0.0f, -5.54f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(4.79f, 2.77f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(2.0f, -3.46f);
        $this$PathData_u24lambda_u240$iv$iv$iv.lineToRelative(-4.79f, -2.77f);
        $this$PathData_u24lambda_u240$iv$iv$iv.close();
        m4975addPathoIyEayM = $this$_get_Emergency__u24lambda_u241.m4975addPathoIyEayM($this$PathData_u24lambda_u240$iv$iv$iv.getNodes(), (r30 & 2) != 0 ? VectorKt.getDefaultFillType() : pathFillType$iv, (r30 & 4) != 0 ? "" : "", (r30 & 8) != 0 ? null : fill$iv$iv, (r30 & 16) != 0 ? 1.0f : 1.0f, (r30 & 32) == 0 ? null : null, (r30 & 64) != 0 ? 1.0f : 1.0f, (r30 & 128) != 0 ? 0.0f : 1.0f, (r30 & 256) != 0 ? VectorKt.getDefaultStrokeLineCap() : strokeLineCap$iv$iv, (r30 & 512) != 0 ? VectorKt.getDefaultStrokeLineJoin() : strokeLineJoin$iv$iv, (r30 & 1024) != 0 ? 4.0f : 1.0f, (r30 & 2048) != 0 ? 0.0f : 0.0f, (r30 & 4096) == 0 ? 0.0f : 1.0f, (r30 & 8192) == 0 ? 0.0f : 0.0f);
        _emergency = m4975addPathoIyEayM.build();
        ImageVector imageVector2 = _emergency;
        Intrinsics.checkNotNull(imageVector2);
        return imageVector2;
    }
}
