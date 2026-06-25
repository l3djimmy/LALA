package androidx.compose.foundation.text.modifiers;

import androidx.compose.foundation.internal.InlineClassHelperKt;
import androidx.compose.foundation.text.modifiers.TextStringSimpleNode;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.Brush;
import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.ColorProducer;
import androidx.compose.ui.graphics.Shadow;
import androidx.compose.ui.graphics.drawscope.ContentDrawScope;
import androidx.compose.ui.graphics.drawscope.DrawStyle;
import androidx.compose.ui.graphics.drawscope.Fill;
import androidx.compose.ui.layout.AlignmentLine;
import androidx.compose.ui.layout.AlignmentLineKt;
import androidx.compose.ui.layout.HorizontalAlignmentLine;
import androidx.compose.ui.layout.IntrinsicMeasurable;
import androidx.compose.ui.layout.IntrinsicMeasureScope;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.node.DrawModifierNode;
import androidx.compose.ui.node.DrawModifierNodeKt;
import androidx.compose.ui.node.LayoutModifierNode;
import androidx.compose.ui.node.LayoutModifierNodeKt;
import androidx.compose.ui.node.SemanticsModifierNode;
import androidx.compose.ui.node.SemanticsModifierNodeKt;
import androidx.compose.ui.semantics.SemanticsPropertiesKt;
import androidx.compose.ui.semantics.SemanticsPropertyReceiver;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.Paragraph;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.text.style.TextOverflow;
import androidx.compose.ui.unit.Constraints;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: TextStringSimpleNode.kt */
@Metadata(d1 = {"\u0000¦\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0000\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004:\u0001OBQ\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\n\u0012\b\b\u0002\u0010\u000b\u001a\u00020\f\u0012\b\b\u0002\u0010\r\u001a\u00020\u000e\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u0010\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u0010\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0013¢\u0006\u0002\u0010\u0014J\b\u0010)\u001a\u00020*H\u0002J\u001e\u0010+\u001a\u00020*2\u0006\u0010,\u001a\u00020\u000e2\u0006\u0010-\u001a\u00020\u000e2\u0006\u0010.\u001a\u00020\u000eJ\r\u0010\u001d\u001a\u00020\u0016H\u0003¢\u0006\u0002\b/J\b\u00100\u001a\u00020*H\u0002J\u0010\u00101\u001a\u00020\u000e2\u0006\u00102\u001a\u00020\u0006H\u0002J\u0018\u00103\u001a\u00020\u000e2\b\u00104\u001a\u0004\u0018\u00010\u00132\u0006\u0010\u0007\u001a\u00020\bJ@\u00105\u001a\u00020\u000e2\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\fø\u0001\u0000¢\u0006\u0004\b6\u00107J\u000e\u00108\u001a\u00020\u000e2\u0006\u0010\u0005\u001a\u00020\u0006J\f\u00109\u001a\u00020**\u00020:H\u0016J\f\u0010;\u001a\u00020**\u00020<H\u0016J\f\u0010=\u001a\u00020\u0016*\u00020>H\u0002J\u001c\u0010?\u001a\u00020\u0010*\u00020>2\u0006\u0010@\u001a\u00020A2\u0006\u0010B\u001a\u00020\u0010H\u0016J\u001c\u0010C\u001a\u00020\u0010*\u00020>2\u0006\u0010@\u001a\u00020A2\u0006\u0010D\u001a\u00020\u0010H\u0016J&\u0010E\u001a\u00020F*\u00020G2\u0006\u0010@\u001a\u00020H2\u0006\u0010I\u001a\u00020JH\u0016ø\u0001\u0000¢\u0006\u0004\bK\u0010LJ\u001c\u0010M\u001a\u00020\u0010*\u00020>2\u0006\u0010@\u001a\u00020A2\u0006\u0010B\u001a\u00020\u0010H\u0016J\u001c\u0010N\u001a\u00020\u0010*\u00020>2\u0006\u0010@\u001a\u00020A2\u0006\u0010D\u001a\u00020\u0010H\u0016R\u0010\u0010\u0015\u001a\u0004\u0018\u00010\u0016X\u0082\u000e¢\u0006\u0002\n\u0000R\"\u0010\u0017\u001a\u0010\u0012\u0004\u0012\u00020\u0019\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u0018X\u0082\u000e¢\u0006\b\n\u0000\u0012\u0004\b\u001a\u0010\u001bR\u000e\u0010\t\u001a\u00020\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u001c\u001a\u00020\u00168BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u001d\u0010\u001eR\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\u000b\u001a\u00020\fX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u001fR\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u0013X\u0082\u000e¢\u0006\u0002\n\u0000R\"\u0010 \u001a\u0016\u0012\n\u0012\b\u0012\u0004\u0012\u00020#0\"\u0012\u0004\u0012\u00020\u000e\u0018\u00010!X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010$\u001a\u00020\u000e8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b%\u0010&R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010'\u001a\u0004\u0018\u00010(X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006P"}, d2 = {"Landroidx/compose/foundation/text/modifiers/TextStringSimpleNode;", "Landroidx/compose/ui/Modifier$Node;", "Landroidx/compose/ui/node/LayoutModifierNode;", "Landroidx/compose/ui/node/DrawModifierNode;", "Landroidx/compose/ui/node/SemanticsModifierNode;", "text", "", "style", "Landroidx/compose/ui/text/TextStyle;", "fontFamilyResolver", "Landroidx/compose/ui/text/font/FontFamily$Resolver;", "overflow", "Landroidx/compose/ui/text/style/TextOverflow;", "softWrap", "", "maxLines", "", "minLines", "overrideColor", "Landroidx/compose/ui/graphics/ColorProducer;", "(Ljava/lang/String;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/ui/text/font/FontFamily$Resolver;IZIILandroidx/compose/ui/graphics/ColorProducer;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "_layoutCache", "Landroidx/compose/foundation/text/modifiers/ParagraphLayoutCache;", "baselineCache", "", "Landroidx/compose/ui/layout/AlignmentLine;", "getBaselineCache$annotations", "()V", "layoutCache", "getLayoutCache", "()Landroidx/compose/foundation/text/modifiers/ParagraphLayoutCache;", "I", "semanticsTextLayoutResult", "Lkotlin/Function1;", "", "Landroidx/compose/ui/text/TextLayoutResult;", "shouldAutoInvalidate", "getShouldAutoInvalidate", "()Z", "textSubstitution", "Landroidx/compose/foundation/text/modifiers/TextStringSimpleNode$TextSubstitutionValue;", "clearSubstitution", "", "doInvalidations", "drawChanged", "textChanged", "layoutChanged", "getLayoutCacheOrSubstitute", "invalidateForTranslate", "setSubstitution", "updatedText", "updateDraw", TypedValues.Custom.S_COLOR, "updateLayoutRelatedArgs", "updateLayoutRelatedArgs-HuAbxIM", "(Landroidx/compose/ui/text/TextStyle;IIZLandroidx/compose/ui/text/font/FontFamily$Resolver;I)Z", "updateText", "applySemantics", "Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;", "draw", "Landroidx/compose/ui/graphics/drawscope/ContentDrawScope;", "getLayoutCacheForMeasure", "Landroidx/compose/ui/layout/IntrinsicMeasureScope;", "maxIntrinsicHeight", "measurable", "Landroidx/compose/ui/layout/IntrinsicMeasurable;", "width", "maxIntrinsicWidth", "height", "measure", "Landroidx/compose/ui/layout/MeasureResult;", "Landroidx/compose/ui/layout/MeasureScope;", "Landroidx/compose/ui/layout/Measurable;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "measure-3p2s80s", "(Landroidx/compose/ui/layout/MeasureScope;Landroidx/compose/ui/layout/Measurable;J)Landroidx/compose/ui/layout/MeasureResult;", "minIntrinsicHeight", "minIntrinsicWidth", "TextSubstitutionValue", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextStringSimpleNode extends Modifier.Node implements LayoutModifierNode, DrawModifierNode, SemanticsModifierNode {
    public static final int $stable = 8;
    private ParagraphLayoutCache _layoutCache;
    private Map<AlignmentLine, Integer> baselineCache;
    private FontFamily.Resolver fontFamilyResolver;
    private int maxLines;
    private int minLines;
    private int overflow;
    private ColorProducer overrideColor;
    private Function1<? super List<TextLayoutResult>, Boolean> semanticsTextLayoutResult;
    private boolean softWrap;
    private TextStyle style;
    private String text;
    private TextSubstitutionValue textSubstitution;

    public /* synthetic */ TextStringSimpleNode(String str, TextStyle textStyle, FontFamily.Resolver resolver, int i, boolean z, int i2, int i3, ColorProducer colorProducer, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, textStyle, resolver, i, z, i2, i3, colorProducer);
    }

    private static /* synthetic */ void getBaselineCache$annotations() {
    }

    public /* synthetic */ TextStringSimpleNode(String str, TextStyle textStyle, FontFamily.Resolver resolver, int i, boolean z, int i2, int i3, ColorProducer colorProducer, int i4, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, textStyle, resolver, (i4 & 8) != 0 ? TextOverflow.Companion.m6808getClipgIe3tQ8() : i, (i4 & 16) != 0 ? true : z, (i4 & 32) != 0 ? Integer.MAX_VALUE : i2, (i4 & 64) != 0 ? 1 : i3, (i4 & 128) != 0 ? null : colorProducer, null);
    }

    private TextStringSimpleNode(String text, TextStyle style, FontFamily.Resolver fontFamilyResolver, int overflow, boolean softWrap, int maxLines, int minLines, ColorProducer overrideColor) {
        this.text = text;
        this.style = style;
        this.fontFamilyResolver = fontFamilyResolver;
        this.overflow = overflow;
        this.softWrap = softWrap;
        this.maxLines = maxLines;
        this.minLines = minLines;
        this.overrideColor = overrideColor;
    }

    @Override // androidx.compose.ui.Modifier.Node
    public boolean getShouldAutoInvalidate() {
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final ParagraphLayoutCache getLayoutCache() {
        if (this._layoutCache == null) {
            this._layoutCache = new ParagraphLayoutCache(this.text, this.style, this.fontFamilyResolver, this.overflow, this.softWrap, this.maxLines, this.minLines, null);
        }
        ParagraphLayoutCache paragraphLayoutCache = this._layoutCache;
        Intrinsics.checkNotNull(paragraphLayoutCache);
        return paragraphLayoutCache;
    }

    private final ParagraphLayoutCache getLayoutCacheForMeasure(IntrinsicMeasureScope $this$getLayoutCacheForMeasure) {
        ParagraphLayoutCache activeCache = getLayoutCacheOrSubstitute();
        activeCache.setDensity$foundation_release($this$getLayoutCacheForMeasure);
        return activeCache;
    }

    private final ParagraphLayoutCache getLayoutCacheOrSubstitute() {
        ParagraphLayoutCache layoutCache;
        TextSubstitutionValue it = this.textSubstitution;
        if (it != null) {
            if (!it.isShowingSubstitution()) {
                it = null;
            }
            if (it != null && (layoutCache = it.getLayoutCache()) != null) {
                return layoutCache;
            }
        }
        return getLayoutCache();
    }

    public final boolean updateDraw(ColorProducer color, TextStyle style) {
        boolean changed = false;
        if (!Intrinsics.areEqual(color, this.overrideColor)) {
            changed = true;
        }
        this.overrideColor = color;
        return changed || !style.hasSameDrawAffectingAttributes(this.style);
    }

    public final boolean updateText(String text) {
        if (Intrinsics.areEqual(this.text, text)) {
            return false;
        }
        this.text = text;
        clearSubstitution();
        return true;
    }

    /* renamed from: updateLayoutRelatedArgs-HuAbxIM  reason: not valid java name */
    public final boolean m1696updateLayoutRelatedArgsHuAbxIM(TextStyle style, int minLines, int maxLines, boolean softWrap, FontFamily.Resolver fontFamilyResolver, int overflow) {
        boolean changed = !this.style.hasSameLayoutAffectingAttributes(style);
        this.style = style;
        if (this.minLines != minLines) {
            this.minLines = minLines;
            changed = true;
        }
        if (this.maxLines != maxLines) {
            this.maxLines = maxLines;
            changed = true;
        }
        if (this.softWrap != softWrap) {
            this.softWrap = softWrap;
            changed = true;
        }
        if (!Intrinsics.areEqual(this.fontFamilyResolver, fontFamilyResolver)) {
            this.fontFamilyResolver = fontFamilyResolver;
            changed = true;
        }
        if (!TextOverflow.m6799equalsimpl0(this.overflow, overflow)) {
            this.overflow = overflow;
            return true;
        }
        return changed;
    }

    public final void doInvalidations(boolean drawChanged, boolean textChanged, boolean layoutChanged) {
        if (textChanged || layoutChanged) {
            getLayoutCache().m1689updateL6sJoHM(this.text, this.style, this.fontFamilyResolver, this.overflow, this.softWrap, this.maxLines, this.minLines);
        }
        if (!isAttached()) {
            return;
        }
        if (textChanged || (drawChanged && this.semanticsTextLayoutResult != null)) {
            SemanticsModifierNodeKt.invalidateSemantics(this);
        }
        if (textChanged || layoutChanged) {
            LayoutModifierNodeKt.invalidateMeasurement(this);
            DrawModifierNodeKt.invalidateDraw(this);
        }
        if (drawChanged) {
            DrawModifierNodeKt.invalidateDraw(this);
        }
    }

    /* compiled from: TextStringSimpleNode.kt */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0015\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\u0002\u0010\tJ\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0018\u001a\u00020\u0006HÆ\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\bHÆ\u0003J3\u0010\u001a\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\bHÆ\u0001J\u0013\u0010\u001b\u001a\u00020\u00062\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u001eHÖ\u0001J\b\u0010\u001f\u001a\u00020\u0003H\u0016R\u001a\u0010\u0005\u001a\u00020\u0006X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\n\"\u0004\b\u000b\u0010\fR\u001c\u0010\u0007\u001a\u0004\u0018\u00010\bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u001a\u0010\u0004\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0013\u0010\u0012\"\u0004\b\u0014\u0010\u0015¨\u0006 "}, d2 = {"Landroidx/compose/foundation/text/modifiers/TextStringSimpleNode$TextSubstitutionValue;", "", "original", "", "substitution", "isShowingSubstitution", "", "layoutCache", "Landroidx/compose/foundation/text/modifiers/ParagraphLayoutCache;", "(Ljava/lang/String;Ljava/lang/String;ZLandroidx/compose/foundation/text/modifiers/ParagraphLayoutCache;)V", "()Z", "setShowingSubstitution", "(Z)V", "getLayoutCache", "()Landroidx/compose/foundation/text/modifiers/ParagraphLayoutCache;", "setLayoutCache", "(Landroidx/compose/foundation/text/modifiers/ParagraphLayoutCache;)V", "getOriginal", "()Ljava/lang/String;", "getSubstitution", "setSubstitution", "(Ljava/lang/String;)V", "component1", "component2", "component3", "component4", "copy", "equals", "other", "hashCode", "", "toString", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class TextSubstitutionValue {
        public static final int $stable = 8;
        private boolean isShowingSubstitution;
        private ParagraphLayoutCache layoutCache;
        private final String original;
        private String substitution;

        public static /* synthetic */ TextSubstitutionValue copy$default(TextSubstitutionValue textSubstitutionValue, String str, String str2, boolean z, ParagraphLayoutCache paragraphLayoutCache, int i, Object obj) {
            if ((i & 1) != 0) {
                str = textSubstitutionValue.original;
            }
            if ((i & 2) != 0) {
                str2 = textSubstitutionValue.substitution;
            }
            if ((i & 4) != 0) {
                z = textSubstitutionValue.isShowingSubstitution;
            }
            if ((i & 8) != 0) {
                paragraphLayoutCache = textSubstitutionValue.layoutCache;
            }
            return textSubstitutionValue.copy(str, str2, z, paragraphLayoutCache);
        }

        public final String component1() {
            return this.original;
        }

        public final String component2() {
            return this.substitution;
        }

        public final boolean component3() {
            return this.isShowingSubstitution;
        }

        public final ParagraphLayoutCache component4() {
            return this.layoutCache;
        }

        public final TextSubstitutionValue copy(String str, String str2, boolean z, ParagraphLayoutCache paragraphLayoutCache) {
            return new TextSubstitutionValue(str, str2, z, paragraphLayoutCache);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj instanceof TextSubstitutionValue) {
                TextSubstitutionValue textSubstitutionValue = (TextSubstitutionValue) obj;
                return Intrinsics.areEqual(this.original, textSubstitutionValue.original) && Intrinsics.areEqual(this.substitution, textSubstitutionValue.substitution) && this.isShowingSubstitution == textSubstitutionValue.isShowingSubstitution && Intrinsics.areEqual(this.layoutCache, textSubstitutionValue.layoutCache);
            }
            return false;
        }

        public int hashCode() {
            return (((((this.original.hashCode() * 31) + this.substitution.hashCode()) * 31) + Boolean.hashCode(this.isShowingSubstitution)) * 31) + (this.layoutCache == null ? 0 : this.layoutCache.hashCode());
        }

        public TextSubstitutionValue(String original, String substitution, boolean isShowingSubstitution, ParagraphLayoutCache layoutCache) {
            this.original = original;
            this.substitution = substitution;
            this.isShowingSubstitution = isShowingSubstitution;
            this.layoutCache = layoutCache;
        }

        public /* synthetic */ TextSubstitutionValue(String str, String str2, boolean z, ParagraphLayoutCache paragraphLayoutCache, int i, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, str2, (i & 4) != 0 ? false : z, (i & 8) != 0 ? null : paragraphLayoutCache);
        }

        public final String getOriginal() {
            return this.original;
        }

        public final String getSubstitution() {
            return this.substitution;
        }

        public final void setSubstitution(String str) {
            this.substitution = str;
        }

        public final boolean isShowingSubstitution() {
            return this.isShowingSubstitution;
        }

        public final void setShowingSubstitution(boolean z) {
            this.isShowingSubstitution = z;
        }

        public final ParagraphLayoutCache getLayoutCache() {
            return this.layoutCache;
        }

        public final void setLayoutCache(ParagraphLayoutCache paragraphLayoutCache) {
            this.layoutCache = paragraphLayoutCache;
        }

        public String toString() {
            return "TextSubstitution(layoutCache=" + this.layoutCache + ", isShowingSubstitution=" + this.isShowingSubstitution + ')';
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean setSubstitution(String updatedText) {
        Unit unit;
        TextSubstitutionValue currentTextSubstitution = this.textSubstitution;
        if (currentTextSubstitution != null) {
            if (Intrinsics.areEqual(updatedText, currentTextSubstitution.getSubstitution())) {
                return false;
            }
            currentTextSubstitution.setSubstitution(updatedText);
            ParagraphLayoutCache layoutCache = currentTextSubstitution.getLayoutCache();
            if (layoutCache != null) {
                layoutCache.m1689updateL6sJoHM(updatedText, this.style, this.fontFamilyResolver, this.overflow, this.softWrap, this.maxLines, this.minLines);
                unit = Unit.INSTANCE;
            } else {
                unit = null;
            }
            return unit != null;
        }
        TextSubstitutionValue newTextSubstitution = new TextSubstitutionValue(this.text, updatedText, false, null, 12, null);
        ParagraphLayoutCache substitutionLayoutCache = new ParagraphLayoutCache(updatedText, this.style, this.fontFamilyResolver, this.overflow, this.softWrap, this.maxLines, this.minLines, null);
        substitutionLayoutCache.setDensity$foundation_release(getLayoutCache().getDensity$foundation_release());
        newTextSubstitution.setLayoutCache(substitutionLayoutCache);
        this.textSubstitution = newTextSubstitution;
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void clearSubstitution() {
        this.textSubstitution = null;
    }

    @Override // androidx.compose.ui.node.SemanticsModifierNode
    public void applySemantics(SemanticsPropertyReceiver $this$applySemantics) {
        Function1 localSemanticsTextLayoutResult = this.semanticsTextLayoutResult;
        if (localSemanticsTextLayoutResult == null) {
            localSemanticsTextLayoutResult = new Function1<List<TextLayoutResult>, Boolean>() { // from class: androidx.compose.foundation.text.modifiers.TextStringSimpleNode$applySemantics$1
                /* JADX INFO: Access modifiers changed from: package-private */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final Boolean invoke(List<TextLayoutResult> list) {
                    ParagraphLayoutCache layoutCache;
                    TextStyle textStyle;
                    ColorProducer colorProducer;
                    layoutCache = TextStringSimpleNode.this.getLayoutCache();
                    textStyle = TextStringSimpleNode.this.style;
                    colorProducer = TextStringSimpleNode.this.overrideColor;
                    TextLayoutResult layout = layoutCache.slowCreateTextLayoutResultOrNull(TextStyle.m6359mergedA7vx0o$default(textStyle, colorProducer != null ? colorProducer.mo2110invoke0d7_KjU() : Color.Companion.m4325getUnspecified0d7_KjU(), 0L, null, null, null, null, null, 0L, null, null, null, 0L, null, null, null, 0, 0, 0L, null, null, 0, 0, null, null, 16777214, null));
                    if (layout != null) {
                        list.add(layout);
                    } else {
                        layout = null;
                    }
                    return Boolean.valueOf(layout != null);
                }
            };
            this.semanticsTextLayoutResult = localSemanticsTextLayoutResult;
        }
        SemanticsPropertiesKt.setText($this$applySemantics, new AnnotatedString(this.text, null, 2, null));
        TextSubstitutionValue currentTextSubstitution = this.textSubstitution;
        if (currentTextSubstitution != null) {
            SemanticsPropertiesKt.setShowingTextSubstitution($this$applySemantics, currentTextSubstitution.isShowingSubstitution());
            SemanticsPropertiesKt.setTextSubstitution($this$applySemantics, new AnnotatedString(currentTextSubstitution.getSubstitution(), null, 2, null));
        }
        SemanticsPropertiesKt.setTextSubstitution$default($this$applySemantics, null, new Function1<AnnotatedString, Boolean>() { // from class: androidx.compose.foundation.text.modifiers.TextStringSimpleNode$applySemantics$2
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(AnnotatedString updatedText) {
                TextStringSimpleNode.this.setSubstitution(updatedText.getText());
                TextStringSimpleNode.this.invalidateForTranslate();
                return true;
            }
        }, 1, null);
        SemanticsPropertiesKt.showTextSubstitution$default($this$applySemantics, null, new Function1<Boolean, Boolean>() { // from class: androidx.compose.foundation.text.modifiers.TextStringSimpleNode$applySemantics$3
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Boolean invoke(Boolean bool) {
                return invoke(bool.booleanValue());
            }

            public final Boolean invoke(boolean it) {
                TextStringSimpleNode.TextSubstitutionValue textSubstitutionValue;
                TextStringSimpleNode.TextSubstitutionValue textSubstitutionValue2;
                textSubstitutionValue = TextStringSimpleNode.this.textSubstitution;
                if (textSubstitutionValue != null) {
                    textSubstitutionValue2 = TextStringSimpleNode.this.textSubstitution;
                    if (textSubstitutionValue2 != null) {
                        textSubstitutionValue2.setShowingSubstitution(it);
                    }
                    TextStringSimpleNode.this.invalidateForTranslate();
                    return true;
                }
                return false;
            }
        }, 1, null);
        SemanticsPropertiesKt.clearTextSubstitution$default($this$applySemantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.text.modifiers.TextStringSimpleNode$applySemantics$4
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Boolean invoke() {
                TextStringSimpleNode.this.clearSubstitution();
                TextStringSimpleNode.this.invalidateForTranslate();
                return true;
            }
        }, 1, null);
        SemanticsPropertiesKt.getTextLayoutResult$default($this$applySemantics, null, localSemanticsTextLayoutResult, 1, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void invalidateForTranslate() {
        SemanticsModifierNodeKt.invalidateSemantics(this);
        LayoutModifierNodeKt.invalidateMeasurement(this);
        DrawModifierNodeKt.invalidateDraw(this);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    /* renamed from: measure-3p2s80s */
    public MeasureResult mo328measure3p2s80s(MeasureScope $this$measure_u2d3p2s80s, Measurable measurable, long constraints) {
        ParagraphLayoutCache layoutCache = getLayoutCacheForMeasure($this$measure_u2d3p2s80s);
        boolean didChangeLayout = layoutCache.m1687layoutWithConstraintsK40F9xA(constraints, $this$measure_u2d3p2s80s.getLayoutDirection());
        layoutCache.getObserveFontChanges$foundation_release();
        Paragraph paragraph = layoutCache.getParagraph$foundation_release();
        Intrinsics.checkNotNull(paragraph);
        long layoutSize = layoutCache.m1685getLayoutSizeYbymL2g$foundation_release();
        if (didChangeLayout) {
            LayoutModifierNodeKt.invalidateLayer(this);
            Map cache = this.baselineCache;
            if (cache == null) {
                cache = new HashMap(2);
                this.baselineCache = cache;
            }
            HorizontalAlignmentLine firstBaseline = AlignmentLineKt.getFirstBaseline();
            float $this$fastRoundToInt$iv = paragraph.getFirstBaseline();
            cache.put(firstBaseline, Integer.valueOf(Math.round($this$fastRoundToInt$iv)));
            HorizontalAlignmentLine lastBaseline = AlignmentLineKt.getLastBaseline();
            float $this$fastRoundToInt$iv2 = paragraph.getLastBaseline();
            cache.put(lastBaseline, Integer.valueOf(Math.round($this$fastRoundToInt$iv2)));
        }
        final Placeable placeable = measurable.mo5637measureBRTryo0(Constraints.Companion.m6835fitPrioritizingWidthZbe2FdA((int) (layoutSize >> 32), (int) (layoutSize >> 32), (int) (layoutSize & 4294967295L), (int) (layoutSize & 4294967295L)));
        int $i$f$unpackInt1 = (int) (layoutSize >> 32);
        Map<AlignmentLine, Integer> map = this.baselineCache;
        Intrinsics.checkNotNull(map);
        return $this$measure_u2d3p2s80s.layout($i$f$unpackInt1, (int) (layoutSize & 4294967295L), map, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.text.modifiers.TextStringSimpleNode$measure$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Placeable.PlacementScope placementScope) {
                invoke2(placementScope);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(Placeable.PlacementScope $this$layout) {
                Placeable.PlacementScope.place$default($this$layout, Placeable.this, 0, 0, 0.0f, 4, null);
            }
        });
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int minIntrinsicWidth(IntrinsicMeasureScope $this$minIntrinsicWidth, IntrinsicMeasurable measurable, int height) {
        return getLayoutCacheForMeasure($this$minIntrinsicWidth).minIntrinsicWidth($this$minIntrinsicWidth.getLayoutDirection());
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int minIntrinsicHeight(IntrinsicMeasureScope $this$minIntrinsicHeight, IntrinsicMeasurable measurable, int width) {
        return getLayoutCacheForMeasure($this$minIntrinsicHeight).intrinsicHeight(width, $this$minIntrinsicHeight.getLayoutDirection());
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int maxIntrinsicWidth(IntrinsicMeasureScope $this$maxIntrinsicWidth, IntrinsicMeasurable measurable, int height) {
        return getLayoutCacheForMeasure($this$maxIntrinsicWidth).maxIntrinsicWidth($this$maxIntrinsicWidth.getLayoutDirection());
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int maxIntrinsicHeight(IntrinsicMeasureScope $this$maxIntrinsicHeight, IntrinsicMeasurable measurable, int width) {
        return getLayoutCacheForMeasure($this$maxIntrinsicHeight).intrinsicHeight(width, $this$maxIntrinsicHeight.getLayoutDirection());
    }

    @Override // androidx.compose.ui.node.DrawModifierNode
    public void draw(ContentDrawScope $this$draw) {
        long color;
        if (!isAttached()) {
            return;
        }
        ParagraphLayoutCache layoutCache = getLayoutCacheOrSubstitute();
        Paragraph localParagraph = layoutCache.getParagraph$foundation_release();
        if (localParagraph != null) {
            ContentDrawScope $this$drawIntoCanvas$iv = $this$draw;
            Canvas canvas = $this$drawIntoCanvas$iv.getDrawContext().getCanvas();
            boolean willClip = layoutCache.getDidOverflow$foundation_release();
            if (willClip) {
                long arg0$iv = layoutCache.m1685getLayoutSizeYbymL2g$foundation_release();
                float width = (int) (arg0$iv >> 32);
                long arg0$iv2 = layoutCache.m1685getLayoutSizeYbymL2g$foundation_release();
                float height = (int) (4294967295L & arg0$iv2);
                canvas.save();
                Canvas.m4261clipRectN_I0leg$default(canvas, 0.0f, 0.0f, width, height, 0, 16, null);
            }
            try {
                TextDecoration textDecoration = this.style.getTextDecoration();
                if (textDecoration == null) {
                    textDecoration = TextDecoration.Companion.getNone();
                }
                TextDecoration textDecoration2 = textDecoration;
                Shadow shadow = this.style.getShadow();
                if (shadow == null) {
                    shadow = Shadow.Companion.getNone();
                }
                Shadow shadow2 = shadow;
                Fill drawStyle = this.style.getDrawStyle();
                if (drawStyle == null) {
                    drawStyle = Fill.INSTANCE;
                }
                DrawStyle drawStyle2 = drawStyle;
                Brush brush = this.style.getBrush();
                if (brush == null) {
                    ColorProducer colorProducer = this.overrideColor;
                    long $this$isSpecified$iv = colorProducer != null ? colorProducer.mo2110invoke0d7_KjU() : Color.Companion.m4325getUnspecified0d7_KjU();
                    long overrideColorVal = $this$isSpecified$iv;
                    boolean z = true;
                    if ($this$isSpecified$iv != 16) {
                        color = overrideColorVal;
                    } else {
                        if (this.style.m6369getColor0d7_KjU() == 16) {
                            z = false;
                        }
                        if (z) {
                            color = this.style.m6369getColor0d7_KjU();
                        } else {
                            color = Color.Companion.m4315getBlack0d7_KjU();
                        }
                    }
                    Paragraph.m6197paintLG529CI$default(localParagraph, canvas, color, shadow2, textDecoration2, drawStyle2, 0, 32, null);
                } else {
                    float alpha = this.style.getAlpha();
                    Paragraph.m6199painthn5TExg$default(localParagraph, canvas, brush, alpha, shadow2, textDecoration2, drawStyle2, 0, 64, null);
                }
                if (willClip) {
                    return;
                }
                return;
            } finally {
                if (willClip) {
                    canvas.restore();
                }
            }
        }
        InlineClassHelperKt.throwIllegalArgumentExceptionForNullCheck("no paragraph (layoutCache=" + this._layoutCache + ", textSubstitution=" + this.textSubstitution + ')');
        throw new KotlinNothingValueException();
    }
}
