package androidx.compose.foundation.pager;

import androidx.compose.animation.core.AnimationSpec;
import androidx.compose.animation.core.AnimationSpecKt;
import androidx.compose.foundation.MutatePriority;
import androidx.compose.foundation.gestures.Orientation;
import androidx.compose.foundation.gestures.ScrollScope;
import androidx.compose.foundation.gestures.ScrollableState;
import androidx.compose.foundation.gestures.ScrollableStateKt;
import androidx.compose.foundation.interaction.InteractionSource;
import androidx.compose.foundation.interaction.InteractionSourceKt;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.internal.InlineClassHelperKt;
import androidx.compose.foundation.lazy.layout.AwaitFirstLayoutModifier;
import androidx.compose.foundation.lazy.layout.LazyLayoutBeyondBoundsInfo;
import androidx.compose.foundation.lazy.layout.LazyLayoutPinnedItemList;
import androidx.compose.foundation.lazy.layout.LazyLayoutPrefetchState;
import androidx.compose.foundation.lazy.layout.NestedPrefetchScope;
import androidx.compose.foundation.lazy.layout.ObservableScopeInvalidator;
import androidx.compose.foundation.lazy.layout.PrefetchScheduler;
import androidx.compose.runtime.IntState;
import androidx.compose.runtime.MutableIntState;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotIntStateKt;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.snapshots.Snapshot;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.layout.Remeasurement;
import androidx.compose.ui.layout.RemeasurementModifier;
import androidx.compose.ui.unit.ConstraintsKt;
import androidx.compose.ui.unit.Density;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.math.MathKt;
import kotlin.ranges.IntRange;
import kotlin.ranges.RangesKt;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
/* compiled from: PagerState.kt */
@Metadata(d1 = {"\u0000ô\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\t\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\f\b'\u0018\u00002\u00020\u0001B\u001b\b\u0016\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0003\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006B'\b\u0000\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0003\u0010\u0004\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\u0002\u0010\tJ7\u0010¦\u0001\u001a\u00030§\u00012\u0007\u0010¨\u0001\u001a\u00020\u00032\t\b\u0003\u0010©\u0001\u001a\u00020\u00052\u0010\b\u0002\u0010ª\u0001\u001a\t\u0012\u0004\u0012\u00020\u00050«\u0001H\u0086@¢\u0006\u0003\u0010¬\u0001J-\u0010\u00ad\u0001\u001a\u00030§\u00012\u0007\u0010®\u0001\u001a\u00020\f2\u0007\u0010¯\u0001\u001a\u00020\u00182\t\b\u0002\u0010°\u0001\u001a\u00020\u0018H\u0000¢\u0006\u0003\b±\u0001J\u0011\u0010²\u0001\u001a\u00030§\u0001H\u0082@¢\u0006\u0003\u0010³\u0001J\u0013\u0010´\u0001\u001a\u00030§\u00012\u0007\u0010µ\u0001\u001a\u00020HH\u0002J\u0012\u0010¶\u0001\u001a\u00020\u00052\u0007\u0010·\u0001\u001a\u00020\u0005H\u0016J\u0010\u0010¸\u0001\u001a\u00020\u00052\u0007\u0010¨\u0001\u001a\u00020\u0003J\u0012\u0010¹\u0001\u001a\u00020\u00182\u0007\u0010º\u0001\u001a\u00020\u0005H\u0002J\u000f\u0010»\u0001\u001a\u00020\u0018H\u0000¢\u0006\u0003\b¼\u0001J#\u0010½\u0001\u001a\u00020\u00032\b\u0010¾\u0001\u001a\u00030¿\u00012\b\b\u0002\u0010\u0002\u001a\u00020\u0003H\u0000¢\u0006\u0003\bÀ\u0001J\u001c\u0010Á\u0001\u001a\u00030§\u00012\u0007\u0010·\u0001\u001a\u00020\u00052\u0007\u0010µ\u0001\u001a\u00020HH\u0002J\u0012\u0010Â\u0001\u001a\u00020\u00052\u0007\u0010·\u0001\u001a\u00020\u0005H\u0002J\u001e\u0010Ã\u0001\u001a\u00030§\u00012\t\b\u0001\u0010¨\u0001\u001a\u00020\u00032\t\b\u0003\u0010©\u0001\u001a\u00020\u0005JK\u0010Ä\u0001\u001a\u00030§\u00012\b\u0010Å\u0001\u001a\u00030Æ\u00012.\u0010Ç\u0001\u001a)\b\u0001\u0012\u0005\u0012\u00030É\u0001\u0012\f\u0012\n\u0012\u0005\u0012\u00030§\u00010Ê\u0001\u0012\u0007\u0012\u0005\u0018\u00010Ë\u00010È\u0001¢\u0006\u0003\bÌ\u0001H\u0096@¢\u0006\u0003\u0010Í\u0001J%\u0010Î\u0001\u001a\u00030§\u00012\u0007\u0010¨\u0001\u001a\u00020\u00032\t\b\u0003\u0010©\u0001\u001a\u00020\u0005H\u0086@¢\u0006\u0003\u0010Ï\u0001J+\u0010Ð\u0001\u001a\u00030§\u00012\u0007\u0010¨\u0001\u001a\u00020\u00032\u0007\u0010Ñ\u0001\u001a\u00020\u00052\u0007\u0010Ò\u0001\u001a\u00020\u0018H\u0000¢\u0006\u0003\bÓ\u0001J\u0013\u0010Ô\u0001\u001a\u00030§\u00012\u0007\u0010®\u0001\u001a\u00020\fH\u0002J\r\u0010Õ\u0001\u001a\u00020\u0003*\u00020\u0003H\u0002J!\u0010Ö\u0001\u001a\u00030§\u0001*\u00030É\u00012\u0007\u0010¨\u0001\u001a\u00020\u00032\t\b\u0003\u0010©\u0001\u001a\u00020\u0005J\u0016\u0010×\u0001\u001a\u00030§\u0001*\u00030É\u00012\u0007\u0010\u009d\u0001\u001a\u00020\u0003R\u000e\u0010\n\u001a\u00020\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\"\u0010\r\u001a\u0004\u0018\u00010\f2\b\u0010\u000b\u001a\u0004\u0018\u00010\f@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0014\u0010\u0010\u001a\u00020\u0011X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0014\u0010\u0014\u001a\u00020\u0015X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R+\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u000b\u001a\u00020\u00188F@BX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b\u001e\u0010\u001f\u001a\u0004\b\u001a\u0010\u001b\"\u0004\b\u001c\u0010\u001dR+\u0010 \u001a\u00020\u00182\u0006\u0010\u000b\u001a\u00020\u00188F@BX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b#\u0010\u001f\u001a\u0004\b!\u0010\u001b\"\u0004\b\"\u0010\u001dR\u0011\u0010\u0002\u001a\u00020\u00038F¢\u0006\u0006\u001a\u0004\b$\u0010%R\u0011\u0010\u0004\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b&\u0010'R\u0010\u0010(\u001a\u0004\u0018\u00010)X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010*\u001a\u00020+X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b,\u0010-\"\u0004\b.\u0010/R\u001e\u00100\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0003@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\b1\u0010%R\u001e\u00102\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0003@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\b3\u0010%R\u001e\u00104\u001a\u00020\u00182\u0006\u0010\u000b\u001a\u00020\u0018@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\b5\u0010\u001bR\u000e\u00106\u001a\u00020\u0003X\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u00107\u001a\u0002088F¢\u0006\u0006\u001a\u0004\b9\u0010:R\u0014\u0010;\u001a\u00020<X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b=\u0010>R\u0014\u0010?\u001a\b\u0012\u0004\u0012\u00020\u00180@X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010A\u001a\b\u0012\u0004\u0012\u00020\u00180@X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010B\u001a\u00020\u00188VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bB\u0010\u001bR\u0014\u0010C\u001a\u00020\u00188VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bD\u0010\u001bR\u0014\u0010E\u001a\u00020\u00188VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bF\u0010\u001bR\u0011\u0010G\u001a\u00020H8F¢\u0006\u0006\u001a\u0004\bI\u0010JR\u001e\u0010K\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0003@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\bL\u0010%R\u000e\u0010M\u001a\u00020\u0003X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010N\u001a\u00020OX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bP\u0010Q\"\u0004\bR\u0010SR\u001c\u0010T\u001a\u00020UX\u0080\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u001f\u001a\u0004\bV\u0010WR\u001a\u0010X\u001a\u00020OX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bY\u0010Q\"\u0004\bZ\u0010SR\u001b\u0010[\u001a\u00020\\8@X\u0080\u0084\u0002¢\u0006\f\u001a\u0004\b_\u0010`*\u0004\b]\u0010^R\u0014\u0010a\u001a\u00020\u00038@X\u0080\u0004¢\u0006\u0006\u001a\u0004\bb\u0010%R\u0012\u0010c\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\bd\u0010%R\u0014\u0010e\u001a\u00020\u00038@X\u0080\u0004¢\u0006\u0006\u001a\u0004\bf\u0010%R\u0014\u0010g\u001a\u00020\u00038@X\u0080\u0004¢\u0006\u0006\u001a\u0004\bh\u0010%R\u0014\u0010i\u001a\u00020\u00038@X\u0080\u0004¢\u0006\u0006\u001a\u0004\bj\u0010%R\u0014\u0010k\u001a\b\u0012\u0004\u0012\u00020\f0@X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010l\u001a\u00020mX\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\bn\u0010oR\u001c\u0010p\u001a\u00020UX\u0080\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u001f\u001a\u0004\bq\u0010WR\u0014\u0010r\u001a\u00020\u00058@X\u0080\u0004¢\u0006\u0006\u001a\u0004\bs\u0010'R\u0014\u0010t\u001a\u00020uX\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\bv\u0010wR\u001a\u0010x\u001a\u00020\u0018X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\by\u0010\u001b\"\u0004\bz\u0010\u001dR\"\u0010{\u001a\u00020|X\u0080\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\u007f\u001a\u0004\b}\u0010Q\"\u0004\b~\u0010SR\u000f\u0010\u0080\u0001\u001a\u00020\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R1\u0010\u0081\u0001\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u00038B@BX\u0082\u008e\u0002¢\u0006\u0017\n\u0006\b\u0085\u0001\u0010\u0086\u0001\u001a\u0005\b\u0082\u0001\u0010%\"\u0006\b\u0083\u0001\u0010\u0084\u0001R7\u0010\u0088\u0001\u001a\u0005\u0018\u00010\u0087\u00012\t\u0010\u000b\u001a\u0005\u0018\u00010\u0087\u00018@@BX\u0080\u008e\u0002¢\u0006\u0017\n\u0005\b\u008d\u0001\u0010\u001f\u001a\u0006\b\u0089\u0001\u0010\u008a\u0001\"\u0006\b\u008b\u0001\u0010\u008c\u0001R\u0018\u0010\u008e\u0001\u001a\u00030\u008f\u0001X\u0080\u0004¢\u0006\n\n\u0000\u001a\u0006\b\u0090\u0001\u0010\u0091\u0001R\u0010\u0010\u0092\u0001\u001a\u00030\u0093\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u000f\u0010\u0094\u0001\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u001f\u0010\u0095\u0001\u001a\u00020\u00038FX\u0086\u0084\u0002¢\u0006\u000f\n\u0006\b\u0097\u0001\u0010\u0098\u0001\u001a\u0005\b\u0096\u0001\u0010%R1\u0010\u0099\u0001\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u00038B@BX\u0082\u008e\u0002¢\u0006\u0017\n\u0006\b\u009c\u0001\u0010\u0086\u0001\u001a\u0005\b\u009a\u0001\u0010%\"\u0006\b\u009b\u0001\u0010\u0084\u0001R\u001f\u0010\u009d\u0001\u001a\u00020\u00038FX\u0086\u0084\u0002¢\u0006\u000f\n\u0006\b\u009f\u0001\u0010\u0098\u0001\u001a\u0005\b\u009e\u0001\u0010%R7\u0010¡\u0001\u001a\u00030 \u00012\u0007\u0010\u000b\u001a\u00030 \u00018@@@X\u0080\u008e\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0015\n\u0005\b¤\u0001\u0010\u001f\u001a\u0005\b¢\u0001\u0010Q\"\u0005\b£\u0001\u0010SR\u000f\u0010¥\u0001\u001a\u00020\u0018X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006Ø\u0001"}, d2 = {"Landroidx/compose/foundation/pager/PagerState;", "Landroidx/compose/foundation/gestures/ScrollableState;", "currentPage", "", "currentPageOffsetFraction", "", "(IF)V", "prefetchScheduler", "Landroidx/compose/foundation/lazy/layout/PrefetchScheduler;", "(IFLandroidx/compose/foundation/lazy/layout/PrefetchScheduler;)V", "accumulator", "<set-?>", "Landroidx/compose/foundation/pager/PagerMeasureResult;", "approachLayoutInfo", "getApproachLayoutInfo$foundation_release", "()Landroidx/compose/foundation/pager/PagerMeasureResult;", "awaitLayoutModifier", "Landroidx/compose/foundation/lazy/layout/AwaitFirstLayoutModifier;", "getAwaitLayoutModifier$foundation_release", "()Landroidx/compose/foundation/lazy/layout/AwaitFirstLayoutModifier;", "beyondBoundsInfo", "Landroidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsInfo;", "getBeyondBoundsInfo$foundation_release", "()Landroidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsInfo;", "", "canScrollBackward", "getCanScrollBackward", "()Z", "setCanScrollBackward", "(Z)V", "canScrollBackward$delegate", "Landroidx/compose/runtime/MutableState;", "canScrollForward", "getCanScrollForward", "setCanScrollForward", "canScrollForward$delegate", "getCurrentPage", "()I", "getCurrentPageOffsetFraction", "()F", "currentPrefetchHandle", "Landroidx/compose/foundation/lazy/layout/LazyLayoutPrefetchState$PrefetchHandle;", "density", "Landroidx/compose/ui/unit/Density;", "getDensity$foundation_release", "()Landroidx/compose/ui/unit/Density;", "setDensity$foundation_release", "(Landroidx/compose/ui/unit/Density;)V", "firstVisiblePage", "getFirstVisiblePage$foundation_release", "firstVisiblePageOffset", "getFirstVisiblePageOffset$foundation_release", "hasLookaheadOccurred", "getHasLookaheadOccurred$foundation_release", "indexToPrefetch", "interactionSource", "Landroidx/compose/foundation/interaction/InteractionSource;", "getInteractionSource", "()Landroidx/compose/foundation/interaction/InteractionSource;", "internalInteractionSource", "Landroidx/compose/foundation/interaction/MutableInteractionSource;", "getInternalInteractionSource$foundation_release", "()Landroidx/compose/foundation/interaction/MutableInteractionSource;", "isLastScrollBackwardState", "Landroidx/compose/runtime/MutableState;", "isLastScrollForwardState", "isScrollInProgress", "lastScrolledBackward", "getLastScrolledBackward", "lastScrolledForward", "getLastScrolledForward", "layoutInfo", "Landroidx/compose/foundation/pager/PagerLayoutInfo;", "getLayoutInfo", "()Landroidx/compose/foundation/pager/PagerLayoutInfo;", "layoutWithMeasurement", "getLayoutWithMeasurement$foundation_release", "layoutWithoutMeasurement", "maxScrollOffset", "", "getMaxScrollOffset$foundation_release", "()J", "setMaxScrollOffset$foundation_release", "(J)V", "measurementScopeInvalidator", "Landroidx/compose/foundation/lazy/layout/ObservableScopeInvalidator;", "getMeasurementScopeInvalidator-zYiylxw$foundation_release", "()Landroidx/compose/runtime/MutableState;", "minScrollOffset", "getMinScrollOffset$foundation_release", "setMinScrollOffset$foundation_release", "nearestRange", "Lkotlin/ranges/IntRange;", "getNearestRange$foundation_release$delegate", "(Landroidx/compose/foundation/pager/PagerState;)Ljava/lang/Object;", "getNearestRange$foundation_release", "()Lkotlin/ranges/IntRange;", "numMeasurePasses", "getNumMeasurePasses$foundation_release", "pageCount", "getPageCount", "pageSize", "getPageSize$foundation_release", "pageSizeWithSpacing", "getPageSizeWithSpacing$foundation_release", "pageSpacing", "getPageSpacing$foundation_release", "pagerLayoutInfoState", "pinnedPages", "Landroidx/compose/foundation/lazy/layout/LazyLayoutPinnedItemList;", "getPinnedPages$foundation_release", "()Landroidx/compose/foundation/lazy/layout/LazyLayoutPinnedItemList;", "placementScopeInvalidator", "getPlacementScopeInvalidator-zYiylxw$foundation_release", "positionThresholdFraction", "getPositionThresholdFraction$foundation_release", "prefetchState", "Landroidx/compose/foundation/lazy/layout/LazyLayoutPrefetchState;", "getPrefetchState$foundation_release", "()Landroidx/compose/foundation/lazy/layout/LazyLayoutPrefetchState;", "prefetchingEnabled", "getPrefetchingEnabled$foundation_release", "setPrefetchingEnabled$foundation_release", "premeasureConstraints", "Landroidx/compose/ui/unit/Constraints;", "getPremeasureConstraints-msEJaDk$foundation_release", "setPremeasureConstraints-BRTryo0$foundation_release", "J", "previousPassDelta", "programmaticScrollTargetPage", "getProgrammaticScrollTargetPage", "setProgrammaticScrollTargetPage", "(I)V", "programmaticScrollTargetPage$delegate", "Landroidx/compose/runtime/MutableIntState;", "Landroidx/compose/ui/layout/Remeasurement;", "remeasurement", "getRemeasurement$foundation_release", "()Landroidx/compose/ui/layout/Remeasurement;", "setRemeasurement", "(Landroidx/compose/ui/layout/Remeasurement;)V", "remeasurement$delegate", "remeasurementModifier", "Landroidx/compose/ui/layout/RemeasurementModifier;", "getRemeasurementModifier$foundation_release", "()Landroidx/compose/ui/layout/RemeasurementModifier;", "scrollPosition", "Landroidx/compose/foundation/pager/PagerScrollPosition;", "scrollableState", "settledPage", "getSettledPage", "settledPage$delegate", "Landroidx/compose/runtime/State;", "settledPageState", "getSettledPageState", "setSettledPageState", "settledPageState$delegate", "targetPage", "getTargetPage", "targetPage$delegate", "Landroidx/compose/ui/geometry/Offset;", "upDownDifference", "getUpDownDifference-F1C5BW0$foundation_release", "setUpDownDifference-k-4lQ0M$foundation_release", "upDownDifference$delegate", "wasPrefetchingForward", "animateScrollToPage", "", "page", "pageOffsetFraction", "animationSpec", "Landroidx/compose/animation/core/AnimationSpec;", "(IFLandroidx/compose/animation/core/AnimationSpec;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "applyMeasureResult", "result", "isLookingAhead", "visibleItemsStayedTheSame", "applyMeasureResult$foundation_release", "awaitScrollDependencies", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "cancelPrefetchIfVisibleItemsChanged", "info", "dispatchRawDelta", "delta", "getOffsetDistanceInPages", "isGestureActionMatchesScroll", "scrollDelta", "isNotGestureAction", "isNotGestureAction$foundation_release", "matchScrollPositionWithKey", "itemProvider", "Landroidx/compose/foundation/pager/PagerLazyLayoutItemProvider;", "matchScrollPositionWithKey$foundation_release", "notifyPrefetch", "performScroll", "requestScrollToPage", "scroll", "scrollPriority", "Landroidx/compose/foundation/MutatePriority;", "block", "Lkotlin/Function2;", "Landroidx/compose/foundation/gestures/ScrollScope;", "Lkotlin/coroutines/Continuation;", "", "Lkotlin/ExtensionFunctionType;", "(Landroidx/compose/foundation/MutatePriority;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "scrollToPage", "(IFLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "snapToItem", "offsetFraction", "forceRemeasure", "snapToItem$foundation_release", "tryRunPrefetch", "coerceInPageRange", "updateCurrentPage", "updateTargetPage", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public abstract class PagerState implements ScrollableState {
    public static final int $stable = 0;
    private float accumulator;
    private PagerMeasureResult approachLayoutInfo;
    private final AwaitFirstLayoutModifier awaitLayoutModifier;
    private final LazyLayoutBeyondBoundsInfo beyondBoundsInfo;
    private final MutableState canScrollBackward$delegate;
    private final MutableState canScrollForward$delegate;
    private LazyLayoutPrefetchState.PrefetchHandle currentPrefetchHandle;
    private Density density;
    private int firstVisiblePage;
    private int firstVisiblePageOffset;
    private boolean hasLookaheadOccurred;
    private int indexToPrefetch;
    private final MutableInteractionSource internalInteractionSource;
    private final MutableState<Boolean> isLastScrollBackwardState;
    private final MutableState<Boolean> isLastScrollForwardState;
    private int layoutWithMeasurement;
    private int layoutWithoutMeasurement;
    private long maxScrollOffset;
    private final MutableState<Unit> measurementScopeInvalidator;
    private long minScrollOffset;
    private MutableState<PagerMeasureResult> pagerLayoutInfoState;
    private final LazyLayoutPinnedItemList pinnedPages;
    private final MutableState<Unit> placementScopeInvalidator;
    private final LazyLayoutPrefetchState prefetchState;
    private boolean prefetchingEnabled;
    private long premeasureConstraints;
    private float previousPassDelta;
    private final MutableIntState programmaticScrollTargetPage$delegate;
    private final MutableState remeasurement$delegate;
    private final RemeasurementModifier remeasurementModifier;
    private final PagerScrollPosition scrollPosition;
    private final ScrollableState scrollableState;
    private final State settledPage$delegate;
    private final MutableIntState settledPageState$delegate;
    private final State targetPage$delegate;
    private final MutableState upDownDifference$delegate;
    private boolean wasPrefetchingForward;

    public PagerState() {
        this(0, 0.0f, null, 7, null);
    }

    public abstract int getPageCount();

    @Override // androidx.compose.foundation.gestures.ScrollableState
    public Object scroll(MutatePriority mutatePriority, Function2<? super ScrollScope, ? super Continuation<? super Unit>, ? extends Object> function2, Continuation<? super Unit> continuation) {
        return scroll$suspendImpl(this, mutatePriority, function2, continuation);
    }

    public PagerState(int currentPage, float currentPageOffsetFraction, PrefetchScheduler prefetchScheduler) {
        MutableState mutableStateOf$default;
        MutableState mutableStateOf$default2;
        MutableState mutableStateOf$default3;
        MutableState mutableStateOf$default4;
        MutableState<Boolean> mutableStateOf$default5;
        MutableState<Boolean> mutableStateOf$default6;
        double d = currentPageOffsetFraction;
        boolean value$iv = false;
        if (-0.5d <= d && d <= 0.5d) {
            value$iv = true;
        }
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("currentPageOffsetFraction " + currentPageOffsetFraction + " is not within the range -0.5 to 0.5");
        }
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(Offset.m4037boximpl(Offset.Companion.m4064getZeroF1C5BW0()), null, 2, null);
        this.upDownDifference$delegate = mutableStateOf$default;
        this.scrollPosition = new PagerScrollPosition(currentPage, currentPageOffsetFraction, this);
        this.firstVisiblePage = currentPage;
        this.maxScrollOffset = Long.MAX_VALUE;
        this.scrollableState = ScrollableStateKt.ScrollableState(new Function1<Float, Float>() { // from class: androidx.compose.foundation.pager.PagerState$scrollableState$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            public final Float invoke(float it) {
                float performScroll;
                performScroll = PagerState.this.performScroll(it);
                return Float.valueOf(performScroll);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Float invoke(Float f) {
                return invoke(f.floatValue());
            }
        });
        this.prefetchingEnabled = true;
        this.indexToPrefetch = -1;
        this.pagerLayoutInfoState = SnapshotStateKt.mutableStateOf(PagerStateKt.getEmptyLayoutInfo(), SnapshotStateKt.neverEqualPolicy());
        this.density = PagerStateKt.access$getUnitDensity$p();
        this.internalInteractionSource = InteractionSourceKt.MutableInteractionSource();
        this.programmaticScrollTargetPage$delegate = SnapshotIntStateKt.mutableIntStateOf(-1);
        this.settledPageState$delegate = SnapshotIntStateKt.mutableIntStateOf(currentPage);
        this.settledPage$delegate = SnapshotStateKt.derivedStateOf(SnapshotStateKt.structuralEqualityPolicy(), new Function0<Integer>() { // from class: androidx.compose.foundation.pager.PagerState$settledPage$2
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Integer invoke() {
                int currentPage2;
                boolean isScrollInProgress = PagerState.this.isScrollInProgress();
                PagerState pagerState = PagerState.this;
                if (isScrollInProgress) {
                    currentPage2 = pagerState.getSettledPageState();
                } else {
                    currentPage2 = pagerState.getCurrentPage();
                }
                return Integer.valueOf(currentPage2);
            }
        });
        this.targetPage$delegate = SnapshotStateKt.derivedStateOf(SnapshotStateKt.structuralEqualityPolicy(), new Function0<Integer>() { // from class: androidx.compose.foundation.pager.PagerState$targetPage$2
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Integer invoke() {
                int programmaticScrollTargetPage;
                int finalPage;
                int coerceInPageRange;
                boolean isScrollInProgress = PagerState.this.isScrollInProgress();
                PagerState pagerState = PagerState.this;
                if (isScrollInProgress) {
                    programmaticScrollTargetPage = pagerState.getProgrammaticScrollTargetPage();
                    PagerState pagerState2 = PagerState.this;
                    if (programmaticScrollTargetPage != -1) {
                        finalPage = pagerState2.getProgrammaticScrollTargetPage();
                    } else {
                        int i = (Math.abs(pagerState2.getCurrentPageOffsetFraction()) > Math.abs(PagerState.this.getPositionThresholdFraction$foundation_release()) ? 1 : (Math.abs(pagerState2.getCurrentPageOffsetFraction()) == Math.abs(PagerState.this.getPositionThresholdFraction$foundation_release()) ? 0 : -1));
                        PagerState pagerState3 = PagerState.this;
                        if (i >= 0) {
                            boolean lastScrolledForward = pagerState3.getLastScrolledForward();
                            PagerState pagerState4 = PagerState.this;
                            if (lastScrolledForward) {
                                finalPage = pagerState4.getFirstVisiblePage$foundation_release() + 1;
                            } else {
                                finalPage = pagerState4.getFirstVisiblePage$foundation_release();
                            }
                        } else {
                            finalPage = pagerState3.getCurrentPage();
                        }
                    }
                } else {
                    finalPage = pagerState.getCurrentPage();
                }
                coerceInPageRange = PagerState.this.coerceInPageRange(finalPage);
                return Integer.valueOf(coerceInPageRange);
            }
        });
        this.prefetchState = new LazyLayoutPrefetchState(prefetchScheduler, new Function1<NestedPrefetchScope, Unit>() { // from class: androidx.compose.foundation.pager.PagerState$prefetchState$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(NestedPrefetchScope nestedPrefetchScope) {
                invoke2(nestedPrefetchScope);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(NestedPrefetchScope $this$$receiver) {
                Snapshot.Companion this_$iv = Snapshot.Companion;
                PagerState pagerState = PagerState.this;
                Snapshot previousSnapshot$iv = this_$iv.getCurrentThreadSnapshot();
                Function1 observer$iv = previousSnapshot$iv != null ? previousSnapshot$iv.getReadObserver() : null;
                Snapshot newSnapshot$iv = this_$iv.makeCurrentNonObservable(previousSnapshot$iv);
                try {
                    $this$$receiver.schedulePrefetch(pagerState.getFirstVisiblePage$foundation_release());
                    Unit unit = Unit.INSTANCE;
                } finally {
                    this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
                }
            }
        });
        this.beyondBoundsInfo = new LazyLayoutBeyondBoundsInfo();
        this.awaitLayoutModifier = new AwaitFirstLayoutModifier();
        mutableStateOf$default2 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
        this.remeasurement$delegate = mutableStateOf$default2;
        this.remeasurementModifier = new RemeasurementModifier() { // from class: androidx.compose.foundation.pager.PagerState$remeasurementModifier$1
            @Override // androidx.compose.ui.layout.RemeasurementModifier
            public void onRemeasurementAvailable(Remeasurement remeasurement) {
                PagerState.this.setRemeasurement(remeasurement);
            }
        };
        this.premeasureConstraints = ConstraintsKt.Constraints$default(0, 0, 0, 0, 15, null);
        this.pinnedPages = new LazyLayoutPinnedItemList();
        this.scrollPosition.getNearestRangeState();
        this.placementScopeInvalidator = ObservableScopeInvalidator.m1175constructorimpl$default(null, 1, null);
        this.measurementScopeInvalidator = ObservableScopeInvalidator.m1175constructorimpl$default(null, 1, null);
        mutableStateOf$default3 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.canScrollForward$delegate = mutableStateOf$default3;
        mutableStateOf$default4 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.canScrollBackward$delegate = mutableStateOf$default4;
        mutableStateOf$default5 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.isLastScrollForwardState = mutableStateOf$default5;
        mutableStateOf$default6 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.isLastScrollBackwardState = mutableStateOf$default6;
    }

    public /* synthetic */ PagerState(int i, float f, PrefetchScheduler prefetchScheduler, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this((i2 & 1) != 0 ? 0 : i, (i2 & 2) != 0 ? 0.0f : f, (i2 & 4) != 0 ? null : prefetchScheduler);
    }

    public /* synthetic */ PagerState(int i, float f, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this((i2 & 1) != 0 ? 0 : i, (i2 & 2) != 0 ? 0.0f : f);
    }

    public PagerState(int currentPage, float currentPageOffsetFraction) {
        this(currentPage, currentPageOffsetFraction, null);
    }

    public final boolean getHasLookaheadOccurred$foundation_release() {
        return this.hasLookaheadOccurred;
    }

    public final PagerMeasureResult getApproachLayoutInfo$foundation_release() {
        return this.approachLayoutInfo;
    }

    /* renamed from: getUpDownDifference-F1C5BW0$foundation_release  reason: not valid java name */
    public final long m1250getUpDownDifferenceF1C5BW0$foundation_release() {
        State $this$getValue$iv = this.upDownDifference$delegate;
        return ((Offset) $this$getValue$iv.getValue()).m4058unboximpl();
    }

    /* renamed from: setUpDownDifference-k-4lQ0M$foundation_release  reason: not valid java name */
    public final void m1252setUpDownDifferencek4lQ0M$foundation_release(long j) {
        MutableState $this$setValue$iv = this.upDownDifference$delegate;
        $this$setValue$iv.setValue(Offset.m4037boximpl(j));
    }

    public final int getFirstVisiblePage$foundation_release() {
        return this.firstVisiblePage;
    }

    public final int getFirstVisiblePageOffset$foundation_release() {
        return this.firstVisiblePageOffset;
    }

    public final long getMaxScrollOffset$foundation_release() {
        return this.maxScrollOffset;
    }

    public final void setMaxScrollOffset$foundation_release(long j) {
        this.maxScrollOffset = j;
    }

    public final long getMinScrollOffset$foundation_release() {
        return this.minScrollOffset;
    }

    public final void setMinScrollOffset$foundation_release(long j) {
        this.minScrollOffset = j;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final float performScroll(float delta) {
        long currentScrollPosition = PagerScrollPositionKt.currentAbsoluteScrollOffset(this);
        float decimalAccumulation = delta + this.accumulator;
        long decimalAccumulationInt = MathKt.roundToLong(decimalAccumulation);
        this.accumulator = decimalAccumulation - ((float) decimalAccumulationInt);
        if (Math.abs(delta) < 1.0E-4f) {
            return delta;
        }
        long updatedScrollPosition = currentScrollPosition + decimalAccumulationInt;
        long coercedScrollPosition = RangesKt.coerceIn(updatedScrollPosition, this.minScrollOffset, this.maxScrollOffset);
        boolean changed = updatedScrollPosition != coercedScrollPosition;
        long scrollDelta = coercedScrollPosition - currentScrollPosition;
        this.previousPassDelta = (float) scrollDelta;
        if (Math.abs(scrollDelta) != 0) {
            this.isLastScrollForwardState.setValue(Boolean.valueOf(((float) scrollDelta) > 0.0f));
            this.isLastScrollBackwardState.setValue(Boolean.valueOf(((float) scrollDelta) < 0.0f));
        }
        PagerMeasureResult scrolledLayoutInfo = this.pagerLayoutInfoState.getValue().copyWithScrollDeltaWithoutRemeasure(-((int) scrollDelta));
        if (scrolledLayoutInfo != null && this.approachLayoutInfo != null) {
            PagerMeasureResult pagerMeasureResult = this.approachLayoutInfo;
            PagerMeasureResult scrolledApproachLayoutInfo = pagerMeasureResult != null ? pagerMeasureResult.copyWithScrollDeltaWithoutRemeasure(-((int) scrollDelta)) : null;
            if (scrolledApproachLayoutInfo != null) {
                this.approachLayoutInfo = scrolledApproachLayoutInfo;
            } else {
                scrolledLayoutInfo = null;
            }
        }
        if (scrolledLayoutInfo != null) {
            applyMeasureResult$foundation_release(scrolledLayoutInfo, this.hasLookaheadOccurred, true);
            ObservableScopeInvalidator.m1179invalidateScopeimpl(this.placementScopeInvalidator);
            this.layoutWithoutMeasurement++;
        } else {
            this.scrollPosition.applyScrollDelta((int) scrollDelta);
            Remeasurement remeasurement$foundation_release = getRemeasurement$foundation_release();
            if (remeasurement$foundation_release != null) {
                remeasurement$foundation_release.forceRemeasure();
            }
            this.layoutWithMeasurement++;
        }
        return (changed ? Long.valueOf(scrollDelta) : Float.valueOf(delta)).floatValue();
    }

    public final int getNumMeasurePasses$foundation_release() {
        return this.layoutWithMeasurement + this.layoutWithoutMeasurement;
    }

    public final int getLayoutWithMeasurement$foundation_release() {
        return this.layoutWithMeasurement;
    }

    public final boolean getPrefetchingEnabled$foundation_release() {
        return this.prefetchingEnabled;
    }

    public final void setPrefetchingEnabled$foundation_release(boolean z) {
        this.prefetchingEnabled = z;
    }

    public final PagerLayoutInfo getLayoutInfo() {
        return this.pagerLayoutInfoState.getValue();
    }

    public final int getPageSpacing$foundation_release() {
        return this.pagerLayoutInfoState.getValue().getPageSpacing();
    }

    public final int getPageSize$foundation_release() {
        return this.pagerLayoutInfoState.getValue().getPageSize();
    }

    public final Density getDensity$foundation_release() {
        return this.density;
    }

    public final void setDensity$foundation_release(Density density) {
        this.density = density;
    }

    public final int getPageSizeWithSpacing$foundation_release() {
        return getPageSize$foundation_release() + getPageSpacing$foundation_release();
    }

    public final float getPositionThresholdFraction$foundation_release() {
        Density $this$_get_positionThresholdFraction__u24lambda_u244 = this.density;
        float minThreshold = Math.min($this$_get_positionThresholdFraction__u24lambda_u244.mo644toPx0680j_4(PagerStateKt.getDefaultPositionThreshold()), getPageSize$foundation_release() / 2.0f);
        return minThreshold / getPageSize$foundation_release();
    }

    public final MutableInteractionSource getInternalInteractionSource$foundation_release() {
        return this.internalInteractionSource;
    }

    public final InteractionSource getInteractionSource() {
        return this.internalInteractionSource;
    }

    public final int getCurrentPage() {
        return this.scrollPosition.getCurrentPage();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final int getProgrammaticScrollTargetPage() {
        IntState $this$getValue$iv = this.programmaticScrollTargetPage$delegate;
        return $this$getValue$iv.getIntValue();
    }

    private final void setProgrammaticScrollTargetPage(int i) {
        MutableIntState $this$setValue$iv = this.programmaticScrollTargetPage$delegate;
        $this$setValue$iv.setIntValue(i);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final int getSettledPageState() {
        IntState $this$getValue$iv = this.settledPageState$delegate;
        return $this$getValue$iv.getIntValue();
    }

    private final void setSettledPageState(int i) {
        MutableIntState $this$setValue$iv = this.settledPageState$delegate;
        $this$setValue$iv.setIntValue(i);
    }

    public final int getSettledPage() {
        State $this$getValue$iv = this.settledPage$delegate;
        return ((Number) $this$getValue$iv.getValue()).intValue();
    }

    public final int getTargetPage() {
        State $this$getValue$iv = this.targetPage$delegate;
        return ((Number) $this$getValue$iv.getValue()).intValue();
    }

    public final float getCurrentPageOffsetFraction() {
        return this.scrollPosition.getCurrentPageOffsetFraction();
    }

    public final LazyLayoutPrefetchState getPrefetchState$foundation_release() {
        return this.prefetchState;
    }

    public final LazyLayoutBeyondBoundsInfo getBeyondBoundsInfo$foundation_release() {
        return this.beyondBoundsInfo;
    }

    public final AwaitFirstLayoutModifier getAwaitLayoutModifier$foundation_release() {
        return this.awaitLayoutModifier;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void setRemeasurement(Remeasurement remeasurement) {
        MutableState $this$setValue$iv = this.remeasurement$delegate;
        $this$setValue$iv.setValue(remeasurement);
    }

    public final Remeasurement getRemeasurement$foundation_release() {
        State $this$getValue$iv = this.remeasurement$delegate;
        return (Remeasurement) $this$getValue$iv.getValue();
    }

    public final RemeasurementModifier getRemeasurementModifier$foundation_release() {
        return this.remeasurementModifier;
    }

    /* renamed from: getPremeasureConstraints-msEJaDk$foundation_release  reason: not valid java name */
    public final long m1249getPremeasureConstraintsmsEJaDk$foundation_release() {
        return this.premeasureConstraints;
    }

    /* renamed from: setPremeasureConstraints-BRTryo0$foundation_release  reason: not valid java name */
    public final void m1251setPremeasureConstraintsBRTryo0$foundation_release(long j) {
        this.premeasureConstraints = j;
    }

    public final LazyLayoutPinnedItemList getPinnedPages$foundation_release() {
        return this.pinnedPages;
    }

    public final IntRange getNearestRange$foundation_release() {
        State $this$getValue$iv = this.scrollPosition.getNearestRangeState();
        return $this$getValue$iv.getValue();
    }

    /* renamed from: getPlacementScopeInvalidator-zYiylxw$foundation_release  reason: not valid java name */
    public final MutableState<Unit> m1248getPlacementScopeInvalidatorzYiylxw$foundation_release() {
        return this.placementScopeInvalidator;
    }

    public static /* synthetic */ Object scrollToPage$default(PagerState pagerState, int i, float f, Continuation continuation, int i2, Object obj) {
        if (obj == null) {
            if ((i2 & 2) != 0) {
                f = 0.0f;
            }
            return pagerState.scrollToPage(i, f, continuation);
        }
        throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: scrollToPage");
    }

    public final Object scrollToPage(int page, float pageOffsetFraction, Continuation<? super Unit> continuation) {
        Object scroll$default = ScrollableState.scroll$default(this, null, new PagerState$scrollToPage$2(this, pageOffsetFraction, page, null), continuation, 1, null);
        return scroll$default == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? scroll$default : Unit.INSTANCE;
    }

    public static /* synthetic */ void updateCurrentPage$default(PagerState pagerState, ScrollScope scrollScope, int i, float f, int i2, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: updateCurrentPage");
        }
        if ((i2 & 2) != 0) {
            f = 0.0f;
        }
        pagerState.updateCurrentPage(scrollScope, i, f);
    }

    public final void updateCurrentPage(ScrollScope $this$updateCurrentPage, int page, float pageOffsetFraction) {
        snapToItem$foundation_release(page, pageOffsetFraction, true);
    }

    public final void updateTargetPage(ScrollScope $this$updateTargetPage, int targetPage) {
        setProgrammaticScrollTargetPage(coerceInPageRange(targetPage));
    }

    public final void snapToItem$foundation_release(int page, float offsetFraction, boolean forceRemeasure) {
        this.scrollPosition.requestPositionAndForgetLastKnownKey(page, offsetFraction);
        if (forceRemeasure) {
            Remeasurement remeasurement$foundation_release = getRemeasurement$foundation_release();
            if (remeasurement$foundation_release != null) {
                remeasurement$foundation_release.forceRemeasure();
                return;
            }
            return;
        }
        ObservableScopeInvalidator.m1179invalidateScopeimpl(this.measurementScopeInvalidator);
    }

    /* renamed from: getMeasurementScopeInvalidator-zYiylxw$foundation_release  reason: not valid java name */
    public final MutableState<Unit> m1247getMeasurementScopeInvalidatorzYiylxw$foundation_release() {
        return this.measurementScopeInvalidator;
    }

    public static /* synthetic */ void requestScrollToPage$default(PagerState pagerState, int i, float f, int i2, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: requestScrollToPage");
        }
        if ((i2 & 2) != 0) {
            f = 0.0f;
        }
        pagerState.requestScrollToPage(i, f);
    }

    public final void requestScrollToPage(int page, float pageOffsetFraction) {
        if (isScrollInProgress()) {
            BuildersKt__Builders_commonKt.launch$default(this.pagerLayoutInfoState.getValue().getCoroutineScope(), null, null, new PagerState$requestScrollToPage$1(this, null), 3, null);
        }
        snapToItem$foundation_release(page, pageOffsetFraction, false);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ Object animateScrollToPage$default(PagerState pagerState, int i, float f, AnimationSpec animationSpec, Continuation continuation, int i2, Object obj) {
        if (obj == null) {
            if ((i2 & 2) != 0) {
                f = 0.0f;
            }
            if ((i2 & 4) != 0) {
                animationSpec = AnimationSpecKt.spring$default(0.0f, 0.0f, null, 7, null);
            }
            return pagerState.animateScrollToPage(i, f, animationSpec, continuation);
        }
        throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: animateScrollToPage");
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x006a, code lost:
        if (r11 == false) goto L35;
     */
    /* JADX WARN: Removed duplicated region for block: B:10:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0036  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x003b  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00e1 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object animateScrollToPage(int r18, float r19, androidx.compose.animation.core.AnimationSpec<java.lang.Float> r20, kotlin.coroutines.Continuation<? super kotlin.Unit> r21) {
        /*
            Method dump skipped, instructions count: 240
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.pager.PagerState.animateScrollToPage(int, float, androidx.compose.animation.core.AnimationSpec, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object awaitScrollDependencies(Continuation<? super Unit> continuation) {
        Object waitForFirstLayout = this.awaitLayoutModifier.waitForFirstLayout(continuation);
        return waitForFirstLayout == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? waitForFirstLayout : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x007a A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static /* synthetic */ java.lang.Object scroll$suspendImpl(androidx.compose.foundation.pager.PagerState r6, androidx.compose.foundation.MutatePriority r7, kotlin.jvm.functions.Function2<? super androidx.compose.foundation.gestures.ScrollScope, ? super kotlin.coroutines.Continuation<? super kotlin.Unit>, ? extends java.lang.Object> r8, kotlin.coroutines.Continuation<? super kotlin.Unit> r9) {
        /*
            boolean r0 = r9 instanceof androidx.compose.foundation.pager.PagerState$scroll$1
            if (r0 == 0) goto L14
            r0 = r9
            androidx.compose.foundation.pager.PagerState$scroll$1 r0 = (androidx.compose.foundation.pager.PagerState$scroll$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.foundation.pager.PagerState$scroll$1 r0 = new androidx.compose.foundation.pager.PagerState$scroll$1
            r0.<init>(r6, r9)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L48;
                case 1: goto L35;
                case 2: goto L2d;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r6 = new java.lang.IllegalStateException
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            r6.<init>(r7)
            throw r6
        L2d:
            java.lang.Object r6 = r0.L$0
            androidx.compose.foundation.pager.PagerState r6 = (androidx.compose.foundation.pager.PagerState) r6
            kotlin.ResultKt.throwOnFailure(r1)
            goto L7b
        L35:
            java.lang.Object r6 = r0.L$2
            kotlin.jvm.functions.Function2 r6 = (kotlin.jvm.functions.Function2) r6
            java.lang.Object r7 = r0.L$1
            androidx.compose.foundation.MutatePriority r7 = (androidx.compose.foundation.MutatePriority) r7
            java.lang.Object r8 = r0.L$0
            androidx.compose.foundation.pager.PagerState r8 = (androidx.compose.foundation.pager.PagerState) r8
            kotlin.ResultKt.throwOnFailure(r1)
            r5 = r8
            r8 = r6
            r6 = r5
            goto L5b
        L48:
            kotlin.ResultKt.throwOnFailure(r1)
            r0.L$0 = r6
            r0.L$1 = r7
            r0.L$2 = r8
            r3 = 1
            r0.label = r3
            java.lang.Object r3 = r6.awaitScrollDependencies(r0)
            if (r3 != r2) goto L5b
            return r2
        L5b:
            boolean r3 = r6.isScrollInProgress()
            if (r3 != 0) goto L68
            int r3 = r6.getCurrentPage()
            r6.setSettledPageState(r3)
        L68:
            androidx.compose.foundation.gestures.ScrollableState r3 = r6.scrollableState
            r0.L$0 = r6
            r4 = 0
            r0.L$1 = r4
            r0.L$2 = r4
            r4 = 2
            r0.label = r4
            java.lang.Object r7 = r3.scroll(r7, r8, r0)
            if (r7 != r2) goto L7b
            return r2
        L7b:
            r7 = -1
            r6.setProgrammaticScrollTargetPage(r7)
            kotlin.Unit r7 = kotlin.Unit.INSTANCE
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.pager.PagerState.scroll$suspendImpl(androidx.compose.foundation.pager.PagerState, androidx.compose.foundation.MutatePriority, kotlin.jvm.functions.Function2, kotlin.coroutines.Continuation):java.lang.Object");
    }

    @Override // androidx.compose.foundation.gestures.ScrollableState
    public float dispatchRawDelta(float delta) {
        return this.scrollableState.dispatchRawDelta(delta);
    }

    @Override // androidx.compose.foundation.gestures.ScrollableState
    public boolean isScrollInProgress() {
        return this.scrollableState.isScrollInProgress();
    }

    private final void setCanScrollForward(boolean z) {
        MutableState $this$setValue$iv = this.canScrollForward$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    @Override // androidx.compose.foundation.gestures.ScrollableState
    public final boolean getCanScrollForward() {
        State $this$getValue$iv = this.canScrollForward$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    private final void setCanScrollBackward(boolean z) {
        MutableState $this$setValue$iv = this.canScrollBackward$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    @Override // androidx.compose.foundation.gestures.ScrollableState
    public final boolean getCanScrollBackward() {
        State $this$getValue$iv = this.canScrollBackward$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    @Override // androidx.compose.foundation.gestures.ScrollableState
    public boolean getLastScrolledForward() {
        return this.isLastScrollForwardState.getValue().booleanValue();
    }

    @Override // androidx.compose.foundation.gestures.ScrollableState
    public boolean getLastScrolledBackward() {
        return this.isLastScrollBackwardState.getValue().booleanValue();
    }

    public static /* synthetic */ void applyMeasureResult$foundation_release$default(PagerState pagerState, PagerMeasureResult pagerMeasureResult, boolean z, boolean z2, int i, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: applyMeasureResult");
        }
        if ((i & 4) != 0) {
            z2 = false;
        }
        pagerState.applyMeasureResult$foundation_release(pagerMeasureResult, z, z2);
    }

    public final void applyMeasureResult$foundation_release(PagerMeasureResult result, boolean isLookingAhead, boolean visibleItemsStayedTheSame) {
        if (!isLookingAhead && this.hasLookaheadOccurred) {
            this.approachLayoutInfo = result;
            return;
        }
        if (isLookingAhead) {
            this.hasLookaheadOccurred = true;
        }
        PagerScrollPosition pagerScrollPosition = this.scrollPosition;
        if (visibleItemsStayedTheSame) {
            pagerScrollPosition.updateCurrentPageOffsetFraction(result.getCurrentPageOffsetFraction());
        } else {
            pagerScrollPosition.updateFromMeasureResult(result);
            cancelPrefetchIfVisibleItemsChanged(result);
        }
        this.pagerLayoutInfoState.setValue(result);
        setCanScrollForward(result.getCanScrollForward());
        setCanScrollBackward(result.getCanScrollBackward());
        MeasuredPage it = result.getFirstVisiblePage();
        if (it != null) {
            this.firstVisiblePage = it.getIndex();
        }
        this.firstVisiblePageOffset = result.getFirstVisiblePageScrollOffset();
        tryRunPrefetch(result);
        this.maxScrollOffset = PagerStateKt.calculateNewMaxScrollOffset(result, getPageCount());
        this.minScrollOffset = PagerStateKt.access$calculateNewMinScrollOffset(result, getPageCount());
    }

    private final void tryRunPrefetch(PagerMeasureResult result) {
        Snapshot.Companion this_$iv = Snapshot.Companion;
        Snapshot previousSnapshot$iv = this_$iv.getCurrentThreadSnapshot();
        Function1 observer$iv = previousSnapshot$iv != null ? previousSnapshot$iv.getReadObserver() : null;
        Snapshot newSnapshot$iv = this_$iv.makeCurrentNonObservable(previousSnapshot$iv);
        try {
            if (Math.abs(this.previousPassDelta) > 0.5f && this.prefetchingEnabled && isGestureActionMatchesScroll(this.previousPassDelta)) {
                notifyPrefetch(this.previousPassDelta, result);
            }
            Unit unit = Unit.INSTANCE;
        } finally {
            this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final int coerceInPageRange(int $this$coerceInPageRange) {
        if (getPageCount() > 0) {
            return RangesKt.coerceIn($this$coerceInPageRange, 0, getPageCount() - 1);
        }
        return 0;
    }

    private final boolean isGestureActionMatchesScroll(float scrollDelta) {
        boolean z;
        if (getLayoutInfo().getOrientation() == Orientation.Vertical) {
            float signum = Math.signum(scrollDelta);
            long arg0$iv = m1250getUpDownDifferenceF1C5BW0$foundation_release();
            int bits$iv$iv$iv = (int) (4294967295L & arg0$iv);
            z = signum == Math.signum(-Float.intBitsToFloat(bits$iv$iv$iv));
        } else {
            float signum2 = Math.signum(scrollDelta);
            long arg0$iv2 = m1250getUpDownDifferenceF1C5BW0$foundation_release();
            int bits$iv$iv$iv2 = (int) (arg0$iv2 >> 32);
            z = signum2 == Math.signum(-Float.intBitsToFloat(bits$iv$iv$iv2));
        }
        return z || isNotGestureAction$foundation_release();
    }

    public final boolean isNotGestureAction$foundation_release() {
        long arg0$iv = m1250getUpDownDifferenceF1C5BW0$foundation_release();
        int bits$iv$iv$iv = (int) (arg0$iv >> 32);
        if (((int) Float.intBitsToFloat(bits$iv$iv$iv)) == 0) {
            long arg0$iv2 = m1250getUpDownDifferenceF1C5BW0$foundation_release();
            int bits$iv$iv$iv2 = (int) (4294967295L & arg0$iv2);
            if (((int) Float.intBitsToFloat(bits$iv$iv$iv2)) == 0) {
                return true;
            }
        }
        return false;
    }

    private final void notifyPrefetch(float delta, PagerLayoutInfo info) {
        int indexToPrefetch;
        LazyLayoutPrefetchState.PrefetchHandle prefetchHandle;
        LazyLayoutPrefetchState.PrefetchHandle prefetchHandle2;
        LazyLayoutPrefetchState.PrefetchHandle prefetchHandle3;
        if (this.prefetchingEnabled && !info.getVisiblePagesInfo().isEmpty()) {
            boolean z = false;
            boolean isPrefetchingForward = delta > 0.0f;
            if (isPrefetchingForward) {
                indexToPrefetch = ((PageInfo) CollectionsKt.last((List<? extends Object>) info.getVisiblePagesInfo())).getIndex() + info.getBeyondViewportPageCount() + 1;
            } else {
                indexToPrefetch = (((PageInfo) CollectionsKt.first((List<? extends Object>) info.getVisiblePagesInfo())).getIndex() - info.getBeyondViewportPageCount()) - 1;
            }
            if (indexToPrefetch >= 0 && indexToPrefetch < getPageCount()) {
                z = true;
            }
            if (z) {
                if (indexToPrefetch != this.indexToPrefetch) {
                    if (this.wasPrefetchingForward != isPrefetchingForward && (prefetchHandle3 = this.currentPrefetchHandle) != null) {
                        prefetchHandle3.cancel();
                    }
                    this.wasPrefetchingForward = isPrefetchingForward;
                    this.indexToPrefetch = indexToPrefetch;
                    this.currentPrefetchHandle = this.prefetchState.m1170schedulePrefetch0kLqBqw(indexToPrefetch, this.premeasureConstraints);
                }
                if (isPrefetchingForward) {
                    PageInfo lastItem = (PageInfo) CollectionsKt.last((List<? extends Object>) info.getVisiblePagesInfo());
                    int pageSize = info.getPageSize() + info.getPageSpacing();
                    int distanceToReachNextItem = (lastItem.getOffset() + pageSize) - info.getViewportEndOffset();
                    if (distanceToReachNextItem >= delta || (prefetchHandle2 = this.currentPrefetchHandle) == null) {
                        return;
                    }
                    prefetchHandle2.markAsUrgent();
                    return;
                }
                PageInfo firstItem = (PageInfo) CollectionsKt.first((List<? extends Object>) info.getVisiblePagesInfo());
                int distanceToReachNextItem2 = info.getViewportStartOffset() - firstItem.getOffset();
                if (distanceToReachNextItem2 >= (-delta) || (prefetchHandle = this.currentPrefetchHandle) == null) {
                    return;
                }
                prefetchHandle.markAsUrgent();
            }
        }
    }

    private final void cancelPrefetchIfVisibleItemsChanged(PagerLayoutInfo info) {
        int expectedPrefetchIndex;
        if (this.indexToPrefetch != -1 && !info.getVisiblePagesInfo().isEmpty()) {
            if (this.wasPrefetchingForward) {
                expectedPrefetchIndex = ((PageInfo) CollectionsKt.last((List<? extends Object>) info.getVisiblePagesInfo())).getIndex() + info.getBeyondViewportPageCount() + 1;
            } else {
                expectedPrefetchIndex = (((PageInfo) CollectionsKt.first((List<? extends Object>) info.getVisiblePagesInfo())).getIndex() - info.getBeyondViewportPageCount()) - 1;
            }
            if (this.indexToPrefetch != expectedPrefetchIndex) {
                this.indexToPrefetch = -1;
                LazyLayoutPrefetchState.PrefetchHandle prefetchHandle = this.currentPrefetchHandle;
                if (prefetchHandle != null) {
                    prefetchHandle.cancel();
                }
                this.currentPrefetchHandle = null;
            }
        }
    }

    public final float getOffsetDistanceInPages(int page) {
        boolean value$iv = false;
        if (page >= 0 && page <= getPageCount()) {
            value$iv = true;
        }
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("page " + page + " is not within the range 0 to " + getPageCount());
        }
        return (page - getCurrentPage()) - getCurrentPageOffsetFraction();
    }

    public static /* synthetic */ int matchScrollPositionWithKey$foundation_release$default(PagerState pagerState, PagerLazyLayoutItemProvider pagerLazyLayoutItemProvider, int i, int i2, Object obj) {
        if (obj == null) {
            if ((i2 & 2) != 0) {
                Snapshot.Companion this_$iv = Snapshot.Companion;
                Snapshot previousSnapshot$iv = this_$iv.getCurrentThreadSnapshot();
                Function1 observer$iv = previousSnapshot$iv != null ? previousSnapshot$iv.getReadObserver() : null;
                Snapshot newSnapshot$iv = this_$iv.makeCurrentNonObservable(previousSnapshot$iv);
                try {
                    int currentPage = pagerState.scrollPosition.getCurrentPage();
                    this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
                    i = currentPage;
                } catch (Throwable th) {
                    this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
                    throw th;
                }
            }
            return pagerState.matchScrollPositionWithKey$foundation_release(pagerLazyLayoutItemProvider, i);
        }
        throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: matchScrollPositionWithKey");
    }

    public final int matchScrollPositionWithKey$foundation_release(PagerLazyLayoutItemProvider itemProvider, int currentPage) {
        return this.scrollPosition.matchPageWithKey(itemProvider, currentPage);
    }
}
