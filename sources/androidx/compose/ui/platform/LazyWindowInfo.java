package androidx.compose.ui.platform;

import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.input.pointer.PointerKeyboardModifiers;
import androidx.compose.ui.unit.IntSize;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: AndroidWindowInfo.android.kt */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0016\u0010\u001a\u001a\u00020\u001b2\u000e\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u0019J\u0017\u0010\u001c\u001a\u00020\u001b2\f\u0010\u001d\u001a\b\u0012\u0004\u0012\u00020\u00050\u0019H\u0086\bR\u0016\u0010\u0003\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010\u0006\u001a\u00020\u00058VX\u0096\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR+\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\n8V@VX\u0096\u008e\u0002¢\u0006\u0012\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u000b\u0010\f\"\u0004\b\r\u0010\u000eR*\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u00128V@VX\u0096\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\f\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017R\u0016\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u0019X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u001e"}, d2 = {"Landroidx/compose/ui/platform/LazyWindowInfo;", "Landroidx/compose/ui/platform/WindowInfo;", "()V", "_containerSize", "Landroidx/compose/runtime/MutableState;", "Landroidx/compose/ui/unit/IntSize;", "containerSize", "getContainerSize-YbymL2g", "()J", "<set-?>", "", "isWindowFocused", "()Z", "setWindowFocused", "(Z)V", "isWindowFocused$delegate", "Landroidx/compose/runtime/MutableState;", "value", "Landroidx/compose/ui/input/pointer/PointerKeyboardModifiers;", "keyboardModifiers", "getKeyboardModifiers-k7X9c1A", "()I", "setKeyboardModifiers-5xRPYO0", "(I)V", "onInitializeContainerSize", "Lkotlin/Function0;", "setOnInitializeContainerSize", "", "updateContainerSizeIfObserved", "calculateContainerSize", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class LazyWindowInfo implements WindowInfo {
    public static final int $stable = 0;
    private MutableState<IntSize> _containerSize;
    private final MutableState isWindowFocused$delegate;
    private Function0<IntSize> onInitializeContainerSize;

    public LazyWindowInfo() {
        MutableState mutableStateOf$default;
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.isWindowFocused$delegate = mutableStateOf$default;
    }

    public static final /* synthetic */ MutableState access$get_containerSize$p(LazyWindowInfo $this) {
        return $this._containerSize;
    }

    @Override // androidx.compose.ui.platform.WindowInfo
    public boolean isWindowFocused() {
        State $this$getValue$iv = this.isWindowFocused$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    public void setWindowFocused(boolean z) {
        MutableState $this$setValue$iv = this.isWindowFocused$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    @Override // androidx.compose.ui.platform.WindowInfo
    /* renamed from: getKeyboardModifiers-k7X9c1A */
    public int mo6054getKeyboardModifiersk7X9c1A() {
        return WindowInfoImpl.Companion.getGlobalKeyboardModifiers$ui_release().getValue().m5579unboximpl();
    }

    /* renamed from: setKeyboardModifiers-5xRPYO0 */
    public void m6055setKeyboardModifiers5xRPYO0(int value) {
        WindowInfoImpl.Companion.getGlobalKeyboardModifiers$ui_release().setValue(PointerKeyboardModifiers.m5573boximpl(value));
    }

    public final void updateContainerSizeIfObserved(Function0<IntSize> function0) {
        MutableState it = this._containerSize;
        if (it != null) {
            it.setValue(function0.invoke());
        }
    }

    public final void setOnInitializeContainerSize(Function0<IntSize> function0) {
        if (this._containerSize == null) {
            this.onInitializeContainerSize = function0;
        }
    }

    @Override // androidx.compose.ui.platform.WindowInfo
    /* renamed from: getContainerSize-YbymL2g */
    public long mo6053getContainerSizeYbymL2g() {
        MutableState<IntSize> mutableStateOf$default;
        if (this._containerSize == null) {
            Function0<IntSize> function0 = this.onInitializeContainerSize;
            long initialSize = function0 != null ? function0.invoke().m7048unboximpl() : IntSize.Companion.m7049getZeroYbymL2g();
            mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(IntSize.m7036boximpl(initialSize), null, 2, null);
            this._containerSize = mutableStateOf$default;
            this.onInitializeContainerSize = null;
        }
        MutableState<IntSize> mutableState = this._containerSize;
        Intrinsics.checkNotNull(mutableState);
        return mutableState.getValue().m7048unboximpl();
    }
}
