package androidx.compose.foundation.internal;

import android.os.Parcel;
import android.util.Base64;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.Shadow;
import androidx.compose.ui.text.SpanStyle;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontSynthesis;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.style.BaselineShift;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.text.style.TextGeometricTransform;
import androidx.compose.ui.unit.TextUnit;
import androidx.compose.ui.unit.TextUnitType;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
/* compiled from: ClipboardUtils.android.kt */
@Metadata(d1 = {"\u0000~\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0000\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0018\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bø\u0001\u0000¢\u0006\u0004\b\t\u0010\nJ\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\fJ\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\u000eJ\u0018\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u0010ø\u0001\u0000¢\u0006\u0004\b\u0011\u0010\u0012J\u0018\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0013\u001a\u00020\u0014ø\u0001\u0000¢\u0006\u0004\b\u0015\u0010\u0012J\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0016\u001a\u00020\u0017J\u0018\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0018\u001a\u00020\u0019ø\u0001\u0000¢\u0006\u0004\b\u001a\u0010\u001bJ\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u001c\u001a\u00020\u001dJ\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u001e\u001a\u00020\u001fJ\u0018\u0010\u0005\u001a\u00020\u00062\u0006\u0010 \u001a\u00020!ø\u0001\u0000¢\u0006\u0004\b\"\u0010\nJ\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010#\u001a\u00020$J\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010%\u001a\u00020&J\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010'\u001a\u00020(J\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010)\u001a\u00020*J\u0018\u0010\u0005\u001a\u00020\u00062\u0006\u0010+\u001a\u00020,ø\u0001\u0000¢\u0006\u0004\b-\u0010\nJ\u0006\u0010.\u001a\u00020*J\u0006\u0010/\u001a\u00020\u0006R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u00060"}, d2 = {"Landroidx/compose/foundation/internal/EncodeHelper;", "", "()V", "parcel", "Landroid/os/Parcel;", "encode", "", TypedValues.Custom.S_COLOR, "Landroidx/compose/ui/graphics/Color;", "encode-8_81llA", "(J)V", "shadow", "Landroidx/compose/ui/graphics/Shadow;", "spanStyle", "Landroidx/compose/ui/text/SpanStyle;", "fontStyle", "Landroidx/compose/ui/text/font/FontStyle;", "encode-nzbMABs", "(I)V", "fontSynthesis", "Landroidx/compose/ui/text/font/FontSynthesis;", "encode-6p3vJLY", "fontWeight", "Landroidx/compose/ui/text/font/FontWeight;", "baselineShift", "Landroidx/compose/ui/text/style/BaselineShift;", "encode-4Dl_Bck", "(F)V", "textDecoration", "Landroidx/compose/ui/text/style/TextDecoration;", "textGeometricTransform", "Landroidx/compose/ui/text/style/TextGeometricTransform;", "textUnit", "Landroidx/compose/ui/unit/TextUnit;", "encode--R2X_6o", "byte", "", TypedValues.Custom.S_FLOAT, "", "int", "", TypedValues.Custom.S_STRING, "", "uLong", "Lkotlin/ULong;", "encode-VKZWuLQ", "encodedString", "reset", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class EncodeHelper {
    public static final int $stable = 8;
    private Parcel parcel = Parcel.obtain();

    public final void reset() {
        this.parcel.recycle();
        this.parcel = Parcel.obtain();
    }

    public final String encodedString() {
        byte[] bytes = this.parcel.marshall();
        return Base64.encodeToString(bytes, 0);
    }

    public final void encode(SpanStyle spanStyle) {
        if (!Color.m4290equalsimpl0(spanStyle.m6280getColor0d7_KjU(), Color.Companion.m4325getUnspecified0d7_KjU())) {
            encode((byte) 1);
            m825encode8_81llA(spanStyle.m6280getColor0d7_KjU());
        }
        if (!TextUnit.m7064equalsimpl0(spanStyle.m6281getFontSizeXSAIIZE(), TextUnit.Companion.m7078getUnspecifiedXSAIIZE())) {
            encode((byte) 2);
            m822encodeR2X_6o(spanStyle.m6281getFontSizeXSAIIZE());
        }
        FontWeight it = spanStyle.getFontWeight();
        if (it != null) {
            encode((byte) 3);
            encode(it);
        }
        FontStyle m6282getFontStyle4Lr2A7w = spanStyle.m6282getFontStyle4Lr2A7w();
        if (m6282getFontStyle4Lr2A7w != null) {
            int it2 = m6282getFontStyle4Lr2A7w.m6453unboximpl();
            encode((byte) 4);
            m827encodenzbMABs(it2);
        }
        FontSynthesis m6283getFontSynthesisZQGJjVo = spanStyle.m6283getFontSynthesisZQGJjVo();
        if (m6283getFontSynthesisZQGJjVo != null) {
            int it3 = m6283getFontSynthesisZQGJjVo.m6466unboximpl();
            encode((byte) 5);
            m824encode6p3vJLY(it3);
        }
        String it4 = spanStyle.getFontFeatureSettings();
        if (it4 != null) {
            encode((byte) 6);
            encode(it4);
        }
        if (!TextUnit.m7064equalsimpl0(spanStyle.m6284getLetterSpacingXSAIIZE(), TextUnit.Companion.m7078getUnspecifiedXSAIIZE())) {
            encode((byte) 7);
            m822encodeR2X_6o(spanStyle.m6284getLetterSpacingXSAIIZE());
        }
        BaselineShift m6279getBaselineShift5SSeXJ0 = spanStyle.m6279getBaselineShift5SSeXJ0();
        if (m6279getBaselineShift5SSeXJ0 != null) {
            float it5 = m6279getBaselineShift5SSeXJ0.m6635unboximpl();
            encode((byte) 8);
            m823encode4Dl_Bck(it5);
        }
        TextGeometricTransform it6 = spanStyle.getTextGeometricTransform();
        if (it6 != null) {
            encode((byte) 9);
            encode(it6);
        }
        if (!Color.m4290equalsimpl0(spanStyle.m6278getBackground0d7_KjU(), Color.Companion.m4325getUnspecified0d7_KjU())) {
            encode((byte) 10);
            m825encode8_81llA(spanStyle.m6278getBackground0d7_KjU());
        }
        TextDecoration it7 = spanStyle.getTextDecoration();
        if (it7 != null) {
            encode((byte) 11);
            encode(it7);
        }
        Shadow it8 = spanStyle.getShadow();
        if (it8 != null) {
            encode((byte) 12);
            encode(it8);
        }
    }

    /* renamed from: encode-8_81llA  reason: not valid java name */
    public final void m825encode8_81llA(long color) {
        m826encodeVKZWuLQ(color);
    }

    /* renamed from: encode--R2X_6o  reason: not valid java name */
    public final void m822encodeR2X_6o(long textUnit) {
        long m7066getTypeUIouoOA = TextUnit.m7066getTypeUIouoOA(textUnit);
        byte typeCode = 0;
        if (!TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7101getUnspecifiedUIouoOA())) {
            if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7100getSpUIouoOA())) {
                typeCode = 1;
            } else if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7099getEmUIouoOA())) {
                typeCode = 2;
            }
        }
        encode(typeCode);
        if (!TextUnitType.m7095equalsimpl0(TextUnit.m7066getTypeUIouoOA(textUnit), TextUnitType.Companion.m7101getUnspecifiedUIouoOA())) {
            encode(TextUnit.m7067getValueimpl(textUnit));
        }
    }

    public final void encode(FontWeight fontWeight) {
        encode(fontWeight.getWeight());
    }

    /* renamed from: encode-nzbMABs  reason: not valid java name */
    public final void m827encodenzbMABs(int fontStyle) {
        byte b = 0;
        if (!FontStyle.m6450equalsimpl0(fontStyle, FontStyle.Companion.m6457getNormal_LCdwA()) && FontStyle.m6450equalsimpl0(fontStyle, FontStyle.Companion.m6456getItalic_LCdwA())) {
            b = 1;
        }
        encode(b);
    }

    /* renamed from: encode-6p3vJLY  reason: not valid java name */
    public final void m824encode6p3vJLY(int fontSynthesis) {
        byte value = 0;
        if (!FontSynthesis.m6461equalsimpl0(fontSynthesis, FontSynthesis.Companion.m6468getNoneGVVA2EU())) {
            if (FontSynthesis.m6461equalsimpl0(fontSynthesis, FontSynthesis.Companion.m6467getAllGVVA2EU())) {
                value = 1;
            } else if (FontSynthesis.m6461equalsimpl0(fontSynthesis, FontSynthesis.Companion.m6470getWeightGVVA2EU())) {
                value = 2;
            } else if (FontSynthesis.m6461equalsimpl0(fontSynthesis, FontSynthesis.Companion.m6469getStyleGVVA2EU())) {
                value = 3;
            }
        }
        encode(value);
    }

    /* renamed from: encode-4Dl_Bck  reason: not valid java name */
    public final void m823encode4Dl_Bck(float baselineShift) {
        encode(baselineShift);
    }

    public final void encode(TextGeometricTransform textGeometricTransform) {
        encode(textGeometricTransform.getScaleX());
        encode(textGeometricTransform.getSkewX());
    }

    public final void encode(TextDecoration textDecoration) {
        encode(textDecoration.getMask());
    }

    public final void encode(Shadow shadow) {
        m825encode8_81llA(shadow.m4614getColor0d7_KjU());
        long arg0$iv = shadow.m4615getOffsetF1C5BW0();
        int bits$iv$iv$iv = (int) (arg0$iv >> 32);
        encode(Float.intBitsToFloat(bits$iv$iv$iv));
        long arg0$iv2 = shadow.m4615getOffsetF1C5BW0();
        int bits$iv$iv$iv2 = (int) (4294967295L & arg0$iv2);
        encode(Float.intBitsToFloat(bits$iv$iv$iv2));
        encode(shadow.getBlurRadius());
    }

    public final void encode(byte b) {
        this.parcel.writeByte(b);
    }

    public final void encode(int i) {
        this.parcel.writeInt(i);
    }

    public final void encode(float f) {
        this.parcel.writeFloat(f);
    }

    /* renamed from: encode-VKZWuLQ  reason: not valid java name */
    public final void m826encodeVKZWuLQ(long uLong) {
        this.parcel.writeLong(uLong);
    }

    public final void encode(String string) {
        this.parcel.writeString(string);
    }
}
