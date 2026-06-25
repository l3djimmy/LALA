package androidx.compose.foundation.text.modifiers;

import androidx.compose.foundation.text.TextAutoSize;
import androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.geometry.RectKt;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.graphics.Brush;
import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.ColorProducer;
import androidx.compose.ui.graphics.Shadow;
import androidx.compose.ui.graphics.drawscope.ContentDrawScope;
import androidx.compose.ui.graphics.drawscope.DrawScope;
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
import androidx.compose.ui.text.MultiParagraph;
import androidx.compose.ui.text.Placeholder;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.text.style.TextOverflow;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.Density;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: TextAnnotatedStringNode.kt */
@Metadata(d1 = {"\u0000Î\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010!\n\u0002\b\u0011\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\t\b\u0000\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004:\u0001mBÑ\u0001\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0016\b\u0002\u0010\u000b\u001a\u0010\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u000e\u0018\u00010\f\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u0010\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u0012\u0012\b\b\u0002\u0010\u0013\u001a\u00020\u0014\u0012\b\b\u0002\u0010\u0015\u001a\u00020\u0014\u0012\u0016\b\u0002\u0010\u0016\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00190\u0018\u0018\u00010\u0017\u0012\u001e\b\u0002\u0010\u001a\u001a\u0018\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u001b0\u0017\u0012\u0004\u0012\u00020\u000e\u0018\u00010\f\u0012\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u001d\u0012\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u001f\u0012\n\b\u0002\u0010 \u001a\u0004\u0018\u00010!\u0012\u0016\b\u0002\u0010\"\u001a\u0010\u0012\u0004\u0012\u00020#\u0012\u0004\u0012\u00020\u000e\u0018\u00010\f¢\u0006\u0002\u0010$J\r\u0010:\u001a\u00020\u000eH\u0000¢\u0006\u0002\b;J&\u0010<\u001a\u00020\u000e2\u0006\u0010=\u001a\u00020\u00122\u0006\u0010>\u001a\u00020\u00122\u0006\u0010?\u001a\u00020\u00122\u0006\u0010@\u001a\u00020\u0012J\u000e\u0010A\u001a\u00020\u000e2\u0006\u0010B\u001a\u00020CJ\u0010\u0010-\u001a\u00020&2\u0006\u0010D\u001a\u00020EH\u0002J\b\u0010F\u001a\u00020\u000eH\u0002J\u001e\u0010G\u001a\u00020\u00142\u0006\u0010H\u001a\u00020I2\u0006\u0010J\u001a\u00020K2\u0006\u0010L\u001a\u00020\u0014J\u001e\u0010M\u001a\u00020\u00142\u0006\u0010H\u001a\u00020I2\u0006\u0010J\u001a\u00020K2\u0006\u0010N\u001a\u00020\u0014J(\u0010O\u001a\u00020P2\u0006\u0010Q\u001a\u00020R2\u0006\u0010J\u001a\u00020S2\u0006\u0010T\u001a\u00020Uø\u0001\u0000¢\u0006\u0004\bV\u0010WJ\u001e\u0010X\u001a\u00020\u00142\u0006\u0010H\u001a\u00020I2\u0006\u0010J\u001a\u00020K2\u0006\u0010L\u001a\u00020\u0014J\u001e\u0010Y\u001a\u00020\u00142\u0006\u0010H\u001a\u00020I2\u0006\u0010J\u001a\u00020K2\u0006\u0010N\u001a\u00020\u0014J\u0010\u0010Z\u001a\u00020\u00122\u0006\u0010[\u001a\u00020\u0006H\u0002JZ\u0010\\\u001a\u00020\u00122\u0014\u0010\u000b\u001a\u0010\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u000e\u0018\u00010\f2\u001c\u0010\u001a\u001a\u0018\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u001b0\u0017\u0012\u0004\u0012\u00020\u000e\u0018\u00010\f2\b\u0010\u001c\u001a\u0004\u0018\u00010\u001d2\u0014\u0010\"\u001a\u0010\u0012\u0004\u0012\u00020#\u0012\u0004\u0012\u00020\u000e\u0018\u00010\fJ\u0018\u0010]\u001a\u00020\u00122\b\u0010^\u001a\u0004\u0018\u00010\u001f2\u0006\u0010\u0007\u001a\u00020\bJ`\u0010_\u001a\u00020\u00122\u0006\u0010\u0007\u001a\u00020\b2\u0014\u0010\u0016\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00190\u0018\u0018\u00010\u00172\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000f\u001a\u00020\u00102\b\u0010 \u001a\u0004\u0018\u00010!ø\u0001\u0000¢\u0006\u0004\b`\u0010aJ\u0015\u0010b\u001a\u00020\u00122\u0006\u0010\u0005\u001a\u00020\u0006H\u0000¢\u0006\u0002\bcJ\f\u0010d\u001a\u00020\u000e*\u00020eH\u0016J\f\u0010f\u001a\u00020\u000e*\u00020CH\u0016J\u001c\u0010g\u001a\u00020\u0014*\u00020I2\u0006\u0010J\u001a\u00020K2\u0006\u0010L\u001a\u00020\u0014H\u0016J\u001c\u0010h\u001a\u00020\u0014*\u00020I2\u0006\u0010J\u001a\u00020K2\u0006\u0010N\u001a\u00020\u0014H\u0016J&\u0010i\u001a\u00020P*\u00020R2\u0006\u0010J\u001a\u00020S2\u0006\u0010T\u001a\u00020UH\u0016ø\u0001\u0000¢\u0006\u0004\bj\u0010WJ\u001c\u0010k\u001a\u00020\u0014*\u00020I2\u0006\u0010J\u001a\u00020K2\u0006\u0010L\u001a\u00020\u0014H\u0016J\u001c\u0010l\u001a\u00020\u0014*\u00020I2\u0006\u0010J\u001a\u00020K2\u0006\u0010N\u001a\u00020\u0014H\u0016R\u0010\u0010%\u001a\u0004\u0018\u00010&X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010 \u001a\u0004\u0018\u00010!X\u0082\u000e¢\u0006\u0002\n\u0000R\"\u0010'\u001a\u0010\u0012\u0004\u0012\u00020)\u0012\u0004\u0012\u00020\u0014\u0018\u00010(X\u0082\u000e¢\u0006\b\n\u0000\u0012\u0004\b*\u0010+R\u000e\u0010\t\u001a\u00020\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010,\u001a\u00020&8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b-\u0010.R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0014X\u0082\u000e¢\u0006\u0002\n\u0000R$\u0010\u001a\u001a\u0018\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u001b0\u0017\u0012\u0004\u0012\u00020\u000e\u0018\u00010\fX\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u0010\"\u001a\u0010\u0012\u0004\u0012\u00020#\u0012\u0004\u0012\u00020\u000e\u0018\u00010\fX\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u0010\u000b\u001a\u0010\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u000e\u0018\u00010\fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\u000f\u001a\u00020\u0010X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010/R\u0010\u0010\u001e\u001a\u0004\u0018\u00010\u001fX\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u0010\u0016\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00190\u0018\u0018\u00010\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u001c\u001a\u0004\u0018\u00010\u001dX\u0082\u000e¢\u0006\u0002\n\u0000R\"\u00100\u001a\u0016\u0012\n\u0012\b\u0012\u0004\u0012\u00020\r01\u0012\u0004\u0012\u00020\u0012\u0018\u00010\fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u00102\u001a\u00020\u00128VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b3\u00104R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u00105\u001a\u0004\u0018\u00010#X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b6\u00107\"\u0004\b8\u00109\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006n"}, d2 = {"Landroidx/compose/foundation/text/modifiers/TextAnnotatedStringNode;", "Landroidx/compose/ui/Modifier$Node;", "Landroidx/compose/ui/node/LayoutModifierNode;", "Landroidx/compose/ui/node/DrawModifierNode;", "Landroidx/compose/ui/node/SemanticsModifierNode;", "text", "Landroidx/compose/ui/text/AnnotatedString;", "style", "Landroidx/compose/ui/text/TextStyle;", "fontFamilyResolver", "Landroidx/compose/ui/text/font/FontFamily$Resolver;", "onTextLayout", "Lkotlin/Function1;", "Landroidx/compose/ui/text/TextLayoutResult;", "", "overflow", "Landroidx/compose/ui/text/style/TextOverflow;", "softWrap", "", "maxLines", "", "minLines", "placeholders", "", "Landroidx/compose/ui/text/AnnotatedString$Range;", "Landroidx/compose/ui/text/Placeholder;", "onPlaceholderLayout", "Landroidx/compose/ui/geometry/Rect;", "selectionController", "Landroidx/compose/foundation/text/modifiers/SelectionController;", "overrideColor", "Landroidx/compose/ui/graphics/ColorProducer;", "autoSize", "Landroidx/compose/foundation/text/TextAutoSize;", "onShowTranslation", "Landroidx/compose/foundation/text/modifiers/TextAnnotatedStringNode$TextSubstitutionValue;", "(Landroidx/compose/ui/text/AnnotatedString;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/ui/text/font/FontFamily$Resolver;Lkotlin/jvm/functions/Function1;IZIILjava/util/List;Lkotlin/jvm/functions/Function1;Landroidx/compose/foundation/text/modifiers/SelectionController;Landroidx/compose/ui/graphics/ColorProducer;Landroidx/compose/foundation/text/TextAutoSize;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "_layoutCache", "Landroidx/compose/foundation/text/modifiers/MultiParagraphLayoutCache;", "baselineCache", "", "Landroidx/compose/ui/layout/AlignmentLine;", "getBaselineCache$annotations", "()V", "layoutCache", "getLayoutCache", "()Landroidx/compose/foundation/text/modifiers/MultiParagraphLayoutCache;", "I", "semanticsTextLayoutResult", "", "shouldAutoInvalidate", "getShouldAutoInvalidate", "()Z", "textSubstitution", "getTextSubstitution$foundation_release", "()Landroidx/compose/foundation/text/modifiers/TextAnnotatedStringNode$TextSubstitutionValue;", "setTextSubstitution$foundation_release", "(Landroidx/compose/foundation/text/modifiers/TextAnnotatedStringNode$TextSubstitutionValue;)V", "clearSubstitution", "clearSubstitution$foundation_release", "doInvalidations", "drawChanged", "textChanged", "layoutChanged", "callbacksChanged", "drawNonExtension", "contentDrawScope", "Landroidx/compose/ui/graphics/drawscope/ContentDrawScope;", "density", "Landroidx/compose/ui/unit/Density;", "invalidateForTranslate", "maxIntrinsicHeightNonExtension", "intrinsicMeasureScope", "Landroidx/compose/ui/layout/IntrinsicMeasureScope;", "measurable", "Landroidx/compose/ui/layout/IntrinsicMeasurable;", "width", "maxIntrinsicWidthNonExtension", "height", "measureNonExtension", "Landroidx/compose/ui/layout/MeasureResult;", "measureScope", "Landroidx/compose/ui/layout/MeasureScope;", "Landroidx/compose/ui/layout/Measurable;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "measureNonExtension-3p2s80s", "(Landroidx/compose/ui/layout/MeasureScope;Landroidx/compose/ui/layout/Measurable;J)Landroidx/compose/ui/layout/MeasureResult;", "minIntrinsicHeightNonExtension", "minIntrinsicWidthNonExtension", "setSubstitution", "updatedText", "updateCallbacks", "updateDraw", TypedValues.Custom.S_COLOR, "updateLayoutRelatedArgs", "updateLayoutRelatedArgs-y0k-MQk", "(Landroidx/compose/ui/text/TextStyle;Ljava/util/List;IIZLandroidx/compose/ui/text/font/FontFamily$Resolver;ILandroidx/compose/foundation/text/TextAutoSize;)Z", "updateText", "updateText$foundation_release", "applySemantics", "Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;", "draw", "maxIntrinsicHeight", "maxIntrinsicWidth", "measure", "measure-3p2s80s", "minIntrinsicHeight", "minIntrinsicWidth", "TextSubstitutionValue", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextAnnotatedStringNode extends Modifier.Node implements LayoutModifierNode, DrawModifierNode, SemanticsModifierNode {
    public static final int $stable = 8;
    private MultiParagraphLayoutCache _layoutCache;
    private TextAutoSize autoSize;
    private Map<AlignmentLine, Integer> baselineCache;
    private FontFamily.Resolver fontFamilyResolver;
    private int maxLines;
    private int minLines;
    private Function1<? super List<Rect>, Unit> onPlaceholderLayout;
    private Function1<? super TextSubstitutionValue, Unit> onShowTranslation;
    private Function1<? super TextLayoutResult, Unit> onTextLayout;
    private int overflow;
    private ColorProducer overrideColor;
    private List<AnnotatedString.Range<Placeholder>> placeholders;
    private SelectionController selectionController;
    private Function1<? super List<TextLayoutResult>, Boolean> semanticsTextLayoutResult;
    private boolean softWrap;
    private TextStyle style;
    private AnnotatedString text;
    private TextSubstitutionValue textSubstitution;

    public /* synthetic */ TextAnnotatedStringNode(AnnotatedString annotatedString, TextStyle textStyle, FontFamily.Resolver resolver, Function1 function1, int i, boolean z, int i2, int i3, List list, Function1 function12, SelectionController selectionController, ColorProducer colorProducer, TextAutoSize textAutoSize, Function1 function13, DefaultConstructorMarker defaultConstructorMarker) {
        this(annotatedString, textStyle, resolver, function1, i, z, i2, i3, list, function12, selectionController, colorProducer, textAutoSize, function13);
    }

    private static /* synthetic */ void getBaselineCache$annotations() {
    }

    public /* synthetic */ TextAnnotatedStringNode(AnnotatedString annotatedString, TextStyle textStyle, FontFamily.Resolver resolver, Function1 function1, int i, boolean z, int i2, int i3, List list, Function1 function12, SelectionController selectionController, ColorProducer colorProducer, TextAutoSize textAutoSize, Function1 function13, int i4, DefaultConstructorMarker defaultConstructorMarker) {
        this(annotatedString, textStyle, resolver, (i4 & 8) != 0 ? null : function1, (i4 & 16) != 0 ? TextOverflow.Companion.m6808getClipgIe3tQ8() : i, (i4 & 32) != 0 ? true : z, (i4 & 64) != 0 ? Integer.MAX_VALUE : i2, (i4 & 128) != 0 ? 1 : i3, (i4 & 256) != 0 ? null : list, (i4 & 512) != 0 ? null : function12, (i4 & 1024) != 0 ? null : selectionController, (i4 & 2048) != 0 ? null : colorProducer, (i4 & 4096) != 0 ? null : textAutoSize, (i4 & 8192) != 0 ? null : function13, null);
    }

    private TextAnnotatedStringNode(AnnotatedString text, TextStyle style, FontFamily.Resolver fontFamilyResolver, Function1<? super TextLayoutResult, Unit> function1, int overflow, boolean softWrap, int maxLines, int minLines, List<AnnotatedString.Range<Placeholder>> list, Function1<? super List<Rect>, Unit> function12, SelectionController selectionController, ColorProducer overrideColor, TextAutoSize autoSize, Function1<? super TextSubstitutionValue, Unit> function13) {
        this.text = text;
        this.style = style;
        this.fontFamilyResolver = fontFamilyResolver;
        this.onTextLayout = function1;
        this.overflow = overflow;
        this.softWrap = softWrap;
        this.maxLines = maxLines;
        this.minLines = minLines;
        this.placeholders = list;
        this.onPlaceholderLayout = function12;
        this.selectionController = selectionController;
        this.overrideColor = overrideColor;
        this.autoSize = autoSize;
        this.onShowTranslation = function13;
    }

    @Override // androidx.compose.ui.Modifier.Node
    public boolean getShouldAutoInvalidate() {
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final MultiParagraphLayoutCache getLayoutCache() {
        if (this._layoutCache == null) {
            this._layoutCache = new MultiParagraphLayoutCache(this.text, this.style, this.fontFamilyResolver, this.overflow, this.softWrap, this.maxLines, this.minLines, this.placeholders, this.autoSize, null);
        }
        MultiParagraphLayoutCache multiParagraphLayoutCache = this._layoutCache;
        Intrinsics.checkNotNull(multiParagraphLayoutCache);
        return multiParagraphLayoutCache;
    }

    private final MultiParagraphLayoutCache getLayoutCache(Density density) {
        MultiParagraphLayoutCache cache;
        TextSubstitutionValue textSubstitutionValue = this.textSubstitution;
        if (textSubstitutionValue != null && textSubstitutionValue.isShowingSubstitution() && (cache = textSubstitutionValue.getLayoutCache()) != null) {
            cache.setDensity$foundation_release(density);
            return cache;
        }
        MultiParagraphLayoutCache it = getLayoutCache();
        it.setDensity$foundation_release(density);
        return it;
    }

    public final boolean updateDraw(ColorProducer color, TextStyle style) {
        boolean changed = false;
        if (!Intrinsics.areEqual(color, this.overrideColor)) {
            changed = true;
        }
        this.overrideColor = color;
        return changed || !style.hasSameDrawAffectingAttributes(this.style);
    }

    public final boolean updateText$foundation_release(AnnotatedString text) {
        boolean anyDiff = true;
        boolean charDiff = !Intrinsics.areEqual(this.text.getText(), text.getText());
        boolean annotationDiff = !this.text.hasEqualAnnotations(text);
        if (!charDiff && !annotationDiff) {
            anyDiff = false;
        }
        if (anyDiff) {
            this.text = text;
        }
        if (charDiff) {
            clearSubstitution$foundation_release();
        }
        return anyDiff;
    }

    /* renamed from: updateLayoutRelatedArgs-y0k-MQk  reason: not valid java name */
    public final boolean m1695updateLayoutRelatedArgsy0kMQk(TextStyle style, List<AnnotatedString.Range<Placeholder>> list, int minLines, int maxLines, boolean softWrap, FontFamily.Resolver fontFamilyResolver, int overflow, TextAutoSize autoSize) {
        boolean changed = !this.style.hasSameLayoutAffectingAttributes(style);
        this.style = style;
        if (!Intrinsics.areEqual(this.placeholders, list)) {
            this.placeholders = list;
            changed = true;
        }
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
            changed = true;
        }
        if (!Intrinsics.areEqual(this.autoSize, autoSize)) {
            this.autoSize = autoSize;
            return true;
        }
        return changed;
    }

    public final boolean updateCallbacks(Function1<? super TextLayoutResult, Unit> function1, Function1<? super List<Rect>, Unit> function12, SelectionController selectionController, Function1<? super TextSubstitutionValue, Unit> function13) {
        boolean changed = false;
        if (this.onTextLayout != function1) {
            this.onTextLayout = function1;
            changed = true;
        }
        if (this.onPlaceholderLayout != function12) {
            this.onPlaceholderLayout = function12;
            changed = true;
        }
        if (!Intrinsics.areEqual(this.selectionController, selectionController)) {
            this.selectionController = selectionController;
            changed = true;
        }
        if (this.onShowTranslation != function13) {
            this.onShowTranslation = function13;
            return true;
        }
        return changed;
    }

    public final void doInvalidations(boolean drawChanged, boolean textChanged, boolean layoutChanged, boolean callbacksChanged) {
        if (textChanged || layoutChanged || callbacksChanged) {
            getLayoutCache().m1678updateJ2qo7bo(this.text, this.style, this.fontFamilyResolver, this.overflow, this.softWrap, this.maxLines, this.minLines, this.placeholders, this.autoSize);
        }
        if (!isAttached()) {
            return;
        }
        if (textChanged || (drawChanged && this.semanticsTextLayoutResult != null)) {
            SemanticsModifierNodeKt.invalidateSemantics(this);
        }
        if (textChanged || layoutChanged || callbacksChanged) {
            LayoutModifierNodeKt.invalidateMeasurement(this);
            DrawModifierNodeKt.invalidateDraw(this);
        }
        if (drawChanged) {
            DrawModifierNodeKt.invalidateDraw(this);
        }
    }

    /* compiled from: TextAnnotatedStringNode.kt */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0015\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\u0002\u0010\tJ\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0018\u001a\u00020\u0006HÆ\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\bHÆ\u0003J3\u0010\u001a\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\bHÆ\u0001J\u0013\u0010\u001b\u001a\u00020\u00062\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u001eHÖ\u0001J\t\u0010\u001f\u001a\u00020 HÖ\u0001R\u001a\u0010\u0005\u001a\u00020\u0006X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\n\"\u0004\b\u000b\u0010\fR\u001c\u0010\u0007\u001a\u0004\u0018\u00010\bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u001a\u0010\u0004\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0013\u0010\u0012\"\u0004\b\u0014\u0010\u0015¨\u0006!"}, d2 = {"Landroidx/compose/foundation/text/modifiers/TextAnnotatedStringNode$TextSubstitutionValue;", "", "original", "Landroidx/compose/ui/text/AnnotatedString;", "substitution", "isShowingSubstitution", "", "layoutCache", "Landroidx/compose/foundation/text/modifiers/MultiParagraphLayoutCache;", "(Landroidx/compose/ui/text/AnnotatedString;Landroidx/compose/ui/text/AnnotatedString;ZLandroidx/compose/foundation/text/modifiers/MultiParagraphLayoutCache;)V", "()Z", "setShowingSubstitution", "(Z)V", "getLayoutCache", "()Landroidx/compose/foundation/text/modifiers/MultiParagraphLayoutCache;", "setLayoutCache", "(Landroidx/compose/foundation/text/modifiers/MultiParagraphLayoutCache;)V", "getOriginal", "()Landroidx/compose/ui/text/AnnotatedString;", "getSubstitution", "setSubstitution", "(Landroidx/compose/ui/text/AnnotatedString;)V", "component1", "component2", "component3", "component4", "copy", "equals", "other", "hashCode", "", "toString", "", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class TextSubstitutionValue {
        public static final int $stable = 8;
        private boolean isShowingSubstitution;
        private MultiParagraphLayoutCache layoutCache;
        private final AnnotatedString original;
        private AnnotatedString substitution;

        public static /* synthetic */ TextSubstitutionValue copy$default(TextSubstitutionValue textSubstitutionValue, AnnotatedString annotatedString, AnnotatedString annotatedString2, boolean z, MultiParagraphLayoutCache multiParagraphLayoutCache, int i, Object obj) {
            if ((i & 1) != 0) {
                annotatedString = textSubstitutionValue.original;
            }
            if ((i & 2) != 0) {
                annotatedString2 = textSubstitutionValue.substitution;
            }
            if ((i & 4) != 0) {
                z = textSubstitutionValue.isShowingSubstitution;
            }
            if ((i & 8) != 0) {
                multiParagraphLayoutCache = textSubstitutionValue.layoutCache;
            }
            return textSubstitutionValue.copy(annotatedString, annotatedString2, z, multiParagraphLayoutCache);
        }

        public final AnnotatedString component1() {
            return this.original;
        }

        public final AnnotatedString component2() {
            return this.substitution;
        }

        public final boolean component3() {
            return this.isShowingSubstitution;
        }

        public final MultiParagraphLayoutCache component4() {
            return this.layoutCache;
        }

        public final TextSubstitutionValue copy(AnnotatedString annotatedString, AnnotatedString annotatedString2, boolean z, MultiParagraphLayoutCache multiParagraphLayoutCache) {
            return new TextSubstitutionValue(annotatedString, annotatedString2, z, multiParagraphLayoutCache);
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

        public String toString() {
            return "TextSubstitutionValue(original=" + ((Object) this.original) + ", substitution=" + ((Object) this.substitution) + ", isShowingSubstitution=" + this.isShowingSubstitution + ", layoutCache=" + this.layoutCache + ')';
        }

        public TextSubstitutionValue(AnnotatedString original, AnnotatedString substitution, boolean isShowingSubstitution, MultiParagraphLayoutCache layoutCache) {
            this.original = original;
            this.substitution = substitution;
            this.isShowingSubstitution = isShowingSubstitution;
            this.layoutCache = layoutCache;
        }

        public /* synthetic */ TextSubstitutionValue(AnnotatedString annotatedString, AnnotatedString annotatedString2, boolean z, MultiParagraphLayoutCache multiParagraphLayoutCache, int i, DefaultConstructorMarker defaultConstructorMarker) {
            this(annotatedString, annotatedString2, (i & 4) != 0 ? false : z, (i & 8) != 0 ? null : multiParagraphLayoutCache);
        }

        public final AnnotatedString getOriginal() {
            return this.original;
        }

        public final AnnotatedString getSubstitution() {
            return this.substitution;
        }

        public final void setSubstitution(AnnotatedString annotatedString) {
            this.substitution = annotatedString;
        }

        public final boolean isShowingSubstitution() {
            return this.isShowingSubstitution;
        }

        public final void setShowingSubstitution(boolean z) {
            this.isShowingSubstitution = z;
        }

        public final MultiParagraphLayoutCache getLayoutCache() {
            return this.layoutCache;
        }

        public final void setLayoutCache(MultiParagraphLayoutCache multiParagraphLayoutCache) {
            this.layoutCache = multiParagraphLayoutCache;
        }
    }

    public final TextSubstitutionValue getTextSubstitution$foundation_release() {
        return this.textSubstitution;
    }

    public final void setTextSubstitution$foundation_release(TextSubstitutionValue textSubstitutionValue) {
        this.textSubstitution = textSubstitutionValue;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean setSubstitution(AnnotatedString updatedText) {
        Unit unit;
        TextSubstitutionValue currentTextSubstitution = this.textSubstitution;
        if (currentTextSubstitution != null) {
            if (Intrinsics.areEqual(updatedText, currentTextSubstitution.getSubstitution())) {
                return false;
            }
            currentTextSubstitution.setSubstitution(updatedText);
            MultiParagraphLayoutCache layoutCache = currentTextSubstitution.getLayoutCache();
            if (layoutCache != null) {
                layoutCache.m1678updateJ2qo7bo(updatedText, this.style, this.fontFamilyResolver, this.overflow, this.softWrap, this.maxLines, this.minLines, CollectionsKt.emptyList(), this.autoSize);
                unit = Unit.INSTANCE;
            } else {
                unit = null;
            }
            return unit != null;
        }
        TextSubstitutionValue newTextSubstitution = new TextSubstitutionValue(this.text, updatedText, false, null, 12, null);
        MultiParagraphLayoutCache substitutionLayoutCache = new MultiParagraphLayoutCache(updatedText, this.style, this.fontFamilyResolver, this.overflow, this.softWrap, this.maxLines, this.minLines, CollectionsKt.emptyList(), this.autoSize, null);
        substitutionLayoutCache.setDensity$foundation_release(getLayoutCache().getDensity$foundation_release());
        newTextSubstitution.setLayoutCache(substitutionLayoutCache);
        this.textSubstitution = newTextSubstitution;
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void invalidateForTranslate() {
        SemanticsModifierNodeKt.invalidateSemantics(this);
        LayoutModifierNodeKt.invalidateMeasurement(this);
        DrawModifierNodeKt.invalidateDraw(this);
    }

    public final void clearSubstitution$foundation_release() {
        this.textSubstitution = null;
    }

    @Override // androidx.compose.ui.node.SemanticsModifierNode
    public void applySemantics(SemanticsPropertyReceiver $this$applySemantics) {
        Function1 localSemanticsTextLayoutResult = this.semanticsTextLayoutResult;
        if (localSemanticsTextLayoutResult == null) {
            localSemanticsTextLayoutResult = new Function1<List<TextLayoutResult>, Boolean>() { // from class: androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode$applySemantics$1
                /* JADX INFO: Access modifiers changed from: package-private */
                {
                    super(1);
                }

                /* JADX WARN: Removed duplicated region for block: B:16:0x00c6  */
                /* JADX WARN: Removed duplicated region for block: B:17:0x00c8  */
                @Override // kotlin.jvm.functions.Function1
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final java.lang.Boolean invoke(java.util.List<androidx.compose.ui.text.TextLayoutResult> r38) {
                    /*
                        r37 = this;
                        r0 = r37
                        androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode r1 = androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode.this
                        androidx.compose.foundation.text.modifiers.MultiParagraphLayoutCache r1 = androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode.access$getLayoutCache(r1)
                        androidx.compose.ui.text.TextLayoutResult r2 = r1.getLayoutOrNull()
                        if (r2 == 0) goto Lc0
                    L11:
                        androidx.compose.ui.text.TextLayoutInput r3 = new androidx.compose.ui.text.TextLayoutInput
                        androidx.compose.ui.text.TextLayoutInput r1 = r2.getLayoutInput()
                        androidx.compose.ui.text.AnnotatedString r4 = r1.getText()
                        androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode r1 = androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode.this
                        androidx.compose.ui.text.TextStyle r5 = androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode.access$getStyle$p(r1)
                        androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode r1 = androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode.this
                        androidx.compose.ui.graphics.ColorProducer r1 = androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode.access$getOverrideColor$p(r1)
                        if (r1 == 0) goto L2e
                        long r6 = r1.mo2110invoke0d7_KjU()
                        goto L34
                    L2e:
                        androidx.compose.ui.graphics.Color$Companion r1 = androidx.compose.ui.graphics.Color.Companion
                        long r6 = r1.m4325getUnspecified0d7_KjU()
                    L34:
                        r35 = 16777214(0xfffffe, float:2.3509884E-38)
                        r36 = 0
                        r8 = 0
                        r10 = 0
                        r11 = 0
                        r12 = 0
                        r13 = 0
                        r14 = 0
                        r15 = 0
                        r17 = 0
                        r18 = 0
                        r19 = 0
                        r20 = 0
                        r22 = 0
                        r23 = 0
                        r24 = 0
                        r25 = 0
                        r26 = 0
                        r27 = 0
                        r29 = 0
                        r30 = 0
                        r31 = 0
                        r32 = 0
                        r33 = 0
                        r34 = 0
                        androidx.compose.ui.text.TextStyle r5 = androidx.compose.ui.text.TextStyle.m6359mergedA7vx0o$default(r5, r6, r8, r10, r11, r12, r13, r14, r15, r17, r18, r19, r20, r22, r23, r24, r25, r26, r27, r29, r30, r31, r32, r33, r34, r35, r36)
                        androidx.compose.ui.text.TextLayoutInput r1 = r2.getLayoutInput()
                        java.util.List r6 = r1.getPlaceholders()
                        androidx.compose.ui.text.TextLayoutInput r1 = r2.getLayoutInput()
                        int r7 = r1.getMaxLines()
                        androidx.compose.ui.text.TextLayoutInput r1 = r2.getLayoutInput()
                        boolean r8 = r1.getSoftWrap()
                        androidx.compose.ui.text.TextLayoutInput r1 = r2.getLayoutInput()
                        int r9 = r1.m6306getOverflowgIe3tQ8()
                        androidx.compose.ui.text.TextLayoutInput r1 = r2.getLayoutInput()
                        androidx.compose.ui.unit.Density r10 = r1.getDensity()
                        androidx.compose.ui.text.TextLayoutInput r1 = r2.getLayoutInput()
                        androidx.compose.ui.unit.LayoutDirection r11 = r1.getLayoutDirection()
                        androidx.compose.ui.text.TextLayoutInput r1 = r2.getLayoutInput()
                        androidx.compose.ui.text.font.FontFamily$Resolver r12 = r1.getFontFamilyResolver()
                        androidx.compose.ui.text.TextLayoutInput r1 = r2.getLayoutInput()
                        long r13 = r1.m6305getConstraintsmsEJaDk()
                        r15 = 0
                        r3.<init>(r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r15)
                        r6 = 2
                        r7 = 0
                        r4 = 0
                        androidx.compose.ui.text.TextLayoutResult r1 = androidx.compose.ui.text.TextLayoutResult.m6307copyO0kMr_c$default(r2, r3, r4, r6, r7)
                        if (r1 == 0) goto Lbd
                    Lb5:
                        r3 = r1
                        r4 = 0
                        r5 = r38
                        r5.add(r3)
                        goto Lc3
                    Lbd:
                        r5 = r38
                        goto Lc2
                    Lc0:
                        r5 = r38
                    Lc2:
                        r1 = 0
                    Lc3:
                        if (r1 == 0) goto Lc8
                        r3 = 1
                        goto Lc9
                    Lc8:
                        r3 = 0
                    Lc9:
                        java.lang.Boolean r3 = java.lang.Boolean.valueOf(r3)
                        return r3
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode$applySemantics$1.invoke(java.util.List):java.lang.Boolean");
                }
            };
            this.semanticsTextLayoutResult = localSemanticsTextLayoutResult;
        }
        SemanticsPropertiesKt.setText($this$applySemantics, this.text);
        TextSubstitutionValue currentTextSubstitution = this.textSubstitution;
        if (currentTextSubstitution != null) {
            SemanticsPropertiesKt.setTextSubstitution($this$applySemantics, currentTextSubstitution.getSubstitution());
            SemanticsPropertiesKt.setShowingTextSubstitution($this$applySemantics, currentTextSubstitution.isShowingSubstitution());
        }
        SemanticsPropertiesKt.setTextSubstitution$default($this$applySemantics, null, new Function1<AnnotatedString, Boolean>() { // from class: androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode$applySemantics$2
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(AnnotatedString updatedText) {
                TextAnnotatedStringNode.this.setSubstitution(updatedText);
                TextAnnotatedStringNode.this.invalidateForTranslate();
                return true;
            }
        }, 1, null);
        SemanticsPropertiesKt.showTextSubstitution$default($this$applySemantics, null, new Function1<Boolean, Boolean>() { // from class: androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode$applySemantics$3
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Boolean invoke(Boolean bool) {
                return invoke(bool.booleanValue());
            }

            public final Boolean invoke(boolean it) {
                Function1 function1;
                if (TextAnnotatedStringNode.this.getTextSubstitution$foundation_release() != null) {
                    function1 = TextAnnotatedStringNode.this.onShowTranslation;
                    if (function1 != null) {
                        TextAnnotatedStringNode.TextSubstitutionValue textSubstitution$foundation_release = TextAnnotatedStringNode.this.getTextSubstitution$foundation_release();
                        Intrinsics.checkNotNull(textSubstitution$foundation_release);
                        function1.invoke(textSubstitution$foundation_release);
                    }
                    TextAnnotatedStringNode.TextSubstitutionValue textSubstitution$foundation_release2 = TextAnnotatedStringNode.this.getTextSubstitution$foundation_release();
                    if (textSubstitution$foundation_release2 != null) {
                        textSubstitution$foundation_release2.setShowingSubstitution(it);
                    }
                    TextAnnotatedStringNode.this.invalidateForTranslate();
                    return true;
                }
                return false;
            }
        }, 1, null);
        SemanticsPropertiesKt.clearTextSubstitution$default($this$applySemantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode$applySemantics$4
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Boolean invoke() {
                TextAnnotatedStringNode.this.clearSubstitution$foundation_release();
                TextAnnotatedStringNode.this.invalidateForTranslate();
                return true;
            }
        }, 1, null);
        SemanticsPropertiesKt.getTextLayoutResult$default($this$applySemantics, null, localSemanticsTextLayoutResult, 1, null);
    }

    /* renamed from: measureNonExtension-3p2s80s  reason: not valid java name */
    public final MeasureResult m1694measureNonExtension3p2s80s(MeasureScope measureScope, Measurable measurable, long constraints) {
        return mo328measure3p2s80s(measureScope, measurable, constraints);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    /* renamed from: measure-3p2s80s */
    public MeasureResult mo328measure3p2s80s(MeasureScope $this$measure_u2d3p2s80s, Measurable measurable, long constraints) {
        MultiParagraphLayoutCache layoutCache = getLayoutCache($this$measure_u2d3p2s80s);
        boolean didChangeLayout = layoutCache.m1677layoutWithConstraintsK40F9xA(constraints, $this$measure_u2d3p2s80s.getLayoutDirection());
        TextLayoutResult textLayoutResult = layoutCache.getTextLayoutResult();
        textLayoutResult.getMultiParagraph().getIntrinsics().getHasStaleResolvedFonts();
        if (didChangeLayout) {
            LayoutModifierNodeKt.invalidateLayer(this);
            Function1<? super TextLayoutResult, Unit> function1 = this.onTextLayout;
            if (function1 != null) {
                function1.invoke(textLayoutResult);
            }
            SelectionController selectionController = this.selectionController;
            if (selectionController != null) {
                selectionController.updateTextLayout(textLayoutResult);
            }
            Map cache = this.baselineCache;
            if (cache == null) {
                cache = new LinkedHashMap(2);
            }
            HorizontalAlignmentLine firstBaseline = AlignmentLineKt.getFirstBaseline();
            float $this$fastRoundToInt$iv = textLayoutResult.getFirstBaseline();
            cache.put(firstBaseline, Integer.valueOf(Math.round($this$fastRoundToInt$iv)));
            HorizontalAlignmentLine lastBaseline = AlignmentLineKt.getLastBaseline();
            float $this$fastRoundToInt$iv2 = textLayoutResult.getLastBaseline();
            cache.put(lastBaseline, Integer.valueOf(Math.round($this$fastRoundToInt$iv2)));
            this.baselineCache = cache;
        }
        Function1<? super List<Rect>, Unit> function12 = this.onPlaceholderLayout;
        if (function12 != null) {
            function12.invoke(textLayoutResult.getPlaceholderRects());
        }
        Constraints.Companion companion = Constraints.Companion;
        long arg0$iv = textLayoutResult.m6310getSizeYbymL2g();
        long arg0$iv2 = textLayoutResult.m6310getSizeYbymL2g();
        long arg0$iv3 = textLayoutResult.m6310getSizeYbymL2g();
        long arg0$iv4 = textLayoutResult.m6310getSizeYbymL2g();
        final Placeable placeable = measurable.mo5637measureBRTryo0(companion.m6835fitPrioritizingWidthZbe2FdA((int) (arg0$iv >> 32), (int) (arg0$iv2 >> 32), (int) (arg0$iv3 & 4294967295L), (int) (arg0$iv4 & 4294967295L)));
        long arg0$iv5 = textLayoutResult.m6310getSizeYbymL2g();
        int $i$f$unpackInt1 = (int) (arg0$iv5 >> 32);
        long arg0$iv6 = textLayoutResult.m6310getSizeYbymL2g();
        Map<AlignmentLine, Integer> map = this.baselineCache;
        Intrinsics.checkNotNull(map);
        return $this$measure_u2d3p2s80s.layout($i$f$unpackInt1, (int) (arg0$iv6 & 4294967295L), map, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode$measure$1
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

    public final int minIntrinsicWidthNonExtension(IntrinsicMeasureScope intrinsicMeasureScope, IntrinsicMeasurable measurable, int height) {
        return minIntrinsicWidth(intrinsicMeasureScope, measurable, height);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int minIntrinsicWidth(IntrinsicMeasureScope $this$minIntrinsicWidth, IntrinsicMeasurable measurable, int height) {
        return getLayoutCache($this$minIntrinsicWidth).minIntrinsicWidth($this$minIntrinsicWidth.getLayoutDirection());
    }

    public final int minIntrinsicHeightNonExtension(IntrinsicMeasureScope intrinsicMeasureScope, IntrinsicMeasurable measurable, int width) {
        return minIntrinsicHeight(intrinsicMeasureScope, measurable, width);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int minIntrinsicHeight(IntrinsicMeasureScope $this$minIntrinsicHeight, IntrinsicMeasurable measurable, int width) {
        return getLayoutCache($this$minIntrinsicHeight).intrinsicHeight(width, $this$minIntrinsicHeight.getLayoutDirection());
    }

    public final int maxIntrinsicWidthNonExtension(IntrinsicMeasureScope intrinsicMeasureScope, IntrinsicMeasurable measurable, int height) {
        return maxIntrinsicWidth(intrinsicMeasureScope, measurable, height);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int maxIntrinsicWidth(IntrinsicMeasureScope $this$maxIntrinsicWidth, IntrinsicMeasurable measurable, int height) {
        return getLayoutCache($this$maxIntrinsicWidth).maxIntrinsicWidth($this$maxIntrinsicWidth.getLayoutDirection());
    }

    public final int maxIntrinsicHeightNonExtension(IntrinsicMeasureScope intrinsicMeasureScope, IntrinsicMeasurable measurable, int width) {
        return maxIntrinsicHeight(intrinsicMeasureScope, measurable, width);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int maxIntrinsicHeight(IntrinsicMeasureScope $this$maxIntrinsicHeight, IntrinsicMeasurable measurable, int width) {
        return getLayoutCache($this$maxIntrinsicHeight).intrinsicHeight(width, $this$maxIntrinsicHeight.getLayoutDirection());
    }

    public final void drawNonExtension(ContentDrawScope contentDrawScope) {
        draw(contentDrawScope);
    }

    @Override // androidx.compose.ui.node.DrawModifierNode
    public void draw(ContentDrawScope $this$draw) {
        boolean z;
        boolean z2;
        boolean z3;
        long color;
        boolean hasLinks;
        if (!isAttached()) {
            return;
        }
        SelectionController selectionController = this.selectionController;
        if (selectionController != null) {
            selectionController.draw($this$draw);
        }
        ContentDrawScope $this$drawIntoCanvas$iv = $this$draw;
        Canvas canvas = $this$drawIntoCanvas$iv.getDrawContext().getCanvas();
        MultiParagraphLayoutCache layoutCache = getLayoutCache($this$draw);
        TextLayoutResult textLayoutResult = layoutCache.getTextLayoutResult();
        MultiParagraph localParagraph = textLayoutResult.getMultiParagraph();
        boolean willClip = textLayoutResult.getHasVisualOverflow() && !TextOverflow.m6799equalsimpl0(this.overflow, TextOverflow.Companion.m6812getVisiblegIe3tQ8());
        if (willClip) {
            long arg0$iv = textLayoutResult.m6310getSizeYbymL2g();
            float width = (int) (arg0$iv >> 32);
            long arg0$iv2 = textLayoutResult.m6310getSizeYbymL2g();
            float height = (int) (arg0$iv2 & 4294967295L);
            long m4064getZeroF1C5BW0 = Offset.Companion.m4064getZeroF1C5BW0();
            long v1$iv$iv = Float.floatToRawIntBits(width);
            long v2$iv$iv = Float.floatToRawIntBits(height);
            Rect bounds = RectKt.m4088Recttz77jQw(m4064getZeroF1C5BW0, Size.m4108constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L)));
            canvas.save();
            z = false;
            Canvas.m4262clipRectmtrdDE$default(canvas, bounds, 0, 2, null);
        } else {
            z = false;
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
            Brush brush = this.style.getBrush();
            if (brush != null) {
                float alpha = this.style.getAlpha();
                z2 = z;
                z3 = true;
                localParagraph.m6195painthn5TExg(canvas, brush, (r16 & 4) != 0 ? Float.NaN : alpha, (r16 & 8) != 0 ? null : shadow2, (r16 & 16) != 0 ? null : textDecoration2, (r16 & 32) != 0 ? null : drawStyle, (r16 & 64) != 0 ? DrawScope.Companion.m4842getDefaultBlendMode0nO6VwU() : 0);
            } else {
                z2 = z;
                z3 = true;
                DrawStyle drawStyle2 = drawStyle;
                ColorProducer colorProducer = this.overrideColor;
                long $this$isSpecified$iv = colorProducer != null ? colorProducer.mo2110invoke0d7_KjU() : Color.Companion.m4325getUnspecified0d7_KjU();
                long overrideColorVal = $this$isSpecified$iv;
                if ($this$isSpecified$iv != 16 ? true : z2) {
                    color = overrideColorVal;
                } else {
                    if (this.style.m6369getColor0d7_KjU() != 16 ? true : z2) {
                        color = this.style.m6369getColor0d7_KjU();
                    } else {
                        color = Color.Companion.m4315getBlack0d7_KjU();
                    }
                }
                localParagraph.m6193paintLG529CI(canvas, (r14 & 2) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : color, (r14 & 4) != 0 ? null : shadow2, (r14 & 8) != 0 ? null : textDecoration2, (r14 & 16) == 0 ? drawStyle2 : null, (r14 & 32) != 0 ? DrawScope.Companion.m4842getDefaultBlendMode0nO6VwU() : 0);
            }
            TextSubstitutionValue textSubstitutionValue = this.textSubstitution;
            if ((textSubstitutionValue == null || textSubstitutionValue.isShowingSubstitution() != z3) ? z2 : z3) {
                hasLinks = z2;
            } else {
                hasLinks = TextAnnotatedStringNodeKt.hasLinks(this.text);
            }
            if (!hasLinks) {
                List<AnnotatedString.Range<Placeholder>> list = this.placeholders;
                if ((list == null || list.isEmpty()) ? z3 : z2) {
                    return;
                }
            }
            $this$draw.drawContent();
        } finally {
            if (willClip) {
                canvas.restore();
            }
        }
    }
}
