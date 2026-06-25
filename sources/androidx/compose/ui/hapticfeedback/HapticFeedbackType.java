package androidx.compose.ui.hapticfeedback;

import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: HapticFeedbackType.kt */
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0087@\u0018\u0000 \u00112\u00020\u0001:\u0001\u0011B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u001a\u0010\u0006\u001a\u00020\u00072\b\u0010\b\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\f\u0010\u0005J\u000f\u0010\r\u001a\u00020\u000eH\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u000e\u0010\u0002\u001a\u00020\u0003X\u0080\u0004¢\u0006\u0002\n\u0000\u0088\u0001\u0002\u0092\u0001\u00020\u0003¨\u0006\u0012"}, d2 = {"Landroidx/compose/ui/hapticfeedback/HapticFeedbackType;", "", "value", "", "constructor-impl", "(I)I", "equals", "", "other", "equals-impl", "(ILjava/lang/Object;)Z", "hashCode", "hashCode-impl", "toString", "", "toString-impl", "(I)Ljava/lang/String;", "Companion", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@JvmInline
/* loaded from: classes11.dex */
public final class HapticFeedbackType {
    public static final Companion Companion = new Companion(null);
    private final int value;

    /* renamed from: box-impl  reason: not valid java name */
    public static final /* synthetic */ HapticFeedbackType m5012boximpl(int i) {
        return new HapticFeedbackType(i);
    }

    /* renamed from: constructor-impl  reason: not valid java name */
    public static int m5013constructorimpl(int i) {
        return i;
    }

    /* renamed from: equals-impl  reason: not valid java name */
    public static boolean m5014equalsimpl(int i, Object obj) {
        return (obj instanceof HapticFeedbackType) && i == ((HapticFeedbackType) obj).m5018unboximpl();
    }

    /* renamed from: equals-impl0  reason: not valid java name */
    public static final boolean m5015equalsimpl0(int i, int i2) {
        return i == i2;
    }

    /* renamed from: hashCode-impl  reason: not valid java name */
    public static int m5016hashCodeimpl(int i) {
        return Integer.hashCode(i);
    }

    public boolean equals(Object obj) {
        return m5014equalsimpl(this.value, obj);
    }

    public int hashCode() {
        return m5016hashCodeimpl(this.value);
    }

    /* renamed from: unbox-impl  reason: not valid java name */
    public final /* synthetic */ int m5018unboximpl() {
        return this.value;
    }

    private /* synthetic */ HapticFeedbackType(int value) {
        this.value = value;
    }

    public String toString() {
        return m5017toStringimpl(this.value);
    }

    /* renamed from: toString-impl  reason: not valid java name */
    public static String m5017toStringimpl(int arg0) {
        return m5015equalsimpl0(arg0, Companion.m5019getConfirm5zf0vsI()) ? "Confirm" : m5015equalsimpl0(arg0, Companion.m5020getContextClick5zf0vsI()) ? "ContextClick" : m5015equalsimpl0(arg0, Companion.m5021getGestureEnd5zf0vsI()) ? "GestureEnd" : m5015equalsimpl0(arg0, Companion.m5022getGestureThresholdActivate5zf0vsI()) ? "GestureThresholdActivate" : m5015equalsimpl0(arg0, Companion.m5023getLongPress5zf0vsI()) ? "LongPress" : m5015equalsimpl0(arg0, Companion.m5024getReject5zf0vsI()) ? "Reject" : m5015equalsimpl0(arg0, Companion.m5025getSegmentFrequentTick5zf0vsI()) ? "SegmentFrequentTick" : m5015equalsimpl0(arg0, Companion.m5026getSegmentTick5zf0vsI()) ? "SegmentTick" : m5015equalsimpl0(arg0, Companion.m5027getTextHandleMove5zf0vsI()) ? "TextHandleMove" : m5015equalsimpl0(arg0, Companion.m5028getToggleOff5zf0vsI()) ? "ToggleOff" : m5015equalsimpl0(arg0, Companion.m5029getToggleOn5zf0vsI()) ? "ToggleOn" : m5015equalsimpl0(arg0, Companion.m5030getVirtualKey5zf0vsI()) ? "VirtualKey" : "Invalid";
    }

