package androidx.compose.foundation.lazy.grid;

import androidx.autofill.HintConstants;
import androidx.compose.foundation.OverscrollEffect;
import androidx.compose.foundation.OverscrollKt;
import androidx.compose.foundation.gestures.FlingBehavior;
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
import java.util.ArrayList;
import java.util.List;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.functions.Function5;
/* compiled from: LazyGridDsl.kt */
@Metadata(d1 = {"\u0000\u009c\u0001\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010 \n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a\u008a\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u000b2\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00142\u0017\u0010\u0015\u001a\u0013\u0012\u0004\u0012\u00020\u0017\u0012\u0004\u0012\u00020\u00010\u0016¢\u0006\u0002\b\u0018H\u0007¢\u0006\u0002\u0010\u0019\u001a~\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u000b2\u0017\u0010\u0015\u001a\u0013\u0012\u0004\u0012\u00020\u0017\u0012\u0004\u0012\u00020\u00010\u0016¢\u0006\u0002\b\u0018H\u0007¢\u0006\u0002\u0010\u001a\u001a\u008a\u0001\u0010\u001b\u001a\u00020\u00012\u0006\u0010\u001c\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u000b2\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00142\u0017\u0010\u0015\u001a\u0013\u0012\u0004\u0012\u00020\u0017\u0012\u0004\u0012\u00020\u00010\u0016¢\u0006\u0002\b\u0018H\u0007¢\u0006\u0002\u0010\u001d\u001a~\u0010\u001b\u001a\u00020\u00012\u0006\u0010\u001c\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u000b2\u0017\u0010\u0015\u001a\u0013\u0012\u0004\u0012\u00020\u0017\u0012\u0004\u0012\u00020\u00010\u0016¢\u0006\u0002\b\u0018H\u0007¢\u0006\u0002\u0010\u001e\u001a&\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020!0 2\u0006\u0010\"\u001a\u00020!2\u0006\u0010#\u001a\u00020!2\u0006\u0010$\u001a\u00020!H\u0002\u001a\u001d\u0010%\u001a\u00020&2\u0006\u0010\u001c\u001a\u00020\u00032\u0006\u0010\f\u001a\u00020\rH\u0003¢\u0006\u0002\u0010'\u001a\u001d\u0010(\u001a\u00020&2\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u000e\u001a\u00020\u000fH\u0003¢\u0006\u0002\u0010)\u001aÛ\u0001\u0010*\u001a\u00020\u0001\"\u0004\b\u0000\u0010+*\u00020\u00172\f\u0010*\u001a\b\u0012\u0004\u0012\u0002H+0,2%\b\n\u0010-\u001a\u001f\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0004\u0012\u000201\u0018\u00010\u001620\b\n\u00102\u001a*\u0012\u0004\u0012\u000204\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0004\u0012\u000205\u0018\u000103¢\u0006\u0002\b\u00182%\b\n\u00106\u001a\u001f\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0006\u0012\u0004\u0018\u0001010\u001623\b\u0004\u00107\u001a-\u0012\u0004\u0012\u000208\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0004\u0012\u00020\u000103¢\u0006\u0002\b9¢\u0006\u0002\b\u0018H\u0086\b¢\u0006\u0002\u0010:\u001aÛ\u0001\u0010*\u001a\u00020\u0001\"\u0004\b\u0000\u0010+*\u00020\u00172\f\u0010*\u001a\b\u0012\u0004\u0012\u0002H+0 2%\b\n\u0010-\u001a\u001f\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0004\u0012\u000201\u0018\u00010\u001620\b\n\u00102\u001a*\u0012\u0004\u0012\u000204\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0004\u0012\u000205\u0018\u000103¢\u0006\u0002\b\u00182%\b\n\u00106\u001a\u001f\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0006\u0012\u0004\u0018\u0001010\u001623\b\u0004\u00107\u001a-\u0012\u0004\u0012\u000208\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0004\u0012\u00020\u000103¢\u0006\u0002\b9¢\u0006\u0002\b\u0018H\u0086\b¢\u0006\u0002\u0010;\u001a¯\u0002\u0010<\u001a\u00020\u0001\"\u0004\b\u0000\u0010+*\u00020\u00172\f\u0010*\u001a\b\u0012\u0004\u0012\u0002H+0,2:\b\n\u0010-\u001a4\u0012\u0013\u0012\u00110!¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(=\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0004\u0012\u000201\u0018\u0001032E\b\n\u00102\u001a?\u0012\u0004\u0012\u000204\u0012\u0013\u0012\u00110!¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(=\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0004\u0012\u000205\u0018\u00010>¢\u0006\u0002\b\u00182:\b\u0006\u00106\u001a4\u0012\u0013\u0012\u00110!¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(=\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0006\u0012\u0004\u0018\u000101032H\b\u0004\u00107\u001aB\u0012\u0004\u0012\u000208\u0012\u0013\u0012\u00110!¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(=\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0004\u0012\u00020\u00010>¢\u0006\u0002\b9¢\u0006\u0002\b\u0018H\u0086\b¢\u0006\u0002\u0010?\u001a¯\u0002\u0010<\u001a\u00020\u0001\"\u0004\b\u0000\u0010+*\u00020\u00172\f\u0010*\u001a\b\u0012\u0004\u0012\u0002H+0 2:\b\n\u0010-\u001a4\u0012\u0013\u0012\u00110!¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(=\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0004\u0012\u000201\u0018\u0001032E\b\n\u00102\u001a?\u0012\u0004\u0012\u000204\u0012\u0013\u0012\u00110!¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(=\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0004\u0012\u000205\u0018\u00010>¢\u0006\u0002\b\u00182:\b\u0006\u00106\u001a4\u0012\u0013\u0012\u00110!¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(=\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0006\u0012\u0004\u0018\u000101032H\b\u0004\u00107\u001aB\u0012\u0004\u0012\u000208\u0012\u0013\u0012\u00110!¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(=\u0012\u0013\u0012\u0011H+¢\u0006\f\b.\u0012\b\b/\u0012\u0004\b\b(0\u0012\u0004\u0012\u00020\u00010>¢\u0006\u0002\b9¢\u0006\u0002\b\u0018H\u0086\b¢\u0006\u0002\u0010@¨\u0006A"}, d2 = {"LazyHorizontalGrid", "", "rows", "Landroidx/compose/foundation/lazy/grid/GridCells;", "modifier", "Landroidx/compose/ui/Modifier;", "state", "Landroidx/compose/foundation/lazy/grid/LazyGridState;", "contentPadding", "Landroidx/compose/foundation/layout/PaddingValues;", "reverseLayout", "", "horizontalArrangement", "Landroidx/compose/foundation/layout/Arrangement$Horizontal;", "verticalArrangement", "Landroidx/compose/foundation/layout/Arrangement$Vertical;", "flingBehavior", "Landroidx/compose/foundation/gestures/FlingBehavior;", "userScrollEnabled", "overscrollEffect", "Landroidx/compose/foundation/OverscrollEffect;", "content", "Lkotlin/Function1;", "Landroidx/compose/foundation/lazy/grid/LazyGridScope;", "Lkotlin/ExtensionFunctionType;", "(Landroidx/compose/foundation/lazy/grid/GridCells;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/lazy/grid/LazyGridState;Landroidx/compose/foundation/layout/PaddingValues;ZLandroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/foundation/gestures/FlingBehavior;ZLandroidx/compose/foundation/OverscrollEffect;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;III)V", "(Landroidx/compose/foundation/lazy/grid/GridCells;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/lazy/grid/LazyGridState;Landroidx/compose/foundation/layout/PaddingValues;ZLandroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/foundation/gestures/FlingBehavior;ZLkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V", "LazyVerticalGrid", "columns", "(Landroidx/compose/foundation/lazy/grid/GridCells;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/lazy/grid/LazyGridState;Landroidx/compose/foundation/layout/PaddingValues;ZLandroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/gestures/FlingBehavior;ZLandroidx/compose/foundation/OverscrollEffect;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;III)V", "(Landroidx/compose/foundation/lazy/grid/GridCells;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/lazy/grid/LazyGridState;Landroidx/compose/foundation/layout/PaddingValues;ZLandroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/gestures/FlingBehavior;ZLkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V", "calculateCellsCrossAxisSizeImpl", "", "", "gridSize", "slotCount", "spacing", "rememberColumnWidthSums", "Landroidx/compose/foundation/lazy/grid/LazyGridSlotsProvider;", "(Landroidx/compose/foundation/lazy/grid/GridCells;Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/runtime/Composer;I)Landroidx/compose/foundation/lazy/grid/LazyGridSlotsProvider;", "rememberRowHeightSums", "(Landroidx/compose/foundation/lazy/grid/GridCells;Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/runtime/Composer;I)Landroidx/compose/foundation/lazy/grid/LazyGridSlotsProvider;", "items", ExifInterface.GPS_DIRECTION_TRUE, "", "key", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "item", "", "span", "Lkotlin/Function2;", "Landroidx/compose/foundation/lazy/grid/LazyGridItemSpanScope;", "Landroidx/compose/foundation/lazy/grid/GridItemSpan;", "contentType", "itemContent", "Landroidx/compose/foundation/lazy/grid/LazyGridItemScope;", "Landroidx/compose/runtime/Composable;", "(Landroidx/compose/foundation/lazy/grid/LazyGridScope;[Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;)V", "(Landroidx/compose/foundation/lazy/grid/LazyGridScope;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;)V", "itemsIndexed", "index", "Lkotlin/Function3;", "(Landroidx/compose/foundation/lazy/grid/LazyGridScope;[Ljava/lang/Object;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function5;)V", "(Landroidx/compose/foundation/lazy/grid/LazyGridScope;Ljava/util/List;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function5;)V", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyGridDslKt {
    public static final void LazyVerticalGrid(final GridCells columns, Modifier modifier, LazyGridState state, PaddingValues contentPadding, boolean reverseLayout, Arrangement.Vertical verticalArrangement, Arrangement.Horizontal horizontalArrangement, FlingBehavior flingBehavior, boolean userScrollEnabled, OverscrollEffect overscrollEffect, final Function1<? super LazyGridScope, Unit> function1, Composer $composer, final int $changed, final int $changed1, final int i) {
        Modifier modifier2;
        Object state2;
        Object contentPadding2;
        boolean reverseLayout2;
        Object verticalArrangement2;
        int i2;
        Composer $composer2;
        final OverscrollEffect overscrollEffect2;
        int $dirty1;
        final Arrangement.Vertical verticalArrangement3;
        final Modifier modifier3;
        final PaddingValues contentPadding3;
        final boolean reverseLayout3;
        final Arrangement.Horizontal horizontalArrangement2;
        final FlingBehavior flingBehavior2;
        int $dirty;
        final LazyGridState state3;
        final boolean userScrollEnabled2;
        Arrangement.Horizontal horizontalArrangement3;
        FlingBehavior flingBehavior3;
        boolean userScrollEnabled3;
        OverscrollEffect overscrollEffect3;
        FlingBehavior flingBehavior4;
        Arrangement.Vertical verticalArrangement4;
        boolean userScrollEnabled4;
        PaddingValues contentPadding4;
        boolean reverseLayout4;
        int i3;
        int i4;
        Modifier modifier4;
        LazyGridState state4;
        int i5;
        int i6;
        int i7;
        int i8;
        Composer $composer3 = $composer.startRestartGroup(-2072102870);
        ComposerKt.sourceInformation($composer3, "C(LazyVerticalGrid)P(!1,5,8,2,7,10,4,3,9,6)81@3848L55,80@3822L510:LazyGridDsl.kt#7791vq");
        int $dirty2 = $changed;
        int $dirty12 = $changed1;
        if ((i & 1) != 0) {
            $dirty2 |= 6;
        } else if (($changed & 6) == 0) {
            $dirty2 |= $composer3.changed(columns) ? 4 : 2;
        }
        int i9 = i & 2;
        if (i9 != 0) {
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
                    i8 = 256;
                    $dirty2 |= i8;
                }
            } else {
                state2 = state;
            }
            i8 = 128;
            $dirty2 |= i8;
        } else {
            state2 = state;
        }
        int i10 = i & 8;
        if (i10 != 0) {
            $dirty2 |= 3072;
            contentPadding2 = contentPadding;
        } else if (($changed & 3072) == 0) {
            contentPadding2 = contentPadding;
            $dirty2 |= $composer3.changed(contentPadding2) ? 2048 : 1024;
        } else {
            contentPadding2 = contentPadding;
        }
        int i11 = i & 16;
        if (i11 != 0) {
            $dirty2 |= 24576;
            reverseLayout2 = reverseLayout;
        } else if (($changed & 24576) == 0) {
            reverseLayout2 = reverseLayout;
            $dirty2 |= $composer3.changed(reverseLayout2) ? 16384 : 8192;
        } else {
            reverseLayout2 = reverseLayout;
        }
        if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            if ((i & 32) == 0) {
                verticalArrangement2 = verticalArrangement;
                if ($composer3.changed(verticalArrangement2)) {
                    i7 = 131072;
                    $dirty2 |= i7;
                }
            } else {
                verticalArrangement2 = verticalArrangement;
            }
            i7 = 65536;
            $dirty2 |= i7;
        } else {
            verticalArrangement2 = verticalArrangement;
        }
        int i12 = i & 64;
        if (i12 != 0) {
            $dirty2 |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty2 |= $composer3.changed(horizontalArrangement) ? 1048576 : 524288;
        }
        if (($changed & 12582912) == 0) {
            if ((i & 128) == 0 && $composer3.changed(flingBehavior)) {
                i6 = 8388608;
                $dirty2 |= i6;
            }
            i6 = 4194304;
            $dirty2 |= i6;
        }
        int i13 = i & 256;
        if (i13 != 0) {
            $dirty2 |= 100663296;
            i2 = i13;
        } else if (($changed & 100663296) == 0) {
            i2 = i13;
            $dirty2 |= $composer3.changed(userScrollEnabled) ? 67108864 : 33554432;
        } else {
            i2 = i13;
        }
        if (($changed & 805306368) == 0) {
            if ((i & 512) == 0 && $composer3.changed(overscrollEffect)) {
                i5 = PropertyOptions.DELETE_EXISTING;
                $dirty2 |= i5;
            }
            i5 = 268435456;
            $dirty2 |= i5;
        }
        if ((i & 1024) != 0) {
            $dirty12 |= 6;
        } else if (($changed1 & 6) == 0) {
            $dirty12 |= $composer3.changedInstance(function1) ? 4 : 2;
        }
        if ($composer3.shouldExecute((($dirty2 & 306783379) == 306783378 && ($dirty12 & 3) == 2) ? false : true, $dirty2 & 1)) {
            $composer3.startDefaults();
            ComposerKt.sourceInformation($composer3, "69@3290L23,75@3650L15,77@3748L26");
            if (($changed & 1) != 0 && !$composer3.getDefaultsInvalid()) {
                $composer3.skipToGroupEnd();
                if ((i & 4) != 0) {
                    $dirty2 &= -897;
                }
                if ((i & 32) != 0) {
                    $dirty2 &= -458753;
                }
                if ((i & 128) != 0) {
                    $dirty2 &= -29360129;
                }
                if ((i & 512) != 0) {
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled4 = userScrollEnabled;
                    overscrollEffect3 = overscrollEffect;
                    $dirty2 = (-1879048193) & $dirty2;
                    verticalArrangement4 = verticalArrangement2;
                    contentPadding4 = contentPadding2;
                    reverseLayout4 = reverseLayout2;
                    i3 = 196608;
                    i4 = -2072102870;
                    horizontalArrangement3 = horizontalArrangement;
                    modifier4 = modifier2;
                    state4 = state2;
                } else {
                    horizontalArrangement3 = horizontalArrangement;
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled4 = userScrollEnabled;
                    overscrollEffect3 = overscrollEffect;
                    verticalArrangement4 = verticalArrangement2;
                    contentPadding4 = contentPadding2;
                    reverseLayout4 = reverseLayout2;
                    i3 = 196608;
                    i4 = -2072102870;
                    modifier4 = modifier2;
                    state4 = state2;
                }
            } else {
                if (i9 != 0) {
                    modifier2 = Modifier.Companion;
                }
                if ((i & 4) != 0) {
                    $dirty2 &= -897;
                    state2 = LazyGridStateKt.rememberLazyGridState(0, 0, $composer3, 0, 3);
                }
                if (i10 != 0) {
                    contentPadding2 = PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(0));
                }
                if (i11 != 0) {
                    reverseLayout2 = false;
                }
                if ((i & 32) != 0) {
                    Arrangement arrangement = Arrangement.INSTANCE;
                    $dirty2 &= -458753;
                    verticalArrangement2 = !reverseLayout2 ? arrangement.getTop() : arrangement.getBottom();
                }
                if (i12 == 0) {
                    horizontalArrangement3 = horizontalArrangement;
                } else {
                    horizontalArrangement3 = Arrangement.INSTANCE.getStart();
                }
                if ((i & 128) == 0) {
                    flingBehavior3 = flingBehavior;
                } else {
                    flingBehavior3 = ScrollableDefaults.INSTANCE.flingBehavior($composer3, 6);
                    $dirty2 &= -29360129;
                }
                if (i2 == 0) {
                    userScrollEnabled3 = userScrollEnabled;
                } else {
                    userScrollEnabled3 = true;
                }
                if ((i & 512) == 0) {
                    overscrollEffect3 = overscrollEffect;
                    flingBehavior4 = flingBehavior3;
                    verticalArrangement4 = verticalArrangement2;
                    userScrollEnabled4 = userScrollEnabled3;
                    contentPadding4 = contentPadding2;
                    reverseLayout4 = reverseLayout2;
                    i3 = 196608;
                    i4 = -2072102870;
                    modifier4 = modifier2;
                    state4 = state2;
                } else {
                    $dirty2 &= -1879048193;
                    flingBehavior4 = flingBehavior3;
                    overscrollEffect3 = OverscrollKt.rememberOverscrollEffect($composer3, 0);
                    verticalArrangement4 = verticalArrangement2;
                    userScrollEnabled4 = userScrollEnabled3;
                    contentPadding4 = contentPadding2;
                    reverseLayout4 = reverseLayout2;
                    i3 = 196608;
                    i4 = -2072102870;
                    modifier4 = modifier2;
                    state4 = state2;
                }
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i4, $dirty2, $dirty12, "androidx.compose.foundation.lazy.grid.LazyVerticalGrid (LazyGridDsl.kt:79)");
            }
            Arrangement.Horizontal horizontalArrangement4 = horizontalArrangement3;
            $composer2 = $composer3;
            LazyGridKt.LazyGrid(modifier4, state4, rememberColumnWidthSums(columns, horizontalArrangement3, $composer3, ($dirty2 & 14) | (($dirty2 >> 15) & Property.BORDER_BOTTOM_RIGHT_RADIUS)), contentPadding4, reverseLayout4, true, flingBehavior4, userScrollEnabled4, overscrollEffect3, verticalArrangement4, horizontalArrangement4, function1, $composer2, i3 | (($dirty2 >> 3) & 14) | (($dirty2 >> 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty2 & 7168) | (57344 & $dirty2) | (($dirty2 >> 3) & 3670016) | (($dirty2 >> 3) & 29360128) | (($dirty2 >> 3) & 234881024) | (($dirty2 << 12) & 1879048192), (($dirty2 >> 18) & 14) | (($dirty12 << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS), 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            $dirty1 = $dirty12;
            modifier3 = modifier4;
            contentPadding3 = contentPadding4;
            reverseLayout3 = reverseLayout4;
            flingBehavior2 = flingBehavior4;
            userScrollEnabled2 = userScrollEnabled4;
            overscrollEffect2 = overscrollEffect3;
            verticalArrangement3 = verticalArrangement4;
            horizontalArrangement2 = horizontalArrangement4;
            $dirty = $dirty2;
            state3 = state4;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            overscrollEffect2 = overscrollEffect;
            $dirty1 = $dirty12;
            verticalArrangement3 = verticalArrangement2;
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
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.lazy.grid.LazyGridDslKt$LazyVerticalGrid$1
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
                    LazyGridDslKt.LazyVerticalGrid(GridCells.this, modifier3, state3, contentPadding3, reverseLayout3, verticalArrangement3, horizontalArrangement2, flingBehavior2, userScrollEnabled2, overscrollEffect2, function1, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Use the non deprecated overload")
    public static final /* synthetic */ void LazyVerticalGrid(final GridCells columns, Modifier modifier, LazyGridState state, PaddingValues contentPadding, boolean reverseLayout, Arrangement.Vertical verticalArrangement, Arrangement.Horizontal horizontalArrangement, FlingBehavior flingBehavior, boolean userScrollEnabled, final Function1 content, Composer $composer, final int $changed, final int i) {
        GridCells gridCells;
        Object obj;
        Object obj2;
        boolean z;
        Object obj3;
        Object obj4;
        int i2;
        Composer $composer2;
        final FlingBehavior flingBehavior2;
        final LazyGridState state2;
        final PaddingValues contentPadding2;
        final boolean reverseLayout2;
        final Arrangement.Vertical verticalArrangement2;
        final Arrangement.Horizontal horizontalArrangement2;
        final Modifier modifier2;
        final boolean userScrollEnabled2;
        int i3;
        LazyGridState state3;
        Arrangement.Vertical verticalArrangement3;
        FlingBehavior flingBehavior3;
        boolean userScrollEnabled3;
        Modifier modifier3;
        LazyGridState state4;
        PaddingValues contentPadding3;
        boolean reverseLayout3;
        Arrangement.Vertical verticalArrangement4;
        Arrangement.Horizontal horizontalArrangement3;
        FlingBehavior flingBehavior4;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        Composer $composer3 = $composer.startRestartGroup(1485410512);
        ComposerKt.sourceInformation($composer3, "C(LazyVerticalGrid)P(!1,5,7,2,6,9,4,3,8)121@5394L26,111@4998L455:LazyGridDsl.kt#7791vq");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
            gridCells = columns;
        } else if (($changed & 6) == 0) {
            gridCells = columns;
            $dirty |= $composer3.changed(gridCells) ? 4 : 2;
        } else {
            gridCells = columns;
        }
        int i9 = i & 2;
        if (i9 != 0) {
            $dirty |= 48;
        } else if (($changed & 48) == 0) {
            $dirty |= $composer3.changed(modifier) ? 32 : 16;
        }
        if (($changed & 384) == 0) {
            if ((i & 4) == 0) {
                obj = state;
                if ($composer3.changed(obj)) {
                    i8 = 256;
                    $dirty |= i8;
                }
            } else {
                obj = state;
            }
            i8 = 128;
            $dirty |= i8;
        } else {
            obj = state;
        }
        int i10 = i & 8;
        if (i10 != 0) {
            $dirty |= 3072;
            obj2 = contentPadding;
        } else if (($changed & 3072) == 0) {
            obj2 = contentPadding;
            $dirty |= $composer3.changed(obj2) ? 2048 : 1024;
        } else {
            obj2 = contentPadding;
        }
        int i11 = i & 16;
        if (i11 != 0) {
            $dirty |= 24576;
            z = reverseLayout;
        } else if (($changed & 24576) == 0) {
            z = reverseLayout;
            $dirty |= $composer3.changed(z) ? 16384 : 8192;
        } else {
            z = reverseLayout;
        }
        if ((196608 & $changed) == 0) {
            if ((i & 32) == 0) {
                obj3 = verticalArrangement;
                if ($composer3.changed(obj3)) {
                    i7 = 131072;
                    $dirty |= i7;
                }
            } else {
                obj3 = verticalArrangement;
            }
            i7 = 65536;
            $dirty |= i7;
        } else {
            obj3 = verticalArrangement;
        }
        int i12 = i & 64;
        if (i12 != 0) {
            $dirty |= 1572864;
            obj4 = horizontalArrangement;
        } else if ((1572864 & $changed) == 0) {
            obj4 = horizontalArrangement;
            $dirty |= $composer3.changed(obj4) ? 1048576 : 524288;
        } else {
            obj4 = horizontalArrangement;
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
            ComposerKt.sourceInformation($composer3, "101@4536L23,107@4896L15");
            if (($changed & 1) == 0 || $composer3.getDefaultsInvalid()) {
                Modifier.Companion modifier4 = i9 != 0 ? Modifier.Companion : modifier;
                if ((i & 4) != 0) {
                    i3 = -29360129;
                    state3 = LazyGridStateKt.rememberLazyGridState(0, 0, $composer3, 0, 3);
                    $dirty &= -897;
                } else {
                    i3 = -29360129;
                    state3 = obj;
                }
                PaddingValues contentPadding4 = i10 != 0 ? PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(0)) : obj2;
                boolean reverseLayout4 = i11 != 0 ? false : z;
                if ((i & 32) != 0) {
                    Arrangement arrangement = Arrangement.INSTANCE;
                    verticalArrangement3 = !reverseLayout4 ? arrangement.getTop() : arrangement.getBottom();
                    $dirty &= -458753;
                } else {
                    verticalArrangement3 = obj3;
                }
                Arrangement.Horizontal horizontalArrangement4 = i12 != 0 ? Arrangement.INSTANCE.getStart() : obj4;
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
                    verticalArrangement4 = verticalArrangement3;
                    horizontalArrangement3 = horizontalArrangement4;
                    flingBehavior4 = flingBehavior3;
                    userScrollEnabled3 = true;
                    i4 = 0;
                    i5 = 1485410512;
                } else {
                    userScrollEnabled3 = userScrollEnabled;
                    modifier3 = modifier4;
                    state4 = state3;
                    contentPadding3 = contentPadding4;
                    reverseLayout3 = reverseLayout4;
                    verticalArrangement4 = verticalArrangement3;
                    horizontalArrangement3 = horizontalArrangement4;
                    flingBehavior4 = flingBehavior3;
                    i4 = 0;
                    i5 = 1485410512;
                }
            } else {
                $composer3.skipToGroupEnd();
                if ((i & 4) != 0) {
                    $dirty &= -897;
                }
                if ((i & 32) != 0) {
                    $dirty &= -458753;
                }
                if ((i & 128) != 0) {
                    modifier3 = modifier;
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled3 = userScrollEnabled;
                    $dirty &= -29360129;
                    i4 = 0;
                    contentPadding3 = obj2;
                    reverseLayout3 = z;
                    verticalArrangement4 = obj3;
                    horizontalArrangement3 = obj4;
                    i5 = 1485410512;
                    state4 = obj;
                } else {
                    modifier3 = modifier;
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled3 = userScrollEnabled;
                    i4 = 0;
                    contentPadding3 = obj2;
                    reverseLayout3 = z;
                    verticalArrangement4 = obj3;
                    horizontalArrangement3 = obj4;
                    i5 = 1485410512;
                    state4 = obj;
                }
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i5, $dirty, -1, "androidx.compose.foundation.lazy.grid.LazyVerticalGrid (LazyGridDsl.kt:110)");
            }
            $composer2 = $composer3;
            LazyVerticalGrid(gridCells, modifier3, state4, contentPadding3, reverseLayout3, verticalArrangement4, horizontalArrangement3, flingBehavior4, userScrollEnabled3, OverscrollKt.rememberOverscrollEffect($composer3, i4), content, $composer2, ($dirty & 14) | ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (458752 & $dirty) | (3670016 & $dirty) | (29360128 & $dirty) | (234881024 & $dirty), ($dirty >> 27) & 14, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier3;
            state2 = state4;
            contentPadding2 = contentPadding3;
            reverseLayout2 = reverseLayout3;
            verticalArrangement2 = verticalArrangement4;
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
            verticalArrangement2 = obj3;
            horizontalArrangement2 = obj4;
            modifier2 = modifier;
            userScrollEnabled2 = userScrollEnabled;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.lazy.grid.LazyGridDslKt$LazyVerticalGrid$2
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
                    LazyGridDslKt.LazyVerticalGrid(GridCells.this, modifier2, state2, contentPadding2, reverseLayout2, verticalArrangement2, horizontalArrangement2, flingBehavior2, userScrollEnabled2, content, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    public static final void LazyHorizontalGrid(final GridCells rows, Modifier modifier, LazyGridState state, PaddingValues contentPadding, boolean reverseLayout, Arrangement.Horizontal horizontalArrangement, Arrangement.Vertical verticalArrangement, FlingBehavior flingBehavior, boolean userScrollEnabled, OverscrollEffect overscrollEffect, final Function1<? super LazyGridScope, Unit> function1, Composer $composer, final int $changed, final int $changed1, final int i) {
        Modifier modifier2;
        Object state2;
        Object contentPadding2;
        boolean reverseLayout2;
        Object horizontalArrangement2;
        int i2;
        Composer $composer2;
        final OverscrollEffect overscrollEffect2;
        int $dirty1;
        final Arrangement.Horizontal horizontalArrangement3;
        final Modifier modifier3;
        final PaddingValues contentPadding3;
        final boolean reverseLayout3;
        final Arrangement.Vertical verticalArrangement2;
        final FlingBehavior flingBehavior2;
        int $dirty;
        final LazyGridState state3;
        final boolean userScrollEnabled2;
        Arrangement.Vertical verticalArrangement3;
        FlingBehavior flingBehavior3;
        boolean userScrollEnabled3;
        OverscrollEffect overscrollEffect3;
        FlingBehavior flingBehavior4;
        Arrangement.Horizontal horizontalArrangement4;
        boolean userScrollEnabled4;
        PaddingValues contentPadding4;
        boolean reverseLayout4;
        int i3;
        int i4;
        Modifier modifier4;
        LazyGridState state4;
        int i5;
        int i6;
        int i7;
        int i8;
        Composer $composer3 = $composer.startRestartGroup(635941664);
        ComposerKt.sourceInformation($composer3, "C(LazyHorizontalGrid)P(7,4,8,1,6,3,10,2,9,5)170@7819L48,169@7793L504:LazyGridDsl.kt#7791vq");
        int $dirty2 = $changed;
        int $dirty12 = $changed1;
        if ((i & 1) != 0) {
            $dirty2 |= 6;
        } else if (($changed & 6) == 0) {
            $dirty2 |= $composer3.changed(rows) ? 4 : 2;
        }
        int i9 = i & 2;
        if (i9 != 0) {
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
                    i8 = 256;
                    $dirty2 |= i8;
                }
            } else {
                state2 = state;
            }
            i8 = 128;
            $dirty2 |= i8;
        } else {
            state2 = state;
        }
        int i10 = i & 8;
        if (i10 != 0) {
            $dirty2 |= 3072;
            contentPadding2 = contentPadding;
        } else if (($changed & 3072) == 0) {
            contentPadding2 = contentPadding;
            $dirty2 |= $composer3.changed(contentPadding2) ? 2048 : 1024;
        } else {
            contentPadding2 = contentPadding;
        }
        int i11 = i & 16;
        if (i11 != 0) {
            $dirty2 |= 24576;
            reverseLayout2 = reverseLayout;
        } else if (($changed & 24576) == 0) {
            reverseLayout2 = reverseLayout;
            $dirty2 |= $composer3.changed(reverseLayout2) ? 16384 : 8192;
        } else {
            reverseLayout2 = reverseLayout;
        }
        if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            if ((i & 32) == 0) {
                horizontalArrangement2 = horizontalArrangement;
                if ($composer3.changed(horizontalArrangement2)) {
                    i7 = 131072;
                    $dirty2 |= i7;
                }
            } else {
                horizontalArrangement2 = horizontalArrangement;
            }
            i7 = 65536;
            $dirty2 |= i7;
        } else {
            horizontalArrangement2 = horizontalArrangement;
        }
        int i12 = i & 64;
        if (i12 != 0) {
            $dirty2 |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty2 |= $composer3.changed(verticalArrangement) ? 1048576 : 524288;
        }
        if (($changed & 12582912) == 0) {
            if ((i & 128) == 0 && $composer3.changed(flingBehavior)) {
                i6 = 8388608;
                $dirty2 |= i6;
            }
            i6 = 4194304;
            $dirty2 |= i6;
        }
        int i13 = i & 256;
        if (i13 != 0) {
            $dirty2 |= 100663296;
            i2 = i13;
        } else if (($changed & 100663296) == 0) {
            i2 = i13;
            $dirty2 |= $composer3.changed(userScrollEnabled) ? 67108864 : 33554432;
        } else {
            i2 = i13;
        }
        if (($changed & 805306368) == 0) {
            if ((i & 512) == 0 && $composer3.changed(overscrollEffect)) {
                i5 = PropertyOptions.DELETE_EXISTING;
                $dirty2 |= i5;
            }
            i5 = 268435456;
            $dirty2 |= i5;
        }
        if ((i & 1024) != 0) {
            $dirty12 |= 6;
        } else if (($changed1 & 6) == 0) {
            $dirty12 |= $composer3.changedInstance(function1) ? 4 : 2;
        }
        if ($composer3.shouldExecute((($dirty2 & 306783379) == 306783378 && ($dirty12 & 3) == 2) ? false : true, $dirty2 & 1)) {
            $composer3.startDefaults();
            ComposerKt.sourceInformation($composer3, "158@7264L23,164@7621L15,166@7719L26");
            if (($changed & 1) != 0 && !$composer3.getDefaultsInvalid()) {
                $composer3.skipToGroupEnd();
                if ((i & 4) != 0) {
                    $dirty2 &= -897;
                }
                if ((i & 32) != 0) {
                    $dirty2 &= -458753;
                }
                if ((i & 128) != 0) {
                    $dirty2 &= -29360129;
                }
                if ((i & 512) != 0) {
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled4 = userScrollEnabled;
                    overscrollEffect3 = overscrollEffect;
                    $dirty2 = (-1879048193) & $dirty2;
                    horizontalArrangement4 = horizontalArrangement2;
                    contentPadding4 = contentPadding2;
                    reverseLayout4 = reverseLayout2;
                    i3 = 196608;
                    i4 = 635941664;
                    verticalArrangement3 = verticalArrangement;
                    modifier4 = modifier2;
                    state4 = state2;
                } else {
                    verticalArrangement3 = verticalArrangement;
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled4 = userScrollEnabled;
                    overscrollEffect3 = overscrollEffect;
                    horizontalArrangement4 = horizontalArrangement2;
                    contentPadding4 = contentPadding2;
                    reverseLayout4 = reverseLayout2;
                    i3 = 196608;
                    i4 = 635941664;
                    modifier4 = modifier2;
                    state4 = state2;
                }
            } else {
                if (i9 != 0) {
                    modifier2 = Modifier.Companion;
                }
                if ((i & 4) != 0) {
                    $dirty2 &= -897;
                    state2 = LazyGridStateKt.rememberLazyGridState(0, 0, $composer3, 0, 3);
                }
                if (i10 != 0) {
                    contentPadding2 = PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(0));
                }
                if (i11 != 0) {
                    reverseLayout2 = false;
                }
                if ((i & 32) != 0) {
                    Arrangement arrangement = Arrangement.INSTANCE;
                    $dirty2 &= -458753;
                    horizontalArrangement2 = !reverseLayout2 ? arrangement.getStart() : arrangement.getEnd();
                }
                if (i12 == 0) {
                    verticalArrangement3 = verticalArrangement;
                } else {
                    verticalArrangement3 = Arrangement.INSTANCE.getTop();
                }
                if ((i & 128) == 0) {
                    flingBehavior3 = flingBehavior;
                } else {
                    flingBehavior3 = ScrollableDefaults.INSTANCE.flingBehavior($composer3, 6);
                    $dirty2 &= -29360129;
                }
                if (i2 == 0) {
                    userScrollEnabled3 = userScrollEnabled;
                } else {
                    userScrollEnabled3 = true;
                }
                if ((i & 512) == 0) {
                    overscrollEffect3 = overscrollEffect;
                    flingBehavior4 = flingBehavior3;
                    horizontalArrangement4 = horizontalArrangement2;
                    userScrollEnabled4 = userScrollEnabled3;
                    contentPadding4 = contentPadding2;
                    reverseLayout4 = reverseLayout2;
                    i3 = 196608;
                    i4 = 635941664;
                    modifier4 = modifier2;
                    state4 = state2;
                } else {
                    $dirty2 &= -1879048193;
                    flingBehavior4 = flingBehavior3;
                    overscrollEffect3 = OverscrollKt.rememberOverscrollEffect($composer3, 0);
                    horizontalArrangement4 = horizontalArrangement2;
                    userScrollEnabled4 = userScrollEnabled3;
                    contentPadding4 = contentPadding2;
                    reverseLayout4 = reverseLayout2;
                    i3 = 196608;
                    i4 = 635941664;
                    modifier4 = modifier2;
                    state4 = state2;
                }
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i4, $dirty2, $dirty12, "androidx.compose.foundation.lazy.grid.LazyHorizontalGrid (LazyGridDsl.kt:168)");
            }
            Arrangement.Vertical verticalArrangement4 = verticalArrangement3;
            $composer2 = $composer3;
            LazyGridKt.LazyGrid(modifier4, state4, rememberRowHeightSums(rows, verticalArrangement3, $composer3, ($dirty2 & 14) | (($dirty2 >> 15) & Property.BORDER_BOTTOM_RIGHT_RADIUS)), contentPadding4, reverseLayout4, false, flingBehavior4, userScrollEnabled4, overscrollEffect3, verticalArrangement4, horizontalArrangement4, function1, $composer2, i3 | (($dirty2 >> 3) & 14) | (($dirty2 >> 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty2 & 7168) | (57344 & $dirty2) | (($dirty2 >> 3) & 3670016) | (($dirty2 >> 3) & 29360128) | (($dirty2 >> 3) & 234881024) | (($dirty2 << 9) & 1879048192), (($dirty2 >> 15) & 14) | (($dirty12 << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS), 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            $dirty1 = $dirty12;
            modifier3 = modifier4;
            contentPadding3 = contentPadding4;
            reverseLayout3 = reverseLayout4;
            flingBehavior2 = flingBehavior4;
            userScrollEnabled2 = userScrollEnabled4;
            overscrollEffect2 = overscrollEffect3;
            verticalArrangement2 = verticalArrangement4;
            horizontalArrangement3 = horizontalArrangement4;
            $dirty = $dirty2;
            state3 = state4;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            overscrollEffect2 = overscrollEffect;
            $dirty1 = $dirty12;
            horizontalArrangement3 = horizontalArrangement2;
            modifier3 = modifier2;
            contentPadding3 = contentPadding2;
            reverseLayout3 = reverseLayout2;
            verticalArrangement2 = verticalArrangement;
            flingBehavior2 = flingBehavior;
            $dirty = $dirty2;
            state3 = state2;
            userScrollEnabled2 = userScrollEnabled;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.lazy.grid.LazyGridDslKt$LazyHorizontalGrid$1
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
                    LazyGridDslKt.LazyHorizontalGrid(GridCells.this, modifier3, state3, contentPadding3, reverseLayout3, horizontalArrangement3, verticalArrangement2, flingBehavior2, userScrollEnabled2, overscrollEffect2, function1, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Use the non deprecated overload")
    public static final /* synthetic */ void LazyHorizontalGrid(final GridCells rows, Modifier modifier, LazyGridState state, PaddingValues contentPadding, boolean reverseLayout, Arrangement.Horizontal horizontalArrangement, Arrangement.Vertical verticalArrangement, FlingBehavior flingBehavior, boolean userScrollEnabled, final Function1 content, Composer $composer, final int $changed, final int i) {
        GridCells gridCells;
        Object obj;
        Object obj2;
        boolean z;
        Object obj3;
        Object obj4;
        int i2;
        Composer $composer2;
        final FlingBehavior flingBehavior2;
        final LazyGridState state2;
        final PaddingValues contentPadding2;
        final boolean reverseLayout2;
        final Arrangement.Horizontal horizontalArrangement2;
        final Arrangement.Vertical verticalArrangement2;
        final Modifier modifier2;
        final boolean userScrollEnabled2;
        int i3;
        LazyGridState state3;
        Arrangement.Horizontal horizontalArrangement3;
        FlingBehavior flingBehavior3;
        boolean userScrollEnabled3;
        Modifier modifier3;
        LazyGridState state4;
        PaddingValues contentPadding3;
        boolean reverseLayout3;
        Arrangement.Horizontal horizontalArrangement4;
        Arrangement.Vertical verticalArrangement3;
        FlingBehavior flingBehavior4;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        Composer $composer3 = $composer.startRestartGroup(2123608858);
        ComposerKt.sourceInformation($composer3, "C(LazyHorizontalGrid)P(6,4,7,1,5,3,9,2,8)210@9351L26,200@8959L451:LazyGridDsl.kt#7791vq");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
            gridCells = rows;
        } else if (($changed & 6) == 0) {
            gridCells = rows;
            $dirty |= $composer3.changed(gridCells) ? 4 : 2;
        } else {
            gridCells = rows;
        }
        int i9 = i & 2;
        if (i9 != 0) {
            $dirty |= 48;
        } else if (($changed & 48) == 0) {
            $dirty |= $composer3.changed(modifier) ? 32 : 16;
        }
        if (($changed & 384) == 0) {
            if ((i & 4) == 0) {
                obj = state;
                if ($composer3.changed(obj)) {
                    i8 = 256;
                    $dirty |= i8;
                }
            } else {
                obj = state;
            }
            i8 = 128;
            $dirty |= i8;
        } else {
            obj = state;
        }
        int i10 = i & 8;
        if (i10 != 0) {
            $dirty |= 3072;
            obj2 = contentPadding;
        } else if (($changed & 3072) == 0) {
            obj2 = contentPadding;
            $dirty |= $composer3.changed(obj2) ? 2048 : 1024;
        } else {
            obj2 = contentPadding;
        }
        int i11 = i & 16;
        if (i11 != 0) {
            $dirty |= 24576;
            z = reverseLayout;
        } else if (($changed & 24576) == 0) {
            z = reverseLayout;
            $dirty |= $composer3.changed(z) ? 16384 : 8192;
        } else {
            z = reverseLayout;
        }
        if ((196608 & $changed) == 0) {
            if ((i & 32) == 0) {
                obj3 = horizontalArrangement;
                if ($composer3.changed(obj3)) {
                    i7 = 131072;
                    $dirty |= i7;
                }
            } else {
                obj3 = horizontalArrangement;
            }
            i7 = 65536;
            $dirty |= i7;
        } else {
            obj3 = horizontalArrangement;
        }
        int i12 = i & 64;
        if (i12 != 0) {
            $dirty |= 1572864;
            obj4 = verticalArrangement;
        } else if ((1572864 & $changed) == 0) {
            obj4 = verticalArrangement;
            $dirty |= $composer3.changed(obj4) ? 1048576 : 524288;
        } else {
            obj4 = verticalArrangement;
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
            ComposerKt.sourceInformation($composer3, "190@8500L23,196@8857L15");
            if (($changed & 1) == 0 || $composer3.getDefaultsInvalid()) {
                Modifier.Companion modifier4 = i9 != 0 ? Modifier.Companion : modifier;
                if ((i & 4) != 0) {
                    i3 = -29360129;
                    state3 = LazyGridStateKt.rememberLazyGridState(0, 0, $composer3, 0, 3);
                    $dirty &= -897;
                } else {
                    i3 = -29360129;
                    state3 = obj;
                }
                PaddingValues contentPadding4 = i10 != 0 ? PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(0)) : obj2;
                boolean reverseLayout4 = i11 != 0 ? false : z;
                if ((i & 32) != 0) {
                    Arrangement arrangement = Arrangement.INSTANCE;
                    horizontalArrangement3 = !reverseLayout4 ? arrangement.getStart() : arrangement.getEnd();
                    $dirty &= -458753;
                } else {
                    horizontalArrangement3 = obj3;
                }
                Arrangement.Vertical verticalArrangement4 = i12 != 0 ? Arrangement.INSTANCE.getTop() : obj4;
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
                    horizontalArrangement4 = horizontalArrangement3;
                    verticalArrangement3 = verticalArrangement4;
                    flingBehavior4 = flingBehavior3;
                    userScrollEnabled3 = true;
                    i4 = 0;
                    i5 = 2123608858;
                } else {
                    userScrollEnabled3 = userScrollEnabled;
                    modifier3 = modifier4;
                    state4 = state3;
                    contentPadding3 = contentPadding4;
                    reverseLayout3 = reverseLayout4;
                    horizontalArrangement4 = horizontalArrangement3;
                    verticalArrangement3 = verticalArrangement4;
                    flingBehavior4 = flingBehavior3;
                    i4 = 0;
                    i5 = 2123608858;
                }
            } else {
                $composer3.skipToGroupEnd();
                if ((i & 4) != 0) {
                    $dirty &= -897;
                }
                if ((i & 32) != 0) {
                    $dirty &= -458753;
                }
                if ((i & 128) != 0) {
                    modifier3 = modifier;
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled3 = userScrollEnabled;
                    $dirty &= -29360129;
                    i4 = 0;
                    contentPadding3 = obj2;
                    reverseLayout3 = z;
                    horizontalArrangement4 = obj3;
                    verticalArrangement3 = obj4;
                    i5 = 2123608858;
                    state4 = obj;
                } else {
                    modifier3 = modifier;
                    flingBehavior4 = flingBehavior;
                    userScrollEnabled3 = userScrollEnabled;
                    i4 = 0;
                    contentPadding3 = obj2;
                    reverseLayout3 = z;
                    horizontalArrangement4 = obj3;
                    verticalArrangement3 = obj4;
                    i5 = 2123608858;
                    state4 = obj;
                }
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i5, $dirty, -1, "androidx.compose.foundation.lazy.grid.LazyHorizontalGrid (LazyGridDsl.kt:199)");
            }
            $composer2 = $composer3;
            LazyHorizontalGrid(gridCells, modifier3, state4, contentPadding3, reverseLayout3, horizontalArrangement4, verticalArrangement3, flingBehavior4, userScrollEnabled3, OverscrollKt.rememberOverscrollEffect($composer3, i4), content, $composer2, ($dirty & 14) | ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (458752 & $dirty) | (3670016 & $dirty) | (29360128 & $dirty) | (234881024 & $dirty), ($dirty >> 27) & 14, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier3;
            state2 = state4;
            contentPadding2 = contentPadding3;
            reverseLayout2 = reverseLayout3;
            horizontalArrangement2 = horizontalArrangement4;
            verticalArrangement2 = verticalArrangement3;
            flingBehavior2 = flingBehavior4;
            userScrollEnabled2 = userScrollEnabled3;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            flingBehavior2 = flingBehavior;
            state2 = obj;
            contentPadding2 = obj2;
            reverseLayout2 = z;
            horizontalArrangement2 = obj3;
            verticalArrangement2 = obj4;
            modifier2 = modifier;
            userScrollEnabled2 = userScrollEnabled;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.lazy.grid.LazyGridDslKt$LazyHorizontalGrid$2
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
                    LazyGridDslKt.LazyHorizontalGrid(GridCells.this, modifier2, state2, contentPadding2, reverseLayout2, horizontalArrangement2, verticalArrangement2, flingBehavior2, userScrollEnabled2, content, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    private static final LazyGridSlotsProvider rememberColumnWidthSums(final GridCells columns, final Arrangement.Horizontal horizontalArrangement, Composer $composer, int $changed) {
        ComposerKt.sourceInformationMarkerStart($composer, -76500289, "C(rememberColumnWidthSums)221@9590L872:LazyGridDsl.kt#7791vq");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-76500289, $changed, -1, "androidx.compose.foundation.lazy.grid.rememberColumnWidthSums (LazyGridDsl.kt:221)");
        }
        ComposerKt.sourceInformationMarkerStart($composer, -2102949461, "CC(remember):LazyGridDsl.kt#9igjgp");
        boolean invalid$iv = (((($changed & 14) ^ 6) > 4 && $composer.changed(columns)) || ($changed & 6) == 4) | (((($changed & Property.BORDER_BOTTOM_RIGHT_RADIUS) ^ 48) > 32 && $composer.changed(horizontalArrangement)) || ($changed & 48) == 32);
        Object it$iv = $composer.rememberedValue();
        if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
            Object value$iv = (LazyGridSlotsProvider) new GridSlotCache(new Function2<Density, Constraints, LazyGridSlots>() { // from class: androidx.compose.foundation.lazy.grid.LazyGridDslKt$rememberColumnWidthSums$1$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ LazyGridSlots invoke(Density density, Constraints constraints) {
                    return m1127invoke0kLqBqw(density, constraints.m6832unboximpl());
                }

                /* renamed from: invoke-0kLqBqw  reason: not valid java name */
                public final LazyGridSlots m1127invoke0kLqBqw(Density $this$$receiver, long constraints) {
                    boolean value$iv2 = Constraints.m6826getMaxWidthimpl(constraints) != Integer.MAX_VALUE;
                    if (!value$iv2) {
                        InlineClassHelperKt.throwIllegalArgumentException("LazyVerticalGrid's width should be bound by parent.");
                    }
                    int gridWidth = Constraints.m6826getMaxWidthimpl(constraints);
                    GridCells $this$invoke_0kLqBqw_u24lambda_u243 = GridCells.this;
                    Arrangement.Horizontal $this$invoke_0kLqBqw_u24lambda_u243_u24lambda_u242_u24lambda_u241 = horizontalArrangement;
                    int[] sizes = CollectionsKt.toIntArray($this$invoke_0kLqBqw_u24lambda_u243.calculateCrossAxisCellSizes($this$$receiver, gridWidth, $this$$receiver.mo638roundToPx0680j_4($this$invoke_0kLqBqw_u24lambda_u243_u24lambda_u242_u24lambda_u241.mo880getSpacingD9Ej5fM())));
                    int[] positions = new int[sizes.length];
                    $this$invoke_0kLqBqw_u24lambda_u243_u24lambda_u242_u24lambda_u241.arrange($this$$receiver, gridWidth, sizes, LayoutDirection.Ltr, positions);
                    return new LazyGridSlots(sizes, positions);
                }
            });
            $composer.updateRememberedValue(value$iv);
            it$iv = value$iv;
        }
        LazyGridSlotsProvider lazyGridSlotsProvider = (LazyGridSlotsProvider) it$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return lazyGridSlotsProvider;
    }

    private static final LazyGridSlotsProvider rememberRowHeightSums(final GridCells rows, final Arrangement.Vertical verticalArrangement, Composer $composer, int $changed) {
        ComposerKt.sourceInformationMarkerStart($composer, -150818144, "C(rememberRowHeightSums)248@10619L772:LazyGridDsl.kt#7791vq");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-150818144, $changed, -1, "androidx.compose.foundation.lazy.grid.rememberRowHeightSums (LazyGridDsl.kt:248)");
        }
        ComposerKt.sourceInformationMarkerStart($composer, -380097672, "CC(remember):LazyGridDsl.kt#9igjgp");
        boolean invalid$iv = (((($changed & 14) ^ 6) > 4 && $composer.changed(rows)) || ($changed & 6) == 4) | (((($changed & Property.BORDER_BOTTOM_RIGHT_RADIUS) ^ 48) > 32 && $composer.changed(verticalArrangement)) || ($changed & 48) == 32);
        Object it$iv = $composer.rememberedValue();
        if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
            Object value$iv = (LazyGridSlotsProvider) new GridSlotCache(new Function2<Density, Constraints, LazyGridSlots>() { // from class: androidx.compose.foundation.lazy.grid.LazyGridDslKt$rememberRowHeightSums$1$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ LazyGridSlots invoke(Density density, Constraints constraints) {
                    return m1128invoke0kLqBqw(density, constraints.m6832unboximpl());
                }

                /* renamed from: invoke-0kLqBqw  reason: not valid java name */
                public final LazyGridSlots m1128invoke0kLqBqw(Density $this$$receiver, long constraints) {
                    boolean value$iv2 = Constraints.m6825getMaxHeightimpl(constraints) != Integer.MAX_VALUE;
                    if (!value$iv2) {
                        InlineClassHelperKt.throwIllegalArgumentException("LazyHorizontalGrid's height should be bound by parent.");
                    }
                    int gridHeight = Constraints.m6825getMaxHeightimpl(constraints);
                    GridCells $this$invoke_0kLqBqw_u24lambda_u243 = GridCells.this;
                    Arrangement.Vertical $this$invoke_0kLqBqw_u24lambda_u243_u24lambda_u242_u24lambda_u241 = verticalArrangement;
                    int[] sizes = CollectionsKt.toIntArray($this$invoke_0kLqBqw_u24lambda_u243.calculateCrossAxisCellSizes($this$$receiver, gridHeight, $this$$receiver.mo638roundToPx0680j_4($this$invoke_0kLqBqw_u24lambda_u243_u24lambda_u242_u24lambda_u241.mo880getSpacingD9Ej5fM())));
                    int[] positions = new int[sizes.length];
                    $this$invoke_0kLqBqw_u24lambda_u243_u24lambda_u242_u24lambda_u241.arrange($this$$receiver, gridHeight, sizes, positions);
                    return new LazyGridSlots(sizes, positions);
                }
            });
            $composer.updateRememberedValue(value$iv);
            it$iv = value$iv;
        }
        LazyGridSlotsProvider lazyGridSlotsProvider = (LazyGridSlotsProvider) it$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return lazyGridSlotsProvider;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final List<Integer> calculateCellsCrossAxisSizeImpl(int gridSize, int slotCount, int spacing) {
        int gridSizeWithoutSpacing = gridSize - ((slotCount - 1) * spacing);
        int slotSize = gridSizeWithoutSpacing / slotCount;
        int remainingPixels = gridSizeWithoutSpacing % slotCount;
        ArrayList arrayList = new ArrayList(slotCount);
        for (int i = 0; i < slotCount; i++) {
            int it = i;
            arrayList.add(Integer.valueOf((it < remainingPixels ? 1 : 0) + slotSize));
        }
        return arrayList;
    }

    public static /* synthetic */ void items$default(LazyGridScope $this$items_u24default, List items, Function1 key, Function2 span, Function1 contentType, Function4 itemContent, int i, Object obj) {
        if ((i & 2) != 0) {
            key = null;
        }
        if ((i & 4) != 0) {
            span = null;
        }
        if ((i & 8) != 0) {
            Function1 contentType2 = new Function1() { // from class: androidx.compose.foundation.lazy.grid.LazyGridDslKt$items$1
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Object p1) {
                    return invoke((LazyGridDslKt$items$1) p1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final Void invoke(T t) {
                    return null;
                }
            };
            contentType = contentType2;
        }
        $this$items_u24default.items(items.size(), key != null ? new LazyGridDslKt$items$2(key, items) : null, span != null ? new LazyGridDslKt$items$3(span, items) : null, new LazyGridDslKt$items$4(contentType, items), ComposableLambdaKt.composableLambdaInstance(699646206, true, new LazyGridDslKt$items$5(itemContent, items)));
    }

    public static final <T> void items(LazyGridScope $this$items, List<? extends T> list, Function1<? super T, ? extends Object> function1, Function2<? super LazyGridItemSpanScope, ? super T, GridItemSpan> function2, Function1<? super T, ? extends Object> function12, Function4<? super LazyGridItemScope, ? super T, ? super Composer, ? super Integer, Unit> function4) {
        $this$items.items(list.size(), function1 != null ? new LazyGridDslKt$items$2(function1, list) : null, function2 != null ? new LazyGridDslKt$items$3(function2, list) : null, new LazyGridDslKt$items$4(function12, list), ComposableLambdaKt.composableLambdaInstance(699646206, true, new LazyGridDslKt$items$5(function4, list)));
    }

    public static /* synthetic */ void itemsIndexed$default(LazyGridScope $this$itemsIndexed_u24default, List items, Function2 key, Function3 span, Function2 contentType, Function5 itemContent, int i, Object obj) {
        if ((i & 2) != 0) {
            key = null;
        }
        if ((i & 4) != 0) {
            span = null;
        }
        if ((i & 8) != 0) {
            Function2 contentType2 = new Function2() { // from class: androidx.compose.foundation.lazy.grid.LazyGridDslKt$itemsIndexed$1
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
        $this$itemsIndexed_u24default.items(items.size(), key != null ? new LazyGridDslKt$itemsIndexed$2(key, items) : null, span != null ? new LazyGridDslKt$itemsIndexed$3(span, items) : null, new LazyGridDslKt$itemsIndexed$4(contentType, items), ComposableLambdaKt.composableLambdaInstance(1229287273, true, new LazyGridDslKt$itemsIndexed$5(itemContent, items)));
    }

    public static final <T> void itemsIndexed(LazyGridScope $this$itemsIndexed, List<? extends T> list, Function2<? super Integer, ? super T, ? extends Object> function2, Function3<? super LazyGridItemSpanScope, ? super Integer, ? super T, GridItemSpan> function3, Function2<? super Integer, ? super T, ? extends Object> function22, Function5<? super LazyGridItemScope, ? super Integer, ? super T, ? super Composer, ? super Integer, Unit> function5) {
        $this$itemsIndexed.items(list.size(), function2 != null ? new LazyGridDslKt$itemsIndexed$2(function2, list) : null, function3 != null ? new LazyGridDslKt$itemsIndexed$3(function3, list) : null, new LazyGridDslKt$itemsIndexed$4(function22, list), ComposableLambdaKt.composableLambdaInstance(1229287273, true, new LazyGridDslKt$itemsIndexed$5(function5, list)));
    }

    public static /* synthetic */ void items$default(LazyGridScope $this$items_u24default, Object[] items, Function1 key, Function2 span, Function1 contentType, Function4 itemContent, int i, Object obj) {
        if ((i & 2) != 0) {
            key = null;
        }
        if ((i & 4) != 0) {
            span = null;
        }
        if ((i & 8) != 0) {
            Function1 contentType2 = new Function1() { // from class: androidx.compose.foundation.lazy.grid.LazyGridDslKt$items$6
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Object p1) {
                    return invoke((LazyGridDslKt$items$6) p1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final Void invoke(T t) {
                    return null;
                }
            };
            contentType = contentType2;
        }
        $this$items_u24default.items(items.length, key != null ? new LazyGridDslKt$items$7(key, items) : null, span != null ? new LazyGridDslKt$items$8(span, items) : null, new LazyGridDslKt$items$9(contentType, items), ComposableLambdaKt.composableLambdaInstance(407562193, true, new LazyGridDslKt$items$10(itemContent, items)));
    }

    public static final <T> void items(LazyGridScope $this$items, T[] tArr, Function1<? super T, ? extends Object> function1, Function2<? super LazyGridItemSpanScope, ? super T, GridItemSpan> function2, Function1<? super T, ? extends Object> function12, Function4<? super LazyGridItemScope, ? super T, ? super Composer, ? super Integer, Unit> function4) {
        $this$items.items(tArr.length, function1 != null ? new LazyGridDslKt$items$7(function1, tArr) : null, function2 != null ? new LazyGridDslKt$items$8(function2, tArr) : null, new LazyGridDslKt$items$9(function12, tArr), ComposableLambdaKt.composableLambdaInstance(407562193, true, new LazyGridDslKt$items$10(function4, tArr)));
    }

    public static /* synthetic */ void itemsIndexed$default(LazyGridScope $this$itemsIndexed_u24default, Object[] items, Function2 key, Function3 span, Function2 contentType, Function5 itemContent, int i, Object obj) {
        if ((i & 2) != 0) {
            key = null;
        }
        if ((i & 4) != 0) {
            span = null;
        }
        if ((i & 8) != 0) {
            Function2 contentType2 = new Function2() { // from class: androidx.compose.foundation.lazy.grid.LazyGridDslKt$itemsIndexed$6
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
        $this$itemsIndexed_u24default.items(items.length, key != null ? new LazyGridDslKt$itemsIndexed$7(key, items) : null, span != null ? new LazyGridDslKt$itemsIndexed$8(span, items) : null, new LazyGridDslKt$itemsIndexed$9(contentType, items), ComposableLambdaKt.composableLambdaInstance(-911455938, true, new LazyGridDslKt$itemsIndexed$10(itemContent, items)));
    }

    public static final <T> void itemsIndexed(LazyGridScope $this$itemsIndexed, T[] tArr, Function2<? super Integer, ? super T, ? extends Object> function2, Function3<? super LazyGridItemSpanScope, ? super Integer, ? super T, GridItemSpan> function3, Function2<? super Integer, ? super T, ? extends Object> function22, Function5<? super LazyGridItemScope, ? super Integer, ? super T, ? super Composer, ? super Integer, Unit> function5) {
        $this$itemsIndexed.items(tArr.length, function2 != null ? new LazyGridDslKt$itemsIndexed$7(function2, tArr) : null, function3 != null ? new LazyGridDslKt$itemsIndexed$8(function3, tArr) : null, new LazyGridDslKt$itemsIndexed$9(function22, tArr), ComposableLambdaKt.composableLambdaInstance(-911455938, true, new LazyGridDslKt$itemsIndexed$10(function5, tArr)));
    }
}
