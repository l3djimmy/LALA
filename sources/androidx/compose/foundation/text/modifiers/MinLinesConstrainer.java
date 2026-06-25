package androidx.compose.foundation.text.modifiers;

import androidx.compose.ui.text.Paragraph;
import androidx.compose.ui.text.ParagraphKt;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.TextStyleKt;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.style.TextOverflow;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.ConstraintsKt;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.DensityKt;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.RangesKt;
/* compiled from: MinLinesConstrainer.kt */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0007\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0004\b\u0000\u0018\u0000 \u001e2\u00020\u0001:\u0001\u001eB'\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0002\u0010\nJ\"\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001a\u001a\u00020\u001bH\u0000ø\u0001\u0000¢\u0006\u0004\b\u001c\u0010\u001dR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0014X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u001f"}, d2 = {"Landroidx/compose/foundation/text/modifiers/MinLinesConstrainer;", "", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "inputTextStyle", "Landroidx/compose/ui/text/TextStyle;", "density", "Landroidx/compose/ui/unit/Density;", "fontFamilyResolver", "Landroidx/compose/ui/text/font/FontFamily$Resolver;", "(Landroidx/compose/ui/unit/LayoutDirection;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/ui/unit/Density;Landroidx/compose/ui/text/font/FontFamily$Resolver;)V", "getDensity", "()Landroidx/compose/ui/unit/Density;", "getFontFamilyResolver", "()Landroidx/compose/ui/text/font/FontFamily$Resolver;", "getInputTextStyle", "()Landroidx/compose/ui/text/TextStyle;", "getLayoutDirection", "()Landroidx/compose/ui/unit/LayoutDirection;", "lineHeightCache", "", "oneLineHeightCache", "resolvedStyle", "coerceMinLines", "Landroidx/compose/ui/unit/Constraints;", "inConstraints", "minLines", "", "coerceMinLines-Oh53vG4$foundation_release", "(JI)J", "Companion", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class MinLinesConstrainer {
    private static MinLinesConstrainer last;
    private final Density density;
    private final FontFamily.Resolver fontFamilyResolver;
    private final TextStyle inputTextStyle;
    private final LayoutDirection layoutDirection;
    private float lineHeightCache = Float.NaN;
    private float oneLineHeightCache = Float.NaN;
    private final TextStyle resolvedStyle;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    public MinLinesConstrainer(LayoutDirection layoutDirection, TextStyle inputTextStyle, Density density, FontFamily.Resolver fontFamilyResolver) {
        this.layoutDirection = layoutDirection;
        this.inputTextStyle = inputTextStyle;
        this.density = density;
        this.fontFamilyResolver = fontFamilyResolver;
        this.resolvedStyle = TextStyleKt.resolveDefaults(this.inputTextStyle, this.layoutDirection);
    }

    public final LayoutDirection getLayoutDirection() {
        return this.layoutDirection;
    }

    public final TextStyle getInputTextStyle() {
        return this.inputTextStyle;
    }

    public final Density getDensity() {
        return this.density;
    }

    public final FontFamily.Resolver getFontFamilyResolver() {
        return this.fontFamilyResolver;
    }

    /* compiled from: MinLinesConstrainer.kt */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J0\u0010\u0005\u001a\u00020\u00042\b\u0010\u0006\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eR\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Landroidx/compose/foundation/text/modifiers/MinLinesConstrainer$Companion;", "", "()V", "last", "Landroidx/compose/foundation/text/modifiers/MinLinesConstrainer;", TypedValues.TransitionType.S_FROM, "minMaxUtil", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "paramStyle", "Landroidx/compose/ui/text/TextStyle;", "density", "Landroidx/compose/ui/unit/Density;", "fontFamilyResolver", "Landroidx/compose/ui/text/font/FontFamily$Resolver;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final MinLinesConstrainer from(MinLinesConstrainer minMaxUtil, LayoutDirection layoutDirection, TextStyle paramStyle, Density density, FontFamily.Resolver fontFamilyResolver) {
            if (minMaxUtil != null && layoutDirection == minMaxUtil.getLayoutDirection() && Intrinsics.areEqual(TextStyleKt.resolveDefaults(paramStyle, layoutDirection), minMaxUtil.getInputTextStyle())) {
                if ((density.getDensity() == minMaxUtil.getDensity().getDensity()) && fontFamilyResolver == minMaxUtil.getFontFamilyResolver()) {
                    return minMaxUtil;
                }
            }
            MinLinesConstrainer it = MinLinesConstrainer.last;
            if (it != null && layoutDirection == it.getLayoutDirection() && Intrinsics.areEqual(TextStyleKt.resolveDefaults(paramStyle, layoutDirection), it.getInputTextStyle())) {
                if ((density.getDensity() == it.getDensity().getDensity()) && fontFamilyResolver == it.getFontFamilyResolver()) {
                    return it;
                }
            }
            MinLinesConstrainer it2 = new MinLinesConstrainer(layoutDirection, TextStyleKt.resolveDefaults(paramStyle, layoutDirection), DensityKt.Density(density.getDensity(), density.getFontScale()), fontFamilyResolver);
            Companion companion = MinLinesConstrainer.Companion;
            MinLinesConstrainer.last = it2;
            return it2;
        }
    }

    /* renamed from: coerceMinLines-Oh53vG4$foundation_release  reason: not valid java name */
    public final long m1667coerceMinLinesOh53vG4$foundation_release(long inConstraints, int minLines) {
        String str;
        Paragraph m6208ParagraphUl8oQg4;
        String str2;
        Paragraph m6208ParagraphUl8oQg42;
        int minHeight;
        float oneLineHeight = this.oneLineHeightCache;
        float lineHeight = this.lineHeightCache;
        if (Float.isNaN(oneLineHeight) || Float.isNaN(lineHeight)) {
            str = MinLinesConstrainerKt.EmptyTextReplacement;
            m6208ParagraphUl8oQg4 = ParagraphKt.m6208ParagraphUl8oQg4(str, this.resolvedStyle, ConstraintsKt.Constraints$default(0, 0, 0, 0, 15, null), this.density, this.fontFamilyResolver, (r22 & 32) != 0 ? CollectionsKt.emptyList() : null, (r22 & 64) != 0 ? CollectionsKt.emptyList() : null, (r22 & 128) != 0 ? Integer.MAX_VALUE : 1, (r22 & 256) != 0 ? TextOverflow.Companion.m6808getClipgIe3tQ8() : TextOverflow.Companion.m6808getClipgIe3tQ8());
            oneLineHeight = m6208ParagraphUl8oQg4.getHeight();
            str2 = MinLinesConstrainerKt.TwoLineTextReplacement;
            m6208ParagraphUl8oQg42 = ParagraphKt.m6208ParagraphUl8oQg4(str2, this.resolvedStyle, ConstraintsKt.Constraints$default(0, 0, 0, 0, 15, null), this.density, this.fontFamilyResolver, (r22 & 32) != 0 ? CollectionsKt.emptyList() : null, (r22 & 64) != 0 ? CollectionsKt.emptyList() : null, (r22 & 128) != 0 ? Integer.MAX_VALUE : 2, (r22 & 256) != 0 ? TextOverflow.Companion.m6808getClipgIe3tQ8() : TextOverflow.Companion.m6808getClipgIe3tQ8());
            float twoLineHeight = m6208ParagraphUl8oQg42.getHeight();
            lineHeight = twoLineHeight - oneLineHeight;
            this.oneLineHeightCache = oneLineHeight;
            this.lineHeightCache = lineHeight;
        }
        if (minLines != 1) {
            float $this$fastRoundToInt$iv = ((minLines - 1) * lineHeight) + oneLineHeight;
            minHeight = RangesKt.coerceAtMost(RangesKt.coerceAtLeast(Math.round($this$fastRoundToInt$iv), 0), Constraints.m6825getMaxHeightimpl(inConstraints));
        } else {
            minHeight = Constraints.m6827getMinHeightimpl(inConstraints);
        }
        return ConstraintsKt.Constraints(Constraints.m6828getMinWidthimpl(inConstraints), Constraints.m6826getMaxWidthimpl(inConstraints), minHeight, Constraints.m6825getMaxHeightimpl(inConstraints));
    }
}
