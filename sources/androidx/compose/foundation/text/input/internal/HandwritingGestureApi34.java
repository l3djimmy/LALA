package androidx.compose.foundation.text.input.internal;

import android.os.CancellationSignal;
import android.view.inputmethod.DeleteGesture;
import android.view.inputmethod.DeleteRangeGesture;
import android.view.inputmethod.HandwritingGesture;
import android.view.inputmethod.InsertGesture;
import android.view.inputmethod.JoinOrSplitGesture;
import android.view.inputmethod.PreviewableHandwritingGesture;
import android.view.inputmethod.RemoveSpaceGesture;
import android.view.inputmethod.SelectGesture;
import android.view.inputmethod.SelectRangeGesture;
import androidx.compose.foundation.text.LegacyTextFieldState;
import androidx.compose.foundation.text.TextLayoutResultProxy;
import androidx.compose.foundation.text.input.InputTransformation;
import androidx.compose.foundation.text.input.TextFieldBuffer;
import androidx.compose.foundation.text.input.TextFieldState;
import androidx.compose.foundation.text.input.TextHighlightType;
import androidx.compose.foundation.text.input.internal.undo.TextFieldEditUndoBehavior;
import androidx.compose.foundation.text.selection.TextFieldSelectionManager;
import androidx.compose.ui.graphics.RectHelper_androidKt;
import androidx.compose.ui.platform.ViewConfiguration;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.TextGranularity;
import androidx.compose.ui.text.TextInclusionStrategy;
import androidx.compose.ui.text.TextLayoutInput;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.TextRangeKt;
import androidx.compose.ui.text.input.CommitTextCommand;
import androidx.compose.ui.text.input.DeleteSurroundingTextCommand;
import androidx.compose.ui.text.input.EditCommand;
import androidx.compose.ui.text.input.SetSelectionCommand;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import com.itextpdf.kernel.xmp.PdfConst;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.text.MatchResult;
import kotlin.text.Regex;
/* compiled from: HandwritingGesture.android.kt */
@Metadata(d1 = {"\u0000¸\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\bÁ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J$\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\bH\u0002J>\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\bH\u0002ø\u0001\u0000¢\u0006\u0004\b\u0012\u0010\u0013J,\u0010\u0014\u001a\u00020\n2\u0006\u0010\u0015\u001a\u00020\u00042\u0006\u0010\u000e\u001a\u00020\u00162\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\bH\u0002J8\u0010\u0017\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\r2\b\u0010\u0018\u001a\u0004\u0018\u00010\u00192\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\bH\u0002ø\u0001\u0000¢\u0006\u0004\b\u001a\u0010\u001bJ\u0014\u0010\u001c\u001a\u00020\u0004*\u00020\u001d2\u0006\u0010\u0005\u001a\u00020\u0006H\u0002J&\u0010\u001e\u001a\u00020\n*\u00020\u001d2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u001f\u001a\u00020 H\u0002ø\u0001\u0000¢\u0006\u0004\b!\u0010\"J0\u0010#\u001a\u00020\u0004*\u00020$2\u0006\u0010\u0005\u001a\u00020%2\u0006\u0010\u000e\u001a\u00020\u000f2\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\bH\u0002J\u001c\u0010#\u001a\u00020\u0004*\u00020\u001d2\u0006\u0010\u0005\u001a\u00020%2\u0006\u0010&\u001a\u00020'H\u0002J0\u0010(\u001a\u00020\u0004*\u00020$2\u0006\u0010\u0005\u001a\u00020)2\u0006\u0010\u000e\u001a\u00020\u000f2\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\bH\u0002J\u001c\u0010(\u001a\u00020\u0004*\u00020\u001d2\u0006\u0010\u0005\u001a\u00020)2\u0006\u0010&\u001a\u00020'H\u0002J&\u0010*\u001a\u00020\n*\u00020\u001d2\u0006\u0010+\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u0011H\u0002ø\u0001\u0000¢\u0006\u0004\b,\u0010-JA\u0010.\u001a\u00020\u0004*\u00020$2\u0006\u0010\u0005\u001a\u00020\u00062\b\u0010/\u001a\u0004\u0018\u00010\u00192\b\u00100\u001a\u0004\u0018\u0001012\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\bH\u0000¢\u0006\u0002\b2J;\u0010.\u001a\u00020\u0004*\u00020\u001d2\u0006\u00103\u001a\u00020\u00062\u0006\u0010&\u001a\u00020'2\u000e\u00104\u001a\n\u0012\u0004\u0012\u00020\n\u0018\u0001052\b\u00100\u001a\u0004\u0018\u000101H\u0000¢\u0006\u0002\b2J2\u00106\u001a\u00020\u0004*\u00020$2\u0006\u0010\u0005\u001a\u0002072\b\u00100\u001a\u0004\u0018\u0001012\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\bH\u0002J&\u00106\u001a\u00020\u0004*\u00020\u001d2\u0006\u0010\u0005\u001a\u0002072\u0006\u0010&\u001a\u00020'2\b\u00100\u001a\u0004\u0018\u000101H\u0002J:\u00108\u001a\u00020\u0004*\u00020$2\u0006\u0010\u0005\u001a\u0002092\u0006\u0010\u000e\u001a\u00020\u000f2\b\u00100\u001a\u0004\u0018\u0001012\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\bH\u0002J&\u00108\u001a\u00020\u0004*\u00020\u001d2\u0006\u0010\u0005\u001a\u0002092\u0006\u0010&\u001a\u00020'2\b\u00100\u001a\u0004\u0018\u000101H\u0002J:\u0010:\u001a\u00020\u0004*\u00020$2\u0006\u0010\u0005\u001a\u00020;2\u0006\u0010\u000e\u001a\u00020\u000f2\b\u00100\u001a\u0004\u0018\u0001012\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\bH\u0002J&\u0010:\u001a\u00020\u0004*\u00020\u001d2\u0006\u0010\u0005\u001a\u00020;2\u0006\u0010&\u001a\u00020'2\b\u00100\u001a\u0004\u0018\u000101H\u0002J2\u0010<\u001a\u00020\u0004*\u00020$2\u0006\u0010\u0005\u001a\u00020=2\b\u0010\u0018\u001a\u0004\u0018\u00010\u00192\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\bH\u0002J,\u0010<\u001a\u00020\u0004*\u00020\u001d2\u0006\u0010\u0005\u001a\u00020=2\u0006\u0010&\u001a\u00020'2\u000e\u00104\u001a\n\u0012\u0004\u0012\u00020\n\u0018\u000105H\u0002J2\u0010>\u001a\u00020\u0004*\u00020$2\u0006\u0010\u0005\u001a\u00020?2\b\u0010\u0018\u001a\u0004\u0018\u00010\u00192\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\bH\u0002J,\u0010>\u001a\u00020\u0004*\u00020\u001d2\u0006\u0010\u0005\u001a\u00020?2\u0006\u0010&\u001a\u00020'2\u000e\u00104\u001a\n\u0012\u0004\u0012\u00020\n\u0018\u000105H\u0002J\u001e\u0010@\u001a\u00020\n*\u00020$2\u0006\u0010\u0005\u001a\u00020%2\b\u0010/\u001a\u0004\u0018\u00010\u0019H\u0002J\u001c\u0010@\u001a\u00020\n*\u00020\u001d2\u0006\u0010\u0005\u001a\u00020%2\u0006\u0010&\u001a\u00020'H\u0002J\u001e\u0010A\u001a\u00020\n*\u00020$2\u0006\u0010\u0005\u001a\u00020)2\b\u0010/\u001a\u0004\u0018\u00010\u0019H\u0002J\u001c\u0010A\u001a\u00020\n*\u00020\u001d2\u0006\u0010\u0005\u001a\u00020)2\u0006\u0010&\u001a\u00020'H\u0002J-\u0010B\u001a\u00020\u0011*\u00020$2\u0006\u0010\u0005\u001a\u00020C2\b\u0010/\u001a\u0004\u0018\u00010\u00192\b\u0010D\u001a\u0004\u0018\u00010EH\u0000¢\u0006\u0002\bFJ+\u0010B\u001a\u00020\u0011*\u00020\u001d2\u0006\u00103\u001a\u00020C2\u0006\u0010&\u001a\u00020'2\b\u0010D\u001a\u0004\u0018\u00010EH\u0000¢\u0006\u0002\bFJ\u001e\u0010G\u001a\u00020\n*\u00020$2\u0006\u0010\u0005\u001a\u00020=2\b\u0010/\u001a\u0004\u0018\u00010\u0019H\u0002J\u001c\u0010G\u001a\u00020\n*\u00020\u001d2\u0006\u0010\u0005\u001a\u00020=2\u0006\u0010&\u001a\u00020'H\u0002J\u001e\u0010H\u001a\u00020\n*\u00020$2\u0006\u0010\u0005\u001a\u00020?2\b\u0010/\u001a\u0004\u0018\u00010\u0019H\u0002J\u001c\u0010H\u001a\u00020\n*\u00020\u001d2\u0006\u0010\u0005\u001a\u00020?2\u0006\u0010&\u001a\u00020'H\u0002J\u0019\u0010I\u001a\u00020J*\u00020\u0004H\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\bK\u0010L\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006M"}, d2 = {"Landroidx/compose/foundation/text/input/internal/HandwritingGestureApi34;", "", "()V", "fallbackOnLegacyTextField", "", "gesture", "Landroid/view/inputmethod/HandwritingGesture;", "editCommandConsumer", "Lkotlin/Function1;", "Landroidx/compose/ui/text/input/EditCommand;", "", "performDeletionOnLegacyTextField", "range", "Landroidx/compose/ui/text/TextRange;", "text", "Landroidx/compose/ui/text/AnnotatedString;", "adjustRange", "", "performDeletionOnLegacyTextField-vJH6DeI", "(JLandroidx/compose/ui/text/AnnotatedString;ZLkotlin/jvm/functions/Function1;)V", "performInsertionOnLegacyTextField", TypedValues.CycleType.S_WAVE_OFFSET, "", "performSelectionOnLegacyTextField", "textSelectionManager", "Landroidx/compose/foundation/text/selection/TextFieldSelectionManager;", "performSelectionOnLegacyTextField-8ffj60Q", "(JLandroidx/compose/foundation/text/selection/TextFieldSelectionManager;Lkotlin/jvm/functions/Function1;)V", "fallback", "Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;", "highlightRange", PdfConst.Type, "Landroidx/compose/foundation/text/input/TextHighlightType;", "highlightRange-XJREzCE", "(Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;JI)V", "performDeleteGesture", "Landroidx/compose/foundation/text/LegacyTextFieldState;", "Landroid/view/inputmethod/DeleteGesture;", "layoutState", "Landroidx/compose/foundation/text/input/internal/TextLayoutState;", "performDeleteRangeGesture", "Landroid/view/inputmethod/DeleteRangeGesture;", "performDeletion", "rangeInTransformedText", "performDeletion-Sb-Bc2M", "(Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;JZ)V", "performHandwritingGesture", "textFieldSelectionManager", "viewConfiguration", "Landroidx/compose/ui/platform/ViewConfiguration;", "performHandwritingGesture$foundation_release", "handwritingGesture", "updateSelectionState", "Lkotlin/Function0;", "performInsertGesture", "Landroid/view/inputmethod/InsertGesture;", "performJoinOrSplitGesture", "Landroid/view/inputmethod/JoinOrSplitGesture;", "performRemoveSpaceGesture", "Landroid/view/inputmethod/RemoveSpaceGesture;", "performSelectGesture", "Landroid/view/inputmethod/SelectGesture;", "performSelectRangeGesture", "Landroid/view/inputmethod/SelectRangeGesture;", "previewDeleteGesture", "previewDeleteRangeGesture", "previewHandwritingGesture", "Landroid/view/inputmethod/PreviewableHandwritingGesture;", "cancellationSignal", "Landroid/os/CancellationSignal;", "previewHandwritingGesture$foundation_release", "previewSelectGesture", "previewSelectRangeGesture", "toTextGranularity", "Landroidx/compose/ui/text/TextGranularity;", "toTextGranularity-NUwxegE", "(I)I", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class HandwritingGestureApi34 {
    public static final int $stable = 0;
    public static final HandwritingGestureApi34 INSTANCE = new HandwritingGestureApi34();

    private HandwritingGestureApi34() {
    }

    public final int performHandwritingGesture$foundation_release(TransformedTextFieldState $this$performHandwritingGesture, HandwritingGesture handwritingGesture, TextLayoutState layoutState, Function0<Unit> function0, ViewConfiguration viewConfiguration) {
        if (handwritingGesture instanceof SelectGesture) {
            return performSelectGesture($this$performHandwritingGesture, (SelectGesture) handwritingGesture, layoutState, function0);
        }
        if (handwritingGesture instanceof DeleteGesture) {
            return performDeleteGesture($this$performHandwritingGesture, (DeleteGesture) handwritingGesture, layoutState);
        }
        if (handwritingGesture instanceof SelectRangeGesture) {
            return performSelectRangeGesture($this$performHandwritingGesture, (SelectRangeGesture) handwritingGesture, layoutState, function0);
        }
        if (handwritingGesture instanceof DeleteRangeGesture) {
            return performDeleteRangeGesture($this$performHandwritingGesture, (DeleteRangeGesture) handwritingGesture, layoutState);
        }
        if (handwritingGesture instanceof JoinOrSplitGesture) {
            return performJoinOrSplitGesture($this$performHandwritingGesture, (JoinOrSplitGesture) handwritingGesture, layoutState, viewConfiguration);
        }
        if (handwritingGesture instanceof InsertGesture) {
            return performInsertGesture($this$performHandwritingGesture, (InsertGesture) handwritingGesture, layoutState, viewConfiguration);
        }
        if (handwritingGesture instanceof RemoveSpaceGesture) {
            return performRemoveSpaceGesture($this$performHandwritingGesture, (RemoveSpaceGesture) handwritingGesture, layoutState, viewConfiguration);
        }
        return 2;
    }

    public final boolean previewHandwritingGesture$foundation_release(final TransformedTextFieldState $this$previewHandwritingGesture, PreviewableHandwritingGesture handwritingGesture, TextLayoutState layoutState, CancellationSignal cancellationSignal) {
        if (handwritingGesture instanceof SelectGesture) {
            previewSelectGesture($this$previewHandwritingGesture, (SelectGesture) handwritingGesture, layoutState);
        } else if (handwritingGesture instanceof DeleteGesture) {
            previewDeleteGesture($this$previewHandwritingGesture, (DeleteGesture) handwritingGesture, layoutState);
        } else if (handwritingGesture instanceof SelectRangeGesture) {
            previewSelectRangeGesture($this$previewHandwritingGesture, (SelectRangeGesture) handwritingGesture, layoutState);
        } else if (!(handwritingGesture instanceof DeleteRangeGesture)) {
            return false;
        } else {
            previewDeleteRangeGesture($this$previewHandwritingGesture, (DeleteRangeGesture) handwritingGesture, layoutState);
        }
        if (cancellationSignal != null) {
            cancellationSignal.setOnCancelListener(new CancellationSignal.OnCancelListener() { // from class: androidx.compose.foundation.text.input.internal.HandwritingGestureApi34$$ExternalSyntheticLambda1
                @Override // android.os.CancellationSignal.OnCancelListener
                public final void onCancel() {
                    HandwritingGestureApi34.previewHandwritingGesture$lambda$1(TransformedTextFieldState.this);
                }
            });
            return true;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void previewHandwritingGesture$lambda$1(TransformedTextFieldState $this_previewHandwritingGesture) {
        TextFieldState $this$iv$iv = $this_previewHandwritingGesture.textFieldState;
        InputTransformation inputTransformation$iv$iv = $this_previewHandwritingGesture.inputTransformation;
        TextFieldEditUndoBehavior undoBehavior$iv$iv = TextFieldEditUndoBehavior.MergeIfPossible;
        $this$iv$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
        TextFieldBuffer $this$editUntransformedTextAsUser_u24lambda_u2411$iv = $this$iv$iv.getMainBuffer$foundation_release();
        $this$editUntransformedTextAsUser_u24lambda_u2411$iv.clearHighlight$foundation_release();
        $this_previewHandwritingGesture.updateWedgeAffinity($this$editUntransformedTextAsUser_u24lambda_u2411$iv);
        $this$iv$iv.commitEditAsUser(inputTransformation$iv$iv, true, undoBehavior$iv$iv);
    }

    private final int performSelectGesture(TransformedTextFieldState $this$performSelectGesture, SelectGesture gesture, TextLayoutState layoutState, Function0<Unit> function0) {
        long rangeInTransformedText;
        rangeInTransformedText = HandwritingGesture_androidKt.m1520getRangeForScreenRectOH9lIzo(layoutState, RectHelper_androidKt.toComposeRect(gesture.getSelectionArea()), m1502toTextGranularityNUwxegE(gesture.getGranularity()), TextInclusionStrategy.Companion.getContainsCenter());
        if (TextRange.m6333getCollapsedimpl(rangeInTransformedText)) {
            return INSTANCE.fallback($this$performSelectGesture, (HandwritingGesture) gesture);
        }
        $this$performSelectGesture.m1584selectCharsIn5zctL8(rangeInTransformedText);
        if (function0 != null) {
            function0.invoke();
            return 1;
        }
        return 1;
    }

    private final void previewSelectGesture(TransformedTextFieldState $this$previewSelectGesture, SelectGesture gesture, TextLayoutState layoutState) {
        long m1520getRangeForScreenRectOH9lIzo;
        m1520getRangeForScreenRectOH9lIzo = HandwritingGesture_androidKt.m1520getRangeForScreenRectOH9lIzo(layoutState, RectHelper_androidKt.toComposeRect(gesture.getSelectionArea()), m1502toTextGranularityNUwxegE(gesture.getGranularity()), TextInclusionStrategy.Companion.getContainsCenter());
        m1498highlightRangeXJREzCE($this$previewSelectGesture, m1520getRangeForScreenRectOH9lIzo, TextHighlightType.Companion.m1470getHandwritingSelectPreviewsxJuwY());
    }

    private final int performDeleteGesture(TransformedTextFieldState $this$performDeleteGesture, DeleteGesture gesture, TextLayoutState layoutState) {
        long rangeInTransformedText;
        int granularity = m1502toTextGranularityNUwxegE(gesture.getGranularity());
        rangeInTransformedText = HandwritingGesture_androidKt.m1520getRangeForScreenRectOH9lIzo(layoutState, RectHelper_androidKt.toComposeRect(gesture.getDeletionArea()), granularity, TextInclusionStrategy.Companion.getContainsCenter());
        if (TextRange.m6333getCollapsedimpl(rangeInTransformedText)) {
            return INSTANCE.fallback($this$performDeleteGesture, (HandwritingGesture) gesture);
        }
        m1499performDeletionSbBc2M($this$performDeleteGesture, rangeInTransformedText, TextGranularity.m6297equalsimpl0(granularity, TextGranularity.Companion.m6302getWordDRrd7Zo()));
        return 1;
    }

    private final void previewDeleteGesture(TransformedTextFieldState $this$previewDeleteGesture, DeleteGesture gesture, TextLayoutState layoutState) {
        long m1520getRangeForScreenRectOH9lIzo;
        m1520getRangeForScreenRectOH9lIzo = HandwritingGesture_androidKt.m1520getRangeForScreenRectOH9lIzo(layoutState, RectHelper_androidKt.toComposeRect(gesture.getDeletionArea()), m1502toTextGranularityNUwxegE(gesture.getGranularity()), TextInclusionStrategy.Companion.getContainsCenter());
        m1498highlightRangeXJREzCE($this$previewDeleteGesture, m1520getRangeForScreenRectOH9lIzo, TextHighlightType.Companion.m1469getHandwritingDeletePreviewsxJuwY());
    }

    private final int performSelectRangeGesture(TransformedTextFieldState $this$performSelectRangeGesture, SelectRangeGesture gesture, TextLayoutState layoutState, Function0<Unit> function0) {
        long rangeInTransformedText;
        rangeInTransformedText = HandwritingGesture_androidKt.m1522getRangeForScreenRectsO048IG0(layoutState, RectHelper_androidKt.toComposeRect(gesture.getSelectionStartArea()), RectHelper_androidKt.toComposeRect(gesture.getSelectionEndArea()), m1502toTextGranularityNUwxegE(gesture.getGranularity()), TextInclusionStrategy.Companion.getContainsCenter());
        if (TextRange.m6333getCollapsedimpl(rangeInTransformedText)) {
            return INSTANCE.fallback($this$performSelectRangeGesture, (HandwritingGesture) gesture);
        }
        $this$performSelectRangeGesture.m1584selectCharsIn5zctL8(rangeInTransformedText);
        if (function0 != null) {
            function0.invoke();
            return 1;
        }
        return 1;
    }

    private final void previewSelectRangeGesture(TransformedTextFieldState $this$previewSelectRangeGesture, SelectRangeGesture gesture, TextLayoutState layoutState) {
        long m1522getRangeForScreenRectsO048IG0;
        m1522getRangeForScreenRectsO048IG0 = HandwritingGesture_androidKt.m1522getRangeForScreenRectsO048IG0(layoutState, RectHelper_androidKt.toComposeRect(gesture.getSelectionStartArea()), RectHelper_androidKt.toComposeRect(gesture.getSelectionEndArea()), m1502toTextGranularityNUwxegE(gesture.getGranularity()), TextInclusionStrategy.Companion.getContainsCenter());
        m1498highlightRangeXJREzCE($this$previewSelectRangeGesture, m1522getRangeForScreenRectsO048IG0, TextHighlightType.Companion.m1470getHandwritingSelectPreviewsxJuwY());
    }

    private final int performDeleteRangeGesture(TransformedTextFieldState $this$performDeleteRangeGesture, DeleteRangeGesture gesture, TextLayoutState layoutState) {
        long rangeInTransformedText;
        int granularity = m1502toTextGranularityNUwxegE(gesture.getGranularity());
        rangeInTransformedText = HandwritingGesture_androidKt.m1522getRangeForScreenRectsO048IG0(layoutState, RectHelper_androidKt.toComposeRect(gesture.getDeletionStartArea()), RectHelper_androidKt.toComposeRect(gesture.getDeletionEndArea()), granularity, TextInclusionStrategy.Companion.getContainsCenter());
        if (TextRange.m6333getCollapsedimpl(rangeInTransformedText)) {
            return INSTANCE.fallback($this$performDeleteRangeGesture, (HandwritingGesture) gesture);
        }
        m1499performDeletionSbBc2M($this$performDeleteRangeGesture, rangeInTransformedText, TextGranularity.m6297equalsimpl0(granularity, TextGranularity.Companion.m6302getWordDRrd7Zo()));
        return 1;
    }

    private final void previewDeleteRangeGesture(TransformedTextFieldState $this$previewDeleteRangeGesture, DeleteRangeGesture gesture, TextLayoutState layoutState) {
        long m1522getRangeForScreenRectsO048IG0;
        m1522getRangeForScreenRectsO048IG0 = HandwritingGesture_androidKt.m1522getRangeForScreenRectsO048IG0(layoutState, RectHelper_androidKt.toComposeRect(gesture.getDeletionStartArea()), RectHelper_androidKt.toComposeRect(gesture.getDeletionEndArea()), m1502toTextGranularityNUwxegE(gesture.getGranularity()), TextInclusionStrategy.Companion.getContainsCenter());
        m1498highlightRangeXJREzCE($this$previewDeleteRangeGesture, m1522getRangeForScreenRectsO048IG0, TextHighlightType.Companion.m1469getHandwritingDeletePreviewsxJuwY());
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0035  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final int performJoinOrSplitGesture(androidx.compose.foundation.text.input.internal.TransformedTextFieldState r13, android.view.inputmethod.JoinOrSplitGesture r14, androidx.compose.foundation.text.input.internal.TextLayoutState r15, androidx.compose.ui.platform.ViewConfiguration r16) {
        /*
            r12 = this;
            androidx.compose.foundation.text.input.TextFieldCharSequence r0 = r13.getOutputText()
            androidx.compose.foundation.text.input.TextFieldCharSequence r1 = r13.getUntransformedText()
            if (r0 == r1) goto Lc
            r0 = 3
            return r0
        Lc:
            android.graphics.PointF r0 = r14.getJoinOrSplitPoint()
            long r0 = androidx.compose.foundation.text.input.internal.HandwritingGesture_androidKt.access$toOffset(r0)
            r8 = r15
            r9 = r16
            int r0 = androidx.compose.foundation.text.input.internal.HandwritingGesture_androidKt.m1505access$getOffsetForHandwritingGestured4ec7I(r15, r0, r9)
            r10 = r0
            r0 = -1
            if (r10 == r0) goto L58
            androidx.compose.ui.text.TextLayoutResult r0 = r15.getLayoutResult()
            r11 = 1
            r1 = 0
            if (r0 == 0) goto L31
            boolean r0 = androidx.compose.foundation.text.input.internal.HandwritingGesture_androidKt.access$isBiDiBoundary(r0, r10)
            if (r0 != r11) goto L31
            r0 = r11
            goto L32
        L31:
            r0 = r1
        L32:
            if (r0 == 0) goto L35
            goto L58
        L35:
            androidx.compose.foundation.text.input.TextFieldCharSequence r0 = r13.getVisualText()
            java.lang.CharSequence r0 = (java.lang.CharSequence) r0
            long r2 = androidx.compose.foundation.text.input.internal.HandwritingGesture_androidKt.access$rangeOfWhitespaces(r0, r10)
            boolean r0 = androidx.compose.ui.text.TextRange.m6333getCollapsedimpl(r2)
            if (r0 == 0) goto L54
            java.lang.String r0 = " "
            r1 = r0
            java.lang.CharSequence r1 = (java.lang.CharSequence) r1
            r6 = 12
            r7 = 0
            r4 = 0
            r5 = 0
            r0 = r13
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState.m1577replaceTextM8tDOmk$default(r0, r1, r2, r4, r5, r6, r7)
            goto L57
        L54:
            r12.m1499performDeletionSbBc2M(r13, r2, r1)
        L57:
            return r11
        L58:
            r1 = r14
            android.view.inputmethod.HandwritingGesture r1 = (android.view.inputmethod.HandwritingGesture) r1
            int r1 = r12.fallback(r13, r1)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.HandwritingGestureApi34.performJoinOrSplitGesture(androidx.compose.foundation.text.input.internal.TransformedTextFieldState, android.view.inputmethod.JoinOrSplitGesture, androidx.compose.foundation.text.input.internal.TextLayoutState, androidx.compose.ui.platform.ViewConfiguration):int");
    }

    private final int performInsertGesture(TransformedTextFieldState $this$performInsertGesture, InsertGesture gesture, TextLayoutState layoutState, ViewConfiguration viewConfiguration) {
        long offset;
        int offset2;
        offset = HandwritingGesture_androidKt.toOffset(gesture.getInsertionPoint());
        offset2 = HandwritingGesture_androidKt.m1515getOffsetForHandwritingGestured4ec7I(layoutState, offset, viewConfiguration);
        if (offset2 == -1) {
            return fallback($this$performInsertGesture, (HandwritingGesture) gesture);
        }
        TransformedTextFieldState.m1577replaceTextM8tDOmk$default($this$performInsertGesture, gesture.getTextToInsert(), TextRangeKt.TextRange(offset2), null, false, 12, null);
        return 1;
    }

    private final int performRemoveSpaceGesture(TransformedTextFieldState $this$performRemoveSpaceGesture, RemoveSpaceGesture gesture, TextLayoutState layoutState, ViewConfiguration viewConfiguration) {
        long offset;
        long offset2;
        long $this$performRemoveSpaceGesture_u24lambda_u246;
        TextLayoutResult layoutResult = layoutState.getLayoutResult();
        offset = HandwritingGesture_androidKt.toOffset(gesture.getStartPoint());
        offset2 = HandwritingGesture_androidKt.toOffset(gesture.getEndPoint());
        $this$performRemoveSpaceGesture_u24lambda_u246 = HandwritingGesture_androidKt.m1517getRangeForRemoveSpaceGesture5iVPX68(layoutResult, offset, offset2, layoutState.getTextLayoutNodeCoordinates(), viewConfiguration);
        if (TextRange.m6333getCollapsedimpl($this$performRemoveSpaceGesture_u24lambda_u246)) {
            return INSTANCE.fallback($this$performRemoveSpaceGesture, (HandwritingGesture) gesture);
        }
        final Ref.IntRef firstMatchStart = new Ref.IntRef();
        firstMatchStart.element = -1;
        final Ref.IntRef lastMatchEnd = new Ref.IntRef();
        lastMatchEnd.element = -1;
        String newText = new Regex("\\s+").replace(TextRangeKt.m6346substringFDrldGo($this$performRemoveSpaceGesture.getVisualText(), $this$performRemoveSpaceGesture_u24lambda_u246), new Function1<MatchResult, CharSequence>() { // from class: androidx.compose.foundation.text.input.internal.HandwritingGestureApi34$performRemoveSpaceGesture$newText$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final CharSequence invoke(MatchResult it) {
                if (Ref.IntRef.this.element == -1) {
                    Ref.IntRef.this.element = it.getRange().getFirst();
                }
                lastMatchEnd.element = it.getRange().getLast() + 1;
                return "";
            }
        });
        if (firstMatchStart.element != -1 && lastMatchEnd.element != -1) {
            long finalRange = TextRangeKt.TextRange(TextRange.m6339getStartimpl($this$performRemoveSpaceGesture_u24lambda_u246) + firstMatchStart.element, TextRange.m6339getStartimpl($this$performRemoveSpaceGesture_u24lambda_u246) + lastMatchEnd.element);
            String finalNewText = newText.substring(firstMatchStart.element, newText.length() - (TextRange.m6335getLengthimpl($this$performRemoveSpaceGesture_u24lambda_u246) - lastMatchEnd.element));
            Intrinsics.checkNotNullExpressionValue(finalNewText, "substring(...)");
            TransformedTextFieldState.m1577replaceTextM8tDOmk$default($this$performRemoveSpaceGesture, finalNewText, finalRange, null, false, 12, null);
            return 1;
        }
        return fallback($this$performRemoveSpaceGesture, (HandwritingGesture) gesture);
    }

    /* renamed from: performDeletion-Sb-Bc2M  reason: not valid java name */
    private final void m1499performDeletionSbBc2M(TransformedTextFieldState $this$performDeletion_u2dSb_u2dBc2M, long rangeInTransformedText, boolean adjustRange) {
        long j;
        if (adjustRange) {
            j = HandwritingGesture_androidKt.m1511adjustHandwritingDeleteGestureRange72CqOWE(rangeInTransformedText, $this$performDeletion_u2dSb_u2dBc2M.getVisualText());
        } else {
            j = rangeInTransformedText;
        }
        long finalRange = j;
        TransformedTextFieldState.m1577replaceTextM8tDOmk$default($this$performDeletion_u2dSb_u2dBc2M, "", finalRange, null, false, 12, null);
    }

    private final int fallback(TransformedTextFieldState $this$fallback, HandwritingGesture gesture) {
        TextFieldState $this$iv$iv = $this$fallback.textFieldState;
        InputTransformation inputTransformation$iv$iv = $this$fallback.inputTransformation;
        TextFieldEditUndoBehavior undoBehavior$iv$iv = TextFieldEditUndoBehavior.MergeIfPossible;
        $this$iv$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
        TextFieldBuffer $this$editUntransformedTextAsUser_u24lambda_u2411$iv = $this$iv$iv.getMainBuffer$foundation_release();
        $this$editUntransformedTextAsUser_u24lambda_u2411$iv.clearHighlight$foundation_release();
        $this$fallback.updateWedgeAffinity($this$editUntransformedTextAsUser_u24lambda_u2411$iv);
        $this$iv$iv.commitEditAsUser(inputTransformation$iv$iv, true, undoBehavior$iv$iv);
        String fallbackText = gesture.getFallbackText();
        if (fallbackText == null) {
            return 3;
        }
        TransformedTextFieldState.replaceSelectedText$default($this$fallback, fallbackText, true, null, false, 12, null);
        return 5;
    }

    /* renamed from: highlightRange-XJREzCE  reason: not valid java name */
    private final void m1498highlightRangeXJREzCE(TransformedTextFieldState $this$highlightRange_u2dXJREzCE, long range, int type) {
        if (TextRange.m6333getCollapsedimpl(range)) {
            TextFieldState $this$iv$iv = $this$highlightRange_u2dXJREzCE.textFieldState;
            InputTransformation inputTransformation$iv$iv = $this$highlightRange_u2dXJREzCE.inputTransformation;
            TextFieldEditUndoBehavior undoBehavior$iv$iv = TextFieldEditUndoBehavior.MergeIfPossible;
            $this$iv$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
            TextFieldBuffer $this$editUntransformedTextAsUser_u24lambda_u2411$iv = $this$iv$iv.getMainBuffer$foundation_release();
            $this$editUntransformedTextAsUser_u24lambda_u2411$iv.clearHighlight$foundation_release();
            $this$highlightRange_u2dXJREzCE.updateWedgeAffinity($this$editUntransformedTextAsUser_u24lambda_u2411$iv);
            $this$iv$iv.commitEditAsUser(inputTransformation$iv$iv, true, undoBehavior$iv$iv);
            return;
        }
        $this$highlightRange_u2dXJREzCE.m1578highlightCharsIn7RAjNK8(type, range);
    }

    public final int performHandwritingGesture$foundation_release(LegacyTextFieldState $this$performHandwritingGesture, HandwritingGesture gesture, TextFieldSelectionManager textFieldSelectionManager, ViewConfiguration viewConfiguration, Function1<? super EditCommand, Unit> function1) {
        TextLayoutResult value;
        TextLayoutInput layoutInput;
        AnnotatedString text = $this$performHandwritingGesture.getUntransformedText();
        if (text == null) {
            return 3;
        }
        TextLayoutResultProxy layoutResult = $this$performHandwritingGesture.getLayoutResult();
        if (Intrinsics.areEqual(text, (layoutResult == null || (value = layoutResult.getValue()) == null || (layoutInput = value.getLayoutInput()) == null) ? null : layoutInput.getText())) {
            if (gesture instanceof SelectGesture) {
                return performSelectGesture($this$performHandwritingGesture, (SelectGesture) gesture, textFieldSelectionManager, function1);
            }
            if (gesture instanceof DeleteGesture) {
                return performDeleteGesture($this$performHandwritingGesture, (DeleteGesture) gesture, text, function1);
            }
            if (gesture instanceof SelectRangeGesture) {
                return performSelectRangeGesture($this$performHandwritingGesture, (SelectRangeGesture) gesture, textFieldSelectionManager, function1);
            }
            if (gesture instanceof DeleteRangeGesture) {
                return performDeleteRangeGesture($this$performHandwritingGesture, (DeleteRangeGesture) gesture, text, function1);
            }
            if (gesture instanceof JoinOrSplitGesture) {
                return performJoinOrSplitGesture($this$performHandwritingGesture, (JoinOrSplitGesture) gesture, text, viewConfiguration, function1);
            }
            if (gesture instanceof InsertGesture) {
                return performInsertGesture($this$performHandwritingGesture, (InsertGesture) gesture, viewConfiguration, function1);
            }
            if (gesture instanceof RemoveSpaceGesture) {
                return performRemoveSpaceGesture($this$performHandwritingGesture, (RemoveSpaceGesture) gesture, text, viewConfiguration, function1);
            }
            return 2;
        }
        return 3;
    }

    public final boolean previewHandwritingGesture$foundation_release(LegacyTextFieldState $this$previewHandwritingGesture, PreviewableHandwritingGesture gesture, final TextFieldSelectionManager textFieldSelectionManager, CancellationSignal cancellationSignal) {
        TextLayoutResult value;
        TextLayoutInput layoutInput;
        AnnotatedString text = $this$previewHandwritingGesture.getUntransformedText();
        if (text == null) {
            return false;
        }
        TextLayoutResultProxy layoutResult = $this$previewHandwritingGesture.getLayoutResult();
        if (Intrinsics.areEqual(text, (layoutResult == null || (value = layoutResult.getValue()) == null || (layoutInput = value.getLayoutInput()) == null) ? null : layoutInput.getText())) {
            if (gesture instanceof SelectGesture) {
                previewSelectGesture($this$previewHandwritingGesture, (SelectGesture) gesture, textFieldSelectionManager);
            } else if (gesture instanceof DeleteGesture) {
                previewDeleteGesture($this$previewHandwritingGesture, (DeleteGesture) gesture, textFieldSelectionManager);
            } else if (gesture instanceof SelectRangeGesture) {
                previewSelectRangeGesture($this$previewHandwritingGesture, (SelectRangeGesture) gesture, textFieldSelectionManager);
            } else if (!(gesture instanceof DeleteRangeGesture)) {
                return false;
            } else {
                previewDeleteRangeGesture($this$previewHandwritingGesture, (DeleteRangeGesture) gesture, textFieldSelectionManager);
            }
            if (cancellationSignal != null) {
                cancellationSignal.setOnCancelListener(new CancellationSignal.OnCancelListener() { // from class: androidx.compose.foundation.text.input.internal.HandwritingGestureApi34$$ExternalSyntheticLambda0
                    @Override // android.os.CancellationSignal.OnCancelListener
                    public final void onCancel() {
                        HandwritingGestureApi34.previewHandwritingGesture$lambda$9(TextFieldSelectionManager.this);
                    }
                });
                return true;
            }
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void previewHandwritingGesture$lambda$9(TextFieldSelectionManager $textFieldSelectionManager) {
        if ($textFieldSelectionManager != null) {
            $textFieldSelectionManager.clearPreviewHighlight$foundation_release();
        }
    }

    private final int performSelectGesture(LegacyTextFieldState $this$performSelectGesture, SelectGesture gesture, TextFieldSelectionManager textSelectionManager, Function1<? super EditCommand, Unit> function1) {
        long range;
        range = HandwritingGesture_androidKt.m1519getRangeForScreenRectOH9lIzo($this$performSelectGesture, RectHelper_androidKt.toComposeRect(gesture.getSelectionArea()), m1502toTextGranularityNUwxegE(gesture.getGranularity()), TextInclusionStrategy.Companion.getContainsCenter());
        if (TextRange.m6333getCollapsedimpl(range)) {
            return INSTANCE.fallbackOnLegacyTextField((HandwritingGesture) gesture, function1);
        }
        m1501performSelectionOnLegacyTextField8ffj60Q(range, textSelectionManager, function1);
        return 1;
    }

    private final void previewSelectGesture(LegacyTextFieldState $this$previewSelectGesture, SelectGesture gesture, TextFieldSelectionManager textFieldSelectionManager) {
        long m1519getRangeForScreenRectOH9lIzo;
        if (textFieldSelectionManager != null) {
            m1519getRangeForScreenRectOH9lIzo = HandwritingGesture_androidKt.m1519getRangeForScreenRectOH9lIzo($this$previewSelectGesture, RectHelper_androidKt.toComposeRect(gesture.getSelectionArea()), m1502toTextGranularityNUwxegE(gesture.getGranularity()), TextInclusionStrategy.Companion.getContainsCenter());
            textFieldSelectionManager.m1776setSelectionPreviewHighlight5zctL8$foundation_release(m1519getRangeForScreenRectOH9lIzo);
        }
    }

    private final int performDeleteGesture(LegacyTextFieldState $this$performDeleteGesture, DeleteGesture gesture, AnnotatedString text, Function1<? super EditCommand, Unit> function1) {
        long range;
        int granularity = m1502toTextGranularityNUwxegE(gesture.getGranularity());
        range = HandwritingGesture_androidKt.m1519getRangeForScreenRectOH9lIzo($this$performDeleteGesture, RectHelper_androidKt.toComposeRect(gesture.getDeletionArea()), granularity, TextInclusionStrategy.Companion.getContainsCenter());
        if (TextRange.m6333getCollapsedimpl(range)) {
            return INSTANCE.fallbackOnLegacyTextField((HandwritingGesture) gesture, function1);
        }
        m1500performDeletionOnLegacyTextFieldvJH6DeI(range, text, TextGranularity.m6297equalsimpl0(granularity, TextGranularity.Companion.m6302getWordDRrd7Zo()), function1);
        return 1;
    }

    private final void previewDeleteGesture(LegacyTextFieldState $this$previewDeleteGesture, DeleteGesture gesture, TextFieldSelectionManager textFieldSelectionManager) {
        long m1519getRangeForScreenRectOH9lIzo;
        if (textFieldSelectionManager != null) {
            m1519getRangeForScreenRectOH9lIzo = HandwritingGesture_androidKt.m1519getRangeForScreenRectOH9lIzo($this$previewDeleteGesture, RectHelper_androidKt.toComposeRect(gesture.getDeletionArea()), m1502toTextGranularityNUwxegE(gesture.getGranularity()), TextInclusionStrategy.Companion.getContainsCenter());
            textFieldSelectionManager.m1775setDeletionPreviewHighlight5zctL8$foundation_release(m1519getRangeForScreenRectOH9lIzo);
        }
    }

    private final int performSelectRangeGesture(LegacyTextFieldState $this$performSelectRangeGesture, SelectRangeGesture gesture, TextFieldSelectionManager textSelectionManager, Function1<? super EditCommand, Unit> function1) {
        long range;
        range = HandwritingGesture_androidKt.m1521getRangeForScreenRectsO048IG0($this$performSelectRangeGesture, RectHelper_androidKt.toComposeRect(gesture.getSelectionStartArea()), RectHelper_androidKt.toComposeRect(gesture.getSelectionEndArea()), m1502toTextGranularityNUwxegE(gesture.getGranularity()), TextInclusionStrategy.Companion.getContainsCenter());
        if (TextRange.m6333getCollapsedimpl(range)) {
            return INSTANCE.fallbackOnLegacyTextField((HandwritingGesture) gesture, function1);
        }
        m1501performSelectionOnLegacyTextField8ffj60Q(range, textSelectionManager, function1);
        return 1;
    }

    private final void previewSelectRangeGesture(LegacyTextFieldState $this$previewSelectRangeGesture, SelectRangeGesture gesture, TextFieldSelectionManager textFieldSelectionManager) {
        long m1521getRangeForScreenRectsO048IG0;
        if (textFieldSelectionManager != null) {
            m1521getRangeForScreenRectsO048IG0 = HandwritingGesture_androidKt.m1521getRangeForScreenRectsO048IG0($this$previewSelectRangeGesture, RectHelper_androidKt.toComposeRect(gesture.getSelectionStartArea()), RectHelper_androidKt.toComposeRect(gesture.getSelectionEndArea()), m1502toTextGranularityNUwxegE(gesture.getGranularity()), TextInclusionStrategy.Companion.getContainsCenter());
            textFieldSelectionManager.m1776setSelectionPreviewHighlight5zctL8$foundation_release(m1521getRangeForScreenRectsO048IG0);
        }
    }

    private final int performDeleteRangeGesture(LegacyTextFieldState $this$performDeleteRangeGesture, DeleteRangeGesture gesture, AnnotatedString text, Function1<? super EditCommand, Unit> function1) {
        long range;
        int granularity = m1502toTextGranularityNUwxegE(gesture.getGranularity());
        range = HandwritingGesture_androidKt.m1521getRangeForScreenRectsO048IG0($this$performDeleteRangeGesture, RectHelper_androidKt.toComposeRect(gesture.getDeletionStartArea()), RectHelper_androidKt.toComposeRect(gesture.getDeletionEndArea()), granularity, TextInclusionStrategy.Companion.getContainsCenter());
        if (TextRange.m6333getCollapsedimpl(range)) {
            return INSTANCE.fallbackOnLegacyTextField((HandwritingGesture) gesture, function1);
        }
        m1500performDeletionOnLegacyTextFieldvJH6DeI(range, text, TextGranularity.m6297equalsimpl0(granularity, TextGranularity.Companion.m6302getWordDRrd7Zo()), function1);
        return 1;
    }

    private final void previewDeleteRangeGesture(LegacyTextFieldState $this$previewDeleteRangeGesture, DeleteRangeGesture gesture, TextFieldSelectionManager textFieldSelectionManager) {
        long m1521getRangeForScreenRectsO048IG0;
        if (textFieldSelectionManager != null) {
            m1521getRangeForScreenRectsO048IG0 = HandwritingGesture_androidKt.m1521getRangeForScreenRectsO048IG0($this$previewDeleteRangeGesture, RectHelper_androidKt.toComposeRect(gesture.getDeletionStartArea()), RectHelper_androidKt.toComposeRect(gesture.getDeletionEndArea()), m1502toTextGranularityNUwxegE(gesture.getGranularity()), TextInclusionStrategy.Companion.getContainsCenter());
            textFieldSelectionManager.m1775setDeletionPreviewHighlight5zctL8$foundation_release(m1521getRangeForScreenRectsO048IG0);
        }
    }

    private final int performJoinOrSplitGesture(LegacyTextFieldState $this$performJoinOrSplitGesture, JoinOrSplitGesture gesture, AnnotatedString text, ViewConfiguration viewConfiguration, Function1<? super EditCommand, Unit> function1) {
        long offset;
        int offset2;
        Function1 editCommandConsumer;
        long range;
        TextLayoutResult value;
        boolean isBiDiBoundary;
        if (viewConfiguration != null) {
            offset = HandwritingGesture_androidKt.toOffset(gesture.getJoinOrSplitPoint());
            offset2 = HandwritingGesture_androidKt.m1514getOffsetForHandwritingGestured4ec7I($this$performJoinOrSplitGesture, offset, viewConfiguration);
            if (offset2 != -1) {
                TextLayoutResultProxy layoutResult = $this$performJoinOrSplitGesture.getLayoutResult();
                boolean z = false;
                if (layoutResult != null && (value = layoutResult.getValue()) != null) {
                    isBiDiBoundary = HandwritingGesture_androidKt.isBiDiBoundary(value, offset2);
                    if (isBiDiBoundary) {
                        z = true;
                    }
                }
                if (!z) {
                    range = HandwritingGesture_androidKt.rangeOfWhitespaces(text, offset2);
                    if (TextRange.m6333getCollapsedimpl(range)) {
                        performInsertionOnLegacyTextField(TextRange.m6339getStartimpl(range), " ", function1);
                    } else {
                        m1500performDeletionOnLegacyTextFieldvJH6DeI(range, text, false, function1);
                    }
                    return 1;
                }
                editCommandConsumer = function1;
            } else {
                editCommandConsumer = function1;
            }
            return fallbackOnLegacyTextField((HandwritingGesture) gesture, editCommandConsumer);
        }
        return fallbackOnLegacyTextField((HandwritingGesture) gesture, function1);
    }

    private final int performInsertGesture(LegacyTextFieldState $this$performInsertGesture, InsertGesture gesture, ViewConfiguration viewConfiguration, Function1<? super EditCommand, Unit> function1) {
        long offset;
        int offset2;
        TextLayoutResult value;
        boolean isBiDiBoundary;
        if (viewConfiguration != null) {
            offset = HandwritingGesture_androidKt.toOffset(gesture.getInsertionPoint());
            offset2 = HandwritingGesture_androidKt.m1514getOffsetForHandwritingGestured4ec7I($this$performInsertGesture, offset, viewConfiguration);
            if (offset2 != -1) {
                TextLayoutResultProxy layoutResult = $this$performInsertGesture.getLayoutResult();
                boolean z = false;
                if (layoutResult != null && (value = layoutResult.getValue()) != null) {
                    isBiDiBoundary = HandwritingGesture_androidKt.isBiDiBoundary(value, offset2);
                    if (isBiDiBoundary) {
                        z = true;
                    }
                }
                if (!z) {
                    performInsertionOnLegacyTextField(offset2, gesture.getTextToInsert(), function1);
                    return 1;
                }
            }
            return fallbackOnLegacyTextField((HandwritingGesture) gesture, function1);
        }
        return fallbackOnLegacyTextField((HandwritingGesture) gesture, function1);
    }

    private final int performRemoveSpaceGesture(LegacyTextFieldState $this$performRemoveSpaceGesture, RemoveSpaceGesture gesture, AnnotatedString text, ViewConfiguration viewConfiguration, Function1<? super EditCommand, Unit> function1) {
        long offset;
        long offset2;
        long range;
        EditCommand compoundEditCommand;
        TextLayoutResultProxy layoutResult = $this$performRemoveSpaceGesture.getLayoutResult();
        TextLayoutResult value = layoutResult != null ? layoutResult.getValue() : null;
        offset = HandwritingGesture_androidKt.toOffset(gesture.getStartPoint());
        offset2 = HandwritingGesture_androidKt.toOffset(gesture.getEndPoint());
        range = HandwritingGesture_androidKt.m1517getRangeForRemoveSpaceGesture5iVPX68(value, offset, offset2, $this$performRemoveSpaceGesture.getLayoutCoordinates(), viewConfiguration);
        if (TextRange.m6333getCollapsedimpl(range)) {
            return INSTANCE.fallbackOnLegacyTextField((HandwritingGesture) gesture, function1);
        }
        final Ref.IntRef firstMatchStart = new Ref.IntRef();
        firstMatchStart.element = -1;
        final Ref.IntRef lastMatchEnd = new Ref.IntRef();
        lastMatchEnd.element = -1;
        String newText = new Regex("\\s+").replace(TextRangeKt.m6346substringFDrldGo(text, range), new Function1<MatchResult, CharSequence>() { // from class: androidx.compose.foundation.text.input.internal.HandwritingGestureApi34$performRemoveSpaceGesture$newText$2
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final CharSequence invoke(MatchResult it) {
                if (Ref.IntRef.this.element == -1) {
                    Ref.IntRef.this.element = it.getRange().getFirst();
                }
                lastMatchEnd.element = it.getRange().getLast() + 1;
                return "";
            }
        });
        if (firstMatchStart.element == -1 || lastMatchEnd.element == -1) {
            return fallbackOnLegacyTextField((HandwritingGesture) gesture, function1);
        }
        int replacedRangeStart = TextRange.m6339getStartimpl(range) + firstMatchStart.element;
        int replacedRangeEnd = TextRange.m6339getStartimpl(range) + lastMatchEnd.element;
        String finalNewText = newText.substring(firstMatchStart.element, newText.length() - (TextRange.m6335getLengthimpl(range) - lastMatchEnd.element));
        Intrinsics.checkNotNullExpressionValue(finalNewText, "substring(...)");
        compoundEditCommand = HandwritingGesture_androidKt.compoundEditCommand(new SetSelectionCommand(replacedRangeStart, replacedRangeEnd), new CommitTextCommand(finalNewText, 1));
        function1.invoke(compoundEditCommand);
        return 1;
    }

    private final void performInsertionOnLegacyTextField(int offset, String text, Function1<? super EditCommand, Unit> function1) {
        EditCommand compoundEditCommand;
        compoundEditCommand = HandwritingGesture_androidKt.compoundEditCommand(new SetSelectionCommand(offset, offset), new CommitTextCommand(text, 1));
        function1.invoke(compoundEditCommand);
    }

    /* renamed from: performSelectionOnLegacyTextField-8ffj60Q  reason: not valid java name */
    private final void m1501performSelectionOnLegacyTextField8ffj60Q(long range, TextFieldSelectionManager textSelectionManager, Function1<? super EditCommand, Unit> function1) {
        function1.invoke(new SetSelectionCommand(TextRange.m6339getStartimpl(range), TextRange.m6334getEndimpl(range)));
        if (textSelectionManager != null) {
            textSelectionManager.enterSelectionMode$foundation_release(true);
        }
    }

    /* renamed from: performDeletionOnLegacyTextField-vJH6DeI  reason: not valid java name */
    private final void m1500performDeletionOnLegacyTextFieldvJH6DeI(long range, AnnotatedString text, boolean adjustRange, Function1<? super EditCommand, Unit> function1) {
        long finalRange;
        EditCommand compoundEditCommand;
        if (adjustRange) {
            finalRange = HandwritingGesture_androidKt.m1511adjustHandwritingDeleteGestureRange72CqOWE(range, text);
        } else {
            finalRange = range;
        }
        compoundEditCommand = HandwritingGesture_androidKt.compoundEditCommand(new SetSelectionCommand(TextRange.m6334getEndimpl(finalRange), TextRange.m6334getEndimpl(finalRange)), new DeleteSurroundingTextCommand(TextRange.m6335getLengthimpl(finalRange), 0));
        function1.invoke(compoundEditCommand);
    }

    private final int fallbackOnLegacyTextField(HandwritingGesture gesture, Function1<? super EditCommand, Unit> function1) {
        String fallbackText = gesture.getFallbackText();
        if (fallbackText == null) {
            return 3;
        }
        function1.invoke(new CommitTextCommand(fallbackText, 1));
        return 5;
    }

    /* renamed from: toTextGranularity-NUwxegE  reason: not valid java name */
    private final int m1502toTextGranularityNUwxegE(int $this$toTextGranularity_u2dNUwxegE) {
        switch ($this$toTextGranularity_u2dNUwxegE) {
            case 1:
                return TextGranularity.Companion.m6302getWordDRrd7Zo();
            case 2:
                return TextGranularity.Companion.m6301getCharacterDRrd7Zo();
            default:
                return TextGranularity.Companion.m6301getCharacterDRrd7Zo();
        }
    }
}
