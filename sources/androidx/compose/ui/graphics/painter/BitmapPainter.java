package androidx.compose.ui.graphics.painter;

import androidx.compose.ui.graphics.ColorFilter;
import androidx.compose.ui.graphics.FilterQuality;
import androidx.compose.ui.graphics.ImageBitmap;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntSize;
import androidx.compose.ui.unit.IntSizeKt;
import com.itextpdf.io.codec.TIFFConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: BitmapPainter.kt */
@Metadata(d1 = {"\u0000`\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bJ\u0010\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\t\u001a\u00020\nH\u0014J\u0012\u0010\u001c\u001a\u00020\u001b2\b\u0010\u000b\u001a\u0004\u0018\u00010\fH\u0014J\u0013\u0010\u001d\u001a\u00020\u001b2\b\u0010\u001e\u001a\u0004\u0018\u00010\u001fH\u0096\u0002J\b\u0010 \u001a\u00020!H\u0016J\b\u0010\"\u001a\u00020#H\u0016J\"\u0010$\u001a\u00020\u00072\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0002ø\u0001\u0000¢\u0006\u0004\b%\u0010&J\f\u0010'\u001a\u00020(*\u00020)H\u0014R\u000e\u0010\t\u001a\u00020\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\fX\u0082\u000e¢\u0006\u0002\n\u0000R\"\u0010\r\u001a\u00020\u000eX\u0080\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\u0013\u001a\u0004\b\u000f\u0010\u0010\"\u0004\b\u0011\u0010\u0012R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u0014\u001a\u00020\u00158VX\u0096\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u0016\u0010\u0017R\u0016\u0010\u0018\u001a\u00020\u0007X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0019R\u0016\u0010\u0004\u001a\u00020\u0005X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0019R\u0016\u0010\u0006\u001a\u00020\u0007X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0019\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006*"}, d2 = {"Landroidx/compose/ui/graphics/painter/BitmapPainter;", "Landroidx/compose/ui/graphics/painter/Painter;", "image", "Landroidx/compose/ui/graphics/ImageBitmap;", "srcOffset", "Landroidx/compose/ui/unit/IntOffset;", "srcSize", "Landroidx/compose/ui/unit/IntSize;", "(Landroidx/compose/ui/graphics/ImageBitmap;JJLkotlin/jvm/internal/DefaultConstructorMarker;)V", "alpha", "", "colorFilter", "Landroidx/compose/ui/graphics/ColorFilter;", "filterQuality", "Landroidx/compose/ui/graphics/FilterQuality;", "getFilterQuality-f-v9h1I$ui_graphics_release", "()I", "setFilterQuality-vDHp3xo$ui_graphics_release", "(I)V", "I", "intrinsicSize", "Landroidx/compose/ui/geometry/Size;", "getIntrinsicSize-NH-jbRc", "()J", "size", "J", "applyAlpha", "", "applyColorFilter", "equals", "other", "", "hashCode", "", "toString", "", "validateSize", "validateSize-N5eqBDc", "(JJ)J", "onDraw", "", "Landroidx/compose/ui/graphics/drawscope/DrawScope;", "ui-graphics_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class BitmapPainter extends Painter {
    private float alpha;
    private ColorFilter colorFilter;
    private int filterQuality;
    private final ImageBitmap image;
    private final long size;
    private final long srcOffset;
    private final long srcSize;

    public /* synthetic */ BitmapPainter(ImageBitmap imageBitmap, long j, long j2, DefaultConstructorMarker defaultConstructorMarker) {
        this(imageBitmap, j, j2);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ BitmapPainter(androidx.compose.ui.graphics.ImageBitmap r8, long r9, long r11, int r13, kotlin.jvm.internal.DefaultConstructorMarker r14) {
        /*
            r7 = this;
            r14 = r13 & 2
            if (r14 == 0) goto Lc
            androidx.compose.ui.unit.IntOffset$Companion r9 = androidx.compose.ui.unit.IntOffset.Companion
            long r9 = r9.m7012getZeronOccac()
            r2 = r9
            goto Ld
        Lc:
            r2 = r9
        Ld:
            r9 = r13 & 4
            if (r9 == 0) goto L2e
            int r9 = r8.getWidth()
            int r10 = r8.getHeight()
            r11 = 0
            r12 = 0
            long r13 = (long) r9
            r0 = 32
            long r13 = r13 << r0
            long r0 = (long) r10
            r4 = 4294967295(0xffffffff, double:2.1219957905E-314)
            long r0 = r0 & r4
            long r12 = r13 | r0
            long r11 = androidx.compose.ui.unit.IntSize.m7039constructorimpl(r12)
            r4 = r11
            goto L2f
        L2e:
            r4 = r11
        L2f:
            r6 = 0
            r0 = r7
            r1 = r8
            r0.<init>(r1, r2, r4, r6)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.graphics.painter.BitmapPainter.<init>(androidx.compose.ui.graphics.ImageBitmap, long, long, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    private BitmapPainter(ImageBitmap image, long srcOffset, long srcSize) {
        this.image = image;
        this.srcOffset = srcOffset;
        this.srcSize = srcSize;
        this.filterQuality = FilterQuality.Companion.m4388getLowfv9h1I();
        this.size = m4958validateSizeN5eqBDc(this.srcOffset, this.srcSize);
        this.alpha = 1.0f;
    }

    /* renamed from: getFilterQuality-f-v9h1I$ui_graphics_release  reason: not valid java name */
    public final int m4959getFilterQualityfv9h1I$ui_graphics_release() {
        return this.filterQuality;
    }

    /* renamed from: setFilterQuality-vDHp3xo$ui_graphics_release  reason: not valid java name */
    public final void m4961setFilterQualityvDHp3xo$ui_graphics_release(int i) {
        this.filterQuality = i;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.compose.ui.graphics.painter.Painter
    public void onDraw(DrawScope $this$onDraw) {
        ImageBitmap imageBitmap = this.image;
        long j = this.srcOffset;
        long j2 = this.srcSize;
        long arg0$iv = $this$onDraw.mo4840getSizeNHjbRc();
        int bits$iv$iv$iv = (int) (arg0$iv >> 32);
        float $this$fastRoundToInt$iv = Float.intBitsToFloat(bits$iv$iv$iv);
        int $i$f$fastRoundToInt = Math.round($this$fastRoundToInt$iv);
        long arg0$iv2 = $this$onDraw.mo4840getSizeNHjbRc();
        int bits$iv$iv$iv2 = (int) (arg0$iv2 & 4294967295L);
        float $this$fastRoundToInt$iv2 = Float.intBitsToFloat(bits$iv$iv$iv2);
        int $i$f$fastRoundToInt2 = Math.round($this$fastRoundToInt$iv2);
        DrawScope.m4823drawImageAZ2fEMs$default($this$onDraw, imageBitmap, j, j2, 0L, IntSize.m7039constructorimpl(($i$f$fastRoundToInt << 32) | ($i$f$fastRoundToInt2 & 4294967295L)), this.alpha, null, this.colorFilter, 0, this.filterQuality, TIFFConstants.TIFFTAG_CONSECUTIVEBADFAXLINES, null);
    }

    @Override // androidx.compose.ui.graphics.painter.Painter
    /* renamed from: getIntrinsicSize-NH-jbRc  reason: not valid java name */
    public long mo4960getIntrinsicSizeNHjbRc() {
        return IntSizeKt.m7056toSizeozmzZPI(this.size);
    }

    @Override // androidx.compose.ui.graphics.painter.Painter
    protected boolean applyAlpha(float alpha) {
        this.alpha = alpha;
        return true;
    }

    @Override // androidx.compose.ui.graphics.painter.Painter
    protected boolean applyColorFilter(ColorFilter colorFilter) {
        this.colorFilter = colorFilter;
        return true;
    }

    /* renamed from: validateSize-N5eqBDc  reason: not valid java name */
    private final long m4958validateSizeN5eqBDc(long srcOffset, long srcSize) {
        if (!(IntOffset.m7001getXimpl(srcOffset) >= 0 && IntOffset.m7002getYimpl(srcOffset) >= 0 && ((int) (srcSize >> 32)) >= 0 && ((int) (srcSize & 4294967295L)) >= 0 && ((int) (srcSize >> 32)) <= this.image.getWidth() && ((int) (srcSize & 4294967295L)) <= this.image.getHeight())) {
            throw new IllegalArgumentException("Failed requirement.".toString());
        }
        return srcSize;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof BitmapPainter) && Intrinsics.areEqual(this.image, ((BitmapPainter) other).image) && IntOffset.m7000equalsimpl0(this.srcOffset, ((BitmapPainter) other).srcOffset) && IntSize.m7042equalsimpl0(this.srcSize, ((BitmapPainter) other).srcSize) && FilterQuality.m4383equalsimpl0(this.filterQuality, ((BitmapPainter) other).filterQuality);
    }

    public int hashCode() {
        int result = this.image.hashCode();
        return (((((result * 31) + IntOffset.m7003hashCodeimpl(this.srcOffset)) * 31) + IntSize.m7045hashCodeimpl(this.srcSize)) * 31) + FilterQuality.m4384hashCodeimpl(this.filterQuality);
    }

    public String toString() {
        return "BitmapPainter(image=" + this.image + ", srcOffset=" + ((Object) IntOffset.m7008toStringimpl(this.srcOffset)) + ", srcSize=" + ((Object) IntSize.m7047toStringimpl(this.srcSize)) + ", filterQuality=" + ((Object) FilterQuality.m4385toStringimpl(this.filterQuality)) + ')';
    }
}
