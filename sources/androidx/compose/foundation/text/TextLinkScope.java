package androidx.compose.foundation.text;

import androidx.compose.foundation.ClickableKt;
import androidx.compose.foundation.HoverableKt;
import androidx.compose.foundation.interaction.InteractionSourceKt;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.layout.BoxKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.DisposableEffectResult;
import androidx.compose.runtime.DisposableEffectScope;
import androidx.compose.runtime.EffectsKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.snapshots.SnapshotStateList;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.graphics.GraphicsLayerModifierKt;
import androidx.compose.ui.graphics.GraphicsLayerScope;
import androidx.compose.ui.graphics.Outline;
import androidx.compose.ui.graphics.Path;
import androidx.compose.ui.graphics.Shadow;
import androidx.compose.ui.graphics.Shape;
import androidx.compose.ui.graphics.drawscope.DrawStyle;
import androidx.compose.ui.input.pointer.PointerIcon;
import androidx.compose.ui.input.pointer.PointerIconKt;
import androidx.compose.ui.platform.CompositionLocalsKt;
import androidx.compose.ui.platform.UriHandler;
import androidx.compose.ui.semantics.SemanticsModifierKt;
import androidx.compose.ui.semantics.SemanticsProperties;
import androidx.compose.ui.semantics.SemanticsPropertyReceiver;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.LinkAnnotation;
import androidx.compose.ui.text.LinkInteractionListener;
import androidx.compose.ui.text.PlatformSpanStyle;
import androidx.compose.ui.text.SpanStyle;
import androidx.compose.ui.text.TextLayoutInput;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextLinkStyles;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontSynthesis;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.intl.LocaleList;
import androidx.compose.ui.text.style.BaselineShift;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.text.style.TextGeometricTransform;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntRect;
import androidx.compose.ui.unit.IntRectKt;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import com.itextpdf.layout.properties.Property;
import java.util.Arrays;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SpreadBuilder;
/* compiled from: TextLinkScope.kt */
@Metadata(d1 = {"\u0000v\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u0011\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\r\u0010\u001e\u001a\u00020\tH\u0007¢\u0006\u0002\u0010\u001fJ>\u0010 \u001a\u00020\t2\u0016\u0010!\u001a\f\u0012\b\b\u0001\u0012\u0004\u0018\u00010\u00010\"\"\u0004\u0018\u00010\u00012\u0017\u0010#\u001a\u0013\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\t0\u0007¢\u0006\u0002\b\nH\u0003¢\u0006\u0002\u0010$J\r\u0010%\u001a\u00020\u0003H\u0000¢\u0006\u0002\b&J0\u0010'\u001a\u0010\u0012\u0004\u0012\u00020)\u0018\u00010(j\u0004\u0018\u0001`*2\u0010\u0010+\u001a\f\u0012\u0004\u0012\u00020)0(j\u0002`*2\u0006\u0010\u0017\u001a\u00020\u0016H\u0002J\u0018\u0010,\u001a\u00020\t2\u0006\u0010+\u001a\u00020)2\u0006\u0010-\u001a\u00020.H\u0002J\u001c\u0010/\u001a\u0004\u0018\u0001002\u0010\u0010+\u001a\f\u0012\u0004\u0012\u00020)0(j\u0002`*H\u0002J\u001c\u00101\u001a\u0004\u0018\u0001022\u0010\u0010+\u001a\f\u0012\u0004\u0012\u00020)0(j\u0002`*H\u0002J\u001e\u00103\u001a\u000204*\u0002042\u0010\u0010+\u001a\f\u0012\u0004\u0012\u00020)0(j\u0002`*H\u0002J\u001a\u00105\u001a\u0004\u0018\u000106*\u0004\u0018\u0001062\b\u00107\u001a\u0004\u0018\u000106H\u0002J\u001e\u00108\u001a\u000204*\u0002042\u0010\u0010+\u001a\f\u0012\u0004\u0012\u00020)0(j\u0002`*H\u0002R%\u0010\u0005\u001a\u0019\u0012\u0015\u0012\u0013\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\t0\u0007¢\u0006\u0002\b\n0\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0017\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000f0\u000e8F¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0011R\u001a\u0010\u0012\u001a\u00020\u0003X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0013\u0010\f\"\u0004\b\u0014\u0010\u0004R/\u0010\u0017\u001a\u0004\u0018\u00010\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u00168F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b\u001c\u0010\u001d\u001a\u0004\b\u0018\u0010\u0019\"\u0004\b\u001a\u0010\u001b¨\u00069"}, d2 = {"Landroidx/compose/foundation/text/TextLinkScope;", "", "initialText", "Landroidx/compose/ui/text/AnnotatedString;", "(Landroidx/compose/ui/text/AnnotatedString;)V", "annotators", "Landroidx/compose/runtime/snapshots/SnapshotStateList;", "Lkotlin/Function1;", "Landroidx/compose/foundation/text/TextAnnotatorScope;", "", "Lkotlin/ExtensionFunctionType;", "getInitialText$foundation_release", "()Landroidx/compose/ui/text/AnnotatedString;", "shouldMeasureLinks", "Lkotlin/Function0;", "", "getShouldMeasureLinks", "()Lkotlin/jvm/functions/Function0;", "text", "getText$foundation_release", "setText$foundation_release", "<set-?>", "Landroidx/compose/ui/text/TextLayoutResult;", "textLayoutResult", "getTextLayoutResult", "()Landroidx/compose/ui/text/TextLayoutResult;", "setTextLayoutResult", "(Landroidx/compose/ui/text/TextLayoutResult;)V", "textLayoutResult$delegate", "Landroidx/compose/runtime/MutableState;", "LinksComposables", "(Landroidx/compose/runtime/Composer;I)V", "StyleAnnotation", "keys", "", "block", "([Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V", "applyAnnotators", "applyAnnotators$foundation_release", "calculateVisibleLinkRange", "Landroidx/compose/ui/text/AnnotatedString$Range;", "Landroidx/compose/ui/text/LinkAnnotation;", "Landroidx/compose/foundation/text/LinkRange;", "link", "handleLink", "uriHandler", "Landroidx/compose/ui/platform/UriHandler;", "pathForRangeInRangeCoordinates", "Landroidx/compose/ui/graphics/Path;", "shapeForRange", "Landroidx/compose/ui/graphics/Shape;", "clipLink", "Landroidx/compose/ui/Modifier;", "mergeOrUse", "Landroidx/compose/ui/text/SpanStyle;", "other", "textRange", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextLinkScope {
    public static final int $stable = 8;
    private final SnapshotStateList<Function1<TextAnnotatorScope, Unit>> annotators;
    private final AnnotatedString initialText;
    private AnnotatedString text;
    private final MutableState textLayoutResult$delegate;

    public TextLinkScope(AnnotatedString initialText) {
        MutableState mutableStateOf$default;
        this.initialText = initialText;
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
        this.textLayoutResult$delegate = mutableStateOf$default;
        this.text = this.initialText.flatMapAnnotations(new Function1<AnnotatedString.Range<? extends AnnotatedString.Annotation>, List<? extends AnnotatedString.Range<? extends AnnotatedString.Annotation>>>() { // from class: androidx.compose.foundation.text.TextLinkScope.1
            @Override // kotlin.jvm.functions.Function1
            public final List<AnnotatedString.Range<? extends AnnotatedString.Annotation>> invoke(AnnotatedString.Range<? extends AnnotatedString.Annotation> range) {
                boolean isNullOrEmpty;
                SpanStyle spanStyle;
                if (range.getItem() instanceof LinkAnnotation) {
                    AnnotatedString.Annotation item = range.getItem();
                    Intrinsics.checkNotNull(item, "null cannot be cast to non-null type androidx.compose.ui.text.LinkAnnotation");
                    isNullOrEmpty = TextLinkScopeKt.isNullOrEmpty(((LinkAnnotation) item).getStyles());
                    if (!isNullOrEmpty) {
                        AnnotatedString.Range[] rangeArr = new AnnotatedString.Range[2];
                        rangeArr[0] = range;
                        AnnotatedString.Annotation item2 = range.getItem();
                        Intrinsics.checkNotNull(item2, "null cannot be cast to non-null type androidx.compose.ui.text.LinkAnnotation");
                        TextLinkStyles styles = ((LinkAnnotation) item2).getStyles();
                        if (styles == null || (spanStyle = styles.getStyle()) == null) {
                            spanStyle = new SpanStyle(0L, 0L, (FontWeight) null, (FontStyle) null, (FontSynthesis) null, (FontFamily) null, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (PlatformSpanStyle) null, (DrawStyle) null, 65535, (DefaultConstructorMarker) null);
                        }
                        rangeArr[1] = new AnnotatedString.Range(spanStyle, range.getStart(), range.getEnd());
                        return CollectionsKt.arrayListOf(rangeArr);
                    }
                }
                return CollectionsKt.arrayListOf(range);
            }
        });
        this.annotators = SnapshotStateKt.mutableStateListOf();
    }

    public final AnnotatedString getInitialText$foundation_release() {
        return this.initialText;
    }

    public final TextLayoutResult getTextLayoutResult() {
        State $this$getValue$iv = this.textLayoutResult$delegate;
        return (TextLayoutResult) $this$getValue$iv.getValue();
    }

    public final void setTextLayoutResult(TextLayoutResult textLayoutResult) {
        MutableState $this$setValue$iv = this.textLayoutResult$delegate;
        $this$setValue$iv.setValue(textLayoutResult);
    }

    public final AnnotatedString getText$foundation_release() {
        return this.text;
    }

    public final void setText$foundation_release(AnnotatedString annotatedString) {
        this.text = annotatedString;
    }

    public final Function0<Boolean> getShouldMeasureLinks() {
        return new Function0<Boolean>() { // from class: androidx.compose.foundation.text.TextLinkScope$shouldMeasureLinks$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Boolean invoke() {
                TextLayoutInput layoutInput;
                AnnotatedString text$foundation_release = TextLinkScope.this.getText$foundation_release();
                TextLayoutResult textLayoutResult = TextLinkScope.this.getTextLayoutResult();
                return Boolean.valueOf(Intrinsics.areEqual(text$foundation_release, (textLayoutResult == null || (layoutInput = textLayoutResult.getLayoutInput()) == null) ? null : layoutInput.getText()));
            }
        };
    }

    private final Modifier textRange(Modifier $this$textRange, final AnnotatedString.Range<LinkAnnotation> range) {
        return $this$textRange.then(new TextRangeLayoutModifier(new TextRangeScopeMeasurePolicy() { // from class: androidx.compose.foundation.text.TextLinkScope$$ExternalSyntheticLambda0
            @Override // androidx.compose.foundation.text.TextRangeScopeMeasurePolicy
            public final TextRangeLayoutMeasureResult measure(TextRangeLayoutMeasureScope textRangeLayoutMeasureScope) {
                return TextLinkScope.textRange$lambda$0(TextLinkScope.this, range, textRangeLayoutMeasureScope);
            }
        }));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final TextRangeLayoutMeasureResult textRange$lambda$0(TextLinkScope this$0, AnnotatedString.Range $link, TextRangeLayoutMeasureScope $this$$receiver) {
        TextLayoutResult layoutResult = this$0.getTextLayoutResult();
        if (layoutResult == null) {
            return $this$$receiver.layout(0, 0, new Function0<IntOffset>() { // from class: androidx.compose.foundation.text.TextLinkScope$textRange$1$layoutResult$1
                @Override // kotlin.jvm.functions.Function0
                public /* bridge */ /* synthetic */ IntOffset invoke() {
                    return IntOffset.m6992boximpl(m1440invokenOccac());
                }

                /* renamed from: invoke-nOcc-ac  reason: not valid java name */
                public final long m1440invokenOccac() {
                    return IntOffset.Companion.m7012getZeronOccac();
                }
            });
        }
        AnnotatedString.Range updatedRange = this$0.calculateVisibleLinkRange($link, layoutResult);
        if (updatedRange == null) {
            return $this$$receiver.layout(0, 0, new Function0<IntOffset>() { // from class: androidx.compose.foundation.text.TextLinkScope$textRange$1$updatedRange$1
                @Override // kotlin.jvm.functions.Function0
                public /* bridge */ /* synthetic */ IntOffset invoke() {
                    return IntOffset.m6992boximpl(m1441invokenOccac());
                }

                /* renamed from: invoke-nOcc-ac  reason: not valid java name */
                public final long m1441invokenOccac() {
                    return IntOffset.Companion.m7012getZeronOccac();
                }
            });
        }
        final IntRect bounds = IntRectKt.roundToIntRect(layoutResult.getPathForRange(updatedRange.getStart(), updatedRange.getEnd()).getBounds());
        return $this$$receiver.layout(bounds.getWidth(), bounds.getHeight(), new Function0<IntOffset>() { // from class: androidx.compose.foundation.text.TextLinkScope$textRange$1$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public /* bridge */ /* synthetic */ IntOffset invoke() {
                return IntOffset.m6992boximpl(m1439invokenOccac());
            }

            /* renamed from: invoke-nOcc-ac  reason: not valid java name */
            public final long m1439invokenOccac() {
                return IntRect.this.m7030getTopLeftnOccac();
            }
        });
    }

    private final Modifier clipLink(Modifier $this$clipLink, final AnnotatedString.Range<LinkAnnotation> range) {
        return GraphicsLayerModifierKt.graphicsLayer($this$clipLink, new Function1<GraphicsLayerScope, Unit>() { // from class: androidx.compose.foundation.text.TextLinkScope$clipLink$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(GraphicsLayerScope graphicsLayerScope) {
                invoke2(graphicsLayerScope);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(GraphicsLayerScope $this$graphicsLayer) {
                Shape linkShape;
                linkShape = TextLinkScope.this.shapeForRange(range);
                if (linkShape != null) {
                    $this$graphicsLayer.setShape(linkShape);
                    $this$graphicsLayer.setClip(true);
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Shape shapeForRange(AnnotatedString.Range<LinkAnnotation> range) {
        final Path it = pathForRangeInRangeCoordinates(range);
        return it != null ? new Shape() { // from class: androidx.compose.foundation.text.TextLinkScope$shapeForRange$1$1
            @Override // androidx.compose.ui.graphics.Shape
            /* renamed from: createOutline-Pq9zytI */
            public Outline mo558createOutlinePq9zytI(long size, LayoutDirection layoutDirection, Density density) {
                return new Outline.Generic(Path.this);
            }
        } : null;
    }

    private final Path pathForRangeInRangeCoordinates(AnnotatedString.Range<LinkAnnotation> range) {
        TextLayoutResult it;
        AnnotatedString.Range range2;
        float xOffset;
        if (!getShouldMeasureLinks().invoke().booleanValue() || (it = getTextLayoutResult()) == null || (range2 = calculateVisibleLinkRange(range, it)) == null) {
            return null;
        }
        Path path = it.getPathForRange(range2.getStart(), range2.getEnd());
        Rect firstCharBoundingBox = it.getBoundingBox(range2.getStart());
        Rect lastCharBoundingBox = it.getBoundingBox(range2.getEnd() - 1);
        int rangeStartLine = it.getLineForOffset(range2.getStart());
        int rangeEndLine = it.getLineForOffset(range2.getEnd() - 1);
        if (rangeStartLine == rangeEndLine) {
            xOffset = Math.min(lastCharBoundingBox.getLeft(), firstCharBoundingBox.getLeft());
        } else {
            xOffset = 0.0f;
        }
        float yOffset = firstCharBoundingBox.getTop();
        long v1$iv$iv = Float.floatToRawIntBits(xOffset);
        long v2$iv$iv = Float.floatToRawIntBits(yOffset);
        long arg0$iv = Offset.m4040constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L));
        path.mo4184translatek4lQ0M(Offset.m4040constructorimpl((-9223372034707292160L) ^ arg0$iv));
        return path;
    }

    private final AnnotatedString.Range<LinkAnnotation> calculateVisibleLinkRange(AnnotatedString.Range<LinkAnnotation> range, TextLayoutResult textLayoutResult) {
        int lastOffset = TextLayoutResult.getLineEnd$default(textLayoutResult, textLayoutResult.getLineCount() - 1, false, 2, null);
        if (range.getStart() < lastOffset) {
            return AnnotatedString.Range.copy$default(range, null, 0, Math.min(range.getEnd(), lastOffset), null, 11, null);
        }
        return null;
    }

    public final void LinksComposables(Composer $composer, final int $changed) {
        UriHandler uriHandler;
        int $dirty;
        List links;
        List $this$fastForEach$iv;
        boolean z;
        MutableInteractionSource interactionSource;
        boolean isNullOrEmpty;
        SpanStyle spanStyle;
        Composer $composer2 = $composer.startRestartGroup(1154651354);
        ComposerKt.sourceInformation($composer2, "C(LinksComposables)215@9178L7:TextLinkScope.kt#423gt5");
        int $dirty2 = $changed;
        if (($changed & 6) == 0) {
            $dirty2 |= $composer2.changedInstance(this) ? 4 : 2;
        }
        if ($composer2.shouldExecute(($dirty2 & 3) != 2, $dirty2 & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1154651354, $dirty2, -1, "androidx.compose.foundation.text.TextLinkScope.LinksComposables (TextLinkScope.kt:214)");
            }
            ComposerKt.sourceInformationMarkerStart($composer2, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
            Object consume = $composer2.consume(CompositionLocalsKt.getLocalUriHandler());
            ComposerKt.sourceInformationMarkerEnd($composer2);
            final UriHandler uriHandler2 = (UriHandler) consume;
            List links2 = this.text.getLinkAnnotations(0, this.text.length());
            List $this$fastForEach$iv2 = links2;
            boolean z2 = false;
            int index$iv = 0;
            int size = $this$fastForEach$iv2.size();
            while (index$iv < size) {
                AnnotatedString.Range item$iv = $this$fastForEach$iv2.get(index$iv);
                final AnnotatedString.Range range = item$iv;
                if (range.getStart() != range.getEnd()) {
                    $composer2.startReplaceGroup(1386075176);
                    ComposerKt.sourceInformation($composer2, "220@9368L39,234@10043L38,222@9425L700");
                    ComposerKt.sourceInformationMarkerStart($composer2, -370931493, "CC(remember):TextLinkScope.kt#9igjgp");
                    Object it$iv = $composer2.rememberedValue();
                    $dirty = $dirty2;
                    if (it$iv == Composer.Companion.getEmpty()) {
                        Object value$iv = InteractionSourceKt.MutableInteractionSource();
                        links = links2;
                        $composer2.updateRememberedValue(value$iv);
                        it$iv = value$iv;
                    } else {
                        links = links2;
                    }
                    MutableInteractionSource interactionSource2 = (MutableInteractionSource) it$iv;
                    ComposerKt.sourceInformationMarkerEnd($composer2);
                    $this$fastForEach$iv = $this$fastForEach$iv2;
                    z = z2;
                    Modifier pointerHoverIcon$default = PointerIconKt.pointerHoverIcon$default(HoverableKt.hoverable$default(textRange(SemanticsModifierKt.semantics$default(clipLink(Modifier.Companion, range), false, new Function1<SemanticsPropertyReceiver, Unit>() { // from class: androidx.compose.foundation.text.TextLinkScope$LinksComposables$1$1
                        @Override // kotlin.jvm.functions.Function1
                        public /* bridge */ /* synthetic */ Unit invoke(SemanticsPropertyReceiver semanticsPropertyReceiver) {
                            invoke2(semanticsPropertyReceiver);
                            return Unit.INSTANCE;
                        }

                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                        public final void invoke2(SemanticsPropertyReceiver $this$semantics) {
                            $this$semantics.set(SemanticsProperties.INSTANCE.getLinkTestMarker(), Unit.INSTANCE);
                        }
                    }, 1, null), range), interactionSource2, false, 2, null), PointerIcon.Companion.getHand(), false, 2, null);
                    ComposerKt.sourceInformationMarkerStart($composer2, -370909894, "CC(remember):TextLinkScope.kt#9igjgp");
                    boolean invalid$iv = $composer2.changedInstance(this) | $composer2.changed(range) | $composer2.changedInstance(uriHandler2);
                    Object it$iv2 = $composer2.rememberedValue();
                    if (invalid$iv || it$iv2 == Composer.Companion.getEmpty()) {
                        interactionSource = interactionSource2;
                        Object value$iv2 = (Function0) new Function0<Unit>() { // from class: androidx.compose.foundation.text.TextLinkScope$LinksComposables$1$2$1
                            /* JADX INFO: Access modifiers changed from: package-private */
                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            {
                                super(0);
                            }

                            @Override // kotlin.jvm.functions.Function0
                            public /* bridge */ /* synthetic */ Unit invoke() {
                                invoke2();
                                return Unit.INSTANCE;
                            }

                            /* renamed from: invoke  reason: avoid collision after fix types in other method */
                            public final void invoke2() {
                                TextLinkScope.this.handleLink(range.getItem(), uriHandler2);
                            }
                        };
                        $composer2.updateRememberedValue(value$iv2);
                        it$iv2 = value$iv2;
                    } else {
                        interactionSource = interactionSource2;
                    }
                    ComposerKt.sourceInformationMarkerEnd($composer2);
                    BoxKt.Box(ClickableKt.m540combinedClickableauXiCPI$default(pointerHoverIcon$default, interactionSource, null, false, null, null, null, null, null, false, (Function0) it$iv2, TypedValues.PositionType.TYPE_CURVE_FIT, null), $composer2, 0);
                    isNullOrEmpty = TextLinkScopeKt.isNullOrEmpty(range.getItem().getStyles());
                    if (!isNullOrEmpty) {
                        $composer2.startReplaceGroup(1386898319);
                        ComposerKt.sourceInformation($composer2, "243@10488L110,246@10640L51,246@10619L72,256@11132L1144,248@10713L1563");
                        ComposerKt.sourceInformationMarkerStart($composer2, -370895582, "CC(remember):TextLinkScope.kt#9igjgp");
                        Object it$iv3 = $composer2.rememberedValue();
                        if (it$iv3 == Composer.Companion.getEmpty()) {
                            uriHandler = uriHandler2;
                            Object value$iv3 = new LinkStateInteractionSourceObserver(interactionSource);
                            $composer2.updateRememberedValue(value$iv3);
                            it$iv3 = value$iv3;
                        } else {
                            uriHandler = uriHandler2;
                        }
                        final LinkStateInteractionSourceObserver linkStateObserver = (LinkStateInteractionSourceObserver) it$iv3;
                        ComposerKt.sourceInformationMarkerEnd($composer2);
                        Unit unit = Unit.INSTANCE;
                        ComposerKt.sourceInformationMarkerStart($composer2, -370890777, "CC(remember):TextLinkScope.kt#9igjgp");
                        Object it$iv4 = $composer2.rememberedValue();
                        if (it$iv4 == Composer.Companion.getEmpty()) {
                            spanStyle = null;
                            Object value$iv4 = (Function2) new TextLinkScope$LinksComposables$1$3$1(linkStateObserver, null);
                            $composer2.updateRememberedValue(value$iv4);
                            it$iv4 = value$iv4;
                        } else {
                            spanStyle = null;
                        }
                        ComposerKt.sourceInformationMarkerEnd($composer2);
                        EffectsKt.LaunchedEffect(unit, (Function2) it$iv4, $composer2, 6);
                        Boolean valueOf = Boolean.valueOf(linkStateObserver.isHovered());
                        Boolean valueOf2 = Boolean.valueOf(linkStateObserver.isFocused());
                        Boolean valueOf3 = Boolean.valueOf(linkStateObserver.isPressed());
                        TextLinkStyles styles = range.getItem().getStyles();
                        SpanStyle style = styles != null ? styles.getStyle() : spanStyle;
                        TextLinkStyles styles2 = range.getItem().getStyles();
                        SpanStyle focusedStyle = styles2 != null ? styles2.getFocusedStyle() : spanStyle;
                        TextLinkStyles styles3 = range.getItem().getStyles();
                        SpanStyle hoveredStyle = styles3 != null ? styles3.getHoveredStyle() : spanStyle;
                        TextLinkStyles styles4 = range.getItem().getStyles();
                        if (styles4 != null) {
                            spanStyle = styles4.getPressedStyle();
                        }
                        Object[] objArr = {valueOf, valueOf2, valueOf3, style, focusedStyle, hoveredStyle, spanStyle};
                        ComposerKt.sourceInformationMarkerStart($composer2, -370873940, "CC(remember):TextLinkScope.kt#9igjgp");
                        boolean invalid$iv2 = $composer2.changedInstance(this) | $composer2.changed(range);
                        Object it$iv5 = $composer2.rememberedValue();
                        if (invalid$iv2 || it$iv5 == Composer.Companion.getEmpty()) {
                            Object value$iv5 = (Function1) new Function1<TextAnnotatorScope, Unit>() { // from class: androidx.compose.foundation.text.TextLinkScope$LinksComposables$1$4$1
                                /* JADX INFO: Access modifiers changed from: package-private */
                                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                {
                                    super(1);
                                }

                                @Override // kotlin.jvm.functions.Function1
                                public /* bridge */ /* synthetic */ Unit invoke(TextAnnotatorScope textAnnotatorScope) {
                                    invoke2(textAnnotatorScope);
                                    return Unit.INSTANCE;
                                }

                                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                                public final void invoke2(TextAnnotatorScope $this$StyleAnnotation) {
                                    SpanStyle spanStyle2;
                                    SpanStyle mergeOrUse;
                                    SpanStyle spanStyle3;
                                    SpanStyle mergeOrUse2;
                                    SpanStyle mergedStyle;
                                    TextLinkStyles styles5;
                                    TextLinkScope textLinkScope = TextLinkScope.this;
                                    TextLinkScope textLinkScope2 = TextLinkScope.this;
                                    TextLinkScope textLinkScope3 = TextLinkScope.this;
                                    TextLinkStyles styles6 = range.getItem().getStyles();
                                    SpanStyle spanStyle4 = null;
                                    SpanStyle style2 = styles6 != null ? styles6.getStyle() : null;
                                    if (linkStateObserver.isFocused()) {
                                        TextLinkStyles styles7 = range.getItem().getStyles();
                                        spanStyle2 = styles7 != null ? styles7.getFocusedStyle() : null;
                                    } else {
                                        spanStyle2 = null;
                                    }
                                    mergeOrUse = textLinkScope3.mergeOrUse(style2, spanStyle2);
                                    if (linkStateObserver.isHovered()) {
                                        TextLinkStyles styles8 = range.getItem().getStyles();
                                        spanStyle3 = styles8 != null ? styles8.getHoveredStyle() : null;
                                    } else {
                                        spanStyle3 = null;
                                    }
                                    mergeOrUse2 = textLinkScope2.mergeOrUse(mergeOrUse, spanStyle3);
                                    if (linkStateObserver.isPressed() && (styles5 = range.getItem().getStyles()) != null) {
                                        spanStyle4 = styles5.getPressedStyle();
                                    }
                                    mergedStyle = textLinkScope.mergeOrUse(mergeOrUse2, spanStyle4);
                                    $this$StyleAnnotation.replaceStyle(range, mergedStyle);
                                }
                            };
                            $composer2.updateRememberedValue(value$iv5);
                            it$iv5 = value$iv5;
                        }
                        ComposerKt.sourceInformationMarkerEnd($composer2);
                        StyleAnnotation(objArr, (Function1) it$iv5, $composer2, ($dirty << 6) & 896);
                        $composer2.endReplaceGroup();
                    } else {
                        uriHandler = uriHandler2;
                        $composer2.startReplaceGroup(1388926990);
                        $composer2.endReplaceGroup();
                    }
                    $composer2.endReplaceGroup();
                } else {
                    uriHandler = uriHandler2;
                    $dirty = $dirty2;
                    links = links2;
                    $this$fastForEach$iv = $this$fastForEach$iv2;
                    z = z2;
                    $composer2.startReplaceGroup(1388940878);
                    $composer2.endReplaceGroup();
                }
                index$iv++;
                z2 = z;
                $this$fastForEach$iv2 = $this$fastForEach$iv;
                uriHandler2 = uriHandler;
                links2 = links;
                $dirty2 = $dirty;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.TextLinkScope$LinksComposables$2
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i) {
                    TextLinkScope.this.LinksComposables(composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final SpanStyle mergeOrUse(SpanStyle $this$mergeOrUse, SpanStyle other) {
        SpanStyle merge;
        return ($this$mergeOrUse == null || (merge = $this$mergeOrUse.merge(other)) == null) ? other : merge;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void handleLink(LinkAnnotation link, UriHandler uriHandler) {
        LinkInteractionListener linkInteractionListener;
        Unit unit;
        if (link instanceof LinkAnnotation.Url) {
            LinkInteractionListener linkInteractionListener2 = link.getLinkInteractionListener();
            if (linkInteractionListener2 != null) {
                linkInteractionListener2.onClick(link);
                unit = Unit.INSTANCE;
            } else {
                unit = null;
            }
            if (unit == null) {
                try {
                    uriHandler.openUri(((LinkAnnotation.Url) link).getUrl());
                } catch (IllegalArgumentException e) {
                }
            }
        } else if (!(link instanceof LinkAnnotation.Clickable) || (linkInteractionListener = link.getLinkInteractionListener()) == null) {
        } else {
            linkInteractionListener.onClick(link);
        }
    }

    public final AnnotatedString applyAnnotators$foundation_release() {
        AnnotatedString styledText;
        if (this.annotators.isEmpty()) {
            styledText = this.text;
        } else {
            TextAnnotatorScope scope = new TextAnnotatorScope(this.text);
            List $this$fastForEach$iv = this.annotators;
            int size = $this$fastForEach$iv.size();
            for (int index$iv = 0; index$iv < size; index$iv++) {
                Object item$iv = $this$fastForEach$iv.get(index$iv);
                Function1 it = (Function1) item$iv;
                it.invoke(scope);
            }
            styledText = scope.getStyledText();
        }
        this.text = styledText;
        return styledText;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void StyleAnnotation(final Object[] keys, final Function1<? super TextAnnotatorScope, Unit> function1, Composer $composer, final int $changed) {
        Composer $composer2 = $composer.startRestartGroup(-2083052099);
        ComposerKt.sourceInformation($composer2, "C(StyleAnnotation)P(1)316@13851L89,316@13820L120:TextLinkScope.kt#423gt5");
        int $dirty = $changed;
        if (($changed & 48) == 0) {
            $dirty |= $composer2.changedInstance(function1) ? 32 : 16;
        }
        if (($changed & 384) == 0) {
            $dirty |= $composer2.changedInstance(this) ? 256 : 128;
        }
        $composer2.startMovableGroup(-416604407, Integer.valueOf(keys.length));
        for (Object value : keys) {
            $dirty |= $composer2.changedInstance(value) ? 4 : 0;
        }
        $composer2.endMovableGroup();
        if (($dirty & 14) == 0) {
            $dirty |= 2;
        }
        if ($composer2.shouldExecute(($dirty & 147) != 146, $dirty & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-2083052099, $dirty, -1, "androidx.compose.foundation.text.TextLinkScope.StyleAnnotation (TextLinkScope.kt:315)");
            }
            SpreadBuilder spreadBuilder = new SpreadBuilder(2);
            spreadBuilder.add(function1);
            spreadBuilder.addSpread(keys);
            Object[] array = spreadBuilder.toArray(new Object[spreadBuilder.size()]);
            ComposerKt.sourceInformationMarkerStart($composer2, -416601199, "CC(remember):TextLinkScope.kt#9igjgp");
            boolean invalid$iv = $composer2.changedInstance(this) | (($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) == 32);
            Object it$iv = $composer2.rememberedValue();
            if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                Object value$iv = (Function1) new Function1<DisposableEffectScope, DisposableEffectResult>() { // from class: androidx.compose.foundation.text.TextLinkScope$StyleAnnotation$1$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    /* JADX WARN: Multi-variable type inference failed */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public final DisposableEffectResult invoke(DisposableEffectScope $this$DisposableEffect) {
                        SnapshotStateList snapshotStateList;
                        snapshotStateList = TextLinkScope.this.annotators;
                        snapshotStateList.add(function1);
                        final TextLinkScope textLinkScope = TextLinkScope.this;
                        final Function1<TextAnnotatorScope, Unit> function12 = function1;
                        return new DisposableEffectResult() { // from class: androidx.compose.foundation.text.TextLinkScope$StyleAnnotation$1$1$invoke$$inlined$onDispose$1
                            @Override // androidx.compose.runtime.DisposableEffectResult
                            public void dispose() {
                                SnapshotStateList snapshotStateList2;
                                snapshotStateList2 = TextLinkScope.this.annotators;
                                snapshotStateList2.remove(function12);
                            }
                        };
                    }
                };
                $composer2.updateRememberedValue(value$iv);
                it$iv = value$iv;
            }
            ComposerKt.sourceInformationMarkerEnd($composer2);
            EffectsKt.DisposableEffect(array, (Function1<? super DisposableEffectScope, ? extends DisposableEffectResult>) it$iv, $composer2, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.TextLinkScope$StyleAnnotation$2
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

                public final void invoke(Composer composer, int i) {
                    TextLinkScope.this.StyleAnnotation(Arrays.copyOf(keys, keys.length), function1, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }
}
