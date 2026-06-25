package androidx.compose.ui.input.pointer;

import android.os.Build;
import android.view.MotionEvent;
import androidx.collection.LongSparseArray;
import com.itextpdf.kernel.xmp.PdfConst;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: PointerEvent.android.kt */
@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\t\b\u0007\u0018\u00002\u00020\u0001B\u0015\b\u0016\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0002\u0010\u0005B\u001f\b\u0000\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0002\u0010\bJ\u0015\u0010\"\u001a\u00020\u001dH\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b#\u0010\fJ\f\u0010$\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003J\u001e\u0010%\u001a\u00020\u00002\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\u0010\u0018\u001a\u0004\u0018\u00010\u0019R\u0019\u0010\t\u001a\u00020\nø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u000b\u0010\fR\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0010\u001a\u00020\u00118F¢\u0006\u0006\u001a\u0004\b\u0012\u0010\fR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0015\u001a\u00020\u0016ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u0017\u0010\fR\u0016\u0010\u0018\u001a\u0004\u0018\u00010\u00198@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u001a\u0010\u001bR,\u0010\u001e\u001a\u00020\u001d2\u0006\u0010\u001c\u001a\u00020\u001d@@X\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\r\u001a\u0004\b\u001f\u0010\f\"\u0004\b \u0010!\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006&"}, d2 = {"Landroidx/compose/ui/input/pointer/PointerEvent;", "", "changes", "", "Landroidx/compose/ui/input/pointer/PointerInputChange;", "(Ljava/util/List;)V", "internalPointerEvent", "Landroidx/compose/ui/input/pointer/InternalPointerEvent;", "(Ljava/util/List;Landroidx/compose/ui/input/pointer/InternalPointerEvent;)V", "buttons", "Landroidx/compose/ui/input/pointer/PointerButtons;", "getButtons-ry648PA", "()I", "I", "getChanges", "()Ljava/util/List;", "classification", "", "getClassification", "getInternalPointerEvent$ui_release", "()Landroidx/compose/ui/input/pointer/InternalPointerEvent;", "keyboardModifiers", "Landroidx/compose/ui/input/pointer/PointerKeyboardModifiers;", "getKeyboardModifiers-k7X9c1A", "motionEvent", "Landroid/view/MotionEvent;", "getMotionEvent$ui_release", "()Landroid/view/MotionEvent;", "<set-?>", "Landroidx/compose/ui/input/pointer/PointerEventType;", PdfConst.Type, "getType-7fucELk", "setType-EhbLWgg$ui_release", "(I)V", "calculatePointerEventType", "calculatePointerEventType-7fucELk", "component1", "copy", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class PointerEvent {
    public static final int $stable = 8;
    private final int buttons;
    private final List<PointerInputChange> changes;
    private final InternalPointerEvent internalPointerEvent;
    private final int keyboardModifiers;
    private int type;

    public PointerEvent(List<PointerInputChange> list, InternalPointerEvent internalPointerEvent) {
        this.changes = list;
        this.internalPointerEvent = internalPointerEvent;
        MotionEvent motionEvent$ui_release = getMotionEvent$ui_release();
        this.buttons = PointerButtons.m5445constructorimpl(motionEvent$ui_release != null ? motionEvent$ui_release.getButtonState() : 0);
        MotionEvent motionEvent$ui_release2 = getMotionEvent$ui_release();
        this.keyboardModifiers = PointerKeyboardModifiers.m5574constructorimpl(motionEvent$ui_release2 != null ? motionEvent$ui_release2.getMetaState() : 0);
        this.type = m5451calculatePointerEventType7fucELk();
    }

    public final List<PointerInputChange> getChanges() {
        return this.changes;
    }

    public final InternalPointerEvent getInternalPointerEvent$ui_release() {
        return this.internalPointerEvent;
    }

    public final MotionEvent getMotionEvent$ui_release() {
        InternalPointerEvent internalPointerEvent = this.internalPointerEvent;
        if (internalPointerEvent != null) {
            return internalPointerEvent.getMotionEvent();
        }
        return null;
    }

    public final int getClassification() {
        MotionEvent motionEvent$ui_release;
        if (Build.VERSION.SDK_INT < 29 || (motionEvent$ui_release = getMotionEvent$ui_release()) == null) {
            return 0;
        }
        return motionEvent$ui_release.getClassification();
    }

    public PointerEvent(List<PointerInputChange> list) {
        this(list, null);
    }

    /* renamed from: getButtons-ry648PA  reason: not valid java name */
    public final int m5452getButtonsry648PA() {
        return this.buttons;
    }

    /* renamed from: getKeyboardModifiers-k7X9c1A  reason: not valid java name */
    public final int m5453getKeyboardModifiersk7X9c1A() {
        return this.keyboardModifiers;
    }

    /* renamed from: getType-7fucELk  reason: not valid java name */
    public final int m5454getType7fucELk() {
        return this.type;
    }

    /* renamed from: setType-EhbLWgg$ui_release  reason: not valid java name */
    public final void m5455setTypeEhbLWgg$ui_release(int i) {
        this.type = i;
    }

    /* renamed from: calculatePointerEventType-7fucELk  reason: not valid java name */
    private final int m5451calculatePointerEventType7fucELk() {
        MotionEvent motionEvent = getMotionEvent$ui_release();
        if (motionEvent != null) {
            switch (motionEvent.getActionMasked()) {
                case 0:
                case 5:
                    return PointerEventType.Companion.m5468getPress7fucELk();
                case 1:
                case 6:
                    return PointerEventType.Companion.m5469getRelease7fucELk();
                case 2:
                case 7:
                    return PointerEventType.Companion.m5467getMove7fucELk();
                case 3:
                case 4:
                default:
                    return PointerEventType.Companion.m5471getUnknown7fucELk();
                case 8:
                    return PointerEventType.Companion.m5470getScroll7fucELk();
                case 9:
                    return PointerEventType.Companion.m5465getEnter7fucELk();
                case 10:
                    return PointerEventType.Companion.m5466getExit7fucELk();
            }
        }
        List $this$fastForEach$iv = this.changes;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            PointerInputChange it = (PointerInputChange) item$iv;
            if (PointerEventKt.changedToUpIgnoreConsumed(it)) {
                return PointerEventType.Companion.m5469getRelease7fucELk();
            }
            if (PointerEventKt.changedToDownIgnoreConsumed(it)) {
                return PointerEventType.Companion.m5468getPress7fucELk();
            }
        }
        return PointerEventType.Companion.m5467getMove7fucELk();
    }

    public final List<PointerInputChange> component1() {
        return this.changes;
    }

    public final PointerEvent copy(List<PointerInputChange> list, MotionEvent motionEvent) {
        List $this$fastForEach$iv;
        boolean z;
        if (motionEvent == null) {
            return new PointerEvent(list, null);
        }
        if (Intrinsics.areEqual(motionEvent, getMotionEvent$ui_release())) {
            return new PointerEvent(list, this.internalPointerEvent);
        }
        LongSparseArray changesArray = new LongSparseArray(list.size());
        ArrayList pointerEventData = new ArrayList(list.size());
        List $this$fastForEach$iv2 = list;
        boolean z2 = false;
        int index$iv = 0;
        int size = $this$fastForEach$iv2.size();
        while (index$iv < size) {
            Object item$iv = $this$fastForEach$iv2.get(index$iv);
            PointerInputChange change = (PointerInputChange) item$iv;
            changesArray.put(change.m5510getIdJ3iCeTQ(), change);
            ArrayList arrayList = pointerEventData;
            long m5510getIdJ3iCeTQ = change.m5510getIdJ3iCeTQ();
            long uptimeMillis = change.getUptimeMillis();
            long m5512getPositionF1C5BW0 = change.m5512getPositionF1C5BW0();
            long m5512getPositionF1C5BW02 = change.m5512getPositionF1C5BW0();
            boolean pressed = change.getPressed();
            float pressure = change.getPressure();
            int m5515getTypeT8wyACA = change.m5515getTypeT8wyACA();
            ArrayList pointerEventData2 = pointerEventData;
            InternalPointerEvent internalPointerEvent = this.internalPointerEvent;
            boolean z3 = false;
            if (internalPointerEvent != null) {
                $this$fastForEach$iv = $this$fastForEach$iv2;
                z = z2;
                if (internalPointerEvent.m5440activeHoverEvent0FcD4WY(change.m5510getIdJ3iCeTQ())) {
                    z3 = true;
                }
            } else {
                $this$fastForEach$iv = $this$fastForEach$iv2;
                z = z2;
            }
            arrayList.add(new PointerInputEventData(m5510getIdJ3iCeTQ, uptimeMillis, m5512getPositionF1C5BW0, m5512getPositionF1C5BW02, pressed, pressure, m5515getTypeT8wyACA, z3, null, 0L, 0L, 1792, null));
            index$iv++;
            pointerEventData = pointerEventData2;
            $this$fastForEach$iv2 = $this$fastForEach$iv;
            z2 = z;
        }
        PointerInputEvent pointerInputEvent = new PointerInputEvent(motionEvent.getEventTime(), pointerEventData, motionEvent);
        InternalPointerEvent event = new InternalPointerEvent(changesArray, pointerInputEvent);
        return new PointerEvent(list, event);
    }
}
