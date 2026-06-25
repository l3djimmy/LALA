package androidx.compose.ui.graphics;

import androidx.compose.ui.graphics.PathIterator;
import androidx.compose.ui.graphics.PathSegment;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.graphics.path.PathIterator;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: AndroidPathIterator.android.kt */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0014\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0002\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bJ\u0010\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0016H\u0016J\t\u0010\u0017\u001a\u00020\u0016H\u0096\u0002J\t\u0010\u0018\u001a\u00020\u0019H\u0096\u0002J\u0018\u0010\u0018\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u00102\u0006\u0010\u001c\u001a\u00020\u0014H\u0016R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u000e\u0010\u000b\u001a\u00020\fX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u00020\u0007X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u001d"}, d2 = {"Landroidx/compose/ui/graphics/AndroidPathIterator;", "Landroidx/compose/ui/graphics/PathIterator;", "path", "Landroidx/compose/ui/graphics/Path;", "conicEvaluation", "Landroidx/compose/ui/graphics/PathIterator$ConicEvaluation;", "tolerance", "", "(Landroidx/compose/ui/graphics/Path;Landroidx/compose/ui/graphics/PathIterator$ConicEvaluation;F)V", "getConicEvaluation", "()Landroidx/compose/ui/graphics/PathIterator$ConicEvaluation;", "implementation", "Landroidx/graphics/path/PathIterator;", "getPath", "()Landroidx/compose/ui/graphics/Path;", "segmentPoints", "", "getTolerance", "()F", "calculateSize", "", "includeConvertedConics", "", "hasNext", "next", "Landroidx/compose/ui/graphics/PathSegment;", "Landroidx/compose/ui/graphics/PathSegment$Type;", "outPoints", TypedValues.CycleType.S_WAVE_OFFSET, "ui-graphics_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class AndroidPathIterator implements PathIterator {
    private final PathIterator.ConicEvaluation conicEvaluation;
    private final androidx.graphics.path.PathIterator implementation;
    private final Path path;
    private final float[] segmentPoints = new float[8];
    private final float tolerance;

    /* compiled from: AndroidPathIterator.android.kt */
    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;
        public static final /* synthetic */ int[] $EnumSwitchMapping$1;

        static {
            int[] iArr = new int[PathIterator.ConicEvaluation.values().length];
            try {
                iArr[PathIterator.ConicEvaluation.AsConic.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[PathIterator.ConicEvaluation.AsQuadratics.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            $EnumSwitchMapping$0 = iArr;
            int[] iArr2 = new int[PathSegment.Type.values().length];
            try {
                iArr2[PathSegment.Type.Move.ordinal()] = 1;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr2[PathSegment.Type.Line.ordinal()] = 2;
            } catch (NoSuchFieldError e4) {
            }
            try {
                iArr2[PathSegment.Type.Quadratic.ordinal()] = 3;
            } catch (NoSuchFieldError e5) {
            }
            try {
                iArr2[PathSegment.Type.Conic.ordinal()] = 4;
            } catch (NoSuchFieldError e6) {
            }
            try {
                iArr2[PathSegment.Type.Cubic.ordinal()] = 5;
            } catch (NoSuchFieldError e7) {
            }
            $EnumSwitchMapping$1 = iArr2;
        }
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    public AndroidPathIterator(Path path, PathIterator.ConicEvaluation conicEvaluation, float tolerance) {
        PathIterator.ConicEvaluation conicEvaluation2;
        this.path = path;
        this.conicEvaluation = conicEvaluation;
        this.tolerance = tolerance;
        Path $this$asAndroidPath$iv = getPath();
        if ($this$asAndroidPath$iv instanceof AndroidPath) {
            android.graphics.Path internalPath = ((AndroidPath) $this$asAndroidPath$iv).getInternalPath();
            switch (WhenMappings.$EnumSwitchMapping$0[getConicEvaluation().ordinal()]) {
                case 1:
                    conicEvaluation2 = PathIterator.ConicEvaluation.AsConic;
                    break;
                case 2:
                    conicEvaluation2 = PathIterator.ConicEvaluation.AsQuadratics;
                    break;
                default:
                    throw new NoWhenBranchMatchedException();
            }
            this.implementation = new androidx.graphics.path.PathIterator(internalPath, conicEvaluation2, getTolerance());
            return;
        }
        throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
    }

    @Override // androidx.compose.ui.graphics.PathIterator
    public Path getPath() {
        return this.path;
    }

    @Override // androidx.compose.ui.graphics.PathIterator
    public PathIterator.ConicEvaluation getConicEvaluation() {
        return this.conicEvaluation;
    }

    @Override // androidx.compose.ui.graphics.PathIterator
    public float getTolerance() {
        return this.tolerance;
    }

    @Override // androidx.compose.ui.graphics.PathIterator
    public int calculateSize(boolean includeConvertedConics) {
        return this.implementation.calculateSize(includeConvertedConics);
    }

    @Override // androidx.compose.ui.graphics.PathIterator, java.util.Iterator
    public boolean hasNext() {
        return this.implementation.hasNext();
    }

    @Override // androidx.compose.ui.graphics.PathIterator
    public PathSegment.Type next(float[] outPoints, int offset) {
        PathSegment.Type pathSegmentType;
        pathSegmentType = AndroidPathIterator_androidKt.toPathSegmentType(this.implementation.next(outPoints, offset));
        return pathSegmentType;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    /* JADX WARN: Code restructure failed: missing block: B:6:0x000c, code lost:
        r1 = androidx.compose.ui.graphics.AndroidPathIterator_androidKt.toPathSegmentType(r11.implementation.next(r0, 0));
     */
    @Override // java.util.Iterator
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public androidx.compose.ui.graphics.PathSegment next() {
        /*
            r11 = this;
            float[] r0 = r11.segmentPoints
            int r1 = r0.length
            r2 = 8
            if (r1 >= r2) goto Lc
            androidx.compose.ui.graphics.PathSegment r1 = androidx.compose.ui.graphics.PathSegmentKt.getDoneSegment()
            return r1
        Lc:
            androidx.graphics.path.PathIterator r1 = r11.implementation
            r3 = 0
            androidx.graphics.path.PathSegment$Type r1 = r1.next(r0, r3)
            androidx.compose.ui.graphics.PathSegment$Type r1 = androidx.compose.ui.graphics.AndroidPathIterator_androidKt.access$toPathSegmentType(r1)
            androidx.compose.ui.graphics.PathSegment$Type r4 = androidx.compose.ui.graphics.PathSegment.Type.Done
            if (r1 != r4) goto L20
            androidx.compose.ui.graphics.PathSegment r2 = androidx.compose.ui.graphics.PathSegmentKt.getDoneSegment()
            return r2
        L20:
            androidx.compose.ui.graphics.PathSegment$Type r4 = androidx.compose.ui.graphics.PathSegment.Type.Close
            if (r1 != r4) goto L29
            androidx.compose.ui.graphics.PathSegment r2 = androidx.compose.ui.graphics.PathSegmentKt.getCloseSegment()
            return r2
        L29:
            int[] r4 = androidx.compose.ui.graphics.AndroidPathIterator.WhenMappings.$EnumSwitchMapping$1
            int r5 = r1.ordinal()
            r4 = r4[r5]
            r5 = 6
            r6 = 5
            r7 = 4
            r8 = 3
            r9 = 2
            r10 = 1
            switch(r4) {
                case 1: goto Lab;
                case 2: goto L98;
                case 3: goto L7d;
                case 4: goto L62;
                case 5: goto L3e;
                default: goto L3a;
            }
        L3a:
            float[] r2 = new float[r3]
            goto Lb5
        L3e:
            float[] r2 = new float[r2]
            r4 = r0[r3]
            r2[r3] = r4
            r3 = r0[r10]
            r2[r10] = r3
            r3 = r0[r9]
            r2[r9] = r3
            r3 = r0[r8]
            r2[r8] = r3
            r3 = r0[r7]
            r2[r7] = r3
            r3 = r0[r6]
            r2[r6] = r3
            r3 = r0[r5]
            r2[r5] = r3
            r3 = 7
            r4 = r0[r3]
            r2[r3] = r4
            goto Lb5
        L62:
            float[] r2 = new float[r5]
            r4 = r0[r3]
            r2[r3] = r4
            r3 = r0[r10]
            r2[r10] = r3
            r3 = r0[r9]
            r2[r9] = r3
            r3 = r0[r8]
            r2[r8] = r3
            r3 = r0[r7]
            r2[r7] = r3
            r3 = r0[r6]
            r2[r6] = r3
            goto Lb5
        L7d:
            float[] r2 = new float[r5]
            r4 = r0[r3]
            r2[r3] = r4
            r3 = r0[r10]
            r2[r10] = r3
            r3 = r0[r9]
            r2[r9] = r3
            r3 = r0[r8]
            r2[r8] = r3
            r3 = r0[r7]
            r2[r7] = r3
            r3 = r0[r6]
            r2[r6] = r3
            goto Lb5
        L98:
            float[] r2 = new float[r7]
            r4 = r0[r3]
            r2[r3] = r4
            r3 = r0[r10]
            r2[r10] = r3
            r3 = r0[r9]
            r2[r9] = r3
            r3 = r0[r8]
            r2[r8] = r3
            goto Lb5
        Lab:
            float[] r2 = new float[r9]
            r4 = r0[r3]
            r2[r3] = r4
            r3 = r0[r10]
            r2[r10] = r3
        Lb5:
            androidx.compose.ui.graphics.PathSegment r3 = new androidx.compose.ui.graphics.PathSegment
            androidx.compose.ui.graphics.PathSegment$Type r4 = androidx.compose.ui.graphics.PathSegment.Type.Conic
            if (r1 != r4) goto Lc0
            r4 = r0[r5]
            goto Lc1
        Lc0:
            r4 = 0
        Lc1:
            r3.<init>(r1, r2, r4)
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.graphics.AndroidPathIterator.next():androidx.compose.ui.graphics.PathSegment");
    }
}
