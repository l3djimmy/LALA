package androidx.compose.foundation.text.input.internal;

import androidx.compose.foundation.internal.InlineClassHelperKt;
import androidx.compose.foundation.text.input.TextFieldBuffer;
import androidx.compose.foundation.text.input.TextFieldBufferKt;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.TextRangeKt;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.ranges.RangesKt;
/* compiled from: ImeEditCommand.android.kt */
@Metadata(d1 = {"\u0000L\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\f\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\r\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a\u0018\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0003H\u0002\u001a\u001c\u0010\u0005\u001a\u00020\u0006*\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0000\u001a\u001c\u0010\f\u001a\u00020\u0006*\u00020\u00072\u0006\u0010\r\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\u000bH\u0000\u001a\u001c\u0010\u000f\u001a\u00020\u0006*\u00020\u00072\u0006\u0010\r\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\u000bH\u0000\u001a\f\u0010\u0010\u001a\u00020\u0006*\u00020\u0007H\u0000\u001a\u001c\u0010\u0011\u001a\u00020\u0006*\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\u000bH\u0001\u001a$\u0010\u0015\u001a\u00020\u0006*\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u0016H\u0001\u001a\u001c\u0010\u0017\u001a\u00020\u0006*\u00020\u00072\u0006\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\u000bH\u0000\u001a8\u0010\u0018\u001a\u00020\u0006*\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u001a\b\u0002\u0010\u0019\u001a\u0014\u0012\u000e\u0012\f\u0012\u0004\u0012\u00020\u001c0\u001bj\u0002`\u001d\u0018\u00010\u001aH\u0000\u001a\u001c\u0010\u001e\u001a\u00020\u0006*\u00020\u00072\u0006\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\u000bH\u0000¨\u0006\u001f"}, d2 = {"isSurrogatePair", "", "high", "", "low", "commitText", "", "Landroidx/compose/foundation/text/input/internal/ImeEditCommandScope;", "text", "", "newCursorPosition", "", "deleteSurroundingText", "lengthBeforeCursor", "lengthAfterCursor", "deleteSurroundingTextInCodePoints", "finishComposingText", "imeDelete", "Landroidx/compose/foundation/text/input/TextFieldBuffer;", "start", "end", "imeReplace", "", "setComposingRegion", "setComposingText", "annotations", "", "Landroidx/compose/ui/text/AnnotatedString$Range;", "Landroidx/compose/ui/text/AnnotatedString$Annotation;", "Landroidx/compose/foundation/text/input/PlacedAnnotation;", "setSelection", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ImeEditCommand_androidKt {
    public static final void commitText(ImeEditCommandScope $this$commitText, final String text, final int newCursorPosition) {
        $this$commitText.edit(new Function1<TextFieldBuffer, Unit>() { // from class: androidx.compose.foundation.text.input.internal.ImeEditCommand_androidKt$commitText$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(TextFieldBuffer textFieldBuffer) {
                invoke2(textFieldBuffer);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(TextFieldBuffer $this$edit) {
                int newCursorInBuffer;
                TextRange compositionRange = $this$edit.m1446getCompositionMzsxiRA$foundation_release();
                if (compositionRange != null) {
                    ImeEditCommand_androidKt.imeReplace($this$edit, TextRange.m6339getStartimpl(compositionRange.m6343unboximpl()), TextRange.m6334getEndimpl(compositionRange.m6343unboximpl()), text);
                } else {
                    ImeEditCommand_androidKt.imeReplace($this$edit, TextRange.m6339getStartimpl($this$edit.m1448getSelectiond9O1mEE()), TextRange.m6334getEndimpl($this$edit.m1448getSelectiond9O1mEE()), text);
                }
                int newCursor = TextRange.m6339getStartimpl($this$edit.m1448getSelectiond9O1mEE());
                int i = newCursorPosition;
                int i2 = newCursorPosition;
                if (i > 0) {
                    newCursorInBuffer = (i2 + newCursor) - 1;
                } else {
                    newCursorInBuffer = (i2 + newCursor) - text.length();
                }
                $this$edit.m1450setSelection5zctL8(TextRangeKt.TextRange(RangesKt.coerceIn(newCursorInBuffer, 0, $this$edit.getLength())));
            }
        });
    }

    public static final void setComposingRegion(ImeEditCommandScope $this$setComposingRegion, final int start, final int end) {
        $this$setComposingRegion.edit(new Function1<TextFieldBuffer, Unit>() { // from class: androidx.compose.foundation.text.input.internal.ImeEditCommand_androidKt$setComposingRegion$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(TextFieldBuffer textFieldBuffer) {
                invoke2(textFieldBuffer);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(TextFieldBuffer $this$edit) {
                if ($this$edit.hasComposition$foundation_release()) {
                    $this$edit.commitComposition$foundation_release();
                }
                int clampedStart = RangesKt.coerceIn(start, 0, $this$edit.getLength());
                int clampedEnd = RangesKt.coerceIn(end, 0, $this$edit.getLength());
                if (clampedStart != clampedEnd) {
                    if (clampedStart < clampedEnd) {
                        TextFieldBuffer.setComposition$foundation_release$default($this$edit, clampedStart, clampedEnd, null, 4, null);
                    } else {
                        TextFieldBuffer.setComposition$foundation_release$default($this$edit, clampedEnd, clampedStart, null, 4, null);
                    }
                }
            }
        });
    }

    public static /* synthetic */ void setComposingText$default(ImeEditCommandScope imeEditCommandScope, String str, int i, List list, int i2, Object obj) {
        if ((i2 & 4) != 0) {
            list = null;
        }
        setComposingText(imeEditCommandScope, str, i, list);
    }

    public static final void setComposingText(ImeEditCommandScope $this$setComposingText, final String text, final int newCursorPosition, final List<AnnotatedString.Range<AnnotatedString.Annotation>> list) {
        $this$setComposingText.edit(new Function1<TextFieldBuffer, Unit>() { // from class: androidx.compose.foundation.text.input.internal.ImeEditCommand_androidKt$setComposingText$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(TextFieldBuffer textFieldBuffer) {
                invoke2(textFieldBuffer);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(TextFieldBuffer $this$edit) {
                int newCursorInBuffer;
                TextRange compositionRange = $this$edit.m1446getCompositionMzsxiRA$foundation_release();
                if (compositionRange != null) {
                    ImeEditCommand_androidKt.imeReplace($this$edit, TextRange.m6339getStartimpl(compositionRange.m6343unboximpl()), TextRange.m6334getEndimpl(compositionRange.m6343unboximpl()), text);
                    if (text.length() > 0) {
                        $this$edit.setComposition$foundation_release(TextRange.m6339getStartimpl(compositionRange.m6343unboximpl()), TextRange.m6339getStartimpl(compositionRange.m6343unboximpl()) + text.length(), list);
                    }
                } else {
                    int initialSelectionStart = TextRange.m6339getStartimpl($this$edit.m1448getSelectiond9O1mEE());
                    ImeEditCommand_androidKt.imeReplace($this$edit, initialSelectionStart, TextRange.m6334getEndimpl($this$edit.m1448getSelectiond9O1mEE()), text);
                    if (text.length() > 0) {
                        $this$edit.setComposition$foundation_release(initialSelectionStart, text.length() + initialSelectionStart, list);
                    }
                }
                int newCursor = TextRange.m6339getStartimpl($this$edit.m1448getSelectiond9O1mEE());
                int i = newCursorPosition;
                int i2 = newCursorPosition;
                if (i > 0) {
                    newCursorInBuffer = (i2 + newCursor) - 1;
                } else {
                    newCursorInBuffer = (i2 + newCursor) - text.length();
                }
                $this$edit.m1450setSelection5zctL8(TextRangeKt.TextRange(RangesKt.coerceIn(newCursorInBuffer, 0, $this$edit.getLength())));
            }
        });
    }

    public static final void deleteSurroundingText(ImeEditCommandScope $this$deleteSurroundingText, final int lengthBeforeCursor, final int lengthAfterCursor) {
        $this$deleteSurroundingText.edit(new Function1<TextFieldBuffer, Unit>() { // from class: androidx.compose.foundation.text.input.internal.ImeEditCommand_androidKt$deleteSurroundingText$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(TextFieldBuffer textFieldBuffer) {
                invoke2(textFieldBuffer);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(TextFieldBuffer $this$edit) {
                boolean value$iv = lengthBeforeCursor >= 0 && lengthAfterCursor >= 0;
                int i = lengthBeforeCursor;
                int i2 = lengthAfterCursor;
                if (!value$iv) {
                    InlineClassHelperKt.throwIllegalArgumentException("Expected lengthBeforeCursor and lengthAfterCursor to be non-negative, were " + i + " and " + i2 + " respectively.");
                }
                int $this$addExactOrElse$iv = TextRange.m6334getEndimpl($this$edit.m1448getSelectiond9O1mEE());
                int right$iv = lengthAfterCursor;
                int result$iv = $this$addExactOrElse$iv + right$iv;
                if ((($this$addExactOrElse$iv ^ result$iv) & (right$iv ^ result$iv)) < 0) {
                    result$iv = $this$edit.getLength();
                }
                ImeEditCommand_androidKt.imeDelete($this$edit, TextRange.m6334getEndimpl($this$edit.m1448getSelectiond9O1mEE()), Math.min(result$iv, $this$edit.getLength()));
                int $this$subtractExactOrElse$iv = TextRange.m6339getStartimpl($this$edit.m1448getSelectiond9O1mEE());
                int right$iv2 = lengthBeforeCursor;
                int result$iv2 = $this$subtractExactOrElse$iv - right$iv2;
                if ((($this$subtractExactOrElse$iv ^ right$iv2) & ($this$subtractExactOrElse$iv ^ result$iv2)) < 0) {
                    result$iv2 = 0;
                }
                ImeEditCommand_androidKt.imeDelete($this$edit, Math.max(0, result$iv2), TextRange.m6339getStartimpl($this$edit.m1448getSelectiond9O1mEE()));
            }
        });
    }

    public static final void deleteSurroundingTextInCodePoints(ImeEditCommandScope $this$deleteSurroundingTextInCodePoints, final int lengthBeforeCursor, final int lengthAfterCursor) {
        $this$deleteSurroundingTextInCodePoints.edit(new Function1<TextFieldBuffer, Unit>() { // from class: androidx.compose.foundation.text.input.internal.ImeEditCommand_androidKt$deleteSurroundingTextInCodePoints$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(TextFieldBuffer textFieldBuffer) {
                invoke2(textFieldBuffer);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(TextFieldBuffer $this$edit) {
                boolean isSurrogatePair;
                boolean isSurrogatePair2;
                boolean value$iv = lengthBeforeCursor >= 0 && lengthAfterCursor >= 0;
                int i = lengthBeforeCursor;
                int i2 = lengthAfterCursor;
                if (!value$iv) {
                    InlineClassHelperKt.throwIllegalArgumentException("Expected lengthBeforeCursor and lengthAfterCursor to be non-negative, were " + i + " and " + i2 + " respectively.");
                }
                int beforeLenInChars = 0;
                int i3 = 0;
                while (true) {
                    if (i3 < lengthBeforeCursor) {
                        beforeLenInChars++;
                        if (TextRange.m6339getStartimpl($this$edit.m1448getSelectiond9O1mEE()) <= beforeLenInChars) {
                            beforeLenInChars = TextRange.m6339getStartimpl($this$edit.m1448getSelectiond9O1mEE());
                            break;
                        }
                        char lead = $this$edit.asCharSequence().charAt((TextRange.m6339getStartimpl($this$edit.m1448getSelectiond9O1mEE()) - beforeLenInChars) - 1);
                        char trail = $this$edit.asCharSequence().charAt(TextRange.m6339getStartimpl($this$edit.m1448getSelectiond9O1mEE()) - beforeLenInChars);
                        isSurrogatePair2 = ImeEditCommand_androidKt.isSurrogatePair(lead, trail);
                        if (isSurrogatePair2) {
                            beforeLenInChars++;
                        }
                        i3++;
                    } else {
                        break;
                    }
                }
                int afterLenInChars = 0;
                int i4 = 0;
                while (true) {
                    if (i4 >= lengthAfterCursor) {
                        break;
                    }
                    afterLenInChars++;
                    if (TextRange.m6334getEndimpl($this$edit.m1448getSelectiond9O1mEE()) + afterLenInChars >= $this$edit.getLength()) {
                        afterLenInChars = $this$edit.getLength() - TextRange.m6334getEndimpl($this$edit.m1448getSelectiond9O1mEE());
                        break;
                    }
                    char lead2 = $this$edit.asCharSequence().charAt((TextRange.m6334getEndimpl($this$edit.m1448getSelectiond9O1mEE()) + afterLenInChars) - 1);
                    char trail2 = $this$edit.asCharSequence().charAt(TextRange.m6334getEndimpl($this$edit.m1448getSelectiond9O1mEE()) + afterLenInChars);
                    isSurrogatePair = ImeEditCommand_androidKt.isSurrogatePair(lead2, trail2);
                    if (isSurrogatePair) {
                        afterLenInChars++;
                    }
                    i4++;
                }
                ImeEditCommand_androidKt.imeDelete($this$edit, TextRange.m6334getEndimpl($this$edit.m1448getSelectiond9O1mEE()), TextRange.m6334getEndimpl($this$edit.m1448getSelectiond9O1mEE()) + afterLenInChars);
                ImeEditCommand_androidKt.imeDelete($this$edit, TextRange.m6339getStartimpl($this$edit.m1448getSelectiond9O1mEE()) - beforeLenInChars, TextRange.m6339getStartimpl($this$edit.m1448getSelectiond9O1mEE()));
            }
        });
    }

    public static final void finishComposingText(ImeEditCommandScope $this$finishComposingText) {
        $this$finishComposingText.edit(new Function1<TextFieldBuffer, Unit>() { // from class: androidx.compose.foundation.text.input.internal.ImeEditCommand_androidKt$finishComposingText$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(TextFieldBuffer textFieldBuffer) {
                invoke2(textFieldBuffer);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(TextFieldBuffer $this$edit) {
                $this$edit.commitComposition$foundation_release();
            }
        });
    }

    public static final void setSelection(final ImeEditCommandScope $this$setSelection, final int start, final int end) {
        $this$setSelection.edit(new Function1<TextFieldBuffer, Unit>() { // from class: androidx.compose.foundation.text.input.internal.ImeEditCommand_androidKt$setSelection$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(TextFieldBuffer textFieldBuffer) {
                invoke2(textFieldBuffer);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(TextFieldBuffer $this$edit) {
                long transformedSpaceLength = ImeEditCommandScope.this.mo1485mapToTransformedGEjPoXI(TextRangeKt.TextRange(0, $this$edit.getLength()));
                int $this$fastCoerceIn$iv = start;
                int minimumValue$iv = TextRange.m6337getMinimpl(transformedSpaceLength);
                int maximumValue$iv = TextRange.m6336getMaximpl(transformedSpaceLength);
                int $this$fastCoerceAtLeast$iv$iv = $this$fastCoerceIn$iv;
                if ($this$fastCoerceAtLeast$iv$iv < minimumValue$iv) {
                    $this$fastCoerceAtLeast$iv$iv = minimumValue$iv;
                }
                if ($this$fastCoerceAtLeast$iv$iv > maximumValue$iv) {
                    $this$fastCoerceAtLeast$iv$iv = maximumValue$iv;
                }
                int $this$fastCoerceIn$iv2 = end;
                int minimumValue$iv2 = TextRange.m6337getMinimpl(transformedSpaceLength);
                int maximumValue$iv2 = TextRange.m6336getMaximpl(transformedSpaceLength);
                int $this$fastCoerceAtLeast$iv$iv2 = $this$fastCoerceIn$iv2;
                if ($this$fastCoerceAtLeast$iv$iv2 < minimumValue$iv2) {
                    $this$fastCoerceAtLeast$iv$iv2 = minimumValue$iv2;
                }
                if ($this$fastCoerceAtLeast$iv$iv2 > maximumValue$iv2) {
                    $this$fastCoerceAtLeast$iv$iv2 = maximumValue$iv2;
                }
                $this$edit.m1450setSelection5zctL8(ImeEditCommandScope.this.mo1484mapFromTransformedGEjPoXI(TextRangeKt.TextRange($this$fastCoerceAtLeast$iv$iv, $this$fastCoerceAtLeast$iv$iv2)));
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean isSurrogatePair(char high, char low) {
        return Character.isHighSurrogate(high) && Character.isLowSurrogate(low);
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x0047, code lost:
        if (r2 == r4) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x004a, code lost:
        r9.commitComposition$foundation_release();
        r9.clearHighlight$foundation_release();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void imeReplace(androidx.compose.foundation.text.input.TextFieldBuffer r9, int r10, int r11, java.lang.CharSequence r12) {
        /*
            int r0 = java.lang.Math.min(r10, r11)
            int r1 = java.lang.Math.max(r10, r11)
            r2 = 0
            r3 = r0
        La:
            if (r3 >= r1) goto L25
            int r4 = r12.length()
            if (r2 >= r4) goto L25
            char r4 = r12.charAt(r2)
            java.lang.CharSequence r5 = r9.asCharSequence()
            char r5 = r5.charAt(r3)
            if (r4 != r5) goto L25
            int r2 = r2 + 1
            int r3 = r3 + 1
            goto La
        L25:
            int r4 = r12.length()
            r5 = r1
        L2a:
            if (r5 <= r3) goto L45
            if (r4 <= r2) goto L45
            int r6 = r4 + (-1)
            char r6 = r12.charAt(r6)
            java.lang.CharSequence r7 = r9.asCharSequence()
            int r8 = r5 + (-1)
            char r7 = r7.charAt(r8)
            if (r6 != r7) goto L45
            int r4 = r4 + (-1)
            int r5 = r5 + (-1)
            goto L2a
        L45:
            if (r3 != r5) goto L51
            if (r2 == r4) goto L4a
            goto L51
        L4a:
            r9.commitComposition$foundation_release()
            r9.clearHighlight$foundation_release()
            goto L58
        L51:
            java.lang.CharSequence r6 = r12.subSequence(r2, r4)
            r9.replace(r3, r5, r6)
        L58:
            int r6 = r12.length()
            int r6 = r6 + r0
            long r6 = androidx.compose.ui.text.TextRangeKt.TextRange(r6)
            r9.m1450setSelection5zctL8(r6)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.ImeEditCommand_androidKt.imeReplace(androidx.compose.foundation.text.input.TextFieldBuffer, int, int, java.lang.CharSequence):void");
    }

    public static final void imeDelete(TextFieldBuffer $this$imeDelete, int start, int end) {
        TextRange initialComposition = $this$imeDelete.m1446getCompositionMzsxiRA$foundation_release();
        int min = Math.min(start, end);
        int max = Math.max(start, end);
        TextFieldBufferKt.delete($this$imeDelete, min, max);
        if (initialComposition != null) {
            initialComposition.m6343unboximpl();
            long adjustedComposition = TextFieldBufferKt.m1454adjustTextRangevJH6DeI(initialComposition.m6343unboximpl(), min, max, 0);
            if (TextRange.m6333getCollapsedimpl(adjustedComposition)) {
                $this$imeDelete.commitComposition$foundation_release();
            } else {
                TextFieldBuffer.setComposition$foundation_release$default($this$imeDelete, TextRange.m6337getMinimpl(adjustedComposition), TextRange.m6336getMaximpl(adjustedComposition), null, 4, null);
            }
        }
    }
}
