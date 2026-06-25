package androidx.compose.ui.graphics.colorspace;

import androidx.collection.IntObjectMapKt;
import androidx.collection.MutableIntObjectMap;
import kotlin.Metadata;
/* compiled from: Connector.kt */
@Metadata(d1 = {"\u0000\u001e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a+\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\b\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\nH\u0080\bø\u0001\u0000¢\u0006\u0004\b\u000b\u0010\f\"\u001a\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0003\u0010\u0004\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\r"}, d2 = {"Connectors", "Landroidx/collection/MutableIntObjectMap;", "Landroidx/compose/ui/graphics/colorspace/Connector;", "getConnectors", "()Landroidx/collection/MutableIntObjectMap;", "connectorKey", "", "src", "dst", "renderIntent", "Landroidx/compose/ui/graphics/colorspace/RenderIntent;", "connectorKey-YBCOT_4", "(III)I", "ui-graphics_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class ConnectorKt {
    private static final MutableIntObjectMap<Connector> Connectors;

    public static final MutableIntObjectMap<Connector> getConnectors() {
        return Connectors;
    }

    static {
        int src$iv = ColorSpaces.INSTANCE.getSrgb().getId$ui_graphics_release();
        int dst$iv = ColorSpaces.INSTANCE.getSrgb().getId$ui_graphics_release();
        int renderIntent$iv = RenderIntent.Companion.m4724getPerceptualuksYyKA();
        Connector identity$ui_graphics_release = Connector.Companion.identity$ui_graphics_release(ColorSpaces.INSTANCE.getSrgb());
        int src$iv2 = ColorSpaces.INSTANCE.getSrgb().getId$ui_graphics_release();
        int dst$iv2 = ColorSpaces.INSTANCE.getOklab().getId$ui_graphics_release();
        int renderIntent$iv2 = RenderIntent.Companion.m4724getPerceptualuksYyKA();
        Connector connector = new Connector(ColorSpaces.INSTANCE.getSrgb(), ColorSpaces.INSTANCE.getOklab(), RenderIntent.Companion.m4724getPerceptualuksYyKA(), null);
        int src$iv3 = ColorSpaces.INSTANCE.getOklab().getId$ui_graphics_release();
        int dst$iv3 = ColorSpaces.INSTANCE.getSrgb().getId$ui_graphics_release();
        int renderIntent$iv3 = RenderIntent.Companion.m4724getPerceptualuksYyKA();
        Connectors = IntObjectMapKt.mutableIntObjectMapOf((dst$iv << 6) | src$iv | (renderIntent$iv << 12), identity$ui_graphics_release, (dst$iv2 << 6) | src$iv2 | (renderIntent$iv2 << 12), connector, (renderIntent$iv3 << 12) | (dst$iv3 << 6) | src$iv3, new Connector(ColorSpaces.INSTANCE.getOklab(), ColorSpaces.INSTANCE.getSrgb(), RenderIntent.Companion.m4724getPerceptualuksYyKA(), null));
    }

    /* renamed from: connectorKey-YBCOT_4  reason: not valid java name */
    public static final int m4715connectorKeyYBCOT_4(int src, int dst, int renderIntent) {
        return (dst << 6) | src | (renderIntent << 12);
    }
}
