package androidx.compose.ui.node;

import kotlin.Metadata;
/* compiled from: MyersDiff.kt */
@Metadata(d1 = {"\u00002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0015\n\u0002\b\u0016\u001a\u0018\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0002\u001aZ\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0006\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\t2\u0006\u0010\u0011\u001a\u00020\u0012H\u0002ø\u0001\u0000¢\u0006\u0004\b\u0013\u0010\u0014\u001a \u0010\u0015\u001a\u00020\u00032\u0006\u0010\u0016\u001a\u00020\t2\u0006\u0010\u0017\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u0005H\u0002\u001a \u0010\u0018\u001a\u00020\u00012\u0006\u0010\u0016\u001a\u00020\t2\u0006\u0010\u0017\u001a\u00020\t2\u0006\u0010\u0004\u001a\u00020\u0005H\u0000\u001a8\u0010\u0019\u001a\u00020\u00012\u0006\u0010\u001a\u001a\u00020\t2\u0006\u0010\u001b\u001a\u00020\t2\u0006\u0010\u001c\u001a\u00020\t2\u0006\u0010\u001d\u001a\u00020\t2\u0006\u0010\u001e\u001a\u00020\u00072\u0006\u0010\u001f\u001a\u00020\u0012H\u0000\u001aZ\u0010\u000e\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0006\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\t2\u0006\u0010\u0011\u001a\u00020\u0012H\u0002ø\u0001\u0000¢\u0006\u0004\b \u0010\u0014\u001aR\u0010!\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0006\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u0012H\u0002ø\u0001\u0000¢\u0006\u0004\b\"\u0010#\u001a\u001c\u0010$\u001a\u00020\u0001*\u00020\u00122\u0006\u0010%\u001a\u00020\t2\u0006\u0010&\u001a\u00020\tH\u0002\u001a\r\u0010'\u001a\u00020\t*\u00020\u0007H\u0082\b\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006("}, d2 = {"applyDiff", "", "diagonals", "Landroidx/compose/ui/node/IntStack;", "callback", "Landroidx/compose/ui/node/DiffCallback;", "backward", "", "oldStart", "", "oldEnd", "newStart", "newEnd", "cb", "forward", "Landroidx/compose/ui/node/CenteredArray;", "d", "snake", "", "backward-4l5_RBY", "(IIIILandroidx/compose/ui/node/DiffCallback;[I[II[I)Z", "calculateDiff", "oldSize", "newSize", "executeDiff", "fillSnake", "startX", "startY", "endX", "endY", "reverse", "data", "forward-4l5_RBY", "midPoint", "midPoint-q5eDKzI", "(IIIILandroidx/compose/ui/node/DiffCallback;[I[I[I)Z", "swap", "i", "j", "toInt", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class MyersDiffKt {
    public static final /* synthetic */ void access$swap(int[] $receiver, int i, int j) {
        swap($receiver, i, j);
    }

    private static final IntStack calculateDiff(int oldSize, int newSize, DiffCallback cb) {
        boolean z = true;
        char c = 2;
        int max = ((oldSize + newSize) + 1) / 2;
        IntStack diagonals = new IntStack(max * 3);
        IntStack stack = new IntStack(max * 4);
        stack.pushRange(0, oldSize, 0, newSize);
        int[] forward = CenteredArray.m5746constructorimpl(new int[(max * 2) + 1]);
        int[] backward = CenteredArray.m5746constructorimpl(new int[(max * 2) + 1]);
        int[] snake = Snake.m5963constructorimpl(new int[5]);
        while (stack.isNotEmpty()) {
            int newEnd = stack.pop();
            int newStart = stack.pop();
            int oldEnd = stack.pop();
            int oldStart = stack.pop();
            boolean found = m5857midPointq5eDKzI(oldStart, oldEnd, newStart, newEnd, cb, forward, backward, snake);
            int[] snake2 = snake;
            if (found) {
                boolean z2 = z;
                char c2 = c;
                if (Math.min(snake2[c] - snake2[0], snake2[3] - snake2[z2 ? 1 : 0]) > 0) {
                    Snake.m5961addDiagonalToStackimpl(snake2, diagonals);
                }
                stack.pushRange(oldStart, snake2[0], newStart, snake2[z2 ? 1 : 0]);
                stack.pushRange(snake2[c2], oldEnd, snake2[3], newEnd);
                snake = snake2;
                z = z2 ? 1 : 0;
                c = c2;
            } else {
                snake = snake2;
            }
        }
        diagonals.sortDiagonals();
        diagonals.pushDiagonal(oldSize, newSize, 0);
        return diagonals;
    }

    private static final void applyDiff(IntStack diagonals, DiffCallback callback) {
        int posX = 0;
        int posY = 0;
        int i = 0;
        while (i < diagonals.getSize()) {
            int startX = diagonals.get(i) - diagonals.get(i + 2);
            int startY = diagonals.get(i + 1) - diagonals.get(i + 2);
            int len = diagonals.get(i + 2);
            i += 3;
            while (posX < startX) {
                callback.remove(posY, posX);
                posX++;
            }
            while (posY < startY) {
                callback.insert(posY);
                posY++;
            }
            while (true) {
                int len2 = len - 1;
                if (len > 0) {
                    callback.same(posX, posY);
                    posX++;
                    posY++;
                    len = len2;
                }
            }
        }
    }

    public static final void executeDiff(int oldSize, int newSize, DiffCallback callback) {
        IntStack diagonals = calculateDiff(oldSize, newSize, callback);
        applyDiff(diagonals, callback);
    }

    /* renamed from: midPoint-q5eDKzI  reason: not valid java name */
    private static final boolean m5857midPointq5eDKzI(int oldStart, int oldEnd, int newStart, int newEnd, DiffCallback cb, int[] forward, int[] backward, int[] snake) {
        int i = oldStart;
        int i2 = oldEnd;
        int oldSize = i2 - i;
        int newSize = newEnd - newStart;
        if (oldSize < 1 || newSize < 1) {
            return false;
        }
        int max = ((oldSize + newSize) + 1) / 2;
        int[] iArr = forward;
        CenteredArray.m5752setimpl(iArr, 1, i);
        int[] iArr2 = backward;
        CenteredArray.m5752setimpl(iArr2, 1, i2);
        int d = 0;
        while (d < max) {
            boolean found = m5856forward4l5_RBY(i, i2, newStart, newEnd, cb, iArr, iArr2, d, snake);
            if (found) {
                return true;
            }
            boolean found2 = m5855backward4l5_RBY(oldStart, oldEnd, newStart, newEnd, cb, forward, backward, d, snake);
            if (found2) {
                return true;
            }
            d++;
            i = oldStart;
            i2 = oldEnd;
            iArr = forward;
            iArr2 = backward;
        }
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r20v0 */
    /* JADX WARN: Type inference failed for: r20v1 */
    /* JADX WARN: Type inference failed for: r20v2, types: [boolean] */
    /* renamed from: forward-4l5_RBY  reason: not valid java name */
    private static final boolean m5856forward4l5_RBY(int oldStart, int oldEnd, int newStart, int newEnd, DiffCallback cb, int[] forward, int[] backward, int d, int[] snake) {
        int x;
        int startX;
        ?? r20;
        int i = oldEnd;
        int oldSize = i - oldStart;
        int newSize = newEnd - newStart;
        int i2 = 1;
        boolean checkForSnake = (Math.abs(oldSize - newSize) & 1) == 1;
        int delta = oldSize - newSize;
        int k = -d;
        while (k <= d) {
            if (k == (-d) || (k != d && CenteredArray.m5749getimpl(forward, k + 1) > CenteredArray.m5749getimpl(forward, k - 1))) {
                int startX2 = CenteredArray.m5749getimpl(forward, k + 1);
                x = startX2;
                startX = startX2;
            } else {
                int startX3 = CenteredArray.m5749getimpl(forward, k - 1);
                x = startX3 + 1;
                startX = startX3;
            }
            int y = (newStart + (x - oldStart)) - k;
            int startY = y - ((d != 0 ? i2 : 0) & (x == startX ? i2 : 0));
            while (x < i && y < newEnd) {
                if (!cb.areItemsTheSame(x, y)) {
                    break;
                }
                x++;
                y++;
            }
            CenteredArray.m5752setimpl(forward, k, x);
            if (checkForSnake) {
                r20 = i2;
                int backwardsK = delta - k;
                if (backwardsK >= (-d) + 1 && backwardsK <= d - 1) {
                    if (CenteredArray.m5749getimpl(backward, backwardsK) <= x) {
                        fillSnake(startX, startY, x, y, false, snake);
                        return r20;
                    }
                }
            } else {
                r20 = i2;
            }
            k += 2;
            i = oldEnd;
            i2 = r20;
        }
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* renamed from: backward-4l5_RBY  reason: not valid java name */
    private static final boolean m5855backward4l5_RBY(int oldStart, int oldEnd, int newStart, int newEnd, DiffCallback cb, int[] forward, int[] backward, int d, int[] snake) {
        int x;
        int startX;
        boolean z;
        int oldSize = oldEnd - oldStart;
        int newSize = newEnd - newStart;
        int i = 1;
        boolean checkForSnake = ((oldSize - newSize) & 1) == 0;
        int delta = oldSize - newSize;
        int k = -d;
        while (k <= d) {
            if (k == (-d) || (k != d && CenteredArray.m5749getimpl(backward, k + 1) < CenteredArray.m5749getimpl(backward, k - 1))) {
                int startX2 = CenteredArray.m5749getimpl(backward, k + 1);
                x = startX2;
                startX = startX2;
            } else {
                int startX3 = CenteredArray.m5749getimpl(backward, k - 1);
                x = startX3 - 1;
                startX = startX3;
            }
            int y = newEnd - ((oldEnd - x) - k);
            int startY = y + ((d != 0 ? i : 0) & (x == startX ? i : 0));
            int y2 = y;
            int x2 = x;
            while (x2 > oldStart && y2 > newStart) {
                z = i;
                if (!cb.areItemsTheSame(x2 - 1, y2 - 1)) {
                    break;
                }
                x2--;
                y2--;
                i = z ? 1 : 0;
            }
            z = i;
            CenteredArray.m5752setimpl(backward, k, x2);
            if (checkForSnake) {
                int forwardsK = delta - k;
                if (forwardsK >= (-d) && forwardsK <= d) {
                    if (CenteredArray.m5749getimpl(forward, forwardsK) >= x2) {
                        fillSnake(x2, y2, startX, startY, true, snake);
                        return z;
                    }
                }
            }
            k += 2;
            i = z;
        }
        return false;
    }

    private static final int toInt(boolean $this$toInt) {
        return $this$toInt ? 1 : 0;
    }

    public static final void fillSnake(int startX, int startY, int endX, int endY, boolean reverse, int[] data) {
        if (data.length < 5) {
            return;
        }
        data[0] = startX;
        data[1] = startY;
        data[2] = endX;
        data[3] = endY;
        data[4] = reverse ? 1 : 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void swap(int[] $this$swap, int i, int j) {
        int tmp = $this$swap[i];
        $this$swap[i] = $this$swap[j];
        $this$swap[j] = tmp;
    }
}
