package androidx.compose.foundation.text.selection;

import androidx.compose.foundation.text.TextLayoutHelperKt;
import androidx.compose.foundation.text.selection.Selection;
import androidx.compose.ui.geometry.InlineClassHelperKt;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.TextRangeKt;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.ranges.RangesKt;
/* compiled from: MultiWidgetSelectionDelegate.kt */
@Metadata(d1 = {"\u0000p\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0000\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005\u0012\u000e\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0005¢\u0006\u0002\u0010\tJ\u0010\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0017H\u0016J\u0010\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u000bH\u0016J\u0010\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001a\u001a\u00020\u000bH\u0016J%\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\"H\u0016ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\b#\u0010$J\b\u0010\u0012\u001a\u00020\u000bH\u0016J\n\u0010%\u001a\u0004\u0018\u00010\u0006H\u0016J\u0010\u0010&\u001a\u00020\u001c2\u0006\u0010\u001a\u001a\u00020\u000bH\u0016J\u0010\u0010'\u001a\u00020\u001c2\u0006\u0010\u001a\u001a\u00020\u000bH\u0016J\u0010\u0010(\u001a\u00020\u001c2\u0006\u0010\u001a\u001a\u00020\u000bH\u0016J\u001d\u0010)\u001a\u00020*2\u0006\u0010\u001a\u001a\u00020\u000bH\u0016ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\b+\u0010,J\n\u0010-\u001a\u0004\u0018\u00010 H\u0016J\b\u0010.\u001a\u00020/H\u0016J\n\u00100\u001a\u0004\u0018\u00010\bH\u0016R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\f\u001a\u0004\u0018\u00010\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0018\u0010\u0011\u001a\u00020\u000b*\u00020\b8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013\u0082\u0002\u000b\n\u0002\b!\n\u0005\b¡\u001e0\u0001¨\u00061"}, d2 = {"Landroidx/compose/foundation/text/selection/MultiWidgetSelectionDelegate;", "Landroidx/compose/foundation/text/selection/Selectable;", "selectableId", "", "coordinatesCallback", "Lkotlin/Function0;", "Landroidx/compose/ui/layout/LayoutCoordinates;", "layoutResultCallback", "Landroidx/compose/ui/text/TextLayoutResult;", "(JLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V", "_previousLastVisibleOffset", "", "_previousTextLayoutResult", "lock", "", "getSelectableId", "()J", "lastVisibleOffset", "getLastVisibleOffset", "(Landroidx/compose/ui/text/TextLayoutResult;)I", "appendSelectableInfoToBuilder", "", "builder", "Landroidx/compose/foundation/text/selection/SelectionLayoutBuilder;", "getBoundingBox", "Landroidx/compose/ui/geometry/Rect;", TypedValues.CycleType.S_WAVE_OFFSET, "getCenterYForOffset", "", "getHandlePosition", "Landroidx/compose/ui/geometry/Offset;", "selection", "Landroidx/compose/foundation/text/selection/Selection;", "isStartHandle", "", "getHandlePosition-dBAh8RU", "(Landroidx/compose/foundation/text/selection/Selection;Z)J", "getLayoutCoordinates", "getLineHeight", "getLineLeft", "getLineRight", "getRangeOfLineContaining", "Landroidx/compose/ui/text/TextRange;", "getRangeOfLineContaining--jx7JFs", "(I)J", "getSelectAllSelection", "getText", "Landroidx/compose/ui/text/AnnotatedString;", "textLayoutResult", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class MultiWidgetSelectionDelegate implements Selectable {
    public static final int $stable = 8;
    private TextLayoutResult _previousTextLayoutResult;
    private final Function0<LayoutCoordinates> coordinatesCallback;
    private final Function0<TextLayoutResult> layoutResultCallback;
    private final long selectableId;
    private final Object lock = this;
    private int _previousLastVisibleOffset = -1;

    /* JADX WARN: Multi-variable type inference failed */
    public MultiWidgetSelectionDelegate(long selectableId, Function0<? extends LayoutCoordinates> function0, Function0<TextLayoutResult> function02) {
        this.selectableId = selectableId;
        this.coordinatesCallback = function0;
        this.layoutResultCallback = function02;
    }

    @Override // androidx.compose.foundation.text.selection.Selectable
    public long getSelectableId() {
        return this.selectableId;
    }

    private final int getLastVisibleOffset(TextLayoutResult $this$lastVisibleOffset) {
        int i;
        int lastVisibleLine;
        Object lock$iv = this.lock;
        synchronized (lock$iv) {
            if (this._previousTextLayoutResult != $this$lastVisibleOffset) {
                if ($this$lastVisibleOffset.getDidOverflowHeight() && !$this$lastVisibleOffset.getMultiParagraph().getDidExceedMaxLines()) {
                    long arg0$iv = $this$lastVisibleOffset.m6310getSizeYbymL2g();
                    long j = 4294967295L;
                    int finalVisibleLine = RangesKt.coerceAtMost($this$lastVisibleOffset.getLineForVerticalPosition((int) (arg0$iv & 4294967295L)), $this$lastVisibleOffset.getLineCount() - 1);
                    while (finalVisibleLine >= 0) {
                        float lineTop = $this$lastVisibleOffset.getLineTop(finalVisibleLine);
                        long arg0$iv2 = $this$lastVisibleOffset.m6310getSizeYbymL2g();
                        long j2 = j;
                        int $i$f$unpackInt2 = (int) (arg0$iv2 & j2);
                        if (lineTop < $i$f$unpackInt2) {
                            break;
                        }
                        finalVisibleLine--;
                        j = j2;
                    }
                    lastVisibleLine = RangesKt.coerceAtLeast(finalVisibleLine, 0);
                    this._previousLastVisibleOffset = $this$lastVisibleOffset.getLineEnd(lastVisibleLine, true);
                    this._previousTextLayoutResult = $this$lastVisibleOffset;
                }
                int finalVisibleLine2 = $this$lastVisibleOffset.getLineCount();
                lastVisibleLine = finalVisibleLine2 - 1;
                this._previousLastVisibleOffset = $this$lastVisibleOffset.getLineEnd(lastVisibleLine, true);
                this._previousTextLayoutResult = $this$lastVisibleOffset;
            }
            i = this._previousLastVisibleOffset;
        }
        return i;
    }

    @Override // androidx.compose.foundation.text.selection.Selectable
    public void appendSelectableInfoToBuilder(SelectionLayoutBuilder builder) {
        TextLayoutResult textLayoutResult;
        long localPreviousHandlePosition;
        LayoutCoordinates layoutCoordinates = getLayoutCoordinates();
        if (layoutCoordinates == null || (textLayoutResult = this.layoutResultCallback.invoke()) == null) {
            return;
        }
        long relativePosition = builder.getContainerCoordinates().mo5646localPositionOfR5De75A(layoutCoordinates, Offset.Companion.m4064getZeroF1C5BW0());
        long localPosition = Offset.m4052minusMKHz9U(builder.m1717getCurrentPositionF1C5BW0(), relativePosition);
        long $this$isUnspecified$iv = builder.m1718getPreviousHandlePositionF1C5BW0();
        if (!((9223372034707292159L & $this$isUnspecified$iv) == InlineClassHelperKt.UnspecifiedPackedFloats)) {
            localPreviousHandlePosition = Offset.m4052minusMKHz9U(builder.m1718getPreviousHandlePositionF1C5BW0(), relativePosition);
        } else {
            localPreviousHandlePosition = Offset.Companion.m4063getUnspecifiedF1C5BW0();
        }
        MultiWidgetSelectionDelegateKt.m1704appendSelectableInfoParwq6A(builder, textLayoutResult, localPosition, localPreviousHandlePosition, getSelectableId());
    }

    @Override // androidx.compose.foundation.text.selection.Selectable
    public Selection getSelectAllSelection() {
        TextLayoutResult textLayoutResult = this.layoutResultCallback.invoke();
        if (textLayoutResult == null) {
            return null;
        }
        int end = textLayoutResult.getLayoutInput().getText().length();
        return new Selection(new Selection.AnchorInfo(textLayoutResult.getBidiRunDirection(0), 0, getSelectableId()), new Selection.AnchorInfo(textLayoutResult.getBidiRunDirection(Math.max(end - 1, 0)), end, getSelectableId()), false);
    }

    @Override // androidx.compose.foundation.text.selection.Selectable
    /* renamed from: getHandlePosition-dBAh8RU  reason: not valid java name */
    public long mo1702getHandlePositiondBAh8RU(Selection selection, boolean isStartHandle) {
        TextLayoutResult textLayoutResult;
        if ((isStartHandle && selection.getStart().getSelectableId() != getSelectableId()) || (!isStartHandle && selection.getEnd().getSelectableId() != getSelectableId())) {
            return Offset.Companion.m4063getUnspecifiedF1C5BW0();
        }
        if (getLayoutCoordinates() != null && (textLayoutResult = this.layoutResultCallback.invoke()) != null) {
            int offset = (isStartHandle ? selection.getStart() : selection.getEnd()).getOffset();
            int coercedOffset = RangesKt.coerceIn(offset, 0, getLastVisibleOffset(textLayoutResult));
            return TextSelectionDelegateKt.getSelectionHandleCoordinates(textLayoutResult, coercedOffset, isStartHandle, selection.getHandlesCrossed());
        }
        return Offset.Companion.m4063getUnspecifiedF1C5BW0();
    }

    @Override // androidx.compose.foundation.text.selection.Selectable
    public LayoutCoordinates getLayoutCoordinates() {
        LayoutCoordinates layoutCoordinates = this.coordinatesCallback.invoke();
        if (layoutCoordinates == null || !layoutCoordinates.isAttached()) {
            return null;
        }
        return layoutCoordinates;
    }

    @Override // androidx.compose.foundation.text.selection.Selectable
    public TextLayoutResult textLayoutResult() {
        return this.layoutResultCallback.invoke();
    }

    @Override // androidx.compose.foundation.text.selection.Selectable
    public AnnotatedString getText() {
        TextLayoutResult textLayoutResult = this.layoutResultCallback.invoke();
        return textLayoutResult == null ? new AnnotatedString("", null, 2, null) : textLayoutResult.getLayoutInput().getText();
    }

    @Override // androidx.compose.foundation.text.selection.Selectable
    public Rect getBoundingBox(int offset) {
        int textLength;
        TextLayoutResult textLayoutResult = this.layoutResultCallback.invoke();
        if (textLayoutResult != null && (textLength = textLayoutResult.getLayoutInput().getText().length()) >= 1) {
            return textLayoutResult.getBoundingBox(RangesKt.coerceIn(offset, 0, textLength - 1));
        }
        return Rect.Companion.getZero();
    }

    @Override // androidx.compose.foundation.text.selection.Selectable
    public float getLineLeft(int offset) {
        int line;
        TextLayoutResult textLayoutResult = this.layoutResultCallback.invoke();
        if (textLayoutResult != null && (line = textLayoutResult.getLineForOffset(offset)) < textLayoutResult.getLineCount()) {
            return textLayoutResult.getLineLeft(line);
        }
        return -1.0f;
    }

    @Override // androidx.compose.foundation.text.selection.Selectable
    public float getLineRight(int offset) {
        int line;
        TextLayoutResult textLayoutResult = this.layoutResultCallback.invoke();
        if (textLayoutResult != null && (line = textLayoutResult.getLineForOffset(offset)) < textLayoutResult.getLineCount()) {
            return textLayoutResult.getLineRight(line);
        }
        return -1.0f;
    }

    @Override // androidx.compose.foundation.text.selection.Selectable
    public float getCenterYForOffset(int offset) {
        int line;
        TextLayoutResult textLayoutResult = this.layoutResultCallback.invoke();
        if (textLayoutResult != null && (line = textLayoutResult.getLineForOffset(offset)) < textLayoutResult.getLineCount()) {
            float top = textLayoutResult.getLineTop(line);
            float bottom = textLayoutResult.getLineBottom(line);
            return ((bottom - top) / 2.0f) + top;
        }
        return -1.0f;
    }

    @Override // androidx.compose.foundation.text.selection.Selectable
    /* renamed from: getRangeOfLineContaining--jx7JFs  reason: not valid java name */
    public long mo1703getRangeOfLineContainingjx7JFs(int offset) {
        int visibleTextLength;
        TextLayoutResult textLayoutResult = this.layoutResultCallback.invoke();
        if (textLayoutResult != null && (visibleTextLength = getLastVisibleOffset(textLayoutResult)) >= 1) {
            int line = textLayoutResult.getLineForOffset(RangesKt.coerceIn(offset, 0, visibleTextLength - 1));
            return TextRangeKt.TextRange(textLayoutResult.getLineStart(line), textLayoutResult.getLineEnd(line, true));
        }
        return TextRange.Companion.m6344getZerod9O1mEE();
    }

    @Override // androidx.compose.foundation.text.selection.Selectable
    public int getLastVisibleOffset() {
        TextLayoutResult textLayoutResult = this.layoutResultCallback.invoke();
        if (textLayoutResult == null) {
            return 0;
        }
        return getLastVisibleOffset(textLayoutResult);
    }

    @Override // androidx.compose.foundation.text.selection.Selectable
    public float getLineHeight(int offset) {
        TextLayoutResult invoke = this.layoutResultCallback.invoke();
        if (invoke != null) {
            return TextLayoutHelperKt.getLineHeight(invoke, offset);
        }
        return 0.0f;
    }
}
