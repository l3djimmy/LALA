package androidx.compose.foundation.text.modifiers;

import androidx.compose.foundation.text.TextAutoSize;
import androidx.compose.foundation.text.TextDelegateKt;
import androidx.compose.foundation.text.modifiers.MinLinesConstrainer;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.MultiParagraph;
import androidx.compose.ui.text.MultiParagraphIntrinsics;
import androidx.compose.ui.text.Placeholder;
import androidx.compose.ui.text.TextLayoutInput;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.TextStyleKt;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.style.TextOverflow;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.ConstraintsKt;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.IntSize;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.compose.ui.unit.TextUnit;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.RangesKt;
/* compiled from: MultiParagraphLayoutCache.kt */
@Metadata(d1 = {"\u0000\u0092\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0002\b\u0013\b\u0000\u0018\u00002\u00020\u0001:\u0001VBi\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\b\b\u0002\u0010\b\u001a\u00020\t\u0012\b\b\u0002\u0010\n\u001a\u00020\u000b\u0012\b\b\u0002\u0010\f\u001a\u00020\r\u0012\b\b\u0002\u0010\u000e\u001a\u00020\r\u0012\u0016\b\u0002\u0010\u000f\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00120\u0011\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0014¢\u0006\u0002\u0010\u0015J\u0016\u00107\u001a\u00020\r2\u0006\u00108\u001a\u00020\r2\u0006\u00109\u001a\u00020%J,\u0010:\u001a\u00020;2\u0006\u0010<\u001a\u00020=2\u0006\u00109\u001a\u00020%2\b\b\u0002\u0010\b\u001a\u00020\tH\u0002ø\u0001\u0000¢\u0006\u0004\b>\u0010?J \u0010@\u001a\u00020\u000b2\u0006\u0010<\u001a\u00020=2\u0006\u00109\u001a\u00020%ø\u0001\u0000¢\u0006\u0004\bA\u0010BJ\b\u0010C\u001a\u00020DH\u0002J\b\u0010E\u001a\u00020DH\u0002J\u000e\u0010F\u001a\u00020\r2\u0006\u00109\u001a\u00020%J\u000e\u0010G\u001a\u00020\r2\u0006\u00109\u001a\u00020%J\u0010\u0010H\u001a\u0002022\u0006\u00109\u001a\u00020%H\u0002J*\u00105\u001a\u00020*2\u0006\u00109\u001a\u00020%2\u0006\u0010I\u001a\u00020=2\u0006\u0010J\u001a\u00020;H\u0002ø\u0001\u0000¢\u0006\u0004\bK\u0010LJh\u0010M\u001a\u00020D2\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\r2\u0014\u0010\u000f\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00120\u0011\u0018\u00010\u00102\b\u0010\u0013\u001a\u0004\u0018\u00010\u0014ø\u0001\u0000¢\u0006\u0004\bN\u0010OJ\"\u0010P\u001a\u00020=2\u0006\u0010<\u001a\u00020=2\u0006\u00109\u001a\u00020%H\u0002ø\u0001\u0000¢\u0006\u0004\bQ\u0010RJ(\u0010S\u001a\u00020\u000b*\u0004\u0018\u00010*2\u0006\u0010<\u001a\u00020=2\u0006\u00109\u001a\u00020%H\u0002ø\u0001\u0000¢\u0006\u0004\bT\u0010UR\u0014\u0010\u0016\u001a\b\u0018\u00010\u0017R\u00020\u0000X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0014X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\rX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\rX\u0082\u000e¢\u0006\u0002\n\u0000R(\u0010\u001c\u001a\u0004\u0018\u00010\u001b2\b\u0010\u001a\u001a\u0004\u0018\u00010\u001b@@X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001d\u0010\u001e\"\u0004\b\u001f\u0010 R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u0018\u0010!\u001a\u00060\u0017R\u00020\u00008BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\"\u0010#R\u0010\u0010$\u001a\u0004\u0018\u00010%X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010&\u001a\u00020'X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010(R\u0010\u0010)\u001a\u0004\u0018\u00010*X\u0082\u000e¢\u0006\u0002\n\u0000R\u0013\u0010+\u001a\u0004\u0018\u00010*8F¢\u0006\u0006\u001a\u0004\b,\u0010-R\u0010\u0010.\u001a\u0004\u0018\u00010/X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\rX\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\b\u001a\u00020\tX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u00100R\u0010\u00101\u001a\u0004\u0018\u000102X\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u0010\u000f\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00120\u0011\u0018\u00010\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u001a\u001a\u00020\u0005@BX\u0082\u000e¢\u0006\b\n\u0000\"\u0004\b3\u00104R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u00105\u001a\u00020*8F¢\u0006\u0006\u001a\u0004\b6\u0010-\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006W"}, d2 = {"Landroidx/compose/foundation/text/modifiers/MultiParagraphLayoutCache;", "", "text", "Landroidx/compose/ui/text/AnnotatedString;", "style", "Landroidx/compose/ui/text/TextStyle;", "fontFamilyResolver", "Landroidx/compose/ui/text/font/FontFamily$Resolver;", "overflow", "Landroidx/compose/ui/text/style/TextOverflow;", "softWrap", "", "maxLines", "", "minLines", "placeholders", "", "Landroidx/compose/ui/text/AnnotatedString$Range;", "Landroidx/compose/ui/text/Placeholder;", "autoSize", "Landroidx/compose/foundation/text/TextAutoSize;", "(Landroidx/compose/ui/text/AnnotatedString;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/ui/text/font/FontFamily$Resolver;IZIILjava/util/List;Landroidx/compose/foundation/text/TextAutoSize;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "_textAutoSizeLayoutScope", "Landroidx/compose/foundation/text/modifiers/MultiParagraphLayoutCache$TextAutoSizeLayoutScopeImpl;", "cachedIntrinsicHeight", "cachedIntrinsicHeightInputWidth", "value", "Landroidx/compose/ui/unit/Density;", "density", "getDensity$foundation_release", "()Landroidx/compose/ui/unit/Density;", "setDensity$foundation_release", "(Landroidx/compose/ui/unit/Density;)V", "fontSizeSearchScope", "getFontSizeSearchScope", "()Landroidx/compose/foundation/text/modifiers/MultiParagraphLayoutCache$TextAutoSizeLayoutScopeImpl;", "intrinsicsLayoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "lastDensity", "Landroidx/compose/foundation/text/modifiers/InlineDensity;", "J", "layoutCache", "Landroidx/compose/ui/text/TextLayoutResult;", "layoutOrNull", "getLayoutOrNull", "()Landroidx/compose/ui/text/TextLayoutResult;", "mMinLinesConstrainer", "Landroidx/compose/foundation/text/modifiers/MinLinesConstrainer;", "I", "paragraphIntrinsics", "Landroidx/compose/ui/text/MultiParagraphIntrinsics;", "setStyle", "(Landroidx/compose/ui/text/TextStyle;)V", "textLayoutResult", "getTextLayoutResult", "intrinsicHeight", "width", "layoutDirection", "layoutText", "Landroidx/compose/ui/text/MultiParagraph;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "layoutText-R2G3SPE", "(JLandroidx/compose/ui/unit/LayoutDirection;I)Landroidx/compose/ui/text/MultiParagraph;", "layoutWithConstraints", "layoutWithConstraints-K40F9xA", "(JLandroidx/compose/ui/unit/LayoutDirection;)Z", "markDirty", "", "markStyleAffectedDirty", "maxIntrinsicWidth", "minIntrinsicWidth", "setLayoutDirection", "finalConstraints", "multiParagraph", "textLayoutResult-VKLhPVY", "(Landroidx/compose/ui/unit/LayoutDirection;JLandroidx/compose/ui/text/MultiParagraph;)Landroidx/compose/ui/text/TextLayoutResult;", "update", "update-J2qo7bo", "(Landroidx/compose/ui/text/AnnotatedString;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/ui/text/font/FontFamily$Resolver;IZIILjava/util/List;Landroidx/compose/foundation/text/TextAutoSize;)V", "useMinLinesConstrainer", "useMinLinesConstrainer-Oh53vG4", "(JLandroidx/compose/ui/unit/LayoutDirection;)J", "newLayoutWillBeDifferent", "newLayoutWillBeDifferent-VKLhPVY", "(Landroidx/compose/ui/text/TextLayoutResult;JLandroidx/compose/ui/unit/LayoutDirection;)Z", "TextAutoSizeLayoutScopeImpl", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class MultiParagraphLayoutCache {
    public static final int $stable = 8;
    private TextAutoSizeLayoutScopeImpl _textAutoSizeLayoutScope;
    private TextAutoSize autoSize;
    private int cachedIntrinsicHeight;
    private int cachedIntrinsicHeightInputWidth;
    private Density density;
    private FontFamily.Resolver fontFamilyResolver;
    private LayoutDirection intrinsicsLayoutDirection;
    private long lastDensity;
    private TextLayoutResult layoutCache;
    private MinLinesConstrainer mMinLinesConstrainer;
    private int maxLines;
    private int minLines;
    private int overflow;
    private MultiParagraphIntrinsics paragraphIntrinsics;
    private List<AnnotatedString.Range<Placeholder>> placeholders;
    private boolean softWrap;
    private TextStyle style;
    private AnnotatedString text;

    public /* synthetic */ MultiParagraphLayoutCache(AnnotatedString annotatedString, TextStyle textStyle, FontFamily.Resolver resolver, int i, boolean z, int i2, int i3, List list, TextAutoSize textAutoSize, DefaultConstructorMarker defaultConstructorMarker) {
        this(annotatedString, textStyle, resolver, i, z, i2, i3, list, textAutoSize);
    }

    private MultiParagraphLayoutCache(AnnotatedString text, TextStyle style, FontFamily.Resolver fontFamilyResolver, int overflow, boolean softWrap, int maxLines, int minLines, List<AnnotatedString.Range<Placeholder>> list, TextAutoSize autoSize) {
        this.text = text;
        this.fontFamilyResolver = fontFamilyResolver;
        this.overflow = overflow;
        this.softWrap = softWrap;
        this.maxLines = maxLines;
        this.minLines = minLines;
        this.placeholders = list;
        this.autoSize = autoSize;
        this.lastDensity = InlineDensity.Companion.m1662getUnspecifiedL26CHvs();
        this.style = style;
        this.cachedIntrinsicHeightInputWidth = -1;
        this.cachedIntrinsicHeight = -1;
    }

    public /* synthetic */ MultiParagraphLayoutCache(AnnotatedString annotatedString, TextStyle textStyle, FontFamily.Resolver resolver, int i, boolean z, int i2, int i3, List list, TextAutoSize textAutoSize, int i4, DefaultConstructorMarker defaultConstructorMarker) {
        this(annotatedString, textStyle, resolver, (i4 & 8) != 0 ? TextOverflow.Companion.m6808getClipgIe3tQ8() : i, (i4 & 16) != 0 ? true : z, (i4 & 32) != 0 ? Integer.MAX_VALUE : i2, (i4 & 64) != 0 ? 1 : i3, (i4 & 128) != 0 ? null : list, (i4 & 256) != 0 ? null : textAutoSize, null);
    }

    public final Density getDensity$foundation_release() {
        return this.density;
    }

    public final void setDensity$foundation_release(Density value) {
        Density localField = this.density;
        long newDensity = value != null ? InlineDensity.m1654constructorimpl(value) : InlineDensity.Companion.m1662getUnspecifiedL26CHvs();
        if (localField == null) {
            this.density = value;
            this.lastDensity = newDensity;
        } else if (value == null || !InlineDensity.m1656equalsimpl0(this.lastDensity, newDensity)) {
            this.density = value;
            this.lastDensity = newDensity;
            markDirty();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void setStyle(TextStyle value) {
        boolean newStyleHasSameLayoutAffectingAttrs = value.hasSameLayoutAffectingAttributes(this.style);
        this.style = value;
        if (!newStyleHasSameLayoutAffectingAttrs) {
            markStyleAffectedDirty();
        }
    }

    private final TextAutoSizeLayoutScopeImpl getFontSizeSearchScope() {
        if (this._textAutoSizeLayoutScope == null) {
            this._textAutoSizeLayoutScope = new TextAutoSizeLayoutScopeImpl();
        }
        TextAutoSizeLayoutScopeImpl textAutoSizeLayoutScopeImpl = this._textAutoSizeLayoutScope;
        Intrinsics.checkNotNull(textAutoSizeLayoutScopeImpl);
        return textAutoSizeLayoutScopeImpl;
    }

    public final TextLayoutResult getTextLayoutResult() {
        TextLayoutResult textLayoutResult = this.layoutCache;
        if (textLayoutResult != null) {
            return textLayoutResult;
        }
        throw new IllegalStateException("You must call layoutWithConstraints first");
    }

    public final TextLayoutResult getLayoutOrNull() {
        return this.layoutCache;
    }

    /* renamed from: layoutWithConstraints-K40F9xA  reason: not valid java name */
    public final boolean m1677layoutWithConstraintsK40F9xA(long constraints, LayoutDirection layoutDirection) {
        long finalConstraints;
        if (this.minLines > 1) {
            finalConstraints = m1676useMinLinesConstrainerOh53vG4(constraints, layoutDirection);
        } else {
            finalConstraints = constraints;
        }
        if (!m1674newLayoutWillBeDifferentVKLhPVY(this.layoutCache, finalConstraints, layoutDirection)) {
            TextLayoutResult textLayoutResult = this.layoutCache;
            Intrinsics.checkNotNull(textLayoutResult);
            if (Constraints.m6819equalsimpl0(finalConstraints, textLayoutResult.getLayoutInput().m6305getConstraintsmsEJaDk())) {
                return false;
            }
            TextLayoutResult textLayoutResult2 = this.layoutCache;
            Intrinsics.checkNotNull(textLayoutResult2);
            this.layoutCache = m1675textLayoutResultVKLhPVY(layoutDirection, finalConstraints, textLayoutResult2.getMultiParagraph());
            return true;
        }
        if (this.autoSize != null) {
            this.intrinsicsLayoutDirection = layoutDirection;
            long fontSizeBeforeLayout = this.style.m6370getFontSizeXSAIIZE();
            TextAutoSize $this$layoutWithConstraints_K40F9xA_u24lambda_u242 = this.autoSize;
            Intrinsics.checkNotNull($this$layoutWithConstraints_K40F9xA_u24lambda_u242);
            TextAutoSizeLayoutScopeImpl $this$layoutWithConstraints_K40F9xA_u24lambda_u242_u24lambda_u241 = getFontSizeSearchScope();
            long autoSizeFontSize = $this$layoutWithConstraints_K40F9xA_u24lambda_u242.mo1290getFontSizeCi0_558($this$layoutWithConstraints_K40F9xA_u24lambda_u242_u24lambda_u241, constraints, this.text);
            if (TextUnit.m7069isEmimpl(autoSizeFontSize)) {
                autoSizeFontSize = MultiParagraphLayoutCacheKt.m1681timesNB67dxo(fontSizeBeforeLayout, autoSizeFontSize);
            }
            TextLayoutResult autoSizeLayoutCache = getFontSizeSearchScope().getLastLayoutResult();
            if (autoSizeLayoutCache == null || !TextUnit.m7064equalsimpl0(autoSizeFontSize, autoSizeLayoutCache.getLayoutInput().getStyle().m6370getFontSizeXSAIIZE()) || !TextOverflow.m6799equalsimpl0(autoSizeLayoutCache.getLayoutInput().m6306getOverflowgIe3tQ8(), this.overflow)) {
                long optimalFontSize = autoSizeFontSize;
                setStyle(TextStyle.m6352copyp1EtxEg$default(this.style, 0L, optimalFontSize, null, null, null, null, null, 0L, null, null, null, 0L, null, null, null, 0, 0, 0L, null, null, null, 0, 0, null, 16777213, null));
            } else {
                this.layoutCache = autoSizeLayoutCache;
                return true;
            }
        }
        MultiParagraph multiParagraph = m1673layoutTextR2G3SPE$default(this, finalConstraints, layoutDirection, 0, 4, null);
        this.layoutCache = m1675textLayoutResultVKLhPVY(layoutDirection, finalConstraints, multiParagraph);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: useMinLinesConstrainer-Oh53vG4  reason: not valid java name */
    public final long m1676useMinLinesConstrainerOh53vG4(long constraints, LayoutDirection layoutDirection) {
        MinLinesConstrainer.Companion companion = MinLinesConstrainer.Companion;
        MinLinesConstrainer minLinesConstrainer = this.mMinLinesConstrainer;
        TextStyle textStyle = this.style;
        Density density = this.density;
        Intrinsics.checkNotNull(density);
        MinLinesConstrainer localMin = companion.from(minLinesConstrainer, layoutDirection, textStyle, density, this.fontFamilyResolver);
        this.mMinLinesConstrainer = localMin;
        return localMin.m1667coerceMinLinesOh53vG4$foundation_release(constraints, this.minLines);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: textLayoutResult-VKLhPVY  reason: not valid java name */
    public final TextLayoutResult m1675textLayoutResultVKLhPVY(LayoutDirection layoutDirection, long finalConstraints, MultiParagraph multiParagraph) {
        float layoutWidth = Math.min(multiParagraph.getIntrinsics().getMaxIntrinsicWidth(), multiParagraph.getWidth());
        AnnotatedString annotatedString = this.text;
        TextStyle textStyle = this.style;
        List<AnnotatedString.Range<Placeholder>> list = this.placeholders;
        if (list == null) {
            list = CollectionsKt.emptyList();
        }
        int i = this.maxLines;
        boolean z = this.softWrap;
        int i2 = this.overflow;
        Density density = this.density;
        Intrinsics.checkNotNull(density);
        TextLayoutInput textLayoutInput = new TextLayoutInput(annotatedString, textStyle, list, i, z, i2, density, layoutDirection, this.fontFamilyResolver, finalConstraints, (DefaultConstructorMarker) null);
        int width$iv = TextDelegateKt.ceilToIntPx(layoutWidth);
        int height$iv = TextDelegateKt.ceilToIntPx(multiParagraph.getHeight());
        return new TextLayoutResult(textLayoutInput, multiParagraph, ConstraintsKt.m6840constrain4WqzIAM(finalConstraints, IntSize.m7039constructorimpl((width$iv << 32) | (height$iv & 4294967295L))), null);
    }

    public final int intrinsicHeight(int width, LayoutDirection layoutDirection) {
        long j;
        int localWidth = this.cachedIntrinsicHeightInputWidth;
        int localHeght = this.cachedIntrinsicHeight;
        if (width != localWidth || localWidth == -1) {
            long constraints = ConstraintsKt.Constraints(0, width, 0, Integer.MAX_VALUE);
            if (this.minLines > 1) {
                j = m1676useMinLinesConstrainerOh53vG4(constraints, layoutDirection);
            } else {
                j = constraints;
            }
            long finalConstraints = j;
            int result = RangesKt.coerceAtLeast(TextDelegateKt.ceilToIntPx(m1673layoutTextR2G3SPE$default(this, finalConstraints, layoutDirection, 0, 4, null).getHeight()), Constraints.m6827getMinHeightimpl(finalConstraints));
            this.cachedIntrinsicHeightInputWidth = width;
            this.cachedIntrinsicHeight = result;
            return result;
        }
        return localHeght;
    }

    /* renamed from: update-J2qo7bo  reason: not valid java name */
    public final void m1678updateJ2qo7bo(AnnotatedString text, TextStyle style, FontFamily.Resolver fontFamilyResolver, int overflow, boolean softWrap, int maxLines, int minLines, List<AnnotatedString.Range<Placeholder>> list, TextAutoSize autoSize) {
        this.text = text;
        setStyle(style);
        this.fontFamilyResolver = fontFamilyResolver;
        this.overflow = overflow;
        this.softWrap = softWrap;
        this.maxLines = maxLines;
        this.minLines = minLines;
        this.placeholders = list;
        this.autoSize = autoSize;
        markDirty();
    }

    private final MultiParagraphIntrinsics setLayoutDirection(LayoutDirection layoutDirection) {
        MultiParagraphIntrinsics intrinsics;
        MultiParagraphIntrinsics localIntrinsics = this.paragraphIntrinsics;
        if (localIntrinsics == null || layoutDirection != this.intrinsicsLayoutDirection || localIntrinsics.getHasStaleResolvedFonts()) {
            this.intrinsicsLayoutDirection = layoutDirection;
            AnnotatedString annotatedString = this.text;
            TextStyle resolveDefaults = TextStyleKt.resolveDefaults(this.style, layoutDirection);
            Density density = this.density;
            Intrinsics.checkNotNull(density);
            FontFamily.Resolver resolver = this.fontFamilyResolver;
            List<AnnotatedString.Range<Placeholder>> list = this.placeholders;
            if (list == null) {
                list = CollectionsKt.emptyList();
            }
            intrinsics = new MultiParagraphIntrinsics(annotatedString, resolveDefaults, list, density, resolver);
        } else {
            intrinsics = localIntrinsics;
        }
        this.paragraphIntrinsics = intrinsics;
        return intrinsics;
    }

    /* renamed from: layoutText-R2G3SPE$default  reason: not valid java name */
    static /* synthetic */ MultiParagraph m1673layoutTextR2G3SPE$default(MultiParagraphLayoutCache multiParagraphLayoutCache, long j, LayoutDirection layoutDirection, int i, int i2, Object obj) {
        if ((i2 & 4) != 0) {
            i = multiParagraphLayoutCache.overflow;
        }
        return multiParagraphLayoutCache.m1672layoutTextR2G3SPE(j, layoutDirection, i);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: layoutText-R2G3SPE  reason: not valid java name */
    public final MultiParagraph m1672layoutTextR2G3SPE(long constraints, LayoutDirection layoutDirection, int overflow) {
        MultiParagraphIntrinsics localParagraphIntrinsics = setLayoutDirection(layoutDirection);
        return new MultiParagraph(localParagraphIntrinsics, LayoutUtilsKt.m1663finalConstraintstfFHcEY(constraints, this.softWrap, overflow, localParagraphIntrinsics.getMaxIntrinsicWidth()), LayoutUtilsKt.m1664finalMaxLinesxdlQI24(this.softWrap, overflow, this.maxLines), overflow, (DefaultConstructorMarker) null);
    }

    /* renamed from: newLayoutWillBeDifferent-VKLhPVY  reason: not valid java name */
    private final boolean m1674newLayoutWillBeDifferentVKLhPVY(TextLayoutResult $this$newLayoutWillBeDifferent_u2dVKLhPVY, long constraints, LayoutDirection layoutDirection) {
        if ($this$newLayoutWillBeDifferent_u2dVKLhPVY == null || $this$newLayoutWillBeDifferent_u2dVKLhPVY.getMultiParagraph().getIntrinsics().getHasStaleResolvedFonts() || layoutDirection != $this$newLayoutWillBeDifferent_u2dVKLhPVY.getLayoutInput().getLayoutDirection()) {
            return true;
        }
        if (Constraints.m6819equalsimpl0(constraints, $this$newLayoutWillBeDifferent_u2dVKLhPVY.getLayoutInput().m6305getConstraintsmsEJaDk())) {
            return false;
        }
        return Constraints.m6826getMaxWidthimpl(constraints) != Constraints.m6826getMaxWidthimpl($this$newLayoutWillBeDifferent_u2dVKLhPVY.getLayoutInput().m6305getConstraintsmsEJaDk()) || ((float) Constraints.m6825getMaxHeightimpl(constraints)) < $this$newLayoutWillBeDifferent_u2dVKLhPVY.getMultiParagraph().getHeight() || $this$newLayoutWillBeDifferent_u2dVKLhPVY.getMultiParagraph().getDidExceedMaxLines();
    }

    private final void markDirty() {
        this.paragraphIntrinsics = null;
        this.layoutCache = null;
        this.cachedIntrinsicHeight = -1;
        this.cachedIntrinsicHeightInputWidth = -1;
        this._textAutoSizeLayoutScope = null;
    }

    private final void markStyleAffectedDirty() {
        this.paragraphIntrinsics = null;
        this.layoutCache = null;
        this.cachedIntrinsicHeight = -1;
        this.cachedIntrinsicHeightInputWidth = -1;
    }

    public final int maxIntrinsicWidth(LayoutDirection layoutDirection) {
        return TextDelegateKt.ceilToIntPx(setLayoutDirection(layoutDirection).getMaxIntrinsicWidth());
    }

    public final int minIntrinsicWidth(LayoutDirection layoutDirection) {
        return TextDelegateKt.ceilToIntPx(setLayoutDirection(layoutDirection).getMinIntrinsicWidth());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: MultiParagraphLayoutCache.kt */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0082\u0004\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J*\u0010\u000e\u001a\u00020\n2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u0016ø\u0001\u0000¢\u0006\u0004\b\u0015\u0010\u0016J\u0016\u0010\u0017\u001a\u00020\u0004*\u00020\u0014H\u0016ø\u0001\u0000¢\u0006\u0004\b\u0018\u0010\u0019R\u0014\u0010\u0003\u001a\u00020\u00048VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0005\u0010\u0006R\u0014\u0010\u0007\u001a\u00020\u00048VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\b\u0010\u0006R\"\u0010\u000b\u001a\u0004\u0018\u00010\n2\b\u0010\t\u001a\u0004\u0018\u00010\n@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u001a"}, d2 = {"Landroidx/compose/foundation/text/modifiers/MultiParagraphLayoutCache$TextAutoSizeLayoutScopeImpl;", "Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;", "(Landroidx/compose/foundation/text/modifiers/MultiParagraphLayoutCache;)V", "density", "", "getDensity", "()F", "fontScale", "getFontScale", "<set-?>", "Landroidx/compose/ui/text/TextLayoutResult;", "lastLayoutResult", "getLastLayoutResult", "()Landroidx/compose/ui/text/TextLayoutResult;", "performLayout", "constraints", "Landroidx/compose/ui/unit/Constraints;", "text", "Landroidx/compose/ui/text/AnnotatedString;", "fontSize", "Landroidx/compose/ui/unit/TextUnit;", "performLayout-5ZSfY2I", "(JLandroidx/compose/ui/text/AnnotatedString;J)Landroidx/compose/ui/text/TextLayoutResult;", "toPx", "toPx--R2X_6o", "(J)F", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public final class TextAutoSizeLayoutScopeImpl implements TextAutoSizeLayoutScope {
        private TextLayoutResult lastLayoutResult;

        public TextAutoSizeLayoutScopeImpl() {
        }

        @Override // androidx.compose.ui.unit.Density
        public float getDensity() {
            Density density$foundation_release = MultiParagraphLayoutCache.this.getDensity$foundation_release();
            Intrinsics.checkNotNull(density$foundation_release);
            return density$foundation_release.getDensity();
        }

        @Override // androidx.compose.ui.unit.FontScaling
        public float getFontScale() {
            Density density$foundation_release = MultiParagraphLayoutCache.this.getDensity$foundation_release();
            Intrinsics.checkNotNull(density$foundation_release);
            return density$foundation_release.getFontScale();
        }

        public final TextLayoutResult getLastLayoutResult() {
            return this.lastLayoutResult;
        }

        @Override // androidx.compose.foundation.text.modifiers.TextAutoSizeLayoutScope
        /* renamed from: performLayout-5ZSfY2I  reason: not valid java name */
        public TextLayoutResult mo1679performLayout5ZSfY2I(long constraints, AnnotatedString text, long fontSize) {
            long j;
            long layoutConstraints;
            TextStyle styleBeforeLayout = MultiParagraphLayoutCache.this.style;
            if (TextUnit.m7069isEmimpl(fontSize)) {
                j = MultiParagraphLayoutCacheKt.m1681timesNB67dxo(MultiParagraphLayoutCache.this.style.m6370getFontSizeXSAIIZE(), fontSize);
            } else {
                j = fontSize;
            }
            long scaledFontSize = j;
            if (!TextUnit.m7064equalsimpl0(scaledFontSize, MultiParagraphLayoutCache.this.style.m6370getFontSizeXSAIIZE())) {
                MultiParagraphLayoutCache.this.setStyle(TextStyle.m6352copyp1EtxEg$default(MultiParagraphLayoutCache.this.style, 0L, scaledFontSize, null, null, null, null, null, 0L, null, null, null, 0L, null, null, null, 0, 0, 0L, null, null, null, 0, 0, null, 16777213, null));
            }
            if (MultiParagraphLayoutCache.this.minLines > 1) {
                MultiParagraphLayoutCache multiParagraphLayoutCache = MultiParagraphLayoutCache.this;
                LayoutDirection layoutDirection = MultiParagraphLayoutCache.this.intrinsicsLayoutDirection;
                Intrinsics.checkNotNull(layoutDirection);
                layoutConstraints = multiParagraphLayoutCache.m1676useMinLinesConstrainerOh53vG4(constraints, layoutDirection);
            } else {
                layoutConstraints = constraints;
            }
            MultiParagraphLayoutCache multiParagraphLayoutCache2 = MultiParagraphLayoutCache.this;
            LayoutDirection layoutDirection2 = MultiParagraphLayoutCache.this.intrinsicsLayoutDirection;
            Intrinsics.checkNotNull(layoutDirection2);
            MultiParagraph multiParagraph = multiParagraphLayoutCache2.m1672layoutTextR2G3SPE(layoutConstraints, layoutDirection2, TextOverflow.Companion.m6808getClipgIe3tQ8());
            MultiParagraphLayoutCache multiParagraphLayoutCache3 = MultiParagraphLayoutCache.this;
            LayoutDirection layoutDirection3 = MultiParagraphLayoutCache.this.intrinsicsLayoutDirection;
            Intrinsics.checkNotNull(layoutDirection3);
            TextLayoutResult layoutResult = multiParagraphLayoutCache3.m1675textLayoutResultVKLhPVY(layoutDirection3, layoutConstraints, multiParagraph);
            this.lastLayoutResult = layoutResult;
            MultiParagraphLayoutCache.this.setStyle(styleBeforeLayout);
            return layoutResult;
        }

        @Override // androidx.compose.ui.unit.Density
        /* renamed from: toPx--R2X_6o */
        public float mo643toPxR2X_6o(long $this$toPx_u2d_u2dR2X_6o) {
            if (TextUnit.m7069isEmimpl($this$toPx_u2d_u2dR2X_6o)) {
                if (!TextUnit.m7069isEmimpl(MultiParagraphLayoutCache.this.style.m6370getFontSizeXSAIIZE())) {
                    if (!TextUnit.m7064equalsimpl0(MultiParagraphLayoutCache.this.style.m6370getFontSizeXSAIIZE(), TextUnit.Companion.m7078getUnspecifiedXSAIIZE())) {
                        return mo643toPxR2X_6o(MultiParagraphLayoutCache.this.style.m6370getFontSizeXSAIIZE()) * TextUnit.m7067getValueimpl($this$toPx_u2d_u2dR2X_6o);
                    }
                    throw new IllegalStateException("InternalAutoSize -> toPx(): Cannot convert Em to Px when style.fontSize is not set. Please specify a font size.".toString());
                }
                throw new IllegalStateException("InternalAutoSize -> toPx(): Cannot convert Em to Px when style.fontSize is Em\nDeclare the composable's style.fontSize with Sp units instead.".toString());
            }
            return mo644toPx0680j_4(mo639toDpGaN1DYA($this$toPx_u2d_u2dR2X_6o));
        }
    }
}
