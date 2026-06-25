package androidx.compose.foundation.text.modifiers;

import androidx.compose.ui.unit.TextUnit;
import androidx.compose.ui.unit.TextUnitKt;
import kotlin.Metadata;
/* compiled from: MultiParagraphLayoutCache.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\u001a\u001f\u0010\u0003\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u0001H\u0082\u0002ø\u0001\u0000¢\u0006\u0004\b\u0005\u0010\u0006\"\u0010\u0010\u0000\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0002\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0007"}, d2 = {"DefaultFontSize", "Landroidx/compose/ui/unit/TextUnit;", "J", "times", "other", "times-NB67dxo", "(JJ)J", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class MultiParagraphLayoutCacheKt {
    private static final long DefaultFontSize = TextUnitKt.getSp(14);

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: times-NB67dxo  reason: not valid java name */
    public static final long m1681timesNB67dxo(long $this$times_u2dNB67dxo, long other) {
        if (TextUnit.m7069isEmimpl(other)) {
            if (TextUnit.m7069isEmimpl($this$times_u2dNB67dxo)) {
                throw new IllegalStateException("Cannot convert Em to Px when style.fontSize is Em (" + ((Object) TextUnit.m7074toStringimpl(other)) + "). Please declare the style.fontSize with Sp units instead.");
            }
            if (TextUnit.m7065getRawTypeimpl($this$times_u2dNB67dxo) == 0) {
                long arg0$iv = DefaultFontSize;
                float other$iv = TextUnit.m7067getValueimpl(other);
                TextUnitKt.m7080checkArithmeticR2X_6o(arg0$iv);
                return TextUnitKt.pack(TextUnit.m7065getRawTypeimpl(arg0$iv), TextUnit.m7067getValueimpl(arg0$iv) * other$iv);
            }
            float other$iv2 = TextUnit.m7067getValueimpl(other);
            TextUnitKt.m7080checkArithmeticR2X_6o($this$times_u2dNB67dxo);
            return TextUnitKt.pack(TextUnit.m7065getRawTypeimpl($this$times_u2dNB67dxo), TextUnit.m7067getValueimpl($this$times_u2dNB67dxo) * other$iv2);
        }
        throw new IllegalArgumentException("The multiplier must be in em, but was " + ((Object) TextUnit.m7074toStringimpl(other)) + '.');
    }
}
