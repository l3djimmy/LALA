package androidx.compose.ui.input.pointer;

import androidx.collection.LongSparseArray;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PointerInputEventProcessor.kt */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0002\u0018\u00002\u00020\u0001:\u0001\u000eB\u0005¢\u0006\u0002\u0010\u0002J\u0006\u0010\u0006\u001a\u00020\u0007J\u0016\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\rR\u0014\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Landroidx/compose/ui/input/pointer/PointerInputChangeEventProducer;", "", "()V", "previousPointerInputData", "Landroidx/collection/LongSparseArray;", "Landroidx/compose/ui/input/pointer/PointerInputChangeEventProducer$PointerInputData;", "clear", "", "produce", "Landroidx/compose/ui/input/pointer/InternalPointerEvent;", "pointerInputEvent", "Landroidx/compose/ui/input/pointer/PointerInputEvent;", "positionCalculator", "Landroidx/compose/ui/input/pointer/PositionCalculator;", "PointerInputData", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class PointerInputChangeEventProducer {
    private final LongSparseArray<PointerInputData> previousPointerInputData = new LongSparseArray<>(0, 1, null);

    public final InternalPointerEvent produce(PointerInputEvent pointerInputEvent, PositionCalculator positionCalculator) {
        boolean previousDown;
        long previousTime;
        long previousPosition;
        LongSparseArray changes = new LongSparseArray(pointerInputEvent.getPointers().size());
        List $this$fastForEach$iv = pointerInputEvent.getPointers();
        boolean z = false;
        int index$iv = 0;
        int size = $this$fastForEach$iv.size();
        while (index$iv < size) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            PointerInputEventData it = (PointerInputEventData) item$iv;
            List $this$fastForEach$iv2 = $this$fastForEach$iv;
            boolean z2 = z;
            PointerInputData previousData = this.previousPointerInputData.get(it.m5526getIdJ3iCeTQ());
            if (previousData == null) {
                long previousTime2 = it.getUptime();
                long previousPosition2 = it.m5528getPositionF1C5BW0();
                previousDown = false;
                previousTime = previousTime2;
                previousPosition = previousPosition2;
            } else {
                long previousTime3 = previousData.getUptime();
                boolean previousDown2 = previousData.getDown();
                long previousPosition3 = positionCalculator.mo5593screenToLocalMKHz9U(previousData.m5517getPositionOnScreenF1C5BW0());
                previousDown = previousDown2;
                previousTime = previousTime3;
                previousPosition = previousPosition3;
            }
            changes.put(it.m5526getIdJ3iCeTQ(), new PointerInputChange(it.m5526getIdJ3iCeTQ(), it.getUptime(), it.m5528getPositionF1C5BW0(), it.getDown(), it.getPressure(), previousTime, previousPosition, previousDown, false, it.m5531getTypeT8wyACA(), it.getHistorical(), it.m5530getScrollDeltaF1C5BW0(), it.m5527getOriginalEventPositionF1C5BW0(), null));
            boolean down = it.getDown();
            LongSparseArray<PointerInputData> longSparseArray = this.previousPointerInputData;
            if (down) {
                longSparseArray.put(it.m5526getIdJ3iCeTQ(), new PointerInputData(it.getUptime(), it.m5529getPositionOnScreenF1C5BW0(), it.getDown(), null));
            } else {
                longSparseArray.remove(it.m5526getIdJ3iCeTQ());
            }
            index$iv++;
            $this$fastForEach$iv = $this$fastForEach$iv2;
            z = z2;
        }
        return new InternalPointerEvent(changes, pointerInputEvent);
    }

    public final void clear() {
        this.previousPointerInputData.clear();
    }

    /* compiled from: PointerInputEventProcessor.kt */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0002\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0019\u0010\u0004\u001a\u00020\u0005ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\f\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u000f"}, d2 = {"Landroidx/compose/ui/input/pointer/PointerInputChangeEventProducer$PointerInputData;", "", "uptime", "", "positionOnScreen", "Landroidx/compose/ui/geometry/Offset;", "down", "", "(JJZLkotlin/jvm/internal/DefaultConstructorMarker;)V", "getDown", "()Z", "getPositionOnScreen-F1C5BW0", "()J", "J", "getUptime", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    private static final class PointerInputData {
        private final boolean down;
        private final long positionOnScreen;
        private final long uptime;

        public /* synthetic */ PointerInputData(long j, long j2, boolean z, DefaultConstructorMarker defaultConstructorMarker) {
            this(j, j2, z);
        }

        private PointerInputData(long uptime, long positionOnScreen, boolean down) {
            this.uptime = uptime;
            this.positionOnScreen = positionOnScreen;
            this.down = down;
        }

        public final long getUptime() {
            return this.uptime;
        }

        /* renamed from: getPositionOnScreen-F1C5BW0  reason: not valid java name */
        public final long m5517getPositionOnScreenF1C5BW0() {
            return this.positionOnScreen;
        }

        public final boolean getDown() {
            return this.down;
        }
    }
}
