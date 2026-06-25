package androidx.compose.foundation.text;

import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.ComposedModifierKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.layout.LayoutModifierKt;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.platform.CompositionLocalsKt;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.TextStyleKt;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontSynthesis;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.LayoutDirection;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.ranges.RangesKt;
/* compiled from: TextFieldSize.kt */
@Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\u001a\u0014\u0010\u0000\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0000¨\u0006\u0004²\u0006\n\u0010\u0005\u001a\u00020\u0006X\u008a\u0084\u0002"}, d2 = {"textFieldMinSize", "Landroidx/compose/ui/Modifier;", "style", "Landroidx/compose/ui/text/TextStyle;", "foundation_release", "typeface", ""}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextFieldSizeKt {
    public static final Modifier textFieldMinSize(Modifier $this$textFieldMinSize, final TextStyle style) {
        return ComposedModifierKt.composed$default($this$textFieldMinSize, null, new Function3<Modifier, Composer, Integer, Modifier>() { // from class: androidx.compose.foundation.text.TextFieldSizeKt$textFieldMinSize$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(3);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ Modifier invoke(Modifier modifier, Composer composer, Integer num) {
                return invoke(modifier, composer, num.intValue());
            }

            public final Modifier invoke(Modifier $this$composed, Composer $composer, int $changed) {
                TextStyle resolvedStyle;
                $composer.startReplaceGroup(1582736677);
                ComposerKt.sourceInformation($composer, "C37@1534L7,38@1595L7,39@1650L7,41@1683L76,43@1788L340,52@2153L101,58@2372L487:TextFieldSize.kt#423gt5");
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventStart(1582736677, $changed, -1, "androidx.compose.foundation.text.textFieldMinSize.<anonymous> (TextFieldSize.kt:37)");
                }
                ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                Object consume = $composer.consume(CompositionLocalsKt.getLocalDensity());
                ComposerKt.sourceInformationMarkerEnd($composer);
                Density density = (Density) consume;
                ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                Object consume2 = $composer.consume(CompositionLocalsKt.getLocalFontFamilyResolver());
                ComposerKt.sourceInformationMarkerEnd($composer);
                FontFamily.Resolver fontFamilyResolver = (FontFamily.Resolver) consume2;
                ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                Object consume3 = $composer.consume(CompositionLocalsKt.getLocalLayoutDirection());
                ComposerKt.sourceInformationMarkerEnd($composer);
                LayoutDirection layoutDirection = (LayoutDirection) consume3;
                ComposerKt.sourceInformationMarkerStart($composer, 979653560, "CC(remember):TextFieldSize.kt#9igjgp");
                boolean invalid$iv = $composer.changed(TextStyle.this) | $composer.changed(layoutDirection);
                TextStyle textStyle = TextStyle.this;
                Object it$iv = $composer.rememberedValue();
                if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                    Object value$iv = TextStyleKt.resolveDefaults(textStyle, layoutDirection);
                    $composer.updateRememberedValue(value$iv);
                    it$iv = value$iv;
                }
                TextStyle resolvedStyle2 = (TextStyle) it$iv;
                ComposerKt.sourceInformationMarkerEnd($composer);
                ComposerKt.sourceInformationMarkerStart($composer, 979657184, "CC(remember):TextFieldSize.kt#9igjgp");
                boolean invalid$iv2 = $composer.changed(fontFamilyResolver) | $composer.changed(resolvedStyle2);
                Object it$iv2 = $composer.rememberedValue();
                if (invalid$iv2 || it$iv2 == Composer.Companion.getEmpty()) {
                    FontFamily fontFamily = resolvedStyle2.getFontFamily();
                    FontWeight fontWeight = resolvedStyle2.getFontWeight();
                    if (fontWeight == null) {
                        fontWeight = FontWeight.Companion.getNormal();
                    }
                    FontStyle m6371getFontStyle4Lr2A7w = resolvedStyle2.m6371getFontStyle4Lr2A7w();
                    resolvedStyle = resolvedStyle2;
                    int m6453unboximpl = m6371getFontStyle4Lr2A7w != null ? m6371getFontStyle4Lr2A7w.m6453unboximpl() : FontStyle.Companion.m6457getNormal_LCdwA();
                    FontSynthesis m6372getFontSynthesisZQGJjVo = resolvedStyle.m6372getFontSynthesisZQGJjVo();
                    Object value$iv2 = fontFamilyResolver.mo6423resolveDPcqOEQ(fontFamily, fontWeight, m6453unboximpl, m6372getFontSynthesisZQGJjVo != null ? m6372getFontSynthesisZQGJjVo.m6466unboximpl() : FontSynthesis.Companion.m6467getAllGVVA2EU());
                    $composer.updateRememberedValue(value$iv2);
                    it$iv2 = value$iv2;
                } else {
                    resolvedStyle = resolvedStyle2;
                }
                State typeface$delegate = (State) it$iv2;
                ComposerKt.sourceInformationMarkerEnd($composer);
                ComposerKt.sourceInformationMarkerStart($composer, 979668625, "CC(remember):TextFieldSize.kt#9igjgp");
                TextStyle textStyle2 = TextStyle.this;
                Object it$iv3 = $composer.rememberedValue();
                if (it$iv3 == Composer.Companion.getEmpty()) {
                    Object value$iv3 = new TextFieldSize(layoutDirection, density, fontFamilyResolver, textStyle2, typeface$delegate.getValue());
                    $composer.updateRememberedValue(value$iv3);
                    it$iv3 = value$iv3;
                }
                final TextFieldSize minSizeState = (TextFieldSize) it$iv3;
                ComposerKt.sourceInformationMarkerEnd($composer);
                minSizeState.update(layoutDirection, density, fontFamilyResolver, resolvedStyle, typeface$delegate.getValue());
                Modifier.Companion companion = Modifier.Companion;
                ComposerKt.sourceInformationMarkerStart($composer, 979676019, "CC(remember):TextFieldSize.kt#9igjgp");
                boolean invalid$iv3 = $composer.changedInstance(minSizeState);
                Object it$iv4 = $composer.rememberedValue();
                if (invalid$iv3 || it$iv4 == Composer.Companion.getEmpty()) {
                    Object value$iv4 = (Function3) new Function3<MeasureScope, Measurable, Constraints, MeasureResult>() { // from class: androidx.compose.foundation.text.TextFieldSizeKt$textFieldMinSize$1$1$1
                        /* JADX INFO: Access modifiers changed from: package-private */
                        {
                            super(3);
                        }

                        @Override // kotlin.jvm.functions.Function3
                        public /* bridge */ /* synthetic */ MeasureResult invoke(MeasureScope measureScope, Measurable measurable, Constraints constraints) {
                            return m1428invoke3p2s80s(measureScope, measurable, constraints.m6832unboximpl());
                        }

                        /* renamed from: invoke-3p2s80s  reason: not valid java name */
                        public final MeasureResult m1428invoke3p2s80s(MeasureScope $this$layout, Measurable measurable, long constraints) {
                            long childConstraints;
                            long minSize = TextFieldSize.this.m1427getMinSizeYbymL2g();
                            childConstraints = Constraints.m6815copyZbe2FdA(constraints, (r12 & 1) != 0 ? Constraints.m6828getMinWidthimpl(constraints) : RangesKt.coerceIn((int) (minSize >> 32), Constraints.m6828getMinWidthimpl(constraints), Constraints.m6826getMaxWidthimpl(constraints)), (r12 & 2) != 0 ? Constraints.m6826getMaxWidthimpl(constraints) : 0, (r12 & 4) != 0 ? Constraints.m6827getMinHeightimpl(constraints) : RangesKt.coerceIn((int) (4294967295L & minSize), Constraints.m6827getMinHeightimpl(constraints), Constraints.m6825getMaxHeightimpl(constraints)), (r12 & 8) != 0 ? Constraints.m6825getMaxHeightimpl(constraints) : 0);
                            final Placeable measured = measurable.mo5637measureBRTryo0(childConstraints);
                            return MeasureScope.layout$default($this$layout, measured.getWidth(), measured.getHeight(), null, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.text.TextFieldSizeKt$textFieldMinSize$1$1$1.1
                                {
                                    super(1);
                                }

                                @Override // kotlin.jvm.functions.Function1
                                public /* bridge */ /* synthetic */ Unit invoke(Placeable.PlacementScope placementScope) {
                                    invoke2(placementScope);
                                    return Unit.INSTANCE;
                                }

                                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                                public final void invoke2(Placeable.PlacementScope $this$layout2) {
                                    Placeable.PlacementScope.placeRelative$default($this$layout2, Placeable.this, 0, 0, 0.0f, 4, null);
                                }
                            }, 4, null);
                        }
                    };
                    $composer.updateRememberedValue(value$iv4);
                    it$iv4 = value$iv4;
                }
                ComposerKt.sourceInformationMarkerEnd($composer);
                Modifier layout = LayoutModifierKt.layout(companion, (Function3) it$iv4);
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventEnd();
                }
                $composer.endReplaceGroup();
                return layout;
            }
        }, 1, null);
    }
}
