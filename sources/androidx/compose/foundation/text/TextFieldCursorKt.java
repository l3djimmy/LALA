package androidx.compose.foundation.text;

import androidx.compose.foundation.text.input.internal.CursorAnimationState;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.EffectsKt;
import androidx.compose.ui.ComposedModifierKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.draw.DrawModifierKt;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.graphics.Brush;
import androidx.compose.ui.graphics.SolidColor;
import androidx.compose.ui.graphics.drawscope.ContentDrawScope;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.platform.CompositionLocalsKt;
import androidx.compose.ui.platform.WindowInfo;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.input.OffsetMapping;
import androidx.compose.ui.text.input.TextFieldValue;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.ranges.RangesKt;
/* compiled from: TextFieldCursor.kt */
@Metadata(d1 = {"\u0000&\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\u001a4\u0010\u0000\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0000¨\u0006\f"}, d2 = {"cursor", "Landroidx/compose/ui/Modifier;", "state", "Landroidx/compose/foundation/text/LegacyTextFieldState;", "value", "Landroidx/compose/ui/text/input/TextFieldValue;", "offsetMapping", "Landroidx/compose/ui/text/input/OffsetMapping;", "cursorBrush", "Landroidx/compose/ui/graphics/Brush;", "enabled", "", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextFieldCursorKt {
    public static final Modifier cursor(Modifier $this$cursor, final LegacyTextFieldState state, final TextFieldValue value, final OffsetMapping offsetMapping, final Brush cursorBrush, boolean enabled) {
        if (enabled) {
            return ComposedModifierKt.composed$default($this$cursor, null, new Function3<Modifier, Composer, Integer, Modifier>() { // from class: androidx.compose.foundation.text.TextFieldCursorKt$cursor$1
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
                    Modifier.Companion companion;
                    $composer.startReplaceGroup(-84507373);
                    ComposerKt.sourceInformation($composer, "C46@1734L7,47@1776L63,54@2289L7:TextFieldCursor.kt#423gt5");
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventStart(-84507373, $changed, -1, "androidx.compose.foundation.text.cursor.<anonymous> (TextFieldCursor.kt:46)");
                    }
                    ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                    Object consume = $composer.consume(CompositionLocalsKt.getLocalCursorBlinkEnabled());
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    boolean animateCursor = ((Boolean) consume).booleanValue();
                    ComposerKt.sourceInformationMarkerStart($composer, 1411529339, "CC(remember):TextFieldCursor.kt#9igjgp");
                    boolean invalid$iv = $composer.changed(animateCursor);
                    Object it$iv = $composer.rememberedValue();
                    if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                        Object value$iv = new CursorAnimationState(animateCursor);
                        $composer.updateRememberedValue(value$iv);
                        it$iv = value$iv;
                    }
                    final CursorAnimationState cursorAnimation = (CursorAnimationState) it$iv;
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    boolean isBrushSpecified = true;
                    if (Brush.this instanceof SolidColor) {
                        long $this$isUnspecified$iv = ((SolidColor) Brush.this).m4624getValue0d7_KjU();
                        if (($this$isUnspecified$iv == 16 ? 1 : 0) != 0) {
                            isBrushSpecified = false;
                        }
                    }
                    ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                    Object consume2 = $composer.consume(CompositionLocalsKt.getLocalWindowInfo());
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    boolean isWindowFocused = ((WindowInfo) consume2).isWindowFocused();
                    if (isWindowFocused && state.getHasFocus() && TextRange.m6333getCollapsedimpl(value.m6587getSelectiond9O1mEE()) && isBrushSpecified) {
                        $composer.startReplaceGroup(808460990);
                        ComposerKt.sourceInformation($composer, "58@2516L81,58@2461L136,61@2630L1887");
                        AnnotatedString annotatedString = value.getAnnotatedString();
                        TextRange m6327boximpl = TextRange.m6327boximpl(value.m6587getSelectiond9O1mEE());
                        ComposerKt.sourceInformationMarkerStart($composer, 1411553037, "CC(remember):TextFieldCursor.kt#9igjgp");
                        boolean invalid$iv2 = $composer.changedInstance(cursorAnimation);
                        Object it$iv2 = $composer.rememberedValue();
                        if (invalid$iv2 || it$iv2 == Composer.Companion.getEmpty()) {
                            Object value$iv2 = (Function2) new TextFieldCursorKt$cursor$1$1$1(cursorAnimation, null);
                            $composer.updateRememberedValue(value$iv2);
                            it$iv2 = value$iv2;
                        }
                        ComposerKt.sourceInformationMarkerEnd($composer);
                        EffectsKt.LaunchedEffect(annotatedString, m6327boximpl, (Function2) it$iv2, $composer, 0);
                        ComposerKt.sourceInformationMarkerStart($composer, 1411558491, "CC(remember):TextFieldCursor.kt#9igjgp");
                        boolean invalid$iv3 = $composer.changedInstance(cursorAnimation) | $composer.changedInstance(offsetMapping) | $composer.changed(value) | $composer.changedInstance(state) | $composer.changed(Brush.this);
                        final OffsetMapping offsetMapping2 = offsetMapping;
                        final TextFieldValue textFieldValue = value;
                        final LegacyTextFieldState legacyTextFieldState = state;
                        final Brush brush = Brush.this;
                        Object it$iv3 = $composer.rememberedValue();
                        if (invalid$iv3 || it$iv3 == Composer.Companion.getEmpty()) {
                            Object value$iv3 = (Function1) new Function1<ContentDrawScope, Unit>() { // from class: androidx.compose.foundation.text.TextFieldCursorKt$cursor$1$2$1
                                /* JADX INFO: Access modifiers changed from: package-private */
                                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                {
                                    super(1);
                                }

                                @Override // kotlin.jvm.functions.Function1
                                public /* bridge */ /* synthetic */ Unit invoke(ContentDrawScope contentDrawScope) {
                                    invoke2(contentDrawScope);
                                    return Unit.INSTANCE;
                                }

                                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                                public final void invoke2(ContentDrawScope $this$drawWithContent) {
                                    Rect rect;
                                    float rint;
                                    TextLayoutResult value2;
                                    $this$drawWithContent.drawContent();
                                    float cursorAlphaValue = CursorAnimationState.this.getCursorAlpha();
                                    if (!(cursorAlphaValue == 0.0f)) {
                                        int transformedOffset = offsetMapping2.originalToTransformed(TextRange.m6339getStartimpl(textFieldValue.m6587getSelectiond9O1mEE()));
                                        TextLayoutResultProxy layoutResult = legacyTextFieldState.getLayoutResult();
                                        if (layoutResult == null || (value2 = layoutResult.getValue()) == null || (rect = value2.getCursorRect(transformedOffset)) == null) {
                                            rect = new Rect(0.0f, 0.0f, 0.0f, 0.0f);
                                        }
                                        Rect cursorRect = rect;
                                        float cursorWidth = RangesKt.coerceAtLeast((float) Math.floor($this$drawWithContent.mo644toPx0680j_4(TextFieldCursor_androidKt.getDefaultCursorThickness())), 1.0f);
                                        float left = cursorRect.getLeft() + (cursorWidth / 2.0f);
                                        long arg0$iv = $this$drawWithContent.mo4840getSizeNHjbRc();
                                        int bits$iv$iv$iv = (int) (arg0$iv >> 32);
                                        float it = RangesKt.coerceAtLeast(RangesKt.coerceAtMost(left, Float.intBitsToFloat(bits$iv$iv$iv) - (cursorWidth / 2.0f)), cursorWidth / 2.0f);
                                        if (((int) cursorWidth) % 2 == 1) {
                                            rint = ((float) Math.floor(it)) + 0.5f;
                                        } else {
                                            rint = (float) Math.rint(it);
                                        }
                                        float cursorX = rint;
                                        float y$iv = cursorRect.getTop();
                                        long v1$iv$iv = Float.floatToRawIntBits(cursorX);
                                        long v2$iv$iv = Float.floatToRawIntBits(y$iv);
                                        long m4040constructorimpl = Offset.m4040constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L));
                                        float y$iv2 = cursorRect.getBottom();
                                        long v1$iv$iv2 = Float.floatToRawIntBits(cursorX);
                                        long v2$iv$iv2 = Float.floatToRawIntBits(y$iv2);
                                        DrawScope.m4825drawLine1RTmtNc$default($this$drawWithContent, brush, m4040constructorimpl, Offset.m4040constructorimpl((v1$iv$iv2 << 32) | (v2$iv$iv2 & 4294967295L)), cursorWidth, 0, null, cursorAlphaValue, null, 0, 432, null);
                                    }
                                }
                            };
                            $composer.updateRememberedValue(value$iv3);
                            it$iv3 = value$iv3;
                        }
                        ComposerKt.sourceInformationMarkerEnd($composer);
                        companion = DrawModifierKt.drawWithContent($this$composed, (Function1) it$iv3);
                        $composer.endReplaceGroup();
                    } else {
                        $composer.startReplaceGroup(810474750);
                        $composer.endReplaceGroup();
                        companion = Modifier.Companion;
                    }
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventEnd();
                    }
                    $composer.endReplaceGroup();
                    return companion;
                }
            }, 1, null);
        }
        return $this$cursor;
    }
}
