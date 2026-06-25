package androidx.compose.foundation.text;

import androidx.compose.foundation.internal.InlineClassHelperKt;
import androidx.compose.foundation.layout.SizeKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.ComposedModifierKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.platform.CompositionLocalsKt;
import androidx.compose.ui.platform.InspectableValueKt;
import androidx.compose.ui.platform.InspectorInfo;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.TextStyleKt;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontSynthesis;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.Dp;
import androidx.compose.ui.unit.LayoutDirection;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
/* compiled from: HeightInLinesModifier.kt */
@Metadata(d1 = {"\u0000\"\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\u001a\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0000\u001a(\u0010\u0006\u001a\u00020\u0007*\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\u0004\u001a\u00020\u00012\b\b\u0002\u0010\u0005\u001a\u00020\u0001H\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0080T¢\u0006\u0002\n\u0000¨\u0006\n²\u0006\n\u0010\u000b\u001a\u00020\fX\u008a\u0084\u0002"}, d2 = {"DefaultMinLines", "", "validateMinMaxLines", "", "minLines", "maxLines", "heightInLines", "Landroidx/compose/ui/Modifier;", "textStyle", "Landroidx/compose/ui/text/TextStyle;", "foundation_release", "typeface", ""}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class HeightInLinesModifierKt {
    public static final int DefaultMinLines = 1;

    public static /* synthetic */ Modifier heightInLines$default(Modifier modifier, TextStyle textStyle, int i, int i2, int i3, Object obj) {
        if ((i3 & 2) != 0) {
            i = 1;
        }
        if ((i3 & 4) != 0) {
            i2 = Integer.MAX_VALUE;
        }
        return heightInLines(modifier, textStyle, i, i2);
    }

    public static final Modifier heightInLines(Modifier $this$heightInLines, final TextStyle textStyle, final int minLines, final int maxLines) {
        return ComposedModifierKt.composed($this$heightInLines, InspectableValueKt.isDebugInspectorInfoEnabled() ? new Function1<InspectorInfo, Unit>() { // from class: androidx.compose.foundation.text.HeightInLinesModifierKt$heightInLines$$inlined$debugInspectorInfo$1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(InspectorInfo inspectorInfo) {
                invoke2(inspectorInfo);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(InspectorInfo $this$null) {
                $this$null.setName("heightInLines");
                $this$null.getProperties().set("minLines", Integer.valueOf(minLines));
                $this$null.getProperties().set("maxLines", Integer.valueOf(maxLines));
                $this$null.getProperties().set("textStyle", textStyle);
            }
        } : InspectableValueKt.getNoInspectorInfo(), new Function3<Modifier, Composer, Integer, Modifier>() { // from class: androidx.compose.foundation.text.HeightInLinesModifierKt$heightInLines$2
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(3);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ Modifier invoke(Modifier modifier, Composer composer, Integer num) {
                return invoke(modifier, composer, num.intValue());
            }

            public final Modifier invoke(Modifier $this$composed, Composer $composer, int $changed) {
                long j;
                Density density;
                $composer.startReplaceGroup(408240218);
                ComposerKt.sourceInformation($composer, "C65@2531L7,66@2596L7,67@2655L7,72@2850L84,74@2971L368,84@3383L429,96@3860L499:HeightInLinesModifier.kt#423gt5");
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventStart(408240218, $changed, -1, "androidx.compose.foundation.text.heightInLines.<anonymous> (HeightInLinesModifier.kt:62)");
                }
                HeightInLinesModifierKt.validateMinMaxLines(minLines, maxLines);
                if (minLines == 1 && maxLines == Integer.MAX_VALUE) {
                    Modifier.Companion companion = Modifier.Companion;
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventEnd();
                    }
                    $composer.endReplaceGroup();
                    return companion;
                }
                ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                Object consume = $composer.consume(CompositionLocalsKt.getLocalDensity());
                ComposerKt.sourceInformationMarkerEnd($composer);
                Density density2 = (Density) consume;
                ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                Object consume2 = $composer.consume(CompositionLocalsKt.getLocalFontFamilyResolver());
                ComposerKt.sourceInformationMarkerEnd($composer);
                FontFamily.Resolver fontFamilyResolver = (FontFamily.Resolver) consume2;
                ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                Object consume3 = $composer.consume(CompositionLocalsKt.getLocalLayoutDirection());
                ComposerKt.sourceInformationMarkerEnd($composer);
                LayoutDirection layoutDirection = (LayoutDirection) consume3;
                ComposerKt.sourceInformationMarkerStart($composer, -1954445377, "CC(remember):HeightInLinesModifier.kt#9igjgp");
                boolean invalid$iv = $composer.changed(textStyle) | $composer.changed(layoutDirection);
                TextStyle textStyle2 = textStyle;
                Object it$iv = $composer.rememberedValue();
                if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                    Object value$iv = TextStyleKt.resolveDefaults(textStyle2, layoutDirection);
                    $composer.updateRememberedValue(value$iv);
                    it$iv = value$iv;
                }
                TextStyle resolvedStyle = (TextStyle) it$iv;
                ComposerKt.sourceInformationMarkerEnd($composer);
                ComposerKt.sourceInformationMarkerStart($composer, -1954441221, "CC(remember):HeightInLinesModifier.kt#9igjgp");
                boolean invalid$iv2 = $composer.changed(fontFamilyResolver) | $composer.changed(resolvedStyle);
                Object it$iv2 = $composer.rememberedValue();
                if (invalid$iv2 || it$iv2 == Composer.Companion.getEmpty()) {
                    FontFamily fontFamily = resolvedStyle.getFontFamily();
                    FontWeight fontWeight = resolvedStyle.getFontWeight();
                    if (fontWeight == null) {
                        fontWeight = FontWeight.Companion.getNormal();
                    }
                    FontWeight fontWeight2 = fontWeight;
                    FontStyle m6371getFontStyle4Lr2A7w = resolvedStyle.m6371getFontStyle4Lr2A7w();
                    int m6453unboximpl = m6371getFontStyle4Lr2A7w != null ? m6371getFontStyle4Lr2A7w.m6453unboximpl() : FontStyle.Companion.m6457getNormal_LCdwA();
                    FontSynthesis m6372getFontSynthesisZQGJjVo = resolvedStyle.m6372getFontSynthesisZQGJjVo();
                    Object value$iv2 = fontFamilyResolver.mo6423resolveDPcqOEQ(fontFamily, fontWeight2, m6453unboximpl, m6372getFontSynthesisZQGJjVo != null ? m6372getFontSynthesisZQGJjVo.m6466unboximpl() : FontSynthesis.Companion.m6467getAllGVVA2EU());
                    $composer.updateRememberedValue(value$iv2);
                    it$iv2 = value$iv2;
                }
                State typeface$delegate = (State) it$iv2;
                ComposerKt.sourceInformationMarkerEnd($composer);
                Object value = typeface$delegate.getValue();
                ComposerKt.sourceInformationMarkerStart($composer, -1954427976, "CC(remember):HeightInLinesModifier.kt#9igjgp");
                boolean invalid$iv3 = $composer.changed(value) | $composer.changed(density2) | $composer.changed(fontFamilyResolver) | $composer.changed(textStyle) | $composer.changed(layoutDirection);
                Object it$iv3 = $composer.rememberedValue();
                if (invalid$iv3 || it$iv3 == Composer.Companion.getEmpty()) {
                    j = 4294967295L;
                    long arg0$iv = TextFieldDelegateKt.computeSizeForDefaultText(resolvedStyle, density2, fontFamilyResolver, TextFieldDelegateKt.getEmptyTextReplacement(), 1);
                    Object value$iv3 = Integer.valueOf((int) (arg0$iv & 4294967295L));
                    $composer.updateRememberedValue(value$iv3);
                    it$iv3 = value$iv3;
                } else {
                    j = 4294967295L;
                }
                int firstLineHeight = ((Number) it$iv3).intValue();
                ComposerKt.sourceInformationMarkerEnd($composer);
                Object value2 = typeface$delegate.getValue();
                ComposerKt.sourceInformationMarkerStart($composer, -1954412642, "CC(remember):HeightInLinesModifier.kt#9igjgp");
                boolean invalid$iv4 = $composer.changed(value2) | $composer.changed(density2) | $composer.changed(fontFamilyResolver) | $composer.changed(textStyle) | $composer.changed(layoutDirection);
                Object it$iv4 = $composer.rememberedValue();
                if (invalid$iv4 || it$iv4 == Composer.Companion.getEmpty()) {
                    String twoLines = TextFieldDelegateKt.getEmptyTextReplacement() + '\n' + TextFieldDelegateKt.getEmptyTextReplacement();
                    long arg0$iv2 = TextFieldDelegateKt.computeSizeForDefaultText(resolvedStyle, density2, fontFamilyResolver, twoLines, 2);
                    density = density2;
                    Object value$iv4 = Integer.valueOf((int) (arg0$iv2 & j));
                    $composer.updateRememberedValue(value$iv4);
                    it$iv4 = value$iv4;
                } else {
                    density = density2;
                }
                int firstTwoLinesHeight = ((Number) it$iv4).intValue();
                ComposerKt.sourceInformationMarkerEnd($composer);
                int lineHeight = firstTwoLinesHeight - firstLineHeight;
                Integer precomputedMinLinesHeight = minLines == 1 ? null : Integer.valueOf(((minLines - 1) * lineHeight) + firstLineHeight);
                Integer precomputedMaxLinesHeight = maxLines != Integer.MAX_VALUE ? Integer.valueOf(((maxLines - 1) * lineHeight) + firstLineHeight) : null;
                Density $this$invoke_u24lambda_u245 = density;
                Modifier m1027heightInVpY3zN4 = SizeKt.m1027heightInVpY3zN4(Modifier.Companion, precomputedMinLinesHeight != null ? $this$invoke_u24lambda_u245.mo641toDpu2uoSUM(precomputedMinLinesHeight.intValue()) : Dp.Companion.m6893getUnspecifiedD9Ej5fM(), precomputedMaxLinesHeight != null ? $this$invoke_u24lambda_u245.mo641toDpu2uoSUM(precomputedMaxLinesHeight.intValue()) : Dp.Companion.m6893getUnspecifiedD9Ej5fM());
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventEnd();
                }
                $composer.endReplaceGroup();
                return m1027heightInVpY3zN4;
            }
        });
    }

    public static final void validateMinMaxLines(int minLines, int maxLines) {
        boolean value$iv = minLines > 0 && maxLines > 0;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("both minLines " + minLines + " and maxLines " + maxLines + " must be greater than zero");
        }
        boolean value$iv2 = minLines <= maxLines;
        if (value$iv2) {
            return;
        }
        InlineClassHelperKt.throwIllegalArgumentException("minLines " + minLines + " must be less than or equal to maxLines " + maxLines);
    }
}
