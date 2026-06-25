package com.hardlineforge.lala.ui.screens;

import androidx.compose.runtime.Composer;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.graphics.ColorKt;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.graphics.drawscope.Stroke;
import com.hardlineforge.lala.data.LogEntry;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import com.itextpdf.layout.properties.Property;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: MapViewScreen.kt */
@Metadata(d1 = {"\u0000\u0018\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\u001a\u0017\u0010\u0000\u001a\u00020\u00012\b\b\u0002\u0010\u0002\u001a\u00020\u0003H\u0007¢\u0006\u0002\u0010\u0004¨\u0006\u0005²\u0006\u0010\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007X\u008a\u0084\u0002"}, d2 = {"MapViewScreen", "", "vm", "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;", "(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V", "app_debug", "entries", "", "Lcom/hardlineforge/lala/data/LogEntry;"}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class MapViewScreenKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit MapViewScreen$lambda$9(LalaViewModel lalaViewModel, int i, int i2, Composer composer, int i3) {
        MapViewScreen(lalaViewModel, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1), i2);
        return Unit.INSTANCE;
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x010f  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0173  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void MapViewScreen(com.hardlineforge.lala.ui.viewmodel.LalaViewModel r24, androidx.compose.runtime.Composer r25, final int r26, final int r27) {
        /*
            Method dump skipped, instructions count: 399
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.MapViewScreenKt.MapViewScreen(com.hardlineforge.lala.ui.viewmodel.LalaViewModel, androidx.compose.runtime.Composer, int, int):void");
    }

    private static final List<LogEntry> MapViewScreen$lambda$0(State<? extends List<LogEntry>> state) {
        return (List) state.getValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Removed duplicated region for block: B:35:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x01a7  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0363  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final kotlin.Unit MapViewScreen$lambda$8(final java.util.List r61, androidx.compose.foundation.layout.PaddingValues r62, androidx.compose.runtime.Composer r63, int r64) {
        /*
            Method dump skipped, instructions count: 879
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.MapViewScreenKt.MapViewScreen$lambda$8(java.util.List, androidx.compose.foundation.layout.PaddingValues, androidx.compose.runtime.Composer, int):kotlin.Unit");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit MapViewScreen$lambda$8$lambda$7$lambda$6$lambda$5(List $geotagged, double $minLon, double $lonRange, double $minLat, double $latRange, long $primaryColor, DrawScope Canvas) {
        Intrinsics.checkNotNullParameter(Canvas, "$this$Canvas");
        float w = Float.intBitsToFloat((int) (Canvas.mo4840getSizeNHjbRc() >> 32));
        float h = Float.intBitsToFloat((int) (Canvas.mo4840getSizeNHjbRc() & 4294967295L));
        DrawScope.m4834drawRectnJ9OG0$default(Canvas, ColorKt.Color(4294111991L), 0L, 0L, 0.0f, new Stroke(2.0f, 0.0f, 0, 0, null, 30, null), null, 0, Property.BORDER_TOP_LEFT_RADIUS, null);
        Iterator it = $geotagged.iterator();
        while (it.hasNext()) {
            LogEntry logEntry = (LogEntry) it.next();
            Double gpsLon = logEntry.getGpsLon();
            Intrinsics.checkNotNull(gpsLon);
            float doubleValue = ((float) ((gpsLon.doubleValue() - $minLon) / $lonRange)) * w;
            Double gpsLat = logEntry.getGpsLat();
            Intrinsics.checkNotNull(gpsLat);
            DrawScope.m4821drawCircleVaOC9Bg$default(Canvas, $primaryColor, 6.0f, Offset.m4040constructorimpl((Float.floatToRawIntBits(doubleValue) << 32) | (Float.floatToRawIntBits(h - (((float) ((gpsLat.doubleValue() - $minLat) / $latRange)) * h)) & 4294967295L)), 0.0f, null, null, 0, 120, null);
        }
        return Unit.INSTANCE;
    }
}
