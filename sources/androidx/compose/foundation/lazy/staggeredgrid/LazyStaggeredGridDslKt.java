package androidx.compose.foundation.lazy.staggeredgrid;

import androidx.autofill.HintConstants;
import androidx.compose.foundation.OverscrollEffect;
import androidx.compose.foundation.OverscrollKt;
import androidx.compose.foundation.gestures.FlingBehavior;
import androidx.compose.foundation.gestures.Orientation;
import androidx.compose.foundation.gestures.ScrollableDefaults;
import androidx.compose.foundation.internal.InlineClassHelperKt;
import androidx.compose.foundation.layout.Arrangement;
import androidx.compose.foundation.layout.PaddingKt;
import androidx.compose.foundation.layout.PaddingValues;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.Dp;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.exifinterface.media.ExifInterface;
import androidx.profileinstaller.ProfileVerifier;
import com.itextpdf.kernel.xmp.options.PropertyOptions;
import com.itextpdf.layout.properties.Property;
import java.util.List;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.functions.Function5;
/* compiled from: LazyStaggeredGridDsl.kt */
@Metadata(d1 = {"\u0000 \u0001\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a\u008f\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u000b2\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00142\u0017\u0010\u0015\u001a\u0013\u0012\u0004\u0012\u00020\u0017\u0012\u0004\u0012\u00020\u00010\u0016¢\u0006\u0002\b\u0018H\u0007ø\u0001\u0000¢\u0006\u0004\b\u0019\u0010\u001a\u001a\u0083\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u000b2\u0017\u0010\u0015\u001a\u0013\u0012\u0004\u0012\u00020\u0017\u0012\u0004\u0012\u00020\u00010\u0016¢\u0006\u0002\b\u0018H\u0007ø\u0001\u0000¢\u0006\u0004\b\u001b\u0010\u001c\u001a\u008f\u0001\u0010\u001d\u001a\u00020\u00012\u0006\u0010\u001e\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\u001f\u001a\u00020\u000f2\b\b\u0002\u0010 \u001a\u00020!2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u000b2\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00142\u0017\u0010\u0015\u001a\u0013\u0012\u0004\u0012\u00020\u0017\u0012\u0004\u0012\u00020\u00010\u0016¢\u0006\u0002\b\u0018H\u0007ø\u0001\u0000¢\u0006\u0004\b\"\u0010#\u001a\u0083\u0001\u0010\u001d\u001a\u00020\u00012\u0006\u0010\u001e\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\u001f\u001a\u00020\u000f2\b\b\u0002\u0010 \u001a\u00020!2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u000b2\u0017\u0010\u0015\u001a\u0013\u0012\u0004\u0012\u00020\u0017\u0012\u0004\u0012\u00020\u00010\u0016¢\u0006\u0002\b\u0018H\u0007ø\u0001\u0000¢\u0006\u0004\b$\u0010%\u001a%\u0010&\u001a\u00020'2\u0006\u0010\u001e\u001a\u00020\u00032\u0006\u0010 \u001a\u00020!2\u0006\u0010\b\u001a\u00020\tH\u0003¢\u0006\u0002\u0010(\u001a%\u0010)\u001a\u00020'2\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\b\u001a\u00020\tH\u0003¢\u0006\u0002\u0010*\u001aÐ\u0001\u0010+\u001a\u00020\u0001\"\u0004\b\u0000\u0010,*\u00020\u00172\f\u0010+\u001a\b\u0012\u0004\u0012\u0002H,0-2%\b\n\u0010.\u001a\u001f\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0004\u0012\u000202\u0018\u00010\u00162%\b\u0006\u00103\u001a\u001f\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0006\u0012\u0004\u0018\u0001020\u00162%\b\n\u00104\u001a\u001f\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0004\u0012\u000205\u0018\u00010\u001623\b\u0004\u00106\u001a-\u0012\u0004\u0012\u000208\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0004\u0012\u00020\u000107¢\u0006\u0002\b9¢\u0006\u0002\b\u0018H\u0086\b¢\u0006\u0002\u0010:\u001aÐ\u0001\u0010+\u001a\u00020\u0001\"\u0004\b\u0000\u0010,*\u00020\u00172\f\u0010+\u001a\b\u0012\u0004\u0012\u0002H,0;2%\b\n\u0010.\u001a\u001f\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0004\u0012\u000202\u0018\u00010\u00162%\b\u0006\u00103\u001a\u001f\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0006\u0012\u0004\u0018\u0001020\u00162%\b\n\u00104\u001a\u001f\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0004\u0012\u000205\u0018\u00010\u001623\b\u0004\u00106\u001a-\u0012\u0004\u0012\u000208\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0004\u0012\u00020\u000107¢\u0006\u0002\b9¢\u0006\u0002\b\u0018H\u0086\b¢\u0006\u0002\u0010<\u001a¤\u0002\u0010=\u001a\u00020\u0001\"\u0004\b\u0000\u0010,*\u00020\u00172\f\u0010+\u001a\b\u0012\u0004\u0012\u0002H,0-2:\b\n\u0010.\u001a4\u0012\u0013\u0012\u00110>¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(?\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0004\u0012\u000202\u0018\u0001072:\b\u0006\u00103\u001a4\u0012\u0013\u0012\u00110>¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(?\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0006\u0012\u0004\u0018\u000102072:\b\n\u00104\u001a4\u0012\u0013\u0012\u00110>¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(?\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0004\u0012\u000205\u0018\u0001072H\b\u0004\u00106\u001aB\u0012\u0004\u0012\u000208\u0012\u0013\u0012\u00110>¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(?\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0004\u0012\u00020\u00010@¢\u0006\u0002\b9¢\u0006\u0002\b\u0018H\u0086\b¢\u0006\u0002\u0010A\u001a¤\u0002\u0010=\u001a\u00020\u0001\"\u0004\b\u0000\u0010,*\u00020\u00172\f\u0010+\u001a\b\u0012\u0004\u0012\u0002H,0;2:\b\n\u0010.\u001a4\u0012\u0013\u0012\u00110>¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(?\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0004\u0012\u000202\u0018\u0001072:\b\u0006\u00103\u001a4\u0012\u0013\u0012\u00110>¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(?\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0006\u0012\u0004\u0018\u000102072:\b\n\u00104\u001a4\u0012\u0013\u0012\u00110>¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(?\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0004\u0012\u000205\u0018\u0001072H\b\u0004\u00106\u001aB\u0012\u0004\u0012\u000208\u0012\u0013\u0012\u00110>¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(?\u0012\u0013\u0012\u0011H,¢\u0006\f\b/\u0012\b\b0\u0012\u0004\b\b(1\u0012\u0004\u0012\u00020\u00010@¢\u0006\u0002\b9¢\u0006\u0002\b\u0018H\u0086\b¢\u0006\u0002\u0010B\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006C"}, d2 = {"LazyHorizontalStaggeredGrid", "", "rows", "Landroidx/compose/foundation/lazy/staggeredgrid/StaggeredGridCells;", "modifier", "Landroidx/compose/ui/Modifier;", "state", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridState;", "contentPadding", "Landroidx/compose/foundation/layout/PaddingValues;", "reverseLayout", "", "verticalArrangement", "Landroidx/compose/foundation/layout/Arrangement$Vertical;", "horizontalItemSpacing", "Landroidx/compose/ui/unit/Dp;", "flingBehavior", "Landroidx/compose/foundation/gestures/FlingBehavior;", "userScrollEnabled", "overscrollEffect", "Landroidx/compose/foundation/OverscrollEffect;", "content", "Lkotlin/Function1;", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridScope;", "Lkotlin/ExtensionFunctionType;", "LazyHorizontalStaggeredGrid-121YqSk", "(Landroidx/compose/foundation/lazy/staggeredgrid/StaggeredGridCells;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridState;Landroidx/compose/foundation/layout/PaddingValues;ZLandroidx/compose/foundation/layout/Arrangement$Vertical;FLandroidx/compose/foundation/gestures/FlingBehavior;ZLandroidx/compose/foundation/OverscrollEffect;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;III)V", "LazyHorizontalStaggeredGrid-cJHQLPU", "(Landroidx/compose/foundation/lazy/staggeredgrid/StaggeredGridCells;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridState;Landroidx/compose/foundation/layout/PaddingValues;ZLandroidx/compose/foundation/layout/Arrangement$Vertical;FLandroidx/compose/foundation/gestures/FlingBehavior;ZLkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V", "LazyVerticalStaggeredGrid", "columns", "verticalItemSpacing", "horizontalArrangement", "Landroidx/compose/foundation/layout/Arrangement$Horizontal;", "LazyVerticalStaggeredGrid-6qCrX9Q", "(Landroidx/compose/foundation/lazy/staggeredgrid/StaggeredGridCells;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridState;Landroidx/compose/foundation/layout/PaddingValues;ZFLandroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/gestures/FlingBehavior;ZLandroidx/compose/foundation/OverscrollEffect;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;III)V", "LazyVerticalStaggeredGrid-zadm560", "(Landroidx/compose/foundation/lazy/staggeredgrid/StaggeredGridCells;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridState;Landroidx/compose/foundation/layout/PaddingValues;ZFLandroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/gestures/FlingBehavior;ZLkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V", "rememberColumnSlots", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyGridStaggeredGridSlotsProvider;", "(Landroidx/compose/foundation/lazy/staggeredgrid/StaggeredGridCells;Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/runtime/Composer;I)Landroidx/compose/foundation/lazy/staggeredgrid/LazyGridStaggeredGridSlotsProvider;", "rememberRowSlots", "(Landroidx/compose/foundation/lazy/staggeredgrid/StaggeredGridCells;Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/runtime/Composer;I)Landroidx/compose/foundation/lazy/staggeredgrid/LazyGridStaggeredGridSlotsProvider;", "items", ExifInterface.GPS_DIRECTION_TRUE, "", "key", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "item", "", "contentType", "span", "Landroidx/compose/foundation/lazy/staggeredgrid/StaggeredGridItemSpan;", "itemContent", "Lkotlin/Function2;", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridItemScope;", "Landroidx/compose/runtime/Composable;", "(Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridScope;[Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;)V", "", "(Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridScope;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;)V", "itemsIndexed", "", "index", "Lkotlin/Function3;", "(Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridScope;[Ljava/lang/Object;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function5;)V", "(Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridScope;Ljava/util/List;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function5;)V", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyStaggeredGridDslKt {
    /* renamed from: LazyVerticalStaggeredGrid-6qCrX9Q  reason: not valid java name */
    public static final void m1195LazyVerticalStaggeredGrid6qCrX9Q(final StaggeredGridCells columns, Modifier modifier, LazyStaggeredGridState state, PaddingValues contentPadding, boolean reverseLayout, float verticalItemSpacing, Arrangement.Horizontal horizontalArrangement, FlingBehavior flingBehavior, boolean userScrollEnabled, OverscrollEffect overscrollEffect, final Function1<? super LazyStaggeredGridScope, Unit> function1, Composer $composer, final int $changed, final int $changed1, final int i) {
        Modifier modifier2;
        Object state2;
        Object contentPadding2;
        boolean reverseLayout2;
        float verticalItemSpacing2;
        int i2;
        Composer $composer2;
        final OverscrollEffect overscrollEffect2;
        int $dirty1;
        final float verticalItemSpacing3;
        final Modifier modifier3;
        final PaddingValues contentPadding3;
        final boolean reverseLayout3;
        final Arrangement.Horizontal horizontalArrangement2;
        final FlingBehavior flingBehavior2;
        int $dirty;
        final LazyStaggeredGridState state3;
        final boolean userScrollEnabled2;
        int i3;
        Arrangement.HorizontalOrVertical horizontalArrangement3;
        FlingBehavior flingBehavior3;
        OverscrollEffect overscrollEffect3;
        FlingBehavior flingBehavior4;
        float verticalItemSpacing4;
        boolean userScrollEnabled3;
        boolean reverseLayout4;
        LazyStaggeredGridState state4;
        int i4;
        int i5;
        int i6;
        Composer $composer3 = $composer.startRestartGroup(-578931208);
        ComposerKt.sourceInformation($composer3, "C(LazyVerticalStaggeredGrid)P(!1,5,8,2,7,10:c#ui.unit.Dp,4,3,9,6)93@4431L67,82@3984L547:LazyStaggeredGridDsl.kt#fzvcnm");
        int $dirty2 = $changed;
        int $dirty12 = $changed1;
        if ((i & 1) != 0) {
            $dirty2 |= 6;
        } else if (($changed & 6) == 0) {
            $dirty2 |= $composer3.changed(columns) ? 4 : 2;
        }
        int i7 = i & 2;
        if (i7 != 0) {
            $dirty2 |= 48;
            modifier2 = modifier;
        } else if (($changed & 48) == 0) {
            modifier2 = modifier;
            $dirty2 |= $composer3.changed(modifier2) ? 32 : 16;
        } else {
            modifier2 = modifier;
        }
        if (($changed & 384) == 0) {
            if ((i & 4) == 0) {
                state2 = state;
                if ($composer3.changed(state2)) {
                    i6 = 256;
                    $dirty2 |= i6;
                }
            } else {
                state2 = state;
            }
            i6 = 128;
            $dirty2 |= i6;
        } else {
            state2 = state;
        }
        int i8 = i & 8;
        if (i8 != 0) {
            $dirty2 |= 3072;
            contentPadding2 = contentPadding;
        } else if (($changed & 3072) == 0) {
            contentPadding2 = contentPadding;
            $dirty2 |= $composer3.changed(contentPadding2) ? 2048 : 1024;
        } else {
            contentPadding2 = contentPadding;
        }
        int i9 = i & 16;
        if (i9 != 0) {
            $dirty2 |= 24576;
            reverseLayout2 = reverseLayout;
        } else if (($changed & 24576) == 0) {
            reverseLayout2 = reverseLayout;
            $dirty2 |= $composer3.changed(reverseLayout2) ? 16384 : 8192;
        } else {
            reverseLayout2 = reverseLayout;
        }
        int i10 = i & 32;
        if (i10 != 0) {
            $dirty2 |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            verticalItemSpacing2 = verticalItemSpacing;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            verticalItemSpacing2 = verticalItemSpacing;
            $dirty2 |= $composer3.changed(verticalItemSpacing2) ? 131072 : 65536;
        } else {
            verticalItemSpacing2 = verticalItemSpacing;
        }
        int i11 = i & 64;
        if (i11 != 0) {
            $dirty2 |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty2 |= $composer3.changed(horizontalArrangement) ? 1048576 : 524288;
        }
        if (($changed & 12582912) == 0) {
            if ((i & 128) == 0 && $composer3.changed(flingBehavior)) {
                i5 = 8388608;
                $dirty2 |= i5;
            }
            i5 = 4194304;
            $dirty2 |= i5;
        }
        int i12 = i & 256;
        if (i12 != 0) {
            $dirty2 |= 100663296;
            i2 = i12;
        } else if (($changed & 100663296) == 0) {
            i2 = i12;
            $dirty2 |= $composer3.changed(userScrollEnabled) ? 67108864 : 33554432;
        } else {
            i2 = i12;
        }
        if (($changed & 805306368) == 0) {
            if ((i & 512) == 0 && $composer3.changed(overscrollEffect)) {
                i4 = PropertyOptions.DELETE_EXISTING;
                $dirty2 |= i4;
            }
            i4 = 268435456;
            $dirty2 |= i4;
        }
        if ((i & 1024) != 0) {
            $dirty12 |= 6;
        } else if (($changed1 & 6) == 0) {
            $dirty12 |= $composer3.changedInstance(function1) ? 4 : 2;
        }
        if ($composer3.shouldExecute((($dirty2 & 306783379) == 306783378 && ($dirty12 & 3) == 2) ? false : true, $dirty2 & 1)) {
            $composer3.startDefaults();
            ComposerKt.sourceInformation($composer3, "72@3506L32,77@3803L15,79@3901L26");
            if (($changed & 1) == 0 || $composer3.getDefaultsInvalid()) {
                if (i7 != 0) {
                    modifier2 = Modifier.Companion;
                }
                if ((i & 4) != 0) {
                    $dirty2 &= -897;
                    state2 = LazyStaggeredGridStateKt.rememberLazyStaggeredGridState(0, 0, $composer3, 0, 3);
                }
                if (i8 != 0) {
                    i3 = -1879048193;
                    contentPadding2 = PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(0));
                } else {
                    i3 = -1879048193;
                }
                if (i9 != 0) {
                    reverseLayout2 = false;
                }
                if (i10 != 0) {
                    verticalItemSpacing2 = Dp.m6873constructorimpl(0);
                }
                horizontalArrangement3 = i11 != 0 ? Arrangement.INSTANCE.m874spacedBy0680j_4(Dp.m6873constructorimpl(0)) : horizontalArrangement;
                if ((i & 128) != 0) {
                    flingBehavior3 = ScrollableDefaults.INSTANCE.flingBehavior($composer3, 6);
                    $dirty2 &= -29360129;
                } else {
                    flingBehavior3 = flingBehavior;
                }
                boolean userScrollEnabled4 = i2 != 0 ? true : userScrollEnabled;
                if ((i & 512) != 0) {
                    $dirty2 &= i3;
                    flingBehavior4 = flingBehavior3;
                    overscrollEffect3 = OverscrollKt.rememberOverscrollEffect($composer3, 0);
                    verticalItemSpacing4 = verticalItemSpacing2;
                    userScrollEnabled3 = userScrollEnabled4;
                    reverseLayout4 = reverseLayout2;
                    state4 = state2;
                } else {
                    overscrollEffect3 = overscrollEffect;
                    flingBehavior4 = flingBehavior3;
                    verticalItemSpacing4 = verticalItemSpacing2;
                    userScrollEnabled3 = userScrollEnabled4;
                    reverseLayout4 = reverseLayout2;
                    state4 = state2;
                }
            } else {
                $composer3.skipToGroupEnd();
                if ((i & 4) != 0) {
                    $dirty2 &= -897;
                }
                if ((i & 128) != 0) {
                    $dirty2 &= -29360129;
                }
                if ((i & 512) != 0) {
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled3 = userScrollEnabled;
                    overscrollEffect3 = overscrollEffect;
                    $dirty2 &= -1879048193;
                    verticalItemSpacing4 = verticalItemSpacing2;
                    reverseLayout4 = reverseLayout2;
                    horizontalArrangement3 = horizontalArrangement;
                    state4 = state2;
                } else {
                    horizontalArrangement3 = horizontalArrangement;
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled3 = userScrollEnabled;
                    overscrollEffect3 = overscrollEffect;
                    verticalItemSpacing4 = verticalItemSpacing2;
                    reverseLayout4 = reverseLayout2;
                    state4 = state2;
                }
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-578931208, $dirty2, $dirty12, "androidx.compose.foundation.lazy.staggeredgrid.LazyVerticalStaggeredGrid (LazyStaggeredGridDsl.kt:81)");
            }
            $composer2 = $composer3;
            Modifier modifier4 = modifier2;
            PaddingValues contentPadding4 = contentPadding2;
            LazyStaggeredGridKt.m1201LazyStaggeredGridw41Enmo(state4, Orientation.Vertical, rememberColumnSlots(columns, horizontalArrangement3, contentPadding2, $composer3, ($dirty2 & 14) | (($dirty2 >> 15) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | (($dirty2 >> 3) & 896)), modifier4, contentPadding4, reverseLayout4, flingBehavior4, userScrollEnabled3, overscrollEffect3, verticalItemSpacing4, horizontalArrangement3.mo880getSpacingD9Ej5fM(), function1, $composer2, (($dirty2 >> 6) & 14) | 48 | (($dirty2 << 6) & 7168) | (($dirty2 << 3) & 57344) | (($dirty2 << 3) & 458752) | (($dirty2 >> 3) & 3670016) | (($dirty2 >> 3) & 29360128) | (($dirty2 >> 3) & 234881024) | (($dirty2 << 12) & 1879048192), ($dirty12 << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            LazyStaggeredGridState lazyStaggeredGridState = state4;
            $dirty = $dirty2;
            state3 = lazyStaggeredGridState;
            horizontalArrangement2 = horizontalArrangement3;
            $dirty1 = $dirty12;
            modifier3 = modifier4;
            contentPadding3 = contentPadding4;
            reverseLayout3 = reverseLayout4;
            flingBehavior2 = flingBehavior4;
            userScrollEnabled2 = userScrollEnabled3;
            overscrollEffect2 = overscrollEffect3;
            verticalItemSpacing3 = verticalItemSpacing4;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            overscrollEffect2 = overscrollEffect;
            $dirty1 = $dirty12;
            verticalItemSpacing3 = verticalItemSpacing2;
            modifier3 = modifier2;
            contentPadding3 = contentPadding2;
            reverseLayout3 = reverseLayout2;
            horizontalArrangement2 = horizontalArrangement;
            flingBehavior2 = flingBehavior;
            $dirty = $dirty2;
            state3 = state2;
            userScrollEnabled2 = userScrollEnabled;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridDslKt$LazyVerticalStaggeredGrid$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i13) {
                    LazyStaggeredGridDslKt.m1195LazyVerticalStaggeredGrid6qCrX9Q(StaggeredGridCells.this, modifier3, state3, contentPadding3, reverseLayout3, verticalItemSpacing3, horizontalArrangement2, flingBehavior2, userScrollEnabled2, overscrollEffect2, function1, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Use the non deprecated overload")
    /* renamed from: LazyVerticalStaggeredGrid-zadm560  reason: not valid java name */
    public static final /* synthetic */ void m1196LazyVerticalStaggeredGridzadm560(final StaggeredGridCells columns, Modifier modifier, LazyStaggeredGridState state, PaddingValues contentPadding, boolean reverseLayout, float verticalItemSpacing, Arrangement.Horizontal horizontalArrangement, FlingBehavior flingBehavior, boolean userScrollEnabled, final Function1 content, Composer $composer, final int $changed, final int i) {
        StaggeredGridCells staggeredGridCells;
        Object obj;
        Object obj2;
        boolean z;
        float f;
        int i2;
        Composer $composer2;
        final FlingBehavior flingBehavior2;
        final LazyStaggeredGridState state2;
        final PaddingValues contentPadding2;
        final boolean reverseLayout2;
        final float verticalItemSpacing2;
        final Modifier modifier2;
        final Arrangement.Horizontal horizontalArrangement2;
        final boolean userScrollEnabled2;
        int i3;
        LazyStaggeredGridState state3;
        FlingBehavior flingBehavior3;
        boolean userScrollEnabled3;
        Modifier modifier3;
        LazyStaggeredGridState state4;
        PaddingValues contentPadding3;
        boolean reverseLayout3;
        float verticalItemSpacing3;
        Arrangement.Horizontal horizontalArrangement3;
        FlingBehavior flingBehavior4;
        int i4;
        int i5;
        int i6;
        int i7;
        Composer $composer3 = $composer.startRestartGroup(1695323794);
        ComposerKt.sourceInformation($composer3, "C(LazyVerticalStaggeredGrid)P(!1,5,7,2,6,9:c#ui.unit.Dp,4,3,8)122@5575L26,112@5170L464:LazyStaggeredGridDsl.kt#fzvcnm");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
            staggeredGridCells = columns;
        } else if (($changed & 6) == 0) {
            staggeredGridCells = columns;
            $dirty |= $composer3.changed(staggeredGridCells) ? 4 : 2;
        } else {
            staggeredGridCells = columns;
        }
        int i8 = i & 2;
        if (i8 != 0) {
            $dirty |= 48;
        } else if (($changed & 48) == 0) {
            $dirty |= $composer3.changed(modifier) ? 32 : 16;
        }
        if (($changed & 384) == 0) {
            if ((i & 4) == 0) {
                obj = state;
                if ($composer3.changed(obj)) {
                    i7 = 256;
                    $dirty |= i7;
                }
            } else {
                obj = state;
            }
            i7 = 128;
            $dirty |= i7;
        } else {
            obj = state;
        }
        int i9 = i & 8;
        if (i9 != 0) {
            $dirty |= 3072;
            obj2 = contentPadding;
        } else if (($changed & 3072) == 0) {
            obj2 = contentPadding;
            $dirty |= $composer3.changed(obj2) ? 2048 : 1024;
        } else {
            obj2 = contentPadding;
        }
        int i10 = i & 16;
        if (i10 != 0) {
            $dirty |= 24576;
            z = reverseLayout;
        } else if (($changed & 24576) == 0) {
            z = reverseLayout;
            $dirty |= $composer3.changed(z) ? 16384 : 8192;
        } else {
            z = reverseLayout;
        }
        int i11 = i & 32;
        if (i11 != 0) {
            $dirty |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            f = verticalItemSpacing;
        } else if ((196608 & $changed) == 0) {
            f = verticalItemSpacing;
            $dirty |= $composer3.changed(f) ? 131072 : 65536;
        } else {
            f = verticalItemSpacing;
        }
        int i12 = i & 64;
        if (i12 != 0) {
            $dirty |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty |= $composer3.changed(horizontalArrangement) ? 1048576 : 524288;
        }
        if (($changed & 12582912) == 0) {
            if ((i & 128) == 0 && $composer3.changed(flingBehavior)) {
                i6 = 8388608;
                $dirty |= i6;
            }
            i6 = 4194304;
            $dirty |= i6;
        }
        int i13 = i & 256;
        if (i13 != 0) {
            $dirty |= 100663296;
            i2 = i13;
        } else if (($changed & 100663296) == 0) {
            i2 = i13;
            $dirty |= $composer3.changed(userScrollEnabled) ? 67108864 : 33554432;
        } else {
            i2 = i13;
        }
        if ((i & 512) != 0) {
            $dirty |= 805306368;
        } else if (($changed & 805306368) == 0) {
            $dirty |= $composer3.changedInstance(content) ? PropertyOptions.DELETE_EXISTING : 268435456;
        }
        if ($composer3.shouldExecute(($dirty & 306783379) != 306783378, $dirty & 1)) {
            $composer3.startDefaults();
            ComposerKt.sourceInformation($composer3, "103@4762L32,108@5059L15");
            if (($changed & 1) == 0 || $composer3.getDefaultsInvalid()) {
                Modifier.Companion modifier4 = i8 != 0 ? Modifier.Companion : modifier;
                if ((i & 4) != 0) {
                    i3 = -29360129;
                    state3 = LazyStaggeredGridStateKt.rememberLazyStaggeredGridState(0, 0, $composer3, 0, 3);
                    $dirty &= -897;
                } else {
                    i3 = -29360129;
                    state3 = obj;
                }
                PaddingValues contentPadding4 = i9 != 0 ? PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(0)) : obj2;
                boolean reverseLayout4 = i10 != 0 ? false : z;
                float verticalItemSpacing4 = i11 != 0 ? Dp.m6873constructorimpl(0) : f;
                Arrangement.HorizontalOrVertical horizontalArrangement4 = i12 != 0 ? Arrangement.INSTANCE.m874spacedBy0680j_4(Dp.m6873constructorimpl(0)) : horizontalArrangement;
                if ((i & 128) != 0) {
                    flingBehavior3 = ScrollableDefaults.INSTANCE.flingBehavior($composer3, 6);
                    $dirty &= i3;
                } else {
                    flingBehavior3 = flingBehavior;
                }
                if (i2 != 0) {
                    modifier3 = modifier4;
                    state4 = state3;
                    contentPadding3 = contentPadding4;
                    reverseLayout3 = reverseLayout4;
                    verticalItemSpacing3 = verticalItemSpacing4;
                    horizontalArrangement3 = horizontalArrangement4;
                    flingBehavior4 = flingBehavior3;
                    userScrollEnabled3 = true;
                    i4 = 0;
                    i5 = 1695323794;
                } else {
                    userScrollEnabled3 = userScrollEnabled;
                    modifier3 = modifier4;
                    state4 = state3;
                    contentPadding3 = contentPadding4;
                    reverseLayout3 = reverseLayout4;
                    verticalItemSpacing3 = verticalItemSpacing4;
                    horizontalArrangement3 = horizontalArrangement4;
                    flingBehavior4 = flingBehavior3;
                    i4 = 0;
                    i5 = 1695323794;
                }
            } else {
                $composer3.skipToGroupEnd();
                if ((i & 4) != 0) {
                    $dirty &= -897;
                }
                if ((i & 128) != 0) {
                    horizontalArrangement3 = horizontalArrangement;
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled3 = userScrollEnabled;
                    $dirty &= -29360129;
                    i4 = 0;
                    state4 = obj;
                    contentPadding3 = obj2;
                    reverseLayout3 = z;
                    verticalItemSpacing3 = f;
                    i5 = 1695323794;
                    modifier3 = modifier;
                } else {
                    horizontalArrangement3 = horizontalArrangement;
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled3 = userScrollEnabled;
                    i4 = 0;
                    state4 = obj;
                    contentPadding3 = obj2;
                    reverseLayout3 = z;
                    verticalItemSpacing3 = f;
                    i5 = 1695323794;
                    modifier3 = modifier;
                }
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i5, $dirty, -1, "androidx.compose.foundation.lazy.staggeredgrid.LazyVerticalStaggeredGrid (LazyStaggeredGridDsl.kt:111)");
            }
            $composer2 = $composer3;
            m1195LazyVerticalStaggeredGrid6qCrX9Q(staggeredGridCells, modifier3, state4, contentPadding3, reverseLayout3, verticalItemSpacing3, horizontalArrangement3, flingBehavior4, userScrollEnabled3, OverscrollKt.rememberOverscrollEffect($composer3, i4), content, $composer2, ($dirty & 14) | ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (458752 & $dirty) | (3670016 & $dirty) | (29360128 & $dirty) | (234881024 & $dirty), ($dirty >> 27) & 14, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier3;
            state2 = state4;
            contentPadding2 = contentPadding3;
            reverseLayout2 = reverseLayout3;
            verticalItemSpacing2 = verticalItemSpacing3;
            horizontalArrangement2 = horizontalArrangement3;
            flingBehavior2 = flingBehavior4;
            userScrollEnabled2 = userScrollEnabled3;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            flingBehavior2 = flingBehavior;
            state2 = obj;
            contentPadding2 = obj2;
            reverseLayout2 = z;
            verticalItemSpacing2 = f;
            modifier2 = modifier;
            horizontalArrangement2 = horizontalArrangement;
            userScrollEnabled2 = userScrollEnabled;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridDslKt$LazyVerticalStaggeredGrid$2
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i14) {
                    LazyStaggeredGridDslKt.m1196LazyVerticalStaggeredGridzadm560(StaggeredGridCells.this, modifier2, state2, contentPadding2, reverseLayout2, verticalItemSpacing2, horizontalArrangement2, flingBehavior2, userScrollEnabled2, content, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    private static final LazyGridStaggeredGridSlotsProvider rememberColumnSlots(final StaggeredGridCells columns, final Arrangement.Horizontal horizontalArrangement, final PaddingValues contentPadding, Composer $composer, int $changed) {
        ComposerKt.sourceInformationMarkerStart($composer, -1267076841, "C(rememberColumnSlots)P(!1,2)134@5876L1225:LazyStaggeredGridDsl.kt#fzvcnm");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-1267076841, $changed, -1, "androidx.compose.foundation.lazy.staggeredgrid.rememberColumnSlots (LazyStaggeredGridDsl.kt:134)");
        }
        ComposerKt.sourceInformationMarkerStart($composer, 463617631, "CC(remember):LazyStaggeredGridDsl.kt#9igjgp");
        boolean invalid$iv = (((($changed & 14) ^ 6) > 4 && $composer.changed(columns)) || ($changed & 6) == 4) | (((($changed & Property.BORDER_BOTTOM_RIGHT_RADIUS) ^ 48) > 32 && $composer.changed(horizontalArrangement)) || ($changed & 48) == 32) | (((($changed & 896) ^ 384) > 256 && $composer.changed(contentPadding)) || ($changed & 384) == 256);
        Object it$iv = $composer.rememberedValue();
        if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
            Object value$iv = (LazyGridStaggeredGridSlotsProvider) new LazyStaggeredGridSlotCache(new Function2<Density, Constraints, LazyStaggeredGridSlots>() { // from class: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridDslKt$rememberColumnSlots$1$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ LazyStaggeredGridSlots invoke(Density density, Constraints constraints) {
                    return m1197invoke0kLqBqw(density, constraints.m6832unboximpl());
                }

                /* renamed from: invoke-0kLqBqw  reason: not valid java name */
                public final LazyStaggeredGridSlots m1197invoke0kLqBqw(Density $this$$receiver, long constraints) {
                    boolean value$iv2 = Constraints.m6826getMaxWidthimpl(constraints) != Integer.MAX_VALUE;
                    if (!value$iv2) {
                        InlineClassHelperKt.throwIllegalArgumentException("LazyVerticalStaggeredGrid's width should be bound by parent.");
                    }
                    float arg0$iv = PaddingKt.calculateStartPadding(PaddingValues.this, LayoutDirection.Ltr);
                    float other$iv = PaddingKt.calculateEndPadding(PaddingValues.this, LayoutDirection.Ltr);
                    int gridWidth = Constraints.m6826getMaxWidthimpl(constraints) - $this$$receiver.mo638roundToPx0680j_4(Dp.m6873constructorimpl(arg0$iv + other$iv));
                    StaggeredGridCells $this$invoke_0kLqBqw_u24lambda_u243 = columns;
                    Arrangement.Horizontal $this$invoke_0kLqBqw_u24lambda_u243_u24lambda_u242_u24lambda_u241 = horizontalArrangement;
                    int[] sizes = $this$invoke_0kLqBqw_u24lambda_u243.calculateCrossAxisCellSizes($this$$receiver, gridWidth, $this$$receiver.mo638roundToPx0680j_4($this$invoke_0kLqBqw_u24lambda_u243_u24lambda_u242_u24lambda_u241.mo880getSpacingD9Ej5fM()));
                    int[] positions = new int[sizes.length];
                    $this$invoke_0kLqBqw_u24lambda_u243_u24lambda_u242_u24lambda_u241.arrange($this$$receiver, gridWidth, sizes, LayoutDirection.Ltr, positions);
                    return new LazyStaggeredGridSlots(positions, sizes);
                }
            });
            $composer.updateRememberedValue(value$iv);
            it$iv = value$iv;
        }
        LazyGridStaggeredGridSlotsProvider lazyGridStaggeredGridSlotsProvider = (LazyGridStaggeredGridSlotsProvider) it$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return lazyGridStaggeredGridSlotsProvider;
    }

    /* renamed from: LazyHorizontalStaggeredGrid-121YqSk  reason: not valid java name */
    public static final void m1193LazyHorizontalStaggeredGrid121YqSk(final StaggeredGridCells rows, Modifier modifier, LazyStaggeredGridState state, PaddingValues contentPadding, boolean reverseLayout, Arrangement.Vertical verticalArrangement, float horizontalItemSpacing, FlingBehavior flingBehavior, boolean userScrollEnabled, OverscrollEffect overscrollEffect, final Function1<? super LazyStaggeredGridScope, Unit> function1, Composer $composer, final int $changed, final int $changed1, final int i) {
        Modifier modifier2;
        Object state2;
        Object contentPadding2;
        boolean reverseLayout2;
        Arrangement.Vertical verticalArrangement2;
        int i2;
        Composer $composer2;
        final OverscrollEffect overscrollEffect2;
        int $dirty1;
        final Arrangement.Vertical verticalArrangement3;
        final Modifier modifier3;
        final PaddingValues contentPadding3;
        final boolean reverseLayout3;
        final float horizontalItemSpacing2;
        final FlingBehavior flingBehavior2;
        int $dirty;
        final LazyStaggeredGridState state3;
        final boolean userScrollEnabled2;
        int i3;
        float horizontalItemSpacing3;
        FlingBehavior flingBehavior3;
        boolean userScrollEnabled3;
        OverscrollEffect overscrollEffect3;
        float horizontalItemSpacing4;
        FlingBehavior flingBehavior4;
        boolean userScrollEnabled4;
        boolean reverseLayout4;
        LazyStaggeredGridState state4;
        int i4;
        int i5;
        int i6;
        Composer $composer3 = $composer.startRestartGroup(-670735644);
        ComposerKt.sourceInformation($composer3, "C(LazyHorizontalStaggeredGrid)P(7,4,8,1,6,10,3:c#ui.unit.Dp,2,9,5)218@9951L59,207@9502L541:LazyStaggeredGridDsl.kt#fzvcnm");
        int $dirty2 = $changed;
        int $dirty12 = $changed1;
        if ((i & 1) != 0) {
            $dirty2 |= 6;
        } else if (($changed & 6) == 0) {
            $dirty2 |= $composer3.changed(rows) ? 4 : 2;
        }
        int i7 = i & 2;
        if (i7 != 0) {
            $dirty2 |= 48;
            modifier2 = modifier;
        } else if (($changed & 48) == 0) {
            modifier2 = modifier;
            $dirty2 |= $composer3.changed(modifier2) ? 32 : 16;
        } else {
            modifier2 = modifier;
        }
        if (($changed & 384) == 0) {
            if ((i & 4) == 0) {
                state2 = state;
                if ($composer3.changed(state2)) {
                    i6 = 256;
                    $dirty2 |= i6;
                }
            } else {
                state2 = state;
            }
            i6 = 128;
            $dirty2 |= i6;
        } else {
            state2 = state;
        }
        int i8 = i & 8;
        if (i8 != 0) {
            $dirty2 |= 3072;
            contentPadding2 = contentPadding;
        } else if (($changed & 3072) == 0) {
            contentPadding2 = contentPadding;
            $dirty2 |= $composer3.changed(contentPadding2) ? 2048 : 1024;
        } else {
            contentPadding2 = contentPadding;
        }
        int i9 = i & 16;
        if (i9 != 0) {
            $dirty2 |= 24576;
            reverseLayout2 = reverseLayout;
        } else if (($changed & 24576) == 0) {
            reverseLayout2 = reverseLayout;
            $dirty2 |= $composer3.changed(reverseLayout2) ? 16384 : 8192;
        } else {
            reverseLayout2 = reverseLayout;
        }
        int i10 = i & 32;
        if (i10 != 0) {
            $dirty2 |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            verticalArrangement2 = verticalArrangement;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            verticalArrangement2 = verticalArrangement;
            $dirty2 |= $composer3.changed(verticalArrangement2) ? 131072 : 65536;
        } else {
            verticalArrangement2 = verticalArrangement;
        }
        int i11 = i & 64;
        if (i11 != 0) {
            $dirty2 |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty2 |= $composer3.changed(horizontalItemSpacing) ? 1048576 : 524288;
        }
        if (($changed & 12582912) == 0) {
            if ((i & 128) == 0 && $composer3.changed(flingBehavior)) {
                i5 = 8388608;
                $dirty2 |= i5;
            }
            i5 = 4194304;
            $dirty2 |= i5;
        }
        int i12 = i & 256;
        if (i12 != 0) {
            $dirty2 |= 100663296;
            i2 = i12;
        } else if (($changed & 100663296) == 0) {
            i2 = i12;
            $dirty2 |= $composer3.changed(userScrollEnabled) ? 67108864 : 33554432;
        } else {
            i2 = i12;
        }
        if (($changed & 805306368) == 0) {
            if ((i & 512) == 0 && $composer3.changed(overscrollEffect)) {
                i4 = PropertyOptions.DELETE_EXISTING;
                $dirty2 |= i4;
            }
            i4 = 268435456;
            $dirty2 |= i4;
        }
        if ((i & 1024) != 0) {
            $dirty12 |= 6;
        } else if (($changed1 & 6) == 0) {
            $dirty12 |= $composer3.changedInstance(function1) ? 4 : 2;
        }
        if ($composer3.shouldExecute((($dirty2 & 306783379) == 306783378 && ($dirty12 & 3) == 2) ? false : true, $dirty2 & 1)) {
            $composer3.startDefaults();
            ComposerKt.sourceInformation($composer3, "197@9026L32,202@9321L15,204@9419L26");
            if (($changed & 1) != 0 && !$composer3.getDefaultsInvalid()) {
                $composer3.skipToGroupEnd();
                if ((i & 4) != 0) {
                    $dirty2 &= -897;
                }
                if ((i & 128) != 0) {
                    $dirty2 &= -29360129;
                }
                if ((i & 512) != 0) {
                    horizontalItemSpacing4 = horizontalItemSpacing;
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled4 = userScrollEnabled;
                    overscrollEffect3 = overscrollEffect;
                    $dirty2 &= -1879048193;
                    reverseLayout4 = reverseLayout2;
                    state4 = state2;
                } else {
                    horizontalItemSpacing4 = horizontalItemSpacing;
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled4 = userScrollEnabled;
                    overscrollEffect3 = overscrollEffect;
                    reverseLayout4 = reverseLayout2;
                    state4 = state2;
                }
            } else {
                if (i7 != 0) {
                    modifier2 = Modifier.Companion;
                }
                if ((i & 4) != 0) {
                    $dirty2 &= -897;
                    state2 = LazyStaggeredGridStateKt.rememberLazyStaggeredGridState(0, 0, $composer3, 0, 3);
                }
                if (i8 == 0) {
                    i3 = -1879048193;
                } else {
                    i3 = -1879048193;
                    contentPadding2 = PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(0));
                }
                if (i9 != 0) {
                    reverseLayout2 = false;
                }
                if (i10 != 0) {
                    verticalArrangement2 = Arrangement.INSTANCE.m874spacedBy0680j_4(Dp.m6873constructorimpl(0));
                }
                if (i11 == 0) {
                    horizontalItemSpacing3 = horizontalItemSpacing;
                } else {
                    horizontalItemSpacing3 = Dp.m6873constructorimpl(0);
                }
                if ((i & 128) != 0) {
                    flingBehavior3 = ScrollableDefaults.INSTANCE.flingBehavior($composer3, 6);
                    $dirty2 &= -29360129;
                } else {
                    flingBehavior3 = flingBehavior;
                }
                if (i2 == 0) {
                    userScrollEnabled3 = userScrollEnabled;
                } else {
                    userScrollEnabled3 = true;
                }
                if ((i & 512) == 0) {
                    overscrollEffect3 = overscrollEffect;
                    horizontalItemSpacing4 = horizontalItemSpacing3;
                    flingBehavior4 = flingBehavior3;
                    userScrollEnabled4 = userScrollEnabled3;
                    reverseLayout4 = reverseLayout2;
                    state4 = state2;
                } else {
                    $dirty2 &= i3;
                    horizontalItemSpacing4 = horizontalItemSpacing3;
                    flingBehavior4 = flingBehavior3;
                    overscrollEffect3 = OverscrollKt.rememberOverscrollEffect($composer3, 0);
                    userScrollEnabled4 = userScrollEnabled3;
                    reverseLayout4 = reverseLayout2;
                    state4 = state2;
                }
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-670735644, $dirty2, $dirty12, "androidx.compose.foundation.lazy.staggeredgrid.LazyHorizontalStaggeredGrid (LazyStaggeredGridDsl.kt:206)");
            }
            $composer2 = $composer3;
            Modifier modifier4 = modifier2;
            PaddingValues contentPadding4 = contentPadding2;
            LazyStaggeredGridKt.m1201LazyStaggeredGridw41Enmo(state4, Orientation.Horizontal, rememberRowSlots(rows, verticalArrangement2, contentPadding2, $composer3, ($dirty2 & 14) | (($dirty2 >> 12) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | (($dirty2 >> 3) & 896)), modifier4, contentPadding4, reverseLayout4, flingBehavior4, userScrollEnabled4, overscrollEffect3, horizontalItemSpacing4, verticalArrangement2.mo880getSpacingD9Ej5fM(), function1, $composer2, (($dirty2 >> 6) & 14) | 48 | (($dirty2 << 6) & 7168) | (($dirty2 << 3) & 57344) | (($dirty2 << 3) & 458752) | (($dirty2 >> 3) & 3670016) | (($dirty2 >> 3) & 29360128) | (($dirty2 >> 3) & 234881024) | (($dirty2 << 9) & 1879048192), ($dirty12 << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            LazyStaggeredGridState lazyStaggeredGridState = state4;
            $dirty = $dirty2;
            state3 = lazyStaggeredGridState;
            $dirty1 = $dirty12;
            verticalArrangement3 = verticalArrangement2;
            modifier3 = modifier4;
            contentPadding3 = contentPadding4;
            reverseLayout3 = reverseLayout4;
            flingBehavior2 = flingBehavior4;
            userScrollEnabled2 = userScrollEnabled4;
            overscrollEffect2 = overscrollEffect3;
            horizontalItemSpacing2 = horizontalItemSpacing4;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            overscrollEffect2 = overscrollEffect;
            $dirty1 = $dirty12;
            verticalArrangement3 = verticalArrangement2;
            modifier3 = modifier2;
            contentPadding3 = contentPadding2;
            reverseLayout3 = reverseLayout2;
            horizontalItemSpacing2 = horizontalItemSpacing;
            flingBehavior2 = flingBehavior;
            $dirty = $dirty2;
            state3 = state2;
            userScrollEnabled2 = userScrollEnabled;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridDslKt$LazyHorizontalStaggeredGrid$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i13) {
                    LazyStaggeredGridDslKt.m1193LazyHorizontalStaggeredGrid121YqSk(StaggeredGridCells.this, modifier3, state3, contentPadding3, reverseLayout3, verticalArrangement3, horizontalItemSpacing2, flingBehavior2, userScrollEnabled2, overscrollEffect2, function1, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Use the non deprecated overload")
    /* renamed from: LazyHorizontalStaggeredGrid-cJHQLPU  reason: not valid java name */
    public static final /* synthetic */ void m1194LazyHorizontalStaggeredGridcJHQLPU(final StaggeredGridCells rows, Modifier modifier, LazyStaggeredGridState state, PaddingValues contentPadding, boolean reverseLayout, Arrangement.Vertical verticalArrangement, float horizontalItemSpacing, FlingBehavior flingBehavior, boolean userScrollEnabled, final Function1 content, Composer $composer, final int $changed, final int i) {
        StaggeredGridCells staggeredGridCells;
        Object obj;
        Object obj2;
        boolean z;
        Object obj3;
        int i2;
        Composer $composer2;
        final FlingBehavior flingBehavior2;
        final LazyStaggeredGridState state2;
        final PaddingValues contentPadding2;
        final boolean reverseLayout2;
        final Arrangement.Vertical verticalArrangement2;
        final Modifier modifier2;
        final float horizontalItemSpacing2;
        final boolean userScrollEnabled2;
        int i3;
        LazyStaggeredGridState state3;
        FlingBehavior flingBehavior3;
        boolean userScrollEnabled3;
        Modifier modifier3;
        LazyStaggeredGridState state4;
        PaddingValues contentPadding3;
        boolean reverseLayout3;
        Arrangement.Vertical verticalArrangement3;
        float horizontalItemSpacing3;
        FlingBehavior flingBehavior4;
        int i4;
        int i5;
        int i6;
        int i7;
        Composer $composer3 = $composer.startRestartGroup(-8666074);
        ComposerKt.sourceInformation($composer3, "C(LazyHorizontalStaggeredGrid)P(6,4,7,1,5,9,3:c#ui.unit.Dp,2,8)247@11080L26,237@10679L460:LazyStaggeredGridDsl.kt#fzvcnm");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
            staggeredGridCells = rows;
        } else if (($changed & 6) == 0) {
            staggeredGridCells = rows;
            $dirty |= $composer3.changed(staggeredGridCells) ? 4 : 2;
        } else {
            staggeredGridCells = rows;
        }
        int i8 = i & 2;
        if (i8 != 0) {
            $dirty |= 48;
        } else if (($changed & 48) == 0) {
            $dirty |= $composer3.changed(modifier) ? 32 : 16;
        }
        if (($changed & 384) == 0) {
            if ((i & 4) == 0) {
                obj = state;
                if ($composer3.changed(obj)) {
                    i7 = 256;
                    $dirty |= i7;
                }
            } else {
                obj = state;
            }
            i7 = 128;
            $dirty |= i7;
        } else {
            obj = state;
        }
        int i9 = i & 8;
        if (i9 != 0) {
            $dirty |= 3072;
            obj2 = contentPadding;
        } else if (($changed & 3072) == 0) {
            obj2 = contentPadding;
            $dirty |= $composer3.changed(obj2) ? 2048 : 1024;
        } else {
            obj2 = contentPadding;
        }
        int i10 = i & 16;
        if (i10 != 0) {
            $dirty |= 24576;
            z = reverseLayout;
        } else if (($changed & 24576) == 0) {
            z = reverseLayout;
            $dirty |= $composer3.changed(z) ? 16384 : 8192;
        } else {
            z = reverseLayout;
        }
        int i11 = i & 32;
        if (i11 != 0) {
            $dirty |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            obj3 = verticalArrangement;
        } else if ((196608 & $changed) == 0) {
            obj3 = verticalArrangement;
            $dirty |= $composer3.changed(obj3) ? 131072 : 65536;
        } else {
            obj3 = verticalArrangement;
        }
        int i12 = i & 64;
        if (i12 != 0) {
            $dirty |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty |= $composer3.changed(horizontalItemSpacing) ? 1048576 : 524288;
        }
        if (($changed & 12582912) == 0) {
            if ((i & 128) == 0 && $composer3.changed(flingBehavior)) {
                i6 = 8388608;
                $dirty |= i6;
            }
            i6 = 4194304;
            $dirty |= i6;
        }
        int i13 = i & 256;
        if (i13 != 0) {
            $dirty |= 100663296;
            i2 = i13;
        } else if (($changed & 100663296) == 0) {
            i2 = i13;
            $dirty |= $composer3.changed(userScrollEnabled) ? 67108864 : 33554432;
        } else {
            i2 = i13;
        }
        if ((i & 512) != 0) {
            $dirty |= 805306368;
        } else if (($changed & 805306368) == 0) {
            $dirty |= $composer3.changedInstance(content) ? PropertyOptions.DELETE_EXISTING : 268435456;
        }
        if ($composer3.shouldExecute(($dirty & 306783379) != 306783378, $dirty & 1)) {
            $composer3.startDefaults();
            ComposerKt.sourceInformation($composer3, "228@10273L32,233@10568L15");
            if (($changed & 1) == 0 || $composer3.getDefaultsInvalid()) {
                Modifier.Companion modifier4 = i8 != 0 ? Modifier.Companion : modifier;
                if ((i & 4) != 0) {
                    i3 = -29360129;
                    state3 = LazyStaggeredGridStateKt.rememberLazyStaggeredGridState(0, 0, $composer3, 0, 3);
                    $dirty &= -897;
                } else {
                    i3 = -29360129;
                    state3 = obj;
                }
                PaddingValues contentPadding4 = i9 != 0 ? PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(0)) : obj2;
                boolean reverseLayout4 = i10 != 0 ? false : z;
                Arrangement.HorizontalOrVertical verticalArrangement4 = i11 != 0 ? Arrangement.INSTANCE.m874spacedBy0680j_4(Dp.m6873constructorimpl(0)) : obj3;
                float horizontalItemSpacing4 = i12 != 0 ? Dp.m6873constructorimpl(0) : horizontalItemSpacing;
                if ((i & 128) != 0) {
                    flingBehavior3 = ScrollableDefaults.INSTANCE.flingBehavior($composer3, 6);
                    $dirty &= i3;
                } else {
                    flingBehavior3 = flingBehavior;
                }
                if (i2 != 0) {
                    modifier3 = modifier4;
                    state4 = state3;
                    contentPadding3 = contentPadding4;
                    reverseLayout3 = reverseLayout4;
                    verticalArrangement3 = verticalArrangement4;
                    horizontalItemSpacing3 = horizontalItemSpacing4;
                    flingBehavior4 = flingBehavior3;
                    userScrollEnabled3 = true;
                    i4 = 0;
                    i5 = -8666074;
                } else {
                    userScrollEnabled3 = userScrollEnabled;
                    modifier3 = modifier4;
                    state4 = state3;
                    contentPadding3 = contentPadding4;
                    reverseLayout3 = reverseLayout4;
                    verticalArrangement3 = verticalArrangement4;
                    horizontalItemSpacing3 = horizontalItemSpacing4;
                    flingBehavior4 = flingBehavior3;
                    i4 = 0;
                    i5 = -8666074;
                }
            } else {
                $composer3.skipToGroupEnd();
                if ((i & 4) != 0) {
                    $dirty &= -897;
                }
                if ((i & 128) != 0) {
                    horizontalItemSpacing3 = horizontalItemSpacing;
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled3 = userScrollEnabled;
                    $dirty &= -29360129;
                    i4 = 0;
                    state4 = obj;
                    contentPadding3 = obj2;
                    reverseLayout3 = z;
                    verticalArrangement3 = obj3;
                    i5 = -8666074;
                    modifier3 = modifier;
                } else {
                    horizontalItemSpacing3 = horizontalItemSpacing;
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled3 = userScrollEnabled;
                    i4 = 0;
                    state4 = obj;
                    contentPadding3 = obj2;
                    reverseLayout3 = z;
                    verticalArrangement3 = obj3;
                    i5 = -8666074;
                    modifier3 = modifier;
                }
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i5, $dirty, -1, "androidx.compose.foundation.lazy.staggeredgrid.LazyHorizontalStaggeredGrid (LazyStaggeredGridDsl.kt:236)");
            }
            $composer2 = $composer3;
            m1193LazyHorizontalStaggeredGrid121YqSk(staggeredGridCells, modifier3, state4, contentPadding3, reverseLayout3, verticalArrangement3, horizontalItemSpacing3, flingBehavior4, userScrollEnabled3, OverscrollKt.rememberOverscrollEffect($composer3, i4), content, $composer2, ($dirty & 14) | ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (458752 & $dirty) | (3670016 & $dirty) | (29360128 & $dirty) | (234881024 & $dirty), ($dirty >> 27) & 14, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier3;
            state2 = state4;
            contentPadding2 = contentPadding3;
            reverseLayout2 = reverseLayout3;
            verticalArrangement2 = verticalArrangement3;
            horizontalItemSpacing2 = horizontalItemSpacing3;
            flingBehavior2 = flingBehavior4;
            userScrollEnabled2 = userScrollEnabled3;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            flingBehavior2 = flingBehavior;
            state2 = obj;
            contentPadding2 = obj2;
            reverseLayout2 = z;
            verticalArrangement2 = obj3;
            modifier2 = modifier;
            horizontalItemSpacing2 = horizontalItemSpacing;
            userScrollEnabled2 = userScrollEnabled;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridDslKt$LazyHorizontalStaggeredGrid$2
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i14) {
                    LazyStaggeredGridDslKt.m1194LazyHorizontalStaggeredGridcJHQLPU(StaggeredGridCells.this, modifier2, state2, contentPadding2, reverseLayout2, verticalArrangement2, horizontalItemSpacing2, flingBehavior2, userScrollEnabled2, content, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    private static final LazyGridStaggeredGridSlotsProvider rememberRowSlots(final StaggeredGridCells rows, final Arrangement.Vertical verticalArrangement, final PaddingValues contentPadding, Composer $composer, int $changed) {
        ComposerKt.sourceInformationMarkerStart($composer, -1532383053, "C(rememberRowSlots)P(1,2)259@11368L987:LazyStaggeredGridDsl.kt#fzvcnm");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-1532383053, $changed, -1, "androidx.compose.foundation.lazy.staggeredgrid.rememberRowSlots (LazyStaggeredGridDsl.kt:259)");
        }
        ComposerKt.sourceInformationMarkerStart($composer, 1011241887, "CC(remember):LazyStaggeredGridDsl.kt#9igjgp");
        boolean invalid$iv = (((($changed & 14) ^ 6) > 4 && $composer.changed(rows)) || ($changed & 6) == 4) | (((($changed & Property.BORDER_BOTTOM_RIGHT_RADIUS) ^ 48) > 32 && $composer.changed(verticalArrangement)) || ($changed & 48) == 32) | (((($changed & 896) ^ 384) > 256 && $composer.changed(contentPadding)) || ($changed & 384) == 256);
        Object it$iv = $composer.rememberedValue();
        if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
            Object value$iv = (LazyGridStaggeredGridSlotsProvider) new LazyStaggeredGridSlotCache(new Function2<Density, Constraints, LazyStaggeredGridSlots>() { // from class: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridDslKt$rememberRowSlots$1$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ LazyStaggeredGridSlots invoke(Density density, Constraints constraints) {
                    return m1198invoke0kLqBqw(density, constraints.m6832unboximpl());
                }

                /* renamed from: invoke-0kLqBqw  reason: not valid java name */
                public final LazyStaggeredGridSlots m1198invoke0kLqBqw(Density $this$$receiver, long constraints) {
                    boolean value$iv2 = Constraints.m6825getMaxHeightimpl(constraints) != Integer.MAX_VALUE;
                    if (!value$iv2) {
                        InlineClassHelperKt.throwIllegalArgumentException("LazyHorizontalStaggeredGrid's height should be bound by parent.");
                    }
                    float arg0$iv = PaddingValues.this.mo945calculateTopPaddingD9Ej5fM();
                    float other$iv = PaddingValues.this.mo942calculateBottomPaddingD9Ej5fM();
                    int gridHeight = Constraints.m6825getMaxHeightimpl(constraints) - $this$$receiver.mo638roundToPx0680j_4(Dp.m6873constructorimpl(arg0$iv + other$iv));
                    StaggeredGridCells $this$invoke_0kLqBqw_u24lambda_u243 = rows;
                    Arrangement.Vertical $this$invoke_0kLqBqw_u24lambda_u243_u24lambda_u242_u24lambda_u241 = verticalArrangement;
                    int[] sizes = $this$invoke_0kLqBqw_u24lambda_u243.calculateCrossAxisCellSizes($this$$receiver, gridHeight, $this$$receiver.mo638roundToPx0680j_4($this$invoke_0kLqBqw_u24lambda_u243_u24lambda_u242_u24lambda_u241.mo880getSpacingD9Ej5fM()));
                    int[] positions = new int[sizes.length];
                    $this$invoke_0kLqBqw_u24lambda_u243_u24lambda_u242_u24lambda_u241.arrange($this$$receiver, gridHeight, sizes, positions);
                    return new LazyStaggeredGridSlots(positions, sizes);
                }
            });
            $composer.updateRememberedValue(value$iv);
            it$iv = value$iv;
        }
        LazyGridStaggeredGridSlotsProvider lazyGridStaggeredGridSlotsProvider = (LazyGridStaggeredGridSlotsProvider) it$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return lazyGridStaggeredGridSlotsProvider;
    }

    public static /* synthetic */ void items$default(LazyStaggeredGridScope $this$items_u24default, List items, Function1 key, Function1 contentType, Function1 span, Function4 itemContent, int i, Object obj) {
        Function1 function1;
        if ((i & 2) != 0) {
            key = null;
        }
        if ((i & 4) != 0) {
            Function1 contentType2 = new Function1() { // from class: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridDslKt$items$1
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Object p1) {
                    return invoke((LazyStaggeredGridDslKt$items$1) p1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final Void invoke(T t) {
                    return null;
                }
            };
            contentType = contentType2;
        }
        if ((i & 8) != 0) {
            span = null;
        }
        int size = items.size();
        LazyStaggeredGridDslKt$items$2$1 lazyStaggeredGridDslKt$items$2$1 = key != null ? new LazyStaggeredGridDslKt$items$2$1(key, items) : null;
        LazyStaggeredGridDslKt$items$3 lazyStaggeredGridDslKt$items$3 = new LazyStaggeredGridDslKt$items$3(contentType, items);
        if (span != null) {
            Function1 it = new LazyStaggeredGridDslKt$items$4$1(span, items);
            function1 = it;
        } else {
            function1 = null;
        }
        $this$items_u24default.items(size, lazyStaggeredGridDslKt$items$2$1, lazyStaggeredGridDslKt$items$3, function1, ComposableLambdaKt.composableLambdaInstance(-886456479, true, new LazyStaggeredGridDslKt$items$5(itemContent, items)));
    }

    public static final <T> void items(LazyStaggeredGridScope $this$items, List<? extends T> list, Function1<? super T, ? extends Object> function1, Function1<? super T, ? extends Object> function12, Function1<? super T, StaggeredGridItemSpan> function13, Function4<? super LazyStaggeredGridItemScope, ? super T, ? super Composer, ? super Integer, Unit> function4) {
        Function1 function14;
        int size = list.size();
        Function1 it = function1 != null ? new LazyStaggeredGridDslKt$items$2$1(function1, list) : null;
        LazyStaggeredGridDslKt$items$3 lazyStaggeredGridDslKt$items$3 = new LazyStaggeredGridDslKt$items$3(function12, list);
        if (function13 == null) {
            function14 = null;
        } else {
            Function1 it2 = new LazyStaggeredGridDslKt$items$4$1(function13, list);
            function14 = it2;
        }
        $this$items.items(size, it, lazyStaggeredGridDslKt$items$3, function14, ComposableLambdaKt.composableLambdaInstance(-886456479, true, new LazyStaggeredGridDslKt$items$5(function4, list)));
    }

    public static /* synthetic */ void itemsIndexed$default(LazyStaggeredGridScope $this$itemsIndexed_u24default, List items, Function2 key, Function2 contentType, Function2 span, Function5 itemContent, int i, Object obj) {
        if ((i & 2) != 0) {
            key = null;
        }
        if ((i & 4) != 0) {
            Function2 contentType2 = new Function2() { // from class: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridDslKt$itemsIndexed$1
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Object invoke(Object p1, Object p2) {
                    return invoke(((Number) p1).intValue(), (int) p2);
                }

                public final Void invoke(int i2, T t) {
                    return null;
                }
            };
            contentType = contentType2;
        }
        if ((i & 8) != 0) {
            span = null;
        }
        $this$itemsIndexed_u24default.items(items.size(), key != null ? new LazyStaggeredGridDslKt$itemsIndexed$2$1(key, items) : null, new LazyStaggeredGridDslKt$itemsIndexed$3(contentType, items), span != null ? new LazyStaggeredGridDslKt$itemsIndexed$4$1(span, items) : null, ComposableLambdaKt.composableLambdaInstance(284833944, true, new LazyStaggeredGridDslKt$itemsIndexed$5(itemContent, items)));
    }

    public static final <T> void itemsIndexed(LazyStaggeredGridScope $this$itemsIndexed, List<? extends T> list, Function2<? super Integer, ? super T, ? extends Object> function2, Function2<? super Integer, ? super T, ? extends Object> function22, Function2<? super Integer, ? super T, StaggeredGridItemSpan> function23, Function5<? super LazyStaggeredGridItemScope, ? super Integer, ? super T, ? super Composer, ? super Integer, Unit> function5) {
        LazyStaggeredGridDslKt$itemsIndexed$4$1 lazyStaggeredGridDslKt$itemsIndexed$4$1;
        int size = list.size();
        LazyStaggeredGridDslKt$itemsIndexed$2$1 lazyStaggeredGridDslKt$itemsIndexed$2$1 = function2 != null ? new LazyStaggeredGridDslKt$itemsIndexed$2$1(function2, list) : null;
        LazyStaggeredGridDslKt$itemsIndexed$3 lazyStaggeredGridDslKt$itemsIndexed$3 = new LazyStaggeredGridDslKt$itemsIndexed$3(function22, list);
        if (function23 == null) {
            lazyStaggeredGridDslKt$itemsIndexed$4$1 = null;
        } else {
            lazyStaggeredGridDslKt$itemsIndexed$4$1 = new LazyStaggeredGridDslKt$itemsIndexed$4$1(function23, list);
        }
        $this$itemsIndexed.items(size, lazyStaggeredGridDslKt$itemsIndexed$2$1, lazyStaggeredGridDslKt$itemsIndexed$3, lazyStaggeredGridDslKt$itemsIndexed$4$1, ComposableLambdaKt.composableLambdaInstance(284833944, true, new LazyStaggeredGridDslKt$itemsIndexed$5(function5, list)));
    }

    public static /* synthetic */ void items$default(LazyStaggeredGridScope $this$items_u24default, Object[] items, Function1 key, Function1 contentType, Function1 span, Function4 itemContent, int i, Object obj) {
        Function1 function1;
        if ((i & 2) != 0) {
            key = null;
        }
        if ((i & 4) != 0) {
            Function1 contentType2 = new Function1() { // from class: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridDslKt$items$6
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Object p1) {
                    return invoke((LazyStaggeredGridDslKt$items$6) p1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final Void invoke(T t) {
                    return null;
                }
            };
            contentType = contentType2;
        }
        if ((i & 8) != 0) {
            span = null;
        }
        int length = items.length;
        LazyStaggeredGridDslKt$items$7$1 lazyStaggeredGridDslKt$items$7$1 = key != null ? new LazyStaggeredGridDslKt$items$7$1(key, items) : null;
        LazyStaggeredGridDslKt$items$8 lazyStaggeredGridDslKt$items$8 = new LazyStaggeredGridDslKt$items$8(contentType, items);
        if (span != null) {
            Function1 it = new LazyStaggeredGridDslKt$items$9$1(span, items);
            function1 = it;
        } else {
            function1 = null;
        }
        $this$items_u24default.items(length, lazyStaggeredGridDslKt$items$7$1, lazyStaggeredGridDslKt$items$8, function1, ComposableLambdaKt.composableLambdaInstance(2101296000, true, new LazyStaggeredGridDslKt$items$10(itemContent, items)));
    }

    public static final <T> void items(LazyStaggeredGridScope $this$items, T[] tArr, Function1<? super T, ? extends Object> function1, Function1<? super T, ? extends Object> function12, Function1<? super T, StaggeredGridItemSpan> function13, Function4<? super LazyStaggeredGridItemScope, ? super T, ? super Composer, ? super Integer, Unit> function4) {
        Function1 function14;
        int length = tArr.length;
        Function1 it = function1 != null ? new LazyStaggeredGridDslKt$items$7$1(function1, tArr) : null;
        LazyStaggeredGridDslKt$items$8 lazyStaggeredGridDslKt$items$8 = new LazyStaggeredGridDslKt$items$8(function12, tArr);
        if (function13 == null) {
            function14 = null;
        } else {
            Function1 it2 = new LazyStaggeredGridDslKt$items$9$1(function13, tArr);
            function14 = it2;
        }
        $this$items.items(length, it, lazyStaggeredGridDslKt$items$8, function14, ComposableLambdaKt.composableLambdaInstance(2101296000, true, new LazyStaggeredGridDslKt$items$10(function4, tArr)));
    }

    public static /* synthetic */ void itemsIndexed$default(LazyStaggeredGridScope $this$itemsIndexed_u24default, Object[] items, Function2 key, Function2 contentType, Function2 span, Function5 itemContent, int i, Object obj) {
        if ((i & 2) != 0) {
            key = null;
        }
        if ((i & 4) != 0) {
            Function2 contentType2 = new Function2() { // from class: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridDslKt$itemsIndexed$6
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Object invoke(Object p1, Object p2) {
                    return invoke(((Number) p1).intValue(), (int) p2);
                }

                public final Void invoke(int i2, T t) {
                    return null;
                }
            };
            contentType = contentType2;
        }
        if ((i & 8) != 0) {
            span = null;
        }
        $this$itemsIndexed_u24default.items(items.length, key != null ? new LazyStaggeredGridDslKt$itemsIndexed$7$1(key, items) : null, new LazyStaggeredGridDslKt$itemsIndexed$8(contentType, items), span != null ? new LazyStaggeredGridDslKt$itemsIndexed$9$1(span, items) : null, ComposableLambdaKt.composableLambdaInstance(-804487775, true, new LazyStaggeredGridDslKt$itemsIndexed$10(itemContent, items)));
    }

    public static final <T> void itemsIndexed(LazyStaggeredGridScope $this$itemsIndexed, T[] tArr, Function2<? super Integer, ? super T, ? extends Object> function2, Function2<? super Integer, ? super T, ? extends Object> function22, Function2<? super Integer, ? super T, StaggeredGridItemSpan> function23, Function5<? super LazyStaggeredGridItemScope, ? super Integer, ? super T, ? super Composer, ? super Integer, Unit> function5) {
        LazyStaggeredGridDslKt$itemsIndexed$9$1 lazyStaggeredGridDslKt$itemsIndexed$9$1;
        int length = tArr.length;
        LazyStaggeredGridDslKt$itemsIndexed$7$1 lazyStaggeredGridDslKt$itemsIndexed$7$1 = function2 != null ? new LazyStaggeredGridDslKt$itemsIndexed$7$1(function2, tArr) : null;
        LazyStaggeredGridDslKt$itemsIndexed$8 lazyStaggeredGridDslKt$itemsIndexed$8 = new LazyStaggeredGridDslKt$itemsIndexed$8(function22, tArr);
        if (function23 == null) {
            lazyStaggeredGridDslKt$itemsIndexed$9$1 = null;
        } else {
            lazyStaggeredGridDslKt$itemsIndexed$9$1 = new LazyStaggeredGridDslKt$itemsIndexed$9$1(function23, tArr);
        }
        $this$itemsIndexed.items(length, lazyStaggeredGridDslKt$itemsIndexed$7$1, lazyStaggeredGridDslKt$itemsIndexed$8, lazyStaggeredGridDslKt$itemsIndexed$9$1, ComposableLambdaKt.composableLambdaInstance(-804487775, true, new LazyStaggeredGridDslKt$itemsIndexed$10(function5, tArr)));
    }
}
