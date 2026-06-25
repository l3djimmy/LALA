package androidx.compose.runtime;

import androidx.collection.MutableIntList;
import androidx.collection.MutableObjectList;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
/* compiled from: PausableComposition.kt */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u000e\b\u0000\u0018\u0000 '*\u0004\b\u0000\u0010\u00012\b\u0012\u0004\u0012\u0002H\u00010\u0002:\u0001'B\r\u0012\u0006\u0010\u0003\u001a\u00028\u0000¢\u0006\u0002\u0010\u0004J3\u0010\u000f\u001a\u00020\u00102\u001f\u0010\u0011\u001a\u001b\u0012\u0004\u0012\u00028\u0000\u0012\u0006\u0012\u0004\u0018\u00010\f\u0012\u0004\u0012\u00020\u00100\u0012¢\u0006\u0002\b\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\fH\u0016J\b\u0010\u0015\u001a\u00020\u0010H\u0016J\u0015\u0010\u0016\u001a\u00020\u00102\u0006\u0010\u0017\u001a\u00028\u0000H\u0016¢\u0006\u0002\u0010\u0004J\u001d\u0010\u0018\u001a\u00020\u00102\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00028\u0000H\u0016¢\u0006\u0002\u0010\u001cJ\u001d\u0010\u001d\u001a\u00020\u00102\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00028\u0000H\u0016¢\u0006\u0002\u0010\u001cJ \u0010\u001e\u001a\u00020\u00102\u0006\u0010\u001f\u001a\u00020\u001a2\u0006\u0010 \u001a\u00020\u001a2\u0006\u0010!\u001a\u00020\u001aH\u0016J\u0014\u0010\"\u001a\u00020\u00102\f\u0010#\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002J\u0018\u0010$\u001a\u00020\u00102\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010!\u001a\u00020\u001aH\u0016J\b\u0010%\u001a\u00020\u0010H\u0016J\b\u0010&\u001a\u00020\u0010H\u0016R\u001c\u0010\u0005\u001a\u00028\u0000X\u0096\u000e¢\u0006\u0010\n\u0002\u0010\t\u001a\u0004\b\u0006\u0010\u0007\"\u0004\b\b\u0010\u0004R\u0016\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006("}, d2 = {"Landroidx/compose/runtime/RecordingApplier;", "N", "Landroidx/compose/runtime/Applier;", "root", "(Ljava/lang/Object;)V", "current", "getCurrent", "()Ljava/lang/Object;", "setCurrent", "Ljava/lang/Object;", "instances", "Landroidx/collection/MutableObjectList;", "", "operations", "Landroidx/collection/MutableIntList;", "apply", "", "block", "Lkotlin/Function2;", "Lkotlin/ExtensionFunctionType;", "value", "clear", "down", "node", "insertBottomUp", "index", "", "instance", "(ILjava/lang/Object;)V", "insertTopDown", "move", TypedValues.TransitionType.S_FROM, TypedValues.TransitionType.S_TO, "count", "playTo", "applier", "remove", "reuse", "up", "Companion", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class RecordingApplier<N> implements Applier<N> {
    public static final int APPLY = 7;
    public static final int CLEAR = 4;
    public static final int DOWN = 1;
    public static final int INSERT_BOTTOM_UP = 5;
    public static final int INSERT_TOP_DOWN = 6;
    public static final int MOVE = 3;
    public static final int REMOVE = 2;
    public static final int REUSE = 8;
    public static final int UP = 0;
    private N current;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;
    private final MutableIntList operations = new MutableIntList(0, 1, null);
    private final MutableObjectList<Object> instances = new MutableObjectList<>(0, 1, null);

    public RecordingApplier(N n) {
        this.current = n;
    }

    @Override // androidx.compose.runtime.Applier
    public N getCurrent() {
        return this.current;
    }

    public void setCurrent(N n) {
        this.current = n;
    }

    @Override // androidx.compose.runtime.Applier
    public void down(N n) {
        this.operations.add(1);
        this.instances.add(n);
    }

    @Override // androidx.compose.runtime.Applier
    public void up() {
        this.operations.add(0);
    }

    @Override // androidx.compose.runtime.Applier
    public void remove(int index, int count) {
        this.operations.add(2);
        this.operations.add(index);
        this.operations.add(count);
    }

    @Override // androidx.compose.runtime.Applier
    public void move(int from, int to, int count) {
        this.operations.add(3);
        this.operations.add(from);
        this.operations.add(to);
        this.operations.add(count);
    }

    @Override // androidx.compose.runtime.Applier
    public void clear() {
        this.operations.add(4);
    }

    @Override // androidx.compose.runtime.Applier
    public void insertBottomUp(int index, N n) {
        this.operations.add(5);
        this.operations.add(index);
        this.instances.add(n);
    }

    @Override // androidx.compose.runtime.Applier
    public void insertTopDown(int index, N n) {
        this.operations.add(6);
        this.operations.add(index);
        this.instances.add(n);
    }

    @Override // androidx.compose.runtime.Applier
    public void apply(Function2<? super N, Object, Unit> function2, Object value) {
        this.operations.add(7);
        this.instances.add(function2);
        this.instances.add(value);
    }

    @Override // androidx.compose.runtime.Applier
    public void reuse() {
        this.operations.add(8);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void playTo(Applier<N> applier) {
        Throwable th;
        int index;
        int currentInstance;
        int operation = 0;
        int currentInstance2 = 0;
        MutableIntList operations = this.operations;
        MutableIntList this_$iv = operations;
        int size = this_$iv._size;
        MutableObjectList instances = this.instances;
        applier.onBeginChanges();
        while (operation < size) {
            int currentOperation = operation + 1;
            try {
                switch (operations.get(operation)) {
                    case 0:
                        applier.up();
                        break;
                    case 1:
                        int currentOperation2 = currentInstance2 + 1;
                        Object node = instances.get(currentInstance2);
                        applier.down(node);
                        operation = currentOperation;
                        currentInstance2 = currentOperation2;
                        continue;
                    case 2:
                        int currentOperation3 = currentOperation + 1;
                        int index2 = operations.get(currentOperation);
                        int currentOperation4 = currentOperation3 + 1;
                        int count = operations.get(currentOperation3);
                        applier.remove(index2, count);
                        operation = currentOperation4;
                        continue;
                    case 3:
                        int currentOperation5 = currentOperation + 1;
                        int from = operations.get(currentOperation);
                        int currentOperation6 = currentOperation5 + 1;
                        try {
                            int to = operations.get(currentOperation5);
                            int currentOperation7 = currentOperation6 + 1;
                            try {
                                int count2 = operations.get(currentOperation6);
                                applier.move(from, to, count2);
                                operation = currentOperation7;
                                continue;
                            } catch (Throwable th2) {
                                th = th2;
                                applier.onEndChanges();
                                throw th;
                            }
                        } catch (Throwable th3) {
                            th = th3;
                        }
                    case 4:
                        applier.clear();
                        break;
                    case 5:
                        int currentOperation8 = currentOperation + 1;
                        int index3 = operations.get(currentOperation);
                        int currentInstance3 = currentInstance2 + 1;
                        Object instance = instances.get(currentInstance2);
                        applier.insertBottomUp(index3, instance);
                        operation = currentOperation8;
                        currentInstance2 = currentInstance3;
                        continue;
                    case 6:
                        int currentOperation9 = currentOperation + 1;
                        try {
                            index = operations.get(currentOperation);
                            currentInstance = currentInstance2 + 1;
                        } catch (Throwable th4) {
                            th = th4;
                        }
                        try {
                            Object instance2 = instances.get(currentInstance2);
                            applier.insertTopDown(index, instance2);
                            operation = currentOperation9;
                            currentInstance2 = currentInstance;
                            continue;
                        } catch (Throwable th5) {
                            th = th5;
                            applier.onEndChanges();
                            throw th;
                        }
                    case 7:
                        int currentInstance4 = currentInstance2 + 1;
                        try {
                            Object obj = instances.get(currentInstance2);
                            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type @[ExtensionFunctionType] kotlin.Function2<kotlin.Any?, kotlin.Any?, kotlin.Unit>");
                            Function2 block = (Function2) TypeIntrinsics.beforeCheckcastToFunctionOfArity(obj, 2);
                            int currentInstance5 = currentInstance4 + 1;
                            try {
                                Object value = instances.get(currentInstance4);
                                applier.apply(block, value);
                                operation = currentOperation;
                                currentInstance2 = currentInstance5;
                                continue;
                            } catch (Throwable th6) {
                                th = th6;
                                applier.onEndChanges();
                                throw th;
                            }
                        } catch (Throwable th7) {
                            th = th7;
                        }
                    case 8:
                        applier.reuse();
                        break;
                }
                operation = currentOperation;
            } catch (Throwable th8) {
                th = th8;
            }
        }
        try {
            boolean value$iv = currentInstance2 == instances.getSize();
            if (!value$iv) {
                ComposerKt.composeImmediateRuntimeError("Applier operation size mismatch");
            }
            instances.clear();
            operations.clear();
            applier.onEndChanges();
        } catch (Throwable th9) {
            th = th9;
            applier.onEndChanges();
            throw th;
        }
    }

    /* compiled from: PausableComposition.kt */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\t\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000¨\u0006\r"}, d2 = {"Landroidx/compose/runtime/RecordingApplier$Companion;", "", "()V", "APPLY", "", "CLEAR", "DOWN", "INSERT_BOTTOM_UP", "INSERT_TOP_DOWN", "MOVE", "REMOVE", "REUSE", "UP", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }
}
