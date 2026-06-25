package androidx.compose.ui.platform;

import android.view.View;
import androidx.compose.ui.hapticfeedback.HapticFeedback;
import androidx.compose.ui.hapticfeedback.HapticFeedbackType;
import kotlin.Metadata;
/* compiled from: HapticFeedback.android.kt */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u001a\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH\u0016ø\u0001\u0000¢\u0006\u0004\b\t\u0010\nR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u000b"}, d2 = {"Landroidx/compose/ui/platform/DefaultHapticFeedback;", "Landroidx/compose/ui/hapticfeedback/HapticFeedback;", "view", "Landroid/view/View;", "(Landroid/view/View;)V", "performHapticFeedback", "", "hapticFeedbackType", "Landroidx/compose/ui/hapticfeedback/HapticFeedbackType;", "performHapticFeedback-CdsT49E", "(I)V", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class DefaultHapticFeedback implements HapticFeedback {
    public static final int $stable = 8;
    private final View view;

    public DefaultHapticFeedback(View view) {
        this.view = view;
    }

    @Override // androidx.compose.ui.hapticfeedback.HapticFeedback
    /* renamed from: performHapticFeedback-CdsT49E */
    public void mo5011performHapticFeedbackCdsT49E(int hapticFeedbackType) {
        if (HapticFeedbackType.m5015equalsimpl0(hapticFeedbackType, HapticFeedbackType.Companion.m5019getConfirm5zf0vsI())) {
            this.view.performHapticFeedback(16);
        } else if (HapticFeedbackType.m5015equalsimpl0(hapticFeedbackType, HapticFeedbackType.Companion.m5020getContextClick5zf0vsI())) {
            this.view.performHapticFeedback(6);
        } else if (HapticFeedbackType.m5015equalsimpl0(hapticFeedbackType, HapticFeedbackType.Companion.m5021getGestureEnd5zf0vsI())) {
            this.view.performHapticFeedback(13);
        } else if (HapticFeedbackType.m5015equalsimpl0(hapticFeedbackType, HapticFeedbackType.Companion.m5022getGestureThresholdActivate5zf0vsI())) {
            this.view.performHapticFeedback(23);
        } else if (HapticFeedbackType.m5015equalsimpl0(hapticFeedbackType, HapticFeedbackType.Companion.m5023getLongPress5zf0vsI())) {
            this.view.performHapticFeedback(0);
        } else if (!HapticFeedbackType.m5015equalsimpl0(hapticFeedbackType, HapticFeedbackType.Companion.m5024getReject5zf0vsI())) {
            if (HapticFeedbackType.m5015equalsimpl0(hapticFeedbackType, HapticFeedbackType.Companion.m5025getSegmentFrequentTick5zf0vsI())) {
                this.view.performHapticFeedback(27);
            } else if (HapticFeedbackType.m5015equalsimpl0(hapticFeedbackType, HapticFeedbackType.Companion.m5026getSegmentTick5zf0vsI())) {
                this.view.performHapticFeedback(26);
            } else if (HapticFeedbackType.m5015equalsimpl0(hapticFeedbackType, HapticFeedbackType.Companion.m5027getTextHandleMove5zf0vsI())) {
                this.view.performHapticFeedback(9);
            } else if (HapticFeedbackType.m5015equalsimpl0(hapticFeedbackType, HapticFeedbackType.Companion.m5028getToggleOff5zf0vsI())) {
                this.view.performHapticFeedback(22);
            } else if (HapticFeedbackType.m5015equalsimpl0(hapticFeedbackType, HapticFeedbackType.Companion.m5029getToggleOn5zf0vsI())) {
                this.view.performHapticFeedback(21);
            } else if (HapticFeedbackType.m5015equalsimpl0(hapticFeedbackType, HapticFeedbackType.Companion.m5030getVirtualKey5zf0vsI())) {
                this.view.performHapticFeedback(1);
            }
        } else {
            this.view.performHapticFeedback(17);
        }
    }
}
