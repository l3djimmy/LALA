package androidx.compose.ui.platform;

import android.graphics.Matrix;
import androidx.autofill.HintConstants;
import androidx.compose.ui.geometry.MutableRect;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.graphics.AndroidMatrixConversions_androidKt;
import androidx.compose.ui.graphics.MatrixKt;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
/* compiled from: LayerMatrixCache.android.kt */
@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0000\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002B=\u00126\u0010\u0003\u001a2\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\u0005\u0012\b\b\u0006\u0012\u0004\b\b(\u0007\u0012\u0013\u0012\u00110\b¢\u0006\f\b\u0005\u0012\b\b\u0006\u0012\u0004\b\b(\t\u0012\u0004\u0012\u00020\n0\u0004¢\u0006\u0002\u0010\u000bJ\u001d\u0010\u0016\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u0007\u001a\u00028\u0000ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b\u0017\u0010\u0018J\u001b\u0010\u0019\u001a\u00020\u000e2\u0006\u0010\u0007\u001a\u00028\u0000ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b\u001a\u0010\u0018J\u0006\u0010\u001b\u001a\u00020\nJ\u001b\u0010\u001c\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00028\u00002\u0006\u0010\u001d\u001a\u00020\u001e¢\u0006\u0002\u0010\u001fJ \u0010\u001c\u001a\u00020 2\u0006\u0010\u0007\u001a\u00028\u00002\u0006\u0010!\u001a\u00020 ø\u0001\u0000¢\u0006\u0004\b\"\u0010#J\u001b\u0010$\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00028\u00002\u0006\u0010\u001d\u001a\u00020\u001e¢\u0006\u0002\u0010\u001fJ \u0010$\u001a\u00020 2\u0006\u0010\u0007\u001a\u00028\u00002\u0006\u0010!\u001a\u00020 ø\u0001\u0000¢\u0006\u0004\b%\u0010#J\u0006\u0010&\u001a\u00020\nR\u0010\u0010\f\u001a\u0004\u0018\u00010\bX\u0082\u000e¢\u0006\u0002\n\u0000R>\u0010\u0003\u001a2\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\u0005\u0012\b\b\u0006\u0012\u0004\b\b(\u0007\u0012\u0013\u0012\u00110\b¢\u0006\f\b\u0005\u0012\b\b\u0006\u0012\u0004\b\b(\t\u0012\u0004\u0012\u00020\n0\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010\r\u001a\u00020\u000eX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u000fR\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0011X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0011X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0011X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\u0015\u001a\u00020\u000eX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u000f\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006'"}, d2 = {"Landroidx/compose/ui/platform/LayerMatrixCache;", ExifInterface.GPS_DIRECTION_TRUE, "", "getMatrix", "Lkotlin/Function2;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, TypedValues.AttributesType.S_TARGET, "Landroid/graphics/Matrix;", "matrix", "", "(Lkotlin/jvm/functions/Function2;)V", "androidMatrixCache", "inverseMatrixCache", "Landroidx/compose/ui/graphics/Matrix;", "[F", "isDirty", "", "isIdentity", "isInverseDirty", "isInverseValid", "matrixCache", "calculateInverseMatrix", "calculateInverseMatrix-bWbORWo", "(Ljava/lang/Object;)[F", "calculateMatrix", "calculateMatrix-GrdbGEg", "invalidate", "map", "rect", "Landroidx/compose/ui/geometry/MutableRect;", "(Ljava/lang/Object;Landroidx/compose/ui/geometry/MutableRect;)V", "Landroidx/compose/ui/geometry/Offset;", TypedValues.CycleType.S_WAVE_OFFSET, "map-R5De75A", "(Ljava/lang/Object;J)J", "mapInverse", "mapInverse-R5De75A", "reset", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class LayerMatrixCache<T> {
    public static final int $stable = 8;
    private Matrix androidMatrixCache;
    private final Function2<T, Matrix, Unit> getMatrix;
    private boolean isDirty;
    private boolean isInverseDirty;
    private float[] matrixCache = androidx.compose.ui.graphics.Matrix.m4519constructorimpl$default(null, 1, null);
    private float[] inverseMatrixCache = androidx.compose.ui.graphics.Matrix.m4519constructorimpl$default(null, 1, null);
    private boolean isInverseValid = true;
    private boolean isIdentity = true;

    /* JADX WARN: Multi-variable type inference failed */
    public LayerMatrixCache(Function2<? super T, ? super Matrix, Unit> function2) {
        this.getMatrix = function2;
    }

    public final void reset() {
        this.isDirty = false;
        this.isInverseDirty = false;
        this.isIdentity = true;
        this.isInverseValid = true;
        androidx.compose.ui.graphics.Matrix.m4528resetimpl(this.matrixCache);
        androidx.compose.ui.graphics.Matrix.m4528resetimpl(this.inverseMatrixCache);
    }

    public final void invalidate() {
        this.isDirty = true;
        this.isInverseDirty = true;
    }

    /* renamed from: calculateMatrix-GrdbGEg  reason: not valid java name */
    public final float[] m6050calculateMatrixGrdbGEg(T t) {
        float[] matrix = this.matrixCache;
        if (!this.isDirty) {
            return matrix;
        }
        Matrix it = this.androidMatrixCache;
        if (it == null) {
            it = new Matrix();
            this.androidMatrixCache = it;
        }
        this.getMatrix.invoke(t, it);
        AndroidMatrixConversions_androidKt.m4160setFromtUYjHk(matrix, it);
        this.isDirty = false;
        this.isIdentity = MatrixKt.m4544isIdentity58bKbWc(matrix);
        return matrix;
    }

    /* renamed from: calculateInverseMatrix-bWbORWo  reason: not valid java name */
    public final float[] m6049calculateInverseMatrixbWbORWo(T t) {
        float[] matrix = this.inverseMatrixCache;
        if (this.isInverseDirty) {
            float[] normalMatrix = m6050calculateMatrixGrdbGEg(t);
            this.isInverseValid = InvertMatrixKt.m6047invertToJiSxe2E(normalMatrix, matrix);
            this.isInverseDirty = false;
        }
        if (this.isInverseValid) {
            return matrix;
        }
        return null;
    }

    public final void map(T t, MutableRect rect) {
        float[] matrix = m6050calculateMatrixGrdbGEg(t);
        if (!this.isIdentity) {
            androidx.compose.ui.graphics.Matrix.m4527mapimpl(matrix, rect);
        }
    }

    public final void mapInverse(T t, MutableRect rect) {
        float[] matrix = m6049calculateInverseMatrixbWbORWo(t);
        if (matrix == null) {
            rect.set(0.0f, 0.0f, 0.0f, 0.0f);
        } else if (!this.isIdentity) {
            androidx.compose.ui.graphics.Matrix.m4527mapimpl(matrix, rect);
        }
    }

    /* renamed from: map-R5De75A  reason: not valid java name */
    public final long m6051mapR5De75A(T t, long offset) {
        float[] matrix = m6050calculateMatrixGrdbGEg(t);
        if (!this.isIdentity) {
            return androidx.compose.ui.graphics.Matrix.m4525mapMKHz9U(matrix, offset);
        }
        return offset;
    }

    /* renamed from: mapInverse-R5De75A  reason: not valid java name */
    public final long m6052mapInverseR5De75A(T t, long offset) {
        float[] matrix = m6049calculateInverseMatrixbWbORWo(t);
        if (matrix == null) {
            return Offset.Companion.m4062getInfiniteF1C5BW0();
        }
        if (!this.isIdentity) {
            return androidx.compose.ui.graphics.Matrix.m4525mapMKHz9U(matrix, offset);
        }
        return offset;
    }
}
