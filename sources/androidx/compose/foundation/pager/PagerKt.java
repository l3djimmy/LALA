package androidx.compose.foundation.pager;

import androidx.autofill.HintConstants;
import androidx.compose.foundation.OverscrollEffect;
import androidx.compose.foundation.OverscrollKt;
import androidx.compose.foundation.gestures.Orientation;
import androidx.compose.foundation.gestures.TargetedFlingBehavior;
import androidx.compose.foundation.gestures.snapping.SnapPosition;
import androidx.compose.foundation.layout.PaddingKt;
import androidx.compose.foundation.layout.PaddingValues;
import androidx.compose.foundation.pager.PageSize;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.ui.Alignment;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.input.nestedscroll.NestedScrollConnection;
import androidx.compose.ui.semantics.SemanticsModifierKt;
import androidx.compose.ui.semantics.SemanticsPropertiesKt;
import androidx.compose.ui.semantics.SemanticsPropertyReceiver;
import androidx.compose.ui.unit.Dp;
import androidx.profileinstaller.ProfileVerifier;
import com.itextpdf.kernel.xmp.options.PropertyOptions;
import com.itextpdf.layout.properties.Property;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;
import kotlin.math.MathKt;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: Pager.kt */
@Metadata(d1 = {"\u0000\u009e\u0001\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u0007\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\u001aâ\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u0010\u0014\u001a\u00020\u00132%\b\u0002\u0010\u0015\u001a\u001f\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u0019\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u00162\b\b\u0002\u0010\u001b\u001a\u00020\u001c2\b\b\u0002\u0010\u001d\u001a\u00020\u001e21\u0010\u001f\u001a-\u0012\u0004\u0012\u00020!\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\"\u0012\u0004\u0012\u00020\u00010 ¢\u0006\u0002\b#¢\u0006\u0002\b$H\u0007ø\u0001\u0000¢\u0006\u0004\b%\u0010&\u001aî\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u0010\u0014\u001a\u00020\u00132%\b\u0002\u0010\u0015\u001a\u001f\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u0019\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u00162\b\b\u0002\u0010\u001b\u001a\u00020\u001c2\b\b\u0002\u0010\u001d\u001a\u00020\u001e2\n\b\u0002\u0010'\u001a\u0004\u0018\u00010(21\u0010\u001f\u001a-\u0012\u0004\u0012\u00020!\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\"\u0012\u0004\u0012\u00020\u00010 ¢\u0006\u0002\b#¢\u0006\u0002\b$H\u0007ø\u0001\u0000¢\u0006\u0004\b)\u0010*\u001aâ\u0001\u0010+\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010,\u001a\u00020-2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u0010\u0014\u001a\u00020\u00132%\b\u0002\u0010\u0015\u001a\u001f\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u0019\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u00162\b\b\u0002\u0010\u001b\u001a\u00020\u001c2\b\b\u0002\u0010\u001d\u001a\u00020\u001e21\u0010\u001f\u001a-\u0012\u0004\u0012\u00020!\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\"\u0012\u0004\u0012\u00020\u00010 ¢\u0006\u0002\b#¢\u0006\u0002\b$H\u0007ø\u0001\u0000¢\u0006\u0004\b.\u0010/\u001aî\u0001\u0010+\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010,\u001a\u00020-2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u0010\u0014\u001a\u00020\u00132%\b\u0002\u0010\u0015\u001a\u001f\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u0019\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u00162\b\b\u0002\u0010\u001b\u001a\u00020\u001c2\b\b\u0002\u0010\u001d\u001a\u00020\u001e2\n\b\u0002\u0010'\u001a\u0004\u0018\u00010(21\u0010\u001f\u001a-\u0012\u0004\u0012\u00020!\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\"\u0012\u0004\u0012\u00020\u00010 ¢\u0006\u0002\b#¢\u0006\u0002\b$H\u0007ø\u0001\u0000¢\u0006\u0004\b0\u00101\u001a\u0017\u00102\u001a\u00020\u00012\f\u00103\u001a\b\u0012\u0004\u0012\u00020504H\u0082\b\u001aL\u00106\u001a\u00020\u000b*\u00020\u001e2\u0006\u00107\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u000b2\u0006\u00108\u001a\u00020\u000b2\u0006\u00109\u001a\u00020\u000b2\u0006\u0010:\u001a\u00020\u000b2\u0006\u0010;\u001a\u00020\u000b2\u0006\u0010<\u001a\u00020=2\u0006\u0010>\u001a\u00020\u000bH\u0000\u001a,\u0010?\u001a\u00020\u0005*\u00020\u00052\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010@\u001a\u00020\u00132\u0006\u0010A\u001a\u00020B2\u0006\u0010\u0012\u001a\u00020\u0013H\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006C"}, d2 = {"HorizontalPager", "", "state", "Landroidx/compose/foundation/pager/PagerState;", "modifier", "Landroidx/compose/ui/Modifier;", "contentPadding", "Landroidx/compose/foundation/layout/PaddingValues;", "pageSize", "Landroidx/compose/foundation/pager/PageSize;", "beyondViewportPageCount", "", "pageSpacing", "Landroidx/compose/ui/unit/Dp;", "verticalAlignment", "Landroidx/compose/ui/Alignment$Vertical;", "flingBehavior", "Landroidx/compose/foundation/gestures/TargetedFlingBehavior;", "userScrollEnabled", "", "reverseLayout", "key", "Lkotlin/Function1;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "index", "", "pageNestedScrollConnection", "Landroidx/compose/ui/input/nestedscroll/NestedScrollConnection;", "snapPosition", "Landroidx/compose/foundation/gestures/snapping/SnapPosition;", "pageContent", "Lkotlin/Function2;", "Landroidx/compose/foundation/pager/PagerScope;", "page", "Landroidx/compose/runtime/Composable;", "Lkotlin/ExtensionFunctionType;", "HorizontalPager-oI3XNZo", "(Landroidx/compose/foundation/pager/PagerState;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/foundation/pager/PageSize;IFLandroidx/compose/ui/Alignment$Vertical;Landroidx/compose/foundation/gestures/TargetedFlingBehavior;ZZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/input/nestedscroll/NestedScrollConnection;Landroidx/compose/foundation/gestures/snapping/SnapPosition;Lkotlin/jvm/functions/Function4;Landroidx/compose/runtime/Composer;III)V", "overscrollEffect", "Landroidx/compose/foundation/OverscrollEffect;", "HorizontalPager--8jOkeI", "(Landroidx/compose/foundation/pager/PagerState;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/foundation/pager/PageSize;IFLandroidx/compose/ui/Alignment$Vertical;Landroidx/compose/foundation/gestures/TargetedFlingBehavior;ZZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/input/nestedscroll/NestedScrollConnection;Landroidx/compose/foundation/gestures/snapping/SnapPosition;Landroidx/compose/foundation/OverscrollEffect;Lkotlin/jvm/functions/Function4;Landroidx/compose/runtime/Composer;III)V", "VerticalPager", "horizontalAlignment", "Landroidx/compose/ui/Alignment$Horizontal;", "VerticalPager-oI3XNZo", "(Landroidx/compose/foundation/pager/PagerState;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/foundation/pager/PageSize;IFLandroidx/compose/ui/Alignment$Horizontal;Landroidx/compose/foundation/gestures/TargetedFlingBehavior;ZZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/input/nestedscroll/NestedScrollConnection;Landroidx/compose/foundation/gestures/snapping/SnapPosition;Lkotlin/jvm/functions/Function4;Landroidx/compose/runtime/Composer;III)V", "VerticalPager--8jOkeI", "(Landroidx/compose/foundation/pager/PagerState;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/foundation/pager/PageSize;IFLandroidx/compose/ui/Alignment$Horizontal;Landroidx/compose/foundation/gestures/TargetedFlingBehavior;ZZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/input/nestedscroll/NestedScrollConnection;Landroidx/compose/foundation/gestures/snapping/SnapPosition;Landroidx/compose/foundation/OverscrollEffect;Lkotlin/jvm/functions/Function4;Landroidx/compose/runtime/Composer;III)V", "debugLog", "generateMsg", "Lkotlin/Function0;", "", "currentPageOffset", "layoutSize", "spaceBetweenPages", "beforeContentPadding", "afterContentPadding", "currentPage", "currentPageOffsetFraction", "", "pageCount", "pagerSemantics", "isVertical", "scope", "Lkotlinx/coroutines/CoroutineScope;", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class PagerKt {
    /* renamed from: HorizontalPager--8jOkeI  reason: not valid java name */
    public static final void m1237HorizontalPager8jOkeI(final PagerState state, Modifier modifier, PaddingValues contentPadding, PageSize pageSize, int beyondViewportPageCount, float pageSpacing, Alignment.Vertical verticalAlignment, TargetedFlingBehavior flingBehavior, boolean userScrollEnabled, boolean reverseLayout, Function1<? super Integer, ? extends Object> function1, NestedScrollConnection pageNestedScrollConnection, SnapPosition snapPosition, OverscrollEffect overscrollEffect, final Function4<? super PagerScope, ? super Integer, ? super Composer, ? super Integer, Unit> function4, Composer $composer, final int $changed, final int $changed1, final int i) {
        Modifier modifier2;
        Object obj;
        Object obj2;
        int i2;
        float f;
        Object verticalAlignment2;
        Object obj3;
        int i3;
        int i4;
        int $dirty;
        int $dirty1;
        int i5;
        int $dirty12;
        Composer $composer2;
        final boolean userScrollEnabled2;
        final boolean reverseLayout2;
        final Function1 key;
        final OverscrollEffect overscrollEffect2;
        final PaddingValues contentPadding2;
        final PageSize pageSize2;
        final int beyondViewportPageCount2;
        final float pageSpacing2;
        final TargetedFlingBehavior flingBehavior2;
        final Modifier modifier3;
        final Alignment.Vertical verticalAlignment3;
        final NestedScrollConnection pageNestedScrollConnection2;
        final SnapPosition snapPosition2;
        PagerState pagerState;
        int i6;
        int $dirty13;
        TargetedFlingBehavior flingBehavior3;
        boolean reverseLayout3;
        NestedScrollConnection pageNestedScrollConnection3;
        int $dirty14;
        Function1 key2;
        NestedScrollConnection pageNestedScrollConnection4;
        int $dirty15;
        PageSize pageSize3;
        float pageSpacing3;
        OverscrollEffect overscrollEffect3;
        TargetedFlingBehavior flingBehavior4;
        Composer $composer3;
        Modifier modifier4;
        int $dirty2;
        boolean userScrollEnabled3;
        PaddingValues contentPadding3;
        Alignment.Vertical verticalAlignment4;
        SnapPosition snapPosition3;
        int beyondViewportPageCount3;
        Modifier modifier5;
        int i7;
        int i8;
        Composer $composer4 = $composer.startRestartGroup(-1372972868);
        ComposerKt.sourceInformation($composer4, "C(HorizontalPager)P(12,4,1,8!1,9:c#ui.unit.Dp,14!1,13,10!1,7,11)130@7467L706:Pager.kt#g6yjnt");
        int $dirty3 = $changed;
        if ((i & 1) != 0) {
            $dirty3 |= 6;
        } else if (($changed & 6) == 0) {
            $dirty3 |= $composer4.changed(state) ? 4 : 2;
        }
        int i9 = i & 2;
        if (i9 != 0) {
            $dirty3 |= 48;
            modifier2 = modifier;
        } else if (($changed & 48) == 0) {
            modifier2 = modifier;
            $dirty3 |= $composer4.changed(modifier2) ? 32 : 16;
        } else {
            modifier2 = modifier;
        }
        int i10 = i & 4;
        if (i10 != 0) {
            $dirty3 |= 384;
            obj = contentPadding;
        } else if (($changed & 384) == 0) {
            obj = contentPadding;
            $dirty3 |= $composer4.changed(obj) ? 256 : 128;
        } else {
            obj = contentPadding;
        }
        int i11 = i & 8;
        int i12 = 1024;
        if (i11 != 0) {
            $dirty3 |= 3072;
            obj2 = pageSize;
        } else if (($changed & 3072) == 0) {
            obj2 = pageSize;
            $dirty3 |= $composer4.changed(obj2) ? 2048 : 1024;
        } else {
            obj2 = pageSize;
        }
        int i13 = i & 16;
        if (i13 != 0) {
            $dirty3 |= 24576;
            i2 = beyondViewportPageCount;
        } else if (($changed & 24576) == 0) {
            i2 = beyondViewportPageCount;
            $dirty3 |= $composer4.changed(i2) ? 16384 : 8192;
        } else {
            i2 = beyondViewportPageCount;
        }
        int i14 = i & 32;
        if (i14 != 0) {
            $dirty3 |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            f = pageSpacing;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            f = pageSpacing;
            $dirty3 |= $composer4.changed(f) ? 131072 : 65536;
        } else {
            f = pageSpacing;
        }
        int i15 = i & 64;
        if (i15 != 0) {
            $dirty3 |= 1572864;
            verticalAlignment2 = verticalAlignment;
        } else if (($changed & 1572864) == 0) {
            verticalAlignment2 = verticalAlignment;
            $dirty3 |= $composer4.changed(verticalAlignment2) ? 1048576 : 524288;
        } else {
            verticalAlignment2 = verticalAlignment;
        }
        if (($changed & 12582912) == 0) {
            if ((i & 128) == 0) {
                obj3 = flingBehavior;
                if ($composer4.changed(obj3)) {
                    i8 = 8388608;
                    $dirty3 |= i8;
                }
            } else {
                obj3 = flingBehavior;
            }
            i8 = 4194304;
            $dirty3 |= i8;
        } else {
            obj3 = flingBehavior;
        }
        int $dirty16 = i & 256;
        if ($dirty16 != 0) {
            $dirty3 |= 100663296;
            i3 = $dirty16;
        } else if (($changed & 100663296) == 0) {
            i3 = $dirty16;
            $dirty3 |= $composer4.changed(userScrollEnabled) ? 67108864 : 33554432;
        } else {
            i3 = $dirty16;
        }
        int i16 = i & 512;
        if (i16 != 0) {
            $dirty = $dirty3 | 805306368;
            i4 = i16;
        } else {
            if (($changed & 805306368) == 0) {
                i4 = i16;
                $dirty3 |= $composer4.changed(reverseLayout) ? PropertyOptions.DELETE_EXISTING : 268435456;
            } else {
                i4 = i16;
            }
            $dirty = $dirty3;
        }
        int $dirty4 = i & 1024;
        if ($dirty4 != 0) {
            $dirty1 = $changed1 | 6;
        } else if (($changed1 & 6) == 0) {
            $dirty1 = $changed1 | ($composer4.changedInstance(function1) ? 4 : 2);
        } else {
            $dirty1 = $changed1;
        }
        if (($changed1 & 48) == 0) {
            i5 = $dirty4;
            if ((i & 2048) == 0 && $composer4.changedInstance(pageNestedScrollConnection)) {
                i7 = 32;
                $dirty1 |= i7;
            }
            i7 = 16;
            $dirty1 |= i7;
        } else {
            i5 = $dirty4;
        }
        int $dirty17 = $dirty1;
        int i17 = i & 4096;
        if (i17 != 0) {
            $dirty12 = $dirty17 | 384;
        } else if (($changed1 & 384) == 0) {
            $dirty12 = $dirty17 | ($composer4.changed(snapPosition) ? 256 : 128);
        } else {
            $dirty12 = $dirty17;
        }
        if (($changed1 & 3072) == 0) {
            if ((i & 8192) == 0 && $composer4.changed(overscrollEffect)) {
                i12 = 2048;
            }
            $dirty12 |= i12;
        }
        int $dirty18 = $dirty12;
        if ((i & 16384) != 0) {
            $dirty18 |= 24576;
        } else if (($changed1 & 24576) == 0) {
            $dirty18 |= $composer4.changedInstance(function4) ? 16384 : 8192;
        }
        if ($composer4.shouldExecute((($dirty & 306783379) == 306783378 && ($dirty18 & 9363) == 9362) ? false : true, $dirty & 1)) {
            $composer4.startDefaults();
            ComposerKt.sourceInformation($composer4, "120@6993L28,125@7217L57,127@7371L26");
            if (($changed & 1) == 0 || $composer4.getDefaultsInvalid()) {
                if (i9 != 0) {
                    modifier2 = Modifier.Companion;
                }
                PaddingValues contentPadding4 = i10 != 0 ? PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(0)) : obj;
                PageSize pageSize4 = i11 != 0 ? PageSize.Fill.INSTANCE : obj2;
                int beyondViewportPageCount4 = i13 != 0 ? 0 : i2;
                float pageSpacing4 = i14 != 0 ? Dp.m6873constructorimpl(0) : f;
                if (i15 != 0) {
                    verticalAlignment2 = Alignment.Companion.getCenterVertically();
                }
                if ((i & 128) != 0) {
                    i6 = i17;
                    $dirty13 = $dirty18;
                    pagerState = state;
                    flingBehavior3 = PagerDefaults.INSTANCE.flingBehavior(pagerState, null, null, null, 0.0f, $composer4, ($dirty & 14) | ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 30);
                    $dirty &= -29360129;
                } else {
                    pagerState = state;
                    i6 = i17;
                    $dirty13 = $dirty18;
                    flingBehavior3 = obj3;
                }
                boolean userScrollEnabled4 = i3 != 0 ? true : userScrollEnabled;
                reverseLayout3 = i4 != 0 ? false : reverseLayout;
                Function1 key3 = i5 != 0 ? null : function1;
                if ((i & 2048) != 0) {
                    pageNestedScrollConnection3 = PagerDefaults.INSTANCE.pageNestedScrollConnection(pagerState, Orientation.Horizontal, $composer4, ($dirty & 14) | 432);
                    $dirty14 = $dirty13 & (-113);
                } else {
                    pageNestedScrollConnection3 = pageNestedScrollConnection;
                    $dirty14 = $dirty13;
                }
                SnapPosition.Start snapPosition4 = i6 != 0 ? SnapPosition.Start.INSTANCE : snapPosition;
                if ((i & 8192) != 0) {
                    key2 = key3;
                    $dirty15 = $dirty14 & (-7169);
                    overscrollEffect3 = OverscrollKt.rememberOverscrollEffect($composer4, 0);
                    pageNestedScrollConnection4 = pageNestedScrollConnection3;
                    pageSize3 = pageSize4;
                    pageSpacing3 = pageSpacing4;
                    flingBehavior4 = flingBehavior3;
                    $composer3 = $composer4;
                    modifier4 = modifier2;
                    $dirty2 = $dirty;
                    userScrollEnabled3 = userScrollEnabled4;
                    contentPadding3 = contentPadding4;
                    verticalAlignment4 = verticalAlignment2;
                    snapPosition3 = snapPosition4;
                    beyondViewportPageCount3 = beyondViewportPageCount4;
                } else {
                    key2 = key3;
                    pageNestedScrollConnection4 = pageNestedScrollConnection3;
                    $dirty15 = $dirty14;
                    pageSize3 = pageSize4;
                    pageSpacing3 = pageSpacing4;
                    overscrollEffect3 = overscrollEffect;
                    flingBehavior4 = flingBehavior3;
                    $composer3 = $composer4;
                    modifier4 = modifier2;
                    $dirty2 = $dirty;
                    userScrollEnabled3 = userScrollEnabled4;
                    contentPadding3 = contentPadding4;
                    verticalAlignment4 = verticalAlignment2;
                    snapPosition3 = snapPosition4;
                    beyondViewportPageCount3 = beyondViewportPageCount4;
                }
            } else {
                $composer4.skipToGroupEnd();
                if ((i & 128) != 0) {
                    $dirty &= -29360129;
                }
                if ((i & 2048) != 0) {
                    $dirty18 &= -113;
                }
                if ((i & 8192) != 0) {
                    $dirty18 &= -7169;
                }
                reverseLayout3 = reverseLayout;
                pageNestedScrollConnection4 = pageNestedScrollConnection;
                contentPadding3 = obj;
                pageSize3 = obj2;
                $composer3 = $composer4;
                pageSpacing3 = f;
                flingBehavior4 = obj3;
                verticalAlignment4 = verticalAlignment2;
                userScrollEnabled3 = userScrollEnabled;
                key2 = function1;
                snapPosition3 = snapPosition;
                $dirty15 = $dirty18;
                beyondViewportPageCount3 = i2;
                modifier4 = modifier2;
                $dirty2 = $dirty;
                overscrollEffect3 = overscrollEffect;
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                modifier5 = modifier4;
                ComposerKt.traceEventStart(-1372972868, $dirty2, $dirty15, "androidx.compose.foundation.pager.HorizontalPager (Pager.kt:129)");
            } else {
                modifier5 = modifier4;
            }
            int $dirty19 = $dirty15;
            Orientation orientation = Orientation.Horizontal;
            Alignment.Horizontal centerHorizontally = Alignment.Companion.getCenterHorizontally();
            int i18 = (($dirty2 >> 3) & 14) | 24576 | (($dirty2 << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty2 & 896) | (($dirty2 >> 18) & 7168) | (($dirty2 >> 6) & 458752) | (($dirty2 >> 6) & 3670016) | (($dirty19 << 12) & 29360128) | (($dirty2 << 12) & 234881024) | (($dirty2 << 12) & 1879048192);
            int i19 = (($dirty2 >> 9) & 14) | 3072 | ($dirty19 & Property.BORDER_BOTTOM_RIGHT_RADIUS) | (($dirty19 << 6) & 896) | (($dirty2 >> 6) & 57344) | (($dirty19 << 9) & 458752) | (($dirty19 << 6) & 3670016);
            Modifier modifier6 = modifier5;
            LazyLayoutPagerKt.m1233PagereLwUrMk(modifier6, state, contentPadding3, reverseLayout3, orientation, flingBehavior4, userScrollEnabled3, overscrollEffect3, beyondViewportPageCount3, pageSpacing3, pageSize3, pageNestedScrollConnection4, key2, centerHorizontally, verticalAlignment4, snapPosition3, function4, $composer3, i18, i19, 0);
            $composer2 = $composer3;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            int i20 = beyondViewportPageCount3;
            flingBehavior2 = flingBehavior4;
            beyondViewportPageCount2 = i20;
            float f2 = pageSpacing3;
            userScrollEnabled2 = userScrollEnabled3;
            pageSpacing2 = f2;
            Alignment.Vertical vertical = verticalAlignment4;
            overscrollEffect2 = overscrollEffect3;
            verticalAlignment3 = vertical;
            Function1 function12 = key2;
            pageNestedScrollConnection2 = pageNestedScrollConnection4;
            key = function12;
            pageSize2 = pageSize3;
            snapPosition2 = snapPosition3;
            reverseLayout2 = reverseLayout3;
            contentPadding2 = contentPadding3;
            modifier3 = modifier6;
        } else {
            $composer2 = $composer4;
            $composer2.skipToGroupEnd();
            userScrollEnabled2 = userScrollEnabled;
            reverseLayout2 = reverseLayout;
            key = function1;
            overscrollEffect2 = overscrollEffect;
            contentPadding2 = obj;
            pageSize2 = obj2;
            beyondViewportPageCount2 = i2;
            pageSpacing2 = f;
            flingBehavior2 = obj3;
            modifier3 = modifier2;
            verticalAlignment3 = verticalAlignment2;
            pageNestedScrollConnection2 = pageNestedScrollConnection;
            snapPosition2 = snapPosition;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.pager.PagerKt$HorizontalPager$1
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

                public final void invoke(Composer composer, int i21) {
                    PagerKt.m1237HorizontalPager8jOkeI(PagerState.this, modifier3, contentPadding2, pageSize2, beyondViewportPageCount2, pageSpacing2, verticalAlignment3, flingBehavior2, userScrollEnabled2, reverseLayout2, key, pageNestedScrollConnection2, snapPosition2, overscrollEffect2, function4, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Use the non deprecated overload")
    /* renamed from: HorizontalPager-oI3XNZo  reason: not valid java name */
    public static final /* synthetic */ void m1238HorizontalPageroI3XNZo(final PagerState state, Modifier modifier, PaddingValues contentPadding, PageSize pageSize, int beyondViewportPageCount, float pageSpacing, Alignment.Vertical verticalAlignment, TargetedFlingBehavior flingBehavior, boolean userScrollEnabled, boolean reverseLayout, Function1 key, NestedScrollConnection pageNestedScrollConnection, SnapPosition snapPosition, final Function4 pageContent, Composer $composer, final int $changed, final int $changed1, final int i) {
        Object obj;
        Object obj2;
        Object obj3;
        int i2;
        float f;
        Object verticalAlignment2;
        Object obj4;
        int i3;
        int i4;
        int $dirty;
        int $dirty1;
        int i5;
        int $dirty12;
        Composer $composer2;
        final boolean reverseLayout2;
        final boolean reverseLayout3;
        final Function1 key2;
        final SnapPosition snapPosition2;
        final PaddingValues contentPadding2;
        final PageSize pageSize2;
        final int beyondViewportPageCount2;
        final float pageSpacing2;
        final Modifier modifier2;
        final TargetedFlingBehavior flingBehavior2;
        final Alignment.Vertical verticalAlignment3;
        final NestedScrollConnection pageNestedScrollConnection2;
        Modifier modifier3;
        PagerState pagerState;
        Composer $composer3;
        int $dirty13;
        TargetedFlingBehavior flingBehavior3;
        NestedScrollConnection pageNestedScrollConnection3;
        SnapPosition snapPosition3;
        TargetedFlingBehavior flingBehavior4;
        boolean userScrollEnabled2;
        boolean reverseLayout4;
        Function1 key3;
        NestedScrollConnection pageNestedScrollConnection4;
        PaddingValues contentPadding3;
        int $dirty14;
        PageSize pageSize3;
        int beyondViewportPageCount3;
        float pageSpacing3;
        int $dirty2;
        boolean reverseLayout5;
        int i6;
        int i7;
        Composer $composer4 = $composer.startRestartGroup(1870896258);
        ComposerKt.sourceInformation($composer4, "C(HorizontalPager)P(11,4,1,7!1,8:c#ui.unit.Dp,13!1,12,9!1,6,10)184@9633L26,170@9080L620:Pager.kt#g6yjnt");
        int $dirty3 = $changed;
        if ((i & 1) != 0) {
            $dirty3 |= 6;
        } else if (($changed & 6) == 0) {
            $dirty3 |= $composer4.changed(state) ? 4 : 2;
        }
        int i8 = i & 2;
        if (i8 != 0) {
            $dirty3 |= 48;
            obj = modifier;
        } else if (($changed & 48) == 0) {
            obj = modifier;
            $dirty3 |= $composer4.changed(obj) ? 32 : 16;
        } else {
            obj = modifier;
        }
        int i9 = i & 4;
        if (i9 != 0) {
            $dirty3 |= 384;
            obj2 = contentPadding;
        } else if (($changed & 384) == 0) {
            obj2 = contentPadding;
            $dirty3 |= $composer4.changed(obj2) ? 256 : 128;
        } else {
            obj2 = contentPadding;
        }
        int i10 = i & 8;
        if (i10 != 0) {
            $dirty3 |= 3072;
            obj3 = pageSize;
        } else if (($changed & 3072) == 0) {
            obj3 = pageSize;
            $dirty3 |= $composer4.changed(obj3) ? 2048 : 1024;
        } else {
            obj3 = pageSize;
        }
        int i11 = i & 16;
        if (i11 != 0) {
            $dirty3 |= 24576;
            i2 = beyondViewportPageCount;
        } else if (($changed & 24576) == 0) {
            i2 = beyondViewportPageCount;
            $dirty3 |= $composer4.changed(i2) ? 16384 : 8192;
        } else {
            i2 = beyondViewportPageCount;
        }
        int i12 = i & 32;
        if (i12 != 0) {
            $dirty3 |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            f = pageSpacing;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            f = pageSpacing;
            $dirty3 |= $composer4.changed(f) ? 131072 : 65536;
        } else {
            f = pageSpacing;
        }
        int i13 = i & 64;
        if (i13 != 0) {
            $dirty3 |= 1572864;
            verticalAlignment2 = verticalAlignment;
        } else if (($changed & 1572864) == 0) {
            verticalAlignment2 = verticalAlignment;
            $dirty3 |= $composer4.changed(verticalAlignment2) ? 1048576 : 524288;
        } else {
            verticalAlignment2 = verticalAlignment;
        }
        if (($changed & 12582912) == 0) {
            if ((i & 128) == 0) {
                obj4 = flingBehavior;
                if ($composer4.changed(obj4)) {
                    i7 = 8388608;
                    $dirty3 |= i7;
                }
            } else {
                obj4 = flingBehavior;
            }
            i7 = 4194304;
            $dirty3 |= i7;
        } else {
            obj4 = flingBehavior;
        }
        int $dirty15 = i & 256;
        if ($dirty15 != 0) {
            $dirty3 |= 100663296;
            i3 = $dirty15;
        } else if (($changed & 100663296) == 0) {
            i3 = $dirty15;
            $dirty3 |= $composer4.changed(userScrollEnabled) ? 67108864 : 33554432;
        } else {
            i3 = $dirty15;
        }
        int i14 = i & 512;
        if (i14 != 0) {
            $dirty = $dirty3 | 805306368;
            i4 = i14;
        } else {
            if (($changed & 805306368) == 0) {
                i4 = i14;
                $dirty3 |= $composer4.changed(reverseLayout) ? PropertyOptions.DELETE_EXISTING : 268435456;
            } else {
                i4 = i14;
            }
            $dirty = $dirty3;
        }
        int $dirty4 = i & 1024;
        if ($dirty4 != 0) {
            $dirty1 = $changed1 | 6;
        } else if (($changed1 & 6) == 0) {
            $dirty1 = $changed1 | ($composer4.changedInstance(key) ? 4 : 2);
        } else {
            $dirty1 = $changed1;
        }
        if (($changed1 & 48) == 0) {
            i5 = $dirty4;
            if ((i & 2048) == 0 && $composer4.changedInstance(pageNestedScrollConnection)) {
                i6 = 32;
                $dirty1 |= i6;
            }
            i6 = 16;
            $dirty1 |= i6;
        } else {
            i5 = $dirty4;
        }
        int $dirty16 = $dirty1;
        int i15 = i & 4096;
        if (i15 != 0) {
            $dirty12 = $dirty16 | 384;
        } else if (($changed1 & 384) == 0) {
            $dirty12 = $dirty16 | ($composer4.changed(snapPosition) ? 256 : 128);
        } else {
            $dirty12 = $dirty16;
        }
        if ((i & 8192) != 0) {
            $dirty12 |= 3072;
        } else if (($changed1 & 3072) == 0) {
            $dirty12 |= $composer4.changedInstance(pageContent) ? 2048 : 1024;
        }
        if ($composer4.shouldExecute((($dirty & 306783379) == 306783378 && ($dirty12 & 1171) == 1170) ? false : true, $dirty & 1)) {
            $composer4.startDefaults();
            ComposerKt.sourceInformation($composer4, "161@8676L28,166@8900L57");
            if (($changed & 1) == 0 || $composer4.getDefaultsInvalid()) {
                modifier3 = i8 != 0 ? Modifier.Companion : obj;
                PaddingValues contentPadding4 = i9 != 0 ? PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(0)) : obj2;
                PageSize pageSize4 = i10 != 0 ? PageSize.Fill.INSTANCE : obj3;
                int beyondViewportPageCount4 = i11 != 0 ? 0 : i2;
                float pageSpacing4 = i12 != 0 ? Dp.m6873constructorimpl(0) : f;
                if (i13 != 0) {
                    verticalAlignment2 = Alignment.Companion.getCenterVertically();
                }
                if ((i & 128) != 0) {
                    $composer3 = $composer4;
                    $dirty13 = $dirty12;
                    pagerState = state;
                    flingBehavior3 = PagerDefaults.INSTANCE.flingBehavior(pagerState, null, null, null, 0.0f, $composer3, ($dirty & 14) | ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 30);
                    $dirty &= -29360129;
                } else {
                    pagerState = state;
                    $composer3 = $composer4;
                    $dirty13 = $dirty12;
                    flingBehavior3 = obj4;
                }
                boolean userScrollEnabled3 = i3 != 0 ? true : userScrollEnabled;
                boolean reverseLayout6 = i4 != 0 ? false : reverseLayout;
                Function1 key4 = i5 != 0 ? null : key;
                if ((i & 2048) != 0) {
                    pageNestedScrollConnection3 = PagerDefaults.INSTANCE.pageNestedScrollConnection(pagerState, Orientation.Horizontal, $composer3, ($dirty & 14) | 432);
                    $dirty13 &= -113;
                } else {
                    pageNestedScrollConnection3 = pageNestedScrollConnection;
                }
                if (i15 != 0) {
                    userScrollEnabled2 = userScrollEnabled3;
                    key3 = key4;
                    pageNestedScrollConnection4 = pageNestedScrollConnection3;
                    snapPosition3 = SnapPosition.Start.INSTANCE;
                    contentPadding3 = contentPadding4;
                    $dirty14 = $dirty13;
                    beyondViewportPageCount3 = beyondViewportPageCount4;
                    pageSpacing3 = pageSpacing4;
                    $dirty2 = $dirty;
                    flingBehavior4 = flingBehavior3;
                    reverseLayout4 = reverseLayout6;
                    pageSize3 = pageSize4;
                } else {
                    snapPosition3 = snapPosition;
                    flingBehavior4 = flingBehavior3;
                    userScrollEnabled2 = userScrollEnabled3;
                    reverseLayout4 = reverseLayout6;
                    key3 = key4;
                    pageNestedScrollConnection4 = pageNestedScrollConnection3;
                    contentPadding3 = contentPadding4;
                    $dirty14 = $dirty13;
                    pageSize3 = pageSize4;
                    beyondViewportPageCount3 = beyondViewportPageCount4;
                    pageSpacing3 = pageSpacing4;
                    $dirty2 = $dirty;
                }
            } else {
                $composer4.skipToGroupEnd();
                if ((i & 128) != 0) {
                    $dirty &= -29360129;
                }
                if ((i & 2048) != 0) {
                    $dirty12 &= -113;
                }
                key3 = key;
                pageNestedScrollConnection4 = pageNestedScrollConnection;
                $dirty14 = $dirty12;
                contentPadding3 = obj2;
                pageSize3 = obj3;
                beyondViewportPageCount3 = i2;
                pageSpacing3 = f;
                modifier3 = obj;
                flingBehavior4 = obj4;
                $composer3 = $composer4;
                $dirty2 = $dirty;
                userScrollEnabled2 = userScrollEnabled;
                reverseLayout4 = reverseLayout;
                snapPosition3 = snapPosition;
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                reverseLayout5 = reverseLayout4;
                ComposerKt.traceEventStart(1870896258, $dirty2, $dirty14, "androidx.compose.foundation.pager.HorizontalPager (Pager.kt:169)");
            } else {
                reverseLayout5 = reverseLayout4;
            }
            Modifier modifier4 = modifier3;
            boolean reverseLayout7 = reverseLayout5;
            Composer $composer5 = $composer3;
            Alignment.Vertical verticalAlignment4 = verticalAlignment2;
            m1237HorizontalPager8jOkeI(state, modifier4, contentPadding3, pageSize3, beyondViewportPageCount3, pageSpacing3, verticalAlignment4, flingBehavior4, userScrollEnabled2, reverseLayout7, key3, pageNestedScrollConnection4, snapPosition3, OverscrollKt.rememberOverscrollEffect($composer3, 0), pageContent, $composer5, ($dirty2 & 896) | ($dirty2 & 14) | ($dirty2 & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty2 & 7168) | (57344 & $dirty2) | (458752 & $dirty2) | (3670016 & $dirty2) | (29360128 & $dirty2) | (234881024 & $dirty2) | (1879048192 & $dirty2), ($dirty14 & 14) | ($dirty14 & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty14 & 896) | (($dirty14 << 3) & 57344), 0);
            $composer2 = $composer5;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            snapPosition2 = snapPosition3;
            pageNestedScrollConnection2 = pageNestedScrollConnection4;
            key2 = key3;
            reverseLayout3 = reverseLayout7;
            reverseLayout2 = userScrollEnabled2;
            flingBehavior2 = flingBehavior4;
            verticalAlignment3 = verticalAlignment4;
            pageSpacing2 = pageSpacing3;
            beyondViewportPageCount2 = beyondViewportPageCount3;
            pageSize2 = pageSize3;
            contentPadding2 = contentPadding3;
            modifier2 = modifier4;
        } else {
            $composer2 = $composer4;
            $composer2.skipToGroupEnd();
            reverseLayout2 = userScrollEnabled;
            reverseLayout3 = reverseLayout;
            key2 = key;
            snapPosition2 = snapPosition;
            contentPadding2 = obj2;
            pageSize2 = obj3;
            beyondViewportPageCount2 = i2;
            pageSpacing2 = f;
            modifier2 = obj;
            flingBehavior2 = obj4;
            verticalAlignment3 = verticalAlignment2;
            pageNestedScrollConnection2 = pageNestedScrollConnection;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.pager.PagerKt$HorizontalPager$2
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

                public final void invoke(Composer composer, int i16) {
                    PagerKt.m1238HorizontalPageroI3XNZo(PagerState.this, modifier2, contentPadding2, pageSize2, beyondViewportPageCount2, pageSpacing2, verticalAlignment3, flingBehavior2, reverseLayout2, reverseLayout3, key2, pageNestedScrollConnection2, snapPosition2, pageContent, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }

    /* renamed from: VerticalPager--8jOkeI  reason: not valid java name */
    public static final void m1239VerticalPager8jOkeI(final PagerState state, Modifier modifier, PaddingValues contentPadding, PageSize pageSize, int beyondViewportPageCount, float pageSpacing, Alignment.Horizontal horizontalAlignment, TargetedFlingBehavior flingBehavior, boolean userScrollEnabled, boolean reverseLayout, Function1<? super Integer, ? extends Object> function1, NestedScrollConnection pageNestedScrollConnection, SnapPosition snapPosition, OverscrollEffect overscrollEffect, final Function4<? super PagerScope, ? super Integer, ? super Composer, ? super Integer, Unit> function4, Composer $composer, final int $changed, final int $changed1, final int i) {
        Modifier modifier2;
        Object obj;
        Object obj2;
        int i2;
        float f;
        Object horizontalAlignment2;
        Object obj3;
        int i3;
        int i4;
        int $dirty;
        int $dirty1;
        int i5;
        int $dirty12;
        Composer $composer2;
        final boolean userScrollEnabled2;
        final boolean reverseLayout2;
        final Function1 key;
        final OverscrollEffect overscrollEffect2;
        final PaddingValues contentPadding2;
        final PageSize pageSize2;
        final int beyondViewportPageCount2;
        final float pageSpacing2;
        final TargetedFlingBehavior flingBehavior2;
        final Modifier modifier3;
        final Alignment.Horizontal horizontalAlignment3;
        final NestedScrollConnection pageNestedScrollConnection2;
        final SnapPosition snapPosition2;
        PagerState pagerState;
        int i6;
        int $dirty13;
        TargetedFlingBehavior flingBehavior3;
        boolean reverseLayout3;
        NestedScrollConnection pageNestedScrollConnection3;
        int $dirty14;
        Function1 key2;
        NestedScrollConnection pageNestedScrollConnection4;
        int $dirty15;
        PageSize pageSize3;
        float pageSpacing3;
        OverscrollEffect overscrollEffect3;
        TargetedFlingBehavior flingBehavior4;
        Composer $composer3;
        Modifier modifier4;
        Alignment.Horizontal horizontalAlignment4;
        boolean userScrollEnabled3;
        SnapPosition snapPosition3;
        PaddingValues contentPadding3;
        int beyondViewportPageCount3;
        int $dirty2;
        Modifier modifier5;
        int i7;
        int i8;
        Composer $composer4 = $composer.startRestartGroup(632853564);
        ComposerKt.sourceInformation($composer4, "C(VerticalPager)P(13,5,1,9!1,10:c#ui.unit.Dp,3!1,14,11!1,8,12)260@14392L704:Pager.kt#g6yjnt");
        int $dirty3 = $changed;
        if ((i & 1) != 0) {
            $dirty3 |= 6;
        } else if (($changed & 6) == 0) {
            $dirty3 |= $composer4.changed(state) ? 4 : 2;
        }
        int i9 = i & 2;
        if (i9 != 0) {
            $dirty3 |= 48;
            modifier2 = modifier;
        } else if (($changed & 48) == 0) {
            modifier2 = modifier;
            $dirty3 |= $composer4.changed(modifier2) ? 32 : 16;
        } else {
            modifier2 = modifier;
        }
        int i10 = i & 4;
        if (i10 != 0) {
            $dirty3 |= 384;
            obj = contentPadding;
        } else if (($changed & 384) == 0) {
            obj = contentPadding;
            $dirty3 |= $composer4.changed(obj) ? 256 : 128;
        } else {
            obj = contentPadding;
        }
        int i11 = i & 8;
        int i12 = 1024;
        if (i11 != 0) {
            $dirty3 |= 3072;
            obj2 = pageSize;
        } else if (($changed & 3072) == 0) {
            obj2 = pageSize;
            $dirty3 |= $composer4.changed(obj2) ? 2048 : 1024;
        } else {
            obj2 = pageSize;
        }
        int i13 = i & 16;
        if (i13 != 0) {
            $dirty3 |= 24576;
            i2 = beyondViewportPageCount;
        } else if (($changed & 24576) == 0) {
            i2 = beyondViewportPageCount;
            $dirty3 |= $composer4.changed(i2) ? 16384 : 8192;
        } else {
            i2 = beyondViewportPageCount;
        }
        int i14 = i & 32;
        if (i14 != 0) {
            $dirty3 |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            f = pageSpacing;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            f = pageSpacing;
            $dirty3 |= $composer4.changed(f) ? 131072 : 65536;
        } else {
            f = pageSpacing;
        }
        int i15 = i & 64;
        if (i15 != 0) {
            $dirty3 |= 1572864;
            horizontalAlignment2 = horizontalAlignment;
        } else if (($changed & 1572864) == 0) {
            horizontalAlignment2 = horizontalAlignment;
            $dirty3 |= $composer4.changed(horizontalAlignment2) ? 1048576 : 524288;
        } else {
            horizontalAlignment2 = horizontalAlignment;
        }
        if (($changed & 12582912) == 0) {
            if ((i & 128) == 0) {
                obj3 = flingBehavior;
                if ($composer4.changed(obj3)) {
                    i8 = 8388608;
                    $dirty3 |= i8;
                }
            } else {
                obj3 = flingBehavior;
            }
            i8 = 4194304;
            $dirty3 |= i8;
        } else {
            obj3 = flingBehavior;
        }
        int $dirty16 = i & 256;
        if ($dirty16 != 0) {
            $dirty3 |= 100663296;
            i3 = $dirty16;
        } else if (($changed & 100663296) == 0) {
            i3 = $dirty16;
            $dirty3 |= $composer4.changed(userScrollEnabled) ? 67108864 : 33554432;
        } else {
            i3 = $dirty16;
        }
        int i16 = i & 512;
        if (i16 != 0) {
            $dirty = $dirty3 | 805306368;
            i4 = i16;
        } else {
            if (($changed & 805306368) == 0) {
                i4 = i16;
                $dirty3 |= $composer4.changed(reverseLayout) ? PropertyOptions.DELETE_EXISTING : 268435456;
            } else {
                i4 = i16;
            }
            $dirty = $dirty3;
        }
        int $dirty4 = i & 1024;
        if ($dirty4 != 0) {
            $dirty1 = $changed1 | 6;
        } else if (($changed1 & 6) == 0) {
            $dirty1 = $changed1 | ($composer4.changedInstance(function1) ? 4 : 2);
        } else {
            $dirty1 = $changed1;
        }
        if (($changed1 & 48) == 0) {
            i5 = $dirty4;
            if ((i & 2048) == 0 && $composer4.changedInstance(pageNestedScrollConnection)) {
                i7 = 32;
                $dirty1 |= i7;
            }
            i7 = 16;
            $dirty1 |= i7;
        } else {
            i5 = $dirty4;
        }
        int $dirty17 = $dirty1;
        int i17 = i & 4096;
        if (i17 != 0) {
            $dirty12 = $dirty17 | 384;
        } else if (($changed1 & 384) == 0) {
            $dirty12 = $dirty17 | ($composer4.changed(snapPosition) ? 256 : 128);
        } else {
            $dirty12 = $dirty17;
        }
        if (($changed1 & 3072) == 0) {
            if ((i & 8192) == 0 && $composer4.changed(overscrollEffect)) {
                i12 = 2048;
            }
            $dirty12 |= i12;
        }
        int $dirty18 = $dirty12;
        if ((i & 16384) != 0) {
            $dirty18 |= 24576;
        } else if (($changed1 & 24576) == 0) {
            $dirty18 |= $composer4.changedInstance(function4) ? 16384 : 8192;
        }
        if ($composer4.shouldExecute((($dirty & 306783379) == 306783378 && ($dirty18 & 9363) == 9362) ? false : true, $dirty & 1)) {
            $composer4.startDefaults();
            ComposerKt.sourceInformation($composer4, "250@13920L28,255@14144L55,257@14296L26");
            if (($changed & 1) == 0 || $composer4.getDefaultsInvalid()) {
                if (i9 != 0) {
                    modifier2 = Modifier.Companion;
                }
                PaddingValues contentPadding4 = i10 != 0 ? PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(0)) : obj;
                PageSize pageSize4 = i11 != 0 ? PageSize.Fill.INSTANCE : obj2;
                int beyondViewportPageCount4 = i13 != 0 ? 0 : i2;
                float pageSpacing4 = i14 != 0 ? Dp.m6873constructorimpl(0) : f;
                if (i15 != 0) {
                    horizontalAlignment2 = Alignment.Companion.getCenterHorizontally();
                }
                if ((i & 128) != 0) {
                    i6 = i17;
                    $dirty13 = $dirty18;
                    pagerState = state;
                    flingBehavior3 = PagerDefaults.INSTANCE.flingBehavior(pagerState, null, null, null, 0.0f, $composer4, ($dirty & 14) | ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 30);
                    $dirty &= -29360129;
                } else {
                    pagerState = state;
                    i6 = i17;
                    $dirty13 = $dirty18;
                    flingBehavior3 = obj3;
                }
                boolean userScrollEnabled4 = i3 != 0 ? true : userScrollEnabled;
                reverseLayout3 = i4 != 0 ? false : reverseLayout;
                Function1 key3 = i5 != 0 ? null : function1;
                if ((i & 2048) != 0) {
                    pageNestedScrollConnection3 = PagerDefaults.INSTANCE.pageNestedScrollConnection(pagerState, Orientation.Vertical, $composer4, ($dirty & 14) | 432);
                    $dirty14 = $dirty13 & (-113);
                } else {
                    pageNestedScrollConnection3 = pageNestedScrollConnection;
                    $dirty14 = $dirty13;
                }
                SnapPosition.Start snapPosition4 = i6 != 0 ? SnapPosition.Start.INSTANCE : snapPosition;
                if ((i & 8192) != 0) {
                    key2 = key3;
                    $dirty15 = $dirty14 & (-7169);
                    overscrollEffect3 = OverscrollKt.rememberOverscrollEffect($composer4, 0);
                    pageNestedScrollConnection4 = pageNestedScrollConnection3;
                    pageSize3 = pageSize4;
                    pageSpacing3 = pageSpacing4;
                    flingBehavior4 = flingBehavior3;
                    $composer3 = $composer4;
                    modifier4 = modifier2;
                    horizontalAlignment4 = horizontalAlignment2;
                    userScrollEnabled3 = userScrollEnabled4;
                    snapPosition3 = snapPosition4;
                    contentPadding3 = contentPadding4;
                    beyondViewportPageCount3 = beyondViewportPageCount4;
                    $dirty2 = $dirty;
                } else {
                    key2 = key3;
                    pageNestedScrollConnection4 = pageNestedScrollConnection3;
                    $dirty15 = $dirty14;
                    pageSize3 = pageSize4;
                    pageSpacing3 = pageSpacing4;
                    overscrollEffect3 = overscrollEffect;
                    flingBehavior4 = flingBehavior3;
                    $composer3 = $composer4;
                    modifier4 = modifier2;
                    horizontalAlignment4 = horizontalAlignment2;
                    userScrollEnabled3 = userScrollEnabled4;
                    snapPosition3 = snapPosition4;
                    contentPadding3 = contentPadding4;
                    beyondViewportPageCount3 = beyondViewportPageCount4;
                    $dirty2 = $dirty;
                }
            } else {
                $composer4.skipToGroupEnd();
                if ((i & 128) != 0) {
                    $dirty &= -29360129;
                }
                if ((i & 2048) != 0) {
                    $dirty18 &= -113;
                }
                if ((i & 8192) != 0) {
                    $dirty18 &= -7169;
                }
                reverseLayout3 = reverseLayout;
                pageNestedScrollConnection4 = pageNestedScrollConnection;
                contentPadding3 = obj;
                pageSize3 = obj2;
                $composer3 = $composer4;
                pageSpacing3 = f;
                flingBehavior4 = obj3;
                $dirty2 = $dirty;
                userScrollEnabled3 = userScrollEnabled;
                key2 = function1;
                $dirty15 = $dirty18;
                beyondViewportPageCount3 = i2;
                modifier4 = modifier2;
                horizontalAlignment4 = horizontalAlignment2;
                snapPosition3 = snapPosition;
                overscrollEffect3 = overscrollEffect;
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                modifier5 = modifier4;
                ComposerKt.traceEventStart(632853564, $dirty2, $dirty15, "androidx.compose.foundation.pager.VerticalPager (Pager.kt:259)");
            } else {
                modifier5 = modifier4;
            }
            int $dirty19 = $dirty15;
            Orientation orientation = Orientation.Vertical;
            Alignment.Vertical centerVertically = Alignment.Companion.getCenterVertically();
            int i18 = (($dirty2 >> 3) & 14) | 24576 | (($dirty2 << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty2 & 896) | (($dirty2 >> 18) & 7168) | (($dirty2 >> 6) & 458752) | (($dirty2 >> 6) & 3670016) | (($dirty19 << 12) & 29360128) | (($dirty2 << 12) & 234881024) | (($dirty2 << 12) & 1879048192);
            int i19 = (($dirty2 >> 9) & 14) | 24576 | ($dirty19 & Property.BORDER_BOTTOM_RIGHT_RADIUS) | (($dirty19 << 6) & 896) | (($dirty2 >> 9) & 7168) | (($dirty19 << 9) & 458752) | (($dirty19 << 6) & 3670016);
            Modifier modifier6 = modifier5;
            LazyLayoutPagerKt.m1233PagereLwUrMk(modifier6, state, contentPadding3, reverseLayout3, orientation, flingBehavior4, userScrollEnabled3, overscrollEffect3, beyondViewportPageCount3, pageSpacing3, pageSize3, pageNestedScrollConnection4, key2, horizontalAlignment4, centerVertically, snapPosition3, function4, $composer3, i18, i19, 0);
            $composer2 = $composer3;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            int i20 = beyondViewportPageCount3;
            flingBehavior2 = flingBehavior4;
            beyondViewportPageCount2 = i20;
            float f2 = pageSpacing3;
            userScrollEnabled2 = userScrollEnabled3;
            pageSpacing2 = f2;
            Function1 function12 = key2;
            pageNestedScrollConnection2 = pageNestedScrollConnection4;
            key = function12;
            overscrollEffect2 = overscrollEffect3;
            pageSize2 = pageSize3;
            horizontalAlignment3 = horizontalAlignment4;
            snapPosition2 = snapPosition3;
            reverseLayout2 = reverseLayout3;
            contentPadding2 = contentPadding3;
            modifier3 = modifier6;
        } else {
            $composer2 = $composer4;
            $composer2.skipToGroupEnd();
            userScrollEnabled2 = userScrollEnabled;
            reverseLayout2 = reverseLayout;
            key = function1;
            overscrollEffect2 = overscrollEffect;
            contentPadding2 = obj;
            pageSize2 = obj2;
            beyondViewportPageCount2 = i2;
            pageSpacing2 = f;
            flingBehavior2 = obj3;
            modifier3 = modifier2;
            horizontalAlignment3 = horizontalAlignment2;
            pageNestedScrollConnection2 = pageNestedScrollConnection;
            snapPosition2 = snapPosition;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.pager.PagerKt$VerticalPager$1
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

                public final void invoke(Composer composer, int i21) {
                    PagerKt.m1239VerticalPager8jOkeI(PagerState.this, modifier3, contentPadding2, pageSize2, beyondViewportPageCount2, pageSpacing2, horizontalAlignment3, flingBehavior2, userScrollEnabled2, reverseLayout2, key, pageNestedScrollConnection2, snapPosition2, overscrollEffect2, function4, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Use the non deprecated overload")
    /* renamed from: VerticalPager-oI3XNZo  reason: not valid java name */
    public static final /* synthetic */ void m1240VerticalPageroI3XNZo(final PagerState state, Modifier modifier, PaddingValues contentPadding, PageSize pageSize, int beyondViewportPageCount, float pageSpacing, Alignment.Horizontal horizontalAlignment, TargetedFlingBehavior flingBehavior, boolean userScrollEnabled, boolean reverseLayout, Function1 key, NestedScrollConnection pageNestedScrollConnection, SnapPosition snapPosition, final Function4 pageContent, Composer $composer, final int $changed, final int $changed1, final int i) {
        Object obj;
        Object obj2;
        Object obj3;
        int i2;
        float f;
        Object horizontalAlignment2;
        Object obj4;
        int i3;
        int i4;
        int $dirty;
        int $dirty1;
        int i5;
        int $dirty12;
        Composer $composer2;
        final boolean reverseLayout2;
        final boolean reverseLayout3;
        final Function1 key2;
        final SnapPosition snapPosition2;
        final PaddingValues contentPadding2;
        final PageSize pageSize2;
        final int beyondViewportPageCount2;
        final float pageSpacing2;
        final Modifier modifier2;
        final TargetedFlingBehavior flingBehavior2;
        final Alignment.Horizontal horizontalAlignment3;
        final NestedScrollConnection pageNestedScrollConnection2;
        Modifier modifier3;
        PagerState pagerState;
        Composer $composer3;
        int $dirty13;
        TargetedFlingBehavior flingBehavior3;
        NestedScrollConnection pageNestedScrollConnection3;
        SnapPosition snapPosition3;
        TargetedFlingBehavior flingBehavior4;
        boolean userScrollEnabled2;
        boolean reverseLayout4;
        Function1 key3;
        NestedScrollConnection pageNestedScrollConnection4;
        PaddingValues contentPadding3;
        int $dirty14;
        PageSize pageSize3;
        int beyondViewportPageCount3;
        float pageSpacing3;
        int $dirty2;
        boolean reverseLayout5;
        int i6;
        int i7;
        Composer $composer4 = $composer.startRestartGroup(909160706);
        ComposerKt.sourceInformation($composer4, "C(VerticalPager)P(12,5,1,8!1,9:c#ui.unit.Dp,3!1,13,10!1,7,11)314@16560L26,300@16005L622:Pager.kt#g6yjnt");
        int $dirty3 = $changed;
        if ((i & 1) != 0) {
            $dirty3 |= 6;
        } else if (($changed & 6) == 0) {
            $dirty3 |= $composer4.changed(state) ? 4 : 2;
        }
        int i8 = i & 2;
        if (i8 != 0) {
            $dirty3 |= 48;
            obj = modifier;
        } else if (($changed & 48) == 0) {
            obj = modifier;
            $dirty3 |= $composer4.changed(obj) ? 32 : 16;
        } else {
            obj = modifier;
        }
        int i9 = i & 4;
        if (i9 != 0) {
            $dirty3 |= 384;
            obj2 = contentPadding;
        } else if (($changed & 384) == 0) {
            obj2 = contentPadding;
            $dirty3 |= $composer4.changed(obj2) ? 256 : 128;
        } else {
            obj2 = contentPadding;
        }
        int i10 = i & 8;
        if (i10 != 0) {
            $dirty3 |= 3072;
            obj3 = pageSize;
        } else if (($changed & 3072) == 0) {
            obj3 = pageSize;
            $dirty3 |= $composer4.changed(obj3) ? 2048 : 1024;
        } else {
            obj3 = pageSize;
        }
        int i11 = i & 16;
        if (i11 != 0) {
            $dirty3 |= 24576;
            i2 = beyondViewportPageCount;
        } else if (($changed & 24576) == 0) {
            i2 = beyondViewportPageCount;
            $dirty3 |= $composer4.changed(i2) ? 16384 : 8192;
        } else {
            i2 = beyondViewportPageCount;
        }
        int i12 = i & 32;
        if (i12 != 0) {
            $dirty3 |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            f = pageSpacing;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            f = pageSpacing;
            $dirty3 |= $composer4.changed(f) ? 131072 : 65536;
        } else {
            f = pageSpacing;
        }
        int i13 = i & 64;
        if (i13 != 0) {
            $dirty3 |= 1572864;
            horizontalAlignment2 = horizontalAlignment;
        } else if (($changed & 1572864) == 0) {
            horizontalAlignment2 = horizontalAlignment;
            $dirty3 |= $composer4.changed(horizontalAlignment2) ? 1048576 : 524288;
        } else {
            horizontalAlignment2 = horizontalAlignment;
        }
        if (($changed & 12582912) == 0) {
            if ((i & 128) == 0) {
                obj4 = flingBehavior;
                if ($composer4.changed(obj4)) {
                    i7 = 8388608;
                    $dirty3 |= i7;
                }
            } else {
                obj4 = flingBehavior;
            }
            i7 = 4194304;
            $dirty3 |= i7;
        } else {
            obj4 = flingBehavior;
        }
        int $dirty15 = i & 256;
        if ($dirty15 != 0) {
            $dirty3 |= 100663296;
            i3 = $dirty15;
        } else if (($changed & 100663296) == 0) {
            i3 = $dirty15;
            $dirty3 |= $composer4.changed(userScrollEnabled) ? 67108864 : 33554432;
        } else {
            i3 = $dirty15;
        }
        int i14 = i & 512;
        if (i14 != 0) {
            $dirty = $dirty3 | 805306368;
            i4 = i14;
        } else {
            if (($changed & 805306368) == 0) {
                i4 = i14;
                $dirty3 |= $composer4.changed(reverseLayout) ? PropertyOptions.DELETE_EXISTING : 268435456;
            } else {
                i4 = i14;
            }
            $dirty = $dirty3;
        }
        int $dirty4 = i & 1024;
        if ($dirty4 != 0) {
            $dirty1 = $changed1 | 6;
        } else if (($changed1 & 6) == 0) {
            $dirty1 = $changed1 | ($composer4.changedInstance(key) ? 4 : 2);
        } else {
            $dirty1 = $changed1;
        }
        if (($changed1 & 48) == 0) {
            i5 = $dirty4;
            if ((i & 2048) == 0 && $composer4.changedInstance(pageNestedScrollConnection)) {
                i6 = 32;
                $dirty1 |= i6;
            }
            i6 = 16;
            $dirty1 |= i6;
        } else {
            i5 = $dirty4;
        }
        int $dirty16 = $dirty1;
        int i15 = i & 4096;
        if (i15 != 0) {
            $dirty12 = $dirty16 | 384;
        } else if (($changed1 & 384) == 0) {
            $dirty12 = $dirty16 | ($composer4.changed(snapPosition) ? 256 : 128);
        } else {
            $dirty12 = $dirty16;
        }
        if ((i & 8192) != 0) {
            $dirty12 |= 3072;
        } else if (($changed1 & 3072) == 0) {
            $dirty12 |= $composer4.changedInstance(pageContent) ? 2048 : 1024;
        }
        if ($composer4.shouldExecute((($dirty & 306783379) == 306783378 && ($dirty12 & 1171) == 1170) ? false : true, $dirty & 1)) {
            $composer4.startDefaults();
            ComposerKt.sourceInformation($composer4, "291@15603L28,296@15827L55");
            if (($changed & 1) == 0 || $composer4.getDefaultsInvalid()) {
                modifier3 = i8 != 0 ? Modifier.Companion : obj;
                PaddingValues contentPadding4 = i9 != 0 ? PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(0)) : obj2;
                PageSize pageSize4 = i10 != 0 ? PageSize.Fill.INSTANCE : obj3;
                int beyondViewportPageCount4 = i11 != 0 ? 0 : i2;
                float pageSpacing4 = i12 != 0 ? Dp.m6873constructorimpl(0) : f;
                if (i13 != 0) {
                    horizontalAlignment2 = Alignment.Companion.getCenterHorizontally();
                }
                if ((i & 128) != 0) {
                    $composer3 = $composer4;
                    $dirty13 = $dirty12;
                    pagerState = state;
                    flingBehavior3 = PagerDefaults.INSTANCE.flingBehavior(pagerState, null, null, null, 0.0f, $composer3, ($dirty & 14) | ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 30);
                    $dirty &= -29360129;
                } else {
                    pagerState = state;
                    $composer3 = $composer4;
                    $dirty13 = $dirty12;
                    flingBehavior3 = obj4;
                }
                boolean userScrollEnabled3 = i3 != 0 ? true : userScrollEnabled;
                boolean reverseLayout6 = i4 != 0 ? false : reverseLayout;
                Function1 key4 = i5 != 0 ? null : key;
                if ((i & 2048) != 0) {
                    pageNestedScrollConnection3 = PagerDefaults.INSTANCE.pageNestedScrollConnection(pagerState, Orientation.Vertical, $composer3, ($dirty & 14) | 432);
                    $dirty13 &= -113;
                } else {
                    pageNestedScrollConnection3 = pageNestedScrollConnection;
                }
                if (i15 != 0) {
                    userScrollEnabled2 = userScrollEnabled3;
                    key3 = key4;
                    pageNestedScrollConnection4 = pageNestedScrollConnection3;
                    snapPosition3 = SnapPosition.Start.INSTANCE;
                    contentPadding3 = contentPadding4;
                    $dirty14 = $dirty13;
                    beyondViewportPageCount3 = beyondViewportPageCount4;
                    pageSpacing3 = pageSpacing4;
                    $dirty2 = $dirty;
                    flingBehavior4 = flingBehavior3;
                    reverseLayout4 = reverseLayout6;
                    pageSize3 = pageSize4;
                } else {
                    snapPosition3 = snapPosition;
                    flingBehavior4 = flingBehavior3;
                    userScrollEnabled2 = userScrollEnabled3;
                    reverseLayout4 = reverseLayout6;
                    key3 = key4;
                    pageNestedScrollConnection4 = pageNestedScrollConnection3;
                    contentPadding3 = contentPadding4;
                    $dirty14 = $dirty13;
                    pageSize3 = pageSize4;
                    beyondViewportPageCount3 = beyondViewportPageCount4;
                    pageSpacing3 = pageSpacing4;
                    $dirty2 = $dirty;
                }
            } else {
                $composer4.skipToGroupEnd();
                if ((i & 128) != 0) {
                    $dirty &= -29360129;
                }
                if ((i & 2048) != 0) {
                    $dirty12 &= -113;
                }
                key3 = key;
                pageNestedScrollConnection4 = pageNestedScrollConnection;
                $dirty14 = $dirty12;
                contentPadding3 = obj2;
                pageSize3 = obj3;
                beyondViewportPageCount3 = i2;
                pageSpacing3 = f;
                modifier3 = obj;
                flingBehavior4 = obj4;
                $composer3 = $composer4;
                $dirty2 = $dirty;
                userScrollEnabled2 = userScrollEnabled;
                reverseLayout4 = reverseLayout;
                snapPosition3 = snapPosition;
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                reverseLayout5 = reverseLayout4;
                ComposerKt.traceEventStart(909160706, $dirty2, $dirty14, "androidx.compose.foundation.pager.VerticalPager (Pager.kt:299)");
            } else {
                reverseLayout5 = reverseLayout4;
            }
            Modifier modifier4 = modifier3;
            boolean reverseLayout7 = reverseLayout5;
            Composer $composer5 = $composer3;
            Alignment.Horizontal horizontalAlignment4 = horizontalAlignment2;
            m1239VerticalPager8jOkeI(state, modifier4, contentPadding3, pageSize3, beyondViewportPageCount3, pageSpacing3, horizontalAlignment4, flingBehavior4, userScrollEnabled2, reverseLayout7, key3, pageNestedScrollConnection4, snapPosition3, OverscrollKt.rememberOverscrollEffect($composer3, 0), pageContent, $composer5, ($dirty2 & 896) | ($dirty2 & 14) | ($dirty2 & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty2 & 7168) | (57344 & $dirty2) | (458752 & $dirty2) | (3670016 & $dirty2) | (29360128 & $dirty2) | (234881024 & $dirty2) | (1879048192 & $dirty2), ($dirty14 & 14) | ($dirty14 & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty14 & 896) | (($dirty14 << 3) & 57344), 0);
            $composer2 = $composer5;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            snapPosition2 = snapPosition3;
            pageNestedScrollConnection2 = pageNestedScrollConnection4;
            key2 = key3;
            reverseLayout3 = reverseLayout7;
            reverseLayout2 = userScrollEnabled2;
            flingBehavior2 = flingBehavior4;
            horizontalAlignment3 = horizontalAlignment4;
            pageSpacing2 = pageSpacing3;
            beyondViewportPageCount2 = beyondViewportPageCount3;
            pageSize2 = pageSize3;
            contentPadding2 = contentPadding3;
            modifier2 = modifier4;
        } else {
            $composer2 = $composer4;
            $composer2.skipToGroupEnd();
            reverseLayout2 = userScrollEnabled;
            reverseLayout3 = reverseLayout;
            key2 = key;
            snapPosition2 = snapPosition;
            contentPadding2 = obj2;
            pageSize2 = obj3;
            beyondViewportPageCount2 = i2;
            pageSpacing2 = f;
            modifier2 = obj;
            flingBehavior2 = obj4;
            horizontalAlignment3 = horizontalAlignment2;
            pageNestedScrollConnection2 = pageNestedScrollConnection;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.pager.PagerKt$VerticalPager$2
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

                public final void invoke(Composer composer, int i16) {
                    PagerKt.m1240VerticalPageroI3XNZo(PagerState.this, modifier2, contentPadding2, pageSize2, beyondViewportPageCount2, pageSpacing2, horizontalAlignment3, flingBehavior2, reverseLayout2, reverseLayout3, key2, pageNestedScrollConnection2, snapPosition2, pageContent, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }

    public static final int currentPageOffset(SnapPosition $this$currentPageOffset, int layoutSize, int pageSize, int spaceBetweenPages, int beforeContentPadding, int afterContentPadding, int currentPage, float currentPageOffsetFraction, int pageCount) {
        int snapOffset = $this$currentPageOffset.position(layoutSize, pageSize, beforeContentPadding, afterContentPadding, currentPage, pageCount);
        return MathKt.roundToInt(snapOffset - ((pageSize + spaceBetweenPages) * currentPageOffsetFraction));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean pagerSemantics$performForwardPaging(PagerState $state, CoroutineScope $scope) {
        if ($state.getCanScrollForward()) {
            BuildersKt__Builders_commonKt.launch$default($scope, null, null, new PagerKt$pagerSemantics$performForwardPaging$1($state, null), 3, null);
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean pagerSemantics$performBackwardPaging(PagerState $state, CoroutineScope $scope) {
        if ($state.getCanScrollBackward()) {
            BuildersKt__Builders_commonKt.launch$default($scope, null, null, new PagerKt$pagerSemantics$performBackwardPaging$1($state, null), 3, null);
            return true;
        }
        return false;
    }

    public static final Modifier pagerSemantics(Modifier $this$pagerSemantics, final PagerState state, final boolean isVertical, final CoroutineScope scope, boolean userScrollEnabled) {
        if (userScrollEnabled) {
            return $this$pagerSemantics.then(SemanticsModifierKt.semantics$default(Modifier.Companion, false, new Function1<SemanticsPropertyReceiver, Unit>() { // from class: androidx.compose.foundation.pager.PagerKt$pagerSemantics$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(SemanticsPropertyReceiver semanticsPropertyReceiver) {
                    invoke2(semanticsPropertyReceiver);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(SemanticsPropertyReceiver $this$semantics) {
                    if (isVertical) {
                        final PagerState pagerState = state;
                        final CoroutineScope coroutineScope = scope;
                        SemanticsPropertiesKt.pageUp$default($this$semantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.pager.PagerKt$pagerSemantics$1.1
                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            {
                                super(0);
                            }

                            /* JADX WARN: Can't rename method to resolve collision */
                            @Override // kotlin.jvm.functions.Function0
                            public final Boolean invoke() {
                                boolean pagerSemantics$performBackwardPaging;
                                pagerSemantics$performBackwardPaging = PagerKt.pagerSemantics$performBackwardPaging(PagerState.this, coroutineScope);
                                return Boolean.valueOf(pagerSemantics$performBackwardPaging);
                            }
                        }, 1, null);
                        final PagerState pagerState2 = state;
                        final CoroutineScope coroutineScope2 = scope;
                        SemanticsPropertiesKt.pageDown$default($this$semantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.pager.PagerKt$pagerSemantics$1.2
                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            {
                                super(0);
                            }

                            /* JADX WARN: Can't rename method to resolve collision */
                            @Override // kotlin.jvm.functions.Function0
                            public final Boolean invoke() {
                                boolean pagerSemantics$performForwardPaging;
                                pagerSemantics$performForwardPaging = PagerKt.pagerSemantics$performForwardPaging(PagerState.this, coroutineScope2);
                                return Boolean.valueOf(pagerSemantics$performForwardPaging);
                            }
                        }, 1, null);
                        return;
                    }
                    final PagerState pagerState3 = state;
                    final CoroutineScope coroutineScope3 = scope;
                    SemanticsPropertiesKt.pageLeft$default($this$semantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.pager.PagerKt$pagerSemantics$1.3
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        {
                            super(0);
                        }

                        /* JADX WARN: Can't rename method to resolve collision */
                        @Override // kotlin.jvm.functions.Function0
                        public final Boolean invoke() {
                            boolean pagerSemantics$performBackwardPaging;
                            pagerSemantics$performBackwardPaging = PagerKt.pagerSemantics$performBackwardPaging(PagerState.this, coroutineScope3);
                            return Boolean.valueOf(pagerSemantics$performBackwardPaging);
                        }
                    }, 1, null);
                    final PagerState pagerState4 = state;
                    final CoroutineScope coroutineScope4 = scope;
                    SemanticsPropertiesKt.pageRight$default($this$semantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.pager.PagerKt$pagerSemantics$1.4
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        {
                            super(0);
                        }

                        /* JADX WARN: Can't rename method to resolve collision */
                        @Override // kotlin.jvm.functions.Function0
                        public final Boolean invoke() {
                            boolean pagerSemantics$performForwardPaging;
                            pagerSemantics$performForwardPaging = PagerKt.pagerSemantics$performForwardPaging(PagerState.this, coroutineScope4);
                            return Boolean.valueOf(pagerSemantics$performForwardPaging);
                        }
                    }, 1, null);
                }
            }, 1, null));
        }
        return $this$pagerSemantics.then(Modifier.Companion);
    }

    private static final void debugLog(Function0<String> function0) {
    }
}