    /* compiled from: HapticFeedbackType.kt */
    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0019\n\u0002\u0010 \n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\f\u0010\u001d\u001a\b\u0012\u0004\u0012\u00020\u00040\u001eR\u0017\u0010\u0003\u001a\u00020\u00048Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u0005\u0010\u0006R\u0017\u0010\u0007\u001a\u00020\u00048Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\b\u0010\u0006R\u0017\u0010\t\u001a\u00020\u00048Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\n\u0010\u0006R\u0017\u0010\u000b\u001a\u00020\u00048Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\f\u0010\u0006R\u0017\u0010\r\u001a\u00020\u00048Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u000e\u0010\u0006R\u0017\u0010\u000f\u001a\u00020\u00048Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0006R\u0017\u0010\u0011\u001a\u00020\u00048Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0006R\u0017\u0010\u0013\u001a\u00020\u00048Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u0014\u0010\u0006R\u0017\u0010\u0015\u001a\u00020\u00048Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u0016\u0010\u0006R\u0017\u0010\u0017\u001a\u00020\u00048Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u0006R\u0017\u0010\u0019\u001a\u00020\u00048Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u001a\u0010\u0006R\u0017\u0010\u001b\u001a\u00020\u00048Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u001c\u0010\u0006\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u001f"}, d2 = {"Landroidx/compose/ui/hapticfeedback/HapticFeedbackType$Companion;", "", "()V", "Confirm", "Landroidx/compose/ui/hapticfeedback/HapticFeedbackType;", "getConfirm-5zf0vsI", "()I", "ContextClick", "getContextClick-5zf0vsI", "GestureEnd", "getGestureEnd-5zf0vsI", "GestureThresholdActivate", "getGestureThresholdActivate-5zf0vsI", "LongPress", "getLongPress-5zf0vsI", "Reject", "getReject-5zf0vsI", "SegmentFrequentTick", "getSegmentFrequentTick-5zf0vsI", "SegmentTick", "getSegmentTick-5zf0vsI", "TextHandleMove", "getTextHandleMove-5zf0vsI", "ToggleOff", "getToggleOff-5zf0vsI", "ToggleOn", "getToggleOn-5zf0vsI", "VirtualKey", "getVirtualKey-5zf0vsI", "values", "", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        /* renamed from: getConfirm-5zf0vsI  reason: not valid java name */
        public final int m5019getConfirm5zf0vsI() {
            return PlatformHapticFeedbackType.INSTANCE.m5031getConfirm5zf0vsI();
        }

        /* renamed from: getContextClick-5zf0vsI  reason: not valid java name */
        public final int m5020getContextClick5zf0vsI() {
            return PlatformHapticFeedbackType.INSTANCE.m5032getContextClick5zf0vsI();
        }

        /* renamed from: getGestureEnd-5zf0vsI  reason: not valid java name */
        public final int m5021getGestureEnd5zf0vsI() {
            return PlatformHapticFeedbackType.INSTANCE.m5033getGestureEnd5zf0vsI();
        }

        /* renamed from: getGestureThresholdActivate-5zf0vsI  reason: not valid java name */
        public final int m5022getGestureThresholdActivate5zf0vsI() {
            return PlatformHapticFeedbackType.INSTANCE.m5034getGestureThresholdActivate5zf0vsI();
        }

        /* renamed from: getLongPress-5zf0vsI  reason: not valid java name */
        public final int m5023getLongPress5zf0vsI() {
            return PlatformHapticFeedbackType.INSTANCE.m5035getLongPress5zf0vsI();
        }

        /* renamed from: getReject-5zf0vsI  reason: not valid java name */
        public final int m5024getReject5zf0vsI() {
            return PlatformHapticFeedbackType.INSTANCE.m5036getReject5zf0vsI();
        }

        /* renamed from: getSegmentFrequentTick-5zf0vsI  reason: not valid java name */
        public final int m5025getSegmentFrequentTick5zf0vsI() {
            return PlatformHapticFeedbackType.INSTANCE.m5037getSegmentFrequentTick5zf0vsI();
        }

        /* renamed from: getSegmentTick-5zf0vsI  reason: not valid java name */
        public final int m5026getSegmentTick5zf0vsI() {
            return PlatformHapticFeedbackType.INSTANCE.m5038getSegmentTick5zf0vsI();
        }

        /* renamed from: getTextHandleMove-5zf0vsI  reason: not valid java name */
        public final int m5027getTextHandleMove5zf0vsI() {
            return PlatformHapticFeedbackType.INSTANCE.m5039getTextHandleMove5zf0vsI();
        }

        /* renamed from: getToggleOff-5zf0vsI  reason: not valid java name */
        public final int m5028getToggleOff5zf0vsI() {
            return PlatformHapticFeedbackType.INSTANCE.m5040getToggleOff5zf0vsI();
        }

        /* renamed from: getToggleOn-5zf0vsI  reason: not valid java name */
        public final int m5029getToggleOn5zf0vsI() {
            return PlatformHapticFeedbackType.INSTANCE.m5041getToggleOn5zf0vsI();
        }

        /* renamed from: getVirtualKey-5zf0vsI  reason: not valid java name */
        public final int m5030getVirtualKey5zf0vsI() {
            return PlatformHapticFeedbackType.INSTANCE.m5042getVirtualKey5zf0vsI();
        }

        public final List<HapticFeedbackType> values() {
            return CollectionsKt.listOf((Object[]) new HapticFeedbackType[]{HapticFeedbackType.m5012boximpl(m5019getConfirm5zf0vsI()), HapticFeedbackType.m5012boximpl(m5020getContextClick5zf0vsI()), HapticFeedbackType.m5012boximpl(m5021getGestureEnd5zf0vsI()), HapticFeedbackType.m5012boximpl(m5022getGestureThresholdActivate5zf0vsI()), HapticFeedbackType.m5012boximpl(m5023getLongPress5zf0vsI()), HapticFeedbackType.m5012boximpl(m5024getReject5zf0vsI()), HapticFeedbackType.m5012boximpl(m5025getSegmentFrequentTick5zf0vsI()), HapticFeedbackType.m5012boximpl(m5026getSegmentTick5zf0vsI()), HapticFeedbackType.m5012boximpl(m5027getTextHandleMove5zf0vsI()), HapticFeedbackType.m5012boximpl(m5028getToggleOff5zf0vsI()), HapticFeedbackType.m5012boximpl(m5029getToggleOn5zf0vsI()), HapticFeedbackType.m5012boximpl(m5030getVirtualKey5zf0vsI())});
        }
    }
}
