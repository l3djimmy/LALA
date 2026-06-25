package androidx.compose.runtime;

import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: SlotTable.kt */
@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0016\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0000\b\u0000\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0011\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\tH\u0086\u0002J%\u0010\u000f\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\t2\u0012\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040\u0011H\u0082\bJ\u000e\u0010\u0012\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\tJ\u000e\u0010\u0013\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\tJ\u0019\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u000e\u001a\u00020\t2\u0006\u0010\u0016\u001a\u00020\rH\u0086\u0002J\u0016\u0010\u0017\u001a\u00020\u00152\u0006\u0010\u0018\u001a\u00020\t2\u0006\u0010\u0019\u001a\u00020\tJ\b\u0010\u001a\u001a\u00020\u001bH\u0016R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010\b\u001a\u00020\t8F¢\u0006\u0006\u001a\u0004\b\n\u0010\u000b¨\u0006\u001c"}, d2 = {"Landroidx/compose/runtime/BitVector;", "", "()V", "first", "", "others", "", "second", "size", "", "getSize", "()I", "get", "", "index", "nextBit", "valueSelector", "Lkotlin/Function1;", "nextClear", "nextSet", "set", "", "value", "setRange", "start", "end", "toString", "", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class BitVector {
    public static final int $stable = 8;
    private long first;
    private long[] others;
    private long second;

    public BitVector() {
        long[] jArr;
        jArr = SlotTableKt.EmptyLongArray;
        this.others = jArr;
    }

    public final int getSize() {
        return (this.others.length + 2) * 64;
    }

    public final boolean get(int index) {
        int address;
        if (index < 64) {
            return ((1 << index) & this.first) != 0;
        } else if (index < 128) {
            return ((1 << (index + (-64))) & this.second) != 0;
        } else {
            long[] others = this.others;
            int size = others.length;
            if (size != 0 && (index / 64) - 2 < size) {
                int bit = index % 64;
                return ((1 << bit) & others[address]) != 0;
            }
            return false;
        }
    }

    public final void set(int index, boolean value) {
        if (index < 64) {
            long mask = 1 << index;
            this.first = ((value ? 1 : 0) << index) | (this.first & (~mask));
        } else if (index < 128) {
            long mask2 = 1 << (index - 64);
            this.second = ((value ? 1 : 0) << index) | (this.second & (~mask2));
        } else {
            int address = (index / 64) - 2;
            int newIndex = index % 64;
            long mask3 = 1 << newIndex;
            long[] others = this.others;
            if (address >= others.length) {
                long[] copyOf = Arrays.copyOf(others, address + 1);
                Intrinsics.checkNotNullExpressionValue(copyOf, "copyOf(...)");
                others = copyOf;
                this.others = others;
            }
            long bits = others[address];
            others[address] = ((~mask3) & bits) | ((value ? 1 : 0) << newIndex);
        }
    }

    public final int nextSet(int index) {
        if (index < 64) {
            long it = this.first;
            long $this$firstBitSet$iv$iv = (it >>> index) << index;
            int bit$iv = Long.numberOfTrailingZeros($this$firstBitSet$iv$iv);
            if (bit$iv < 64) {
                return bit$iv;
            }
        }
        if (index < 128) {
            int index$iv = index - 64;
            long it2 = this.second;
            long $this$firstBitSet$iv$iv2 = (it2 >>> index$iv) << index$iv;
            int bit$iv2 = Long.numberOfTrailingZeros($this$firstBitSet$iv$iv2);
            if (bit$iv2 < 64) {
                return bit$iv2 + 64;
            }
        }
        int index$iv2 = Math.max(index, 128);
        int start$iv = (index$iv2 / 64) - 2;
        long[] others$iv = this.others;
        int length = others$iv.length;
        for (int i$iv = start$iv; i$iv < length; i$iv++) {
            long value$iv = others$iv[i$iv];
            if (i$iv == start$iv) {
                int shift$iv = index$iv2 % 64;
                value$iv = (value$iv >>> shift$iv) << shift$iv;
            }
            long $this$firstBitSet$iv$iv3 = value$iv;
            int bit$iv3 = Long.numberOfTrailingZeros($this$firstBitSet$iv$iv3);
            if (bit$iv3 < 64) {
                return (i$iv * 64) + 128 + bit$iv3;
            }
        }
        return Integer.MAX_VALUE;
    }

    public final int nextClear(int index) {
        if (index < 64) {
            long it = this.first;
            long $this$firstBitSet$iv$iv = ((~it) >>> index) << index;
            int bit$iv = Long.numberOfTrailingZeros($this$firstBitSet$iv$iv);
            if (bit$iv < 64) {
                return bit$iv;
            }
        }
        if (index < 128) {
            int index$iv = index - 64;
            long it2 = this.second;
            long $this$firstBitSet$iv$iv2 = ((~it2) >>> index$iv) << index$iv;
            int bit$iv2 = Long.numberOfTrailingZeros($this$firstBitSet$iv$iv2);
            if (bit$iv2 < 64) {
                return bit$iv2 + 64;
            }
        }
        int index$iv2 = Math.max(index, 128);
        int start$iv = (index$iv2 / 64) - 2;
        long[] others$iv = this.others;
        int length = others$iv.length;
        for (int i$iv = start$iv; i$iv < length; i$iv++) {
            long it3 = others$iv[i$iv];
            long value$iv = ~it3;
            if (i$iv == start$iv) {
                int shift$iv = index$iv2 % 64;
                value$iv = (value$iv >>> shift$iv) << shift$iv;
            }
            long $this$firstBitSet$iv$iv3 = value$iv;
            int bit$iv3 = Long.numberOfTrailingZeros($this$firstBitSet$iv$iv3);
            if (bit$iv3 < 64) {
                return (i$iv * 64) + 128 + bit$iv3;
            }
        }
        return Integer.MAX_VALUE;
    }

    private final int nextBit(int index, Function1<? super Long, Long> function1) {
        if (index < 64) {
            long $this$firstBitSet$iv = (function1.invoke(Long.valueOf(this.first)).longValue() >>> index) << index;
            int bit = Long.numberOfTrailingZeros($this$firstBitSet$iv);
            if (bit < 64) {
                return bit;
            }
        }
        if (index < 128) {
            int index2 = index - 64;
            long $this$firstBitSet$iv2 = (function1.invoke(Long.valueOf(this.second)).longValue() >>> index2) << index2;
            int bit2 = Long.numberOfTrailingZeros($this$firstBitSet$iv2);
            if (bit2 < 64) {
                return bit2 + 64;
            }
        }
        int index3 = Math.max(index, 128);
        int start = (index3 / 64) - 2;
        long[] others = this.others;
        int length = others.length;
        for (int i = start; i < length; i++) {
            long value = function1.invoke(Long.valueOf(others[i])).longValue();
            if (i == start) {
                int shift = index3 % 64;
                value = (value >>> shift) << shift;
            }
            long $this$firstBitSet$iv3 = value;
            int bit3 = Long.numberOfTrailingZeros($this$firstBitSet$iv3);
            if (bit3 < 64) {
                return (i * 64) + 128 + bit3;
            }
        }
        return Integer.MAX_VALUE;
    }

    public final void setRange(int start, int end) {
        long bits = start < end ? -1L : 0L;
        boolean $this$toBit$iv = start < 64;
        long selector = ($this$toBit$iv ? 1 : 0) * bits;
        long firstValue = (selector >>> (64 - (Math.min(64, end) - start))) << start;
        this.first |= firstValue;
        if (end <= 64) {
            return;
        }
        int start2 = Math.max(start, 64);
        boolean $this$toBit$iv2 = start2 < 128;
        long selector2 = ($this$toBit$iv2 ? 1 : 0) * bits;
        long secondValue = (selector2 >>> (128 - (Math.min(128, end) - start2))) << start2;
        this.second |= secondValue;
        if (end > 128) {
            for (int bit = Math.max(start2, 128); bit < end; bit++) {
                set(bit, true);
            }
        }
    }

    public String toString() {
        StringBuilder $this$toString_u24lambda_u242 = new StringBuilder();
        boolean first = true;
        $this$toString_u24lambda_u242.append("BitVector [");
        int size = getSize();
        for (int i = 0; i < size; i++) {
            if (get(i)) {
                if (!first) {
                    $this$toString_u24lambda_u242.append(", ");
                }
                first = false;
                $this$toString_u24lambda_u242.append(i);
            }
        }
        $this$toString_u24lambda_u242.append(']');
        String sb = $this$toString_u24lambda_u242.toString();
        Intrinsics.checkNotNullExpressionValue(sb, "toString(...)");
        return sb;
    }
}
