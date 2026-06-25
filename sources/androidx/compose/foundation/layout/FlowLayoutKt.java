package androidx.compose.foundation.layout;

import androidx.collection.IntIntPair;
import androidx.collection.IntList;
import androidx.collection.IntObjectMapKt;
import androidx.collection.MutableIntList;
import androidx.collection.MutableIntObjectMap;
import androidx.compose.foundation.layout.Arrangement;
import androidx.compose.foundation.layout.FlowLayoutBuildingBlocks;
import androidx.compose.foundation.layout.FlowLayoutOverflow;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.Alignment;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.layout.IntrinsicMeasurable;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.unit.Constraints;
import androidx.profileinstaller.ProfileVerifier;
import com.itextpdf.layout.properties.Property;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.ranges.IntRange;
/* compiled from: FlowLayout.kt */
@Metadata(d1 = {"\u0000ä\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0015\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010(\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\u001ag\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00112\u001c\u0010\u0013\u001a\u0018\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020\u00070\u0014¢\u0006\u0002\b\u0016¢\u0006\u0002\b\u0017H\u0007¢\u0006\u0002\u0010\u0018\u001aq\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00112\b\b\u0002\u0010\u0019\u001a\u00020\u001a2\u001c\u0010\u0013\u001a\u0018\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020\u00070\u0014¢\u0006\u0002\b\u0016¢\u0006\u0002\b\u0017H\u0007¢\u0006\u0002\u0010\u001b\u001ag\u0010\u001c\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\u001d\u001a\u00020\u001e2\b\b\u0002\u0010\u001f\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00112\u001c\u0010\u0013\u001a\u0018\u0012\u0004\u0012\u00020 \u0012\u0004\u0012\u00020\u00070\u0014¢\u0006\u0002\b\u0016¢\u0006\u0002\b\u0017H\u0007¢\u0006\u0002\u0010!\u001aq\u0010\u001c\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\u001d\u001a\u00020\u001e2\b\b\u0002\u0010\u001f\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00112\b\b\u0002\u0010\u0019\u001a\u00020\"2\u001c\u0010\u0013\u001a\u0018\u0012\u0004\u0012\u00020 \u0012\u0004\u0012\u00020\u00070\u0014¢\u0006\u0002\b\u0016¢\u0006\u0002\b\u0017H\u0007¢\u0006\u0002\u0010#\u001a%\u0010$\u001a\u00020%2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010&\u001a\u00020\u0011H\u0001¢\u0006\u0002\u0010'\u001a=\u0010(\u001a\u00020)2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010&\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010*\u001a\u00020+H\u0001¢\u0006\u0002\u0010,\u001a\u0096\u0001\u0010-\u001a\u00020.2\f\u0010/\u001a\b\u0012\u0004\u0012\u000201002#\u00102\u001a\u001f\u0012\u0004\u0012\u000201\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u001103¢\u0006\u0002\b\u00172#\u00104\u001a\u001f\u0012\u0004\u0012\u000201\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u001103¢\u0006\u0002\b\u00172\u0006\u00105\u001a\u00020\u00112\u0006\u00106\u001a\u00020\u00112\u0006\u00107\u001a\u00020\u00112\u0006\u0010&\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0019\u001a\u00020+H\u0082\b¢\u0006\u0002\u00108\u001a[\u0010-\u001a\u00020.2\f\u0010/\u001a\b\u0012\u0004\u0012\u000201002\u0006\u00109\u001a\u00020:2\u0006\u0010;\u001a\u00020:2\u0006\u00105\u001a\u00020\u00112\u0006\u00106\u001a\u00020\u00112\u0006\u00107\u001a\u00020\u00112\u0006\u0010&\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0019\u001a\u00020+H\u0002¢\u0006\u0002\u0010<\u001aT\u0010=\u001a\u00020\u00112\f\u0010/\u001a\b\u0012\u0004\u0012\u000201002#\u00102\u001a\u001f\u0012\u0004\u0012\u000201\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u001103¢\u0006\u0002\b\u00172\u0006\u0010>\u001a\u00020\u00112\u0006\u00106\u001a\u00020\u00112\u0006\u0010&\u001a\u00020\u0011H\u0082\b\u001a\u0091\u0001\u0010?\u001a\u00020\u00112\f\u0010/\u001a\b\u0012\u0004\u0012\u000201002#\u00102\u001a\u001f\u0012\u0004\u0012\u000201\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u001103¢\u0006\u0002\b\u00172#\u00104\u001a\u001f\u0012\u0004\u0012\u000201\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u001103¢\u0006\u0002\b\u00172\u0006\u0010>\u001a\u00020\u00112\u0006\u00106\u001a\u00020\u00112\u0006\u00107\u001a\u00020\u00112\u0006\u0010&\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0019\u001a\u00020+H\u0082\b\u001a%\u0010@\u001a\u00020%2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010&\u001a\u00020\u0011H\u0001¢\u0006\u0002\u0010A\u001a=\u0010B\u001a\u00020)2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010&\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010*\u001a\u00020+H\u0001¢\u0006\u0002\u0010C\u001a\\\u0010D\u001a\u00020E*\u00020F2\u0006\u0010G\u001a\u00020H2\f\u0010I\u001a\b\u0012\u0004\u0012\u00020K0J2\u0006\u0010L\u001a\u00020M2\u0006\u0010N\u001a\u00020M2\u0006\u0010O\u001a\u00020P2\u0006\u0010&\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0019\u001a\u00020+H\u0000ø\u0001\u0000¢\u0006\u0004\bQ\u0010R\u001a\u001c\u0010S\u001a\u00020\u0011*\u0002012\u0006\u0010T\u001a\u00020U2\u0006\u00102\u001a\u00020\u0011H\u0000\u001a\u001c\u0010V\u001a\u00020\u0011*\u0002012\u0006\u0010T\u001a\u00020U2\u0006\u00104\u001a\u00020\u0011H\u0000\u001a<\u0010W\u001a\u00020.*\u00020K2\u0006\u0010G\u001a\u00020H2\u0006\u0010O\u001a\u00020X2\u0014\u0010Y\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010Z\u0012\u0004\u0012\u00020\u00070\u0014H\u0000ø\u0001\u0000¢\u0006\u0004\b[\u0010\\\u001aT\u0010]\u001a\u00020E*\u00020F2\u0006\u0010O\u001a\u00020P2\u0006\u0010^\u001a\u00020\u00112\u0006\u0010_\u001a\u00020\u00112\u0006\u0010;\u001a\u00020:2\f\u0010`\u001a\b\u0012\u0004\u0012\u00020E0a2\u0006\u0010b\u001a\u00020H2\u0006\u0010c\u001a\u00020:H\u0000ø\u0001\u0000¢\u0006\u0004\bd\u0010e\u001a\u001e\u0010f\u001a\u0004\u0018\u00010K*\b\u0012\u0004\u0012\u00020K0J2\b\u0010g\u001a\u0004\u0018\u00010hH\u0002\"\u0014\u0010\u0000\u001a\u00020\u0001X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0002\u0010\u0003\"\u0014\u0010\u0004\u001a\u00020\u0001X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0003\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006i"}, d2 = {"CROSS_AXIS_ALIGNMENT_START", "Landroidx/compose/foundation/layout/CrossAxisAlignment;", "getCROSS_AXIS_ALIGNMENT_START", "()Landroidx/compose/foundation/layout/CrossAxisAlignment;", "CROSS_AXIS_ALIGNMENT_TOP", "getCROSS_AXIS_ALIGNMENT_TOP", "FlowColumn", "", "modifier", "Landroidx/compose/ui/Modifier;", "verticalArrangement", "Landroidx/compose/foundation/layout/Arrangement$Vertical;", "horizontalArrangement", "Landroidx/compose/foundation/layout/Arrangement$Horizontal;", "itemHorizontalAlignment", "Landroidx/compose/ui/Alignment$Horizontal;", "maxItemsInEachColumn", "", "maxLines", "content", "Lkotlin/Function1;", "Landroidx/compose/foundation/layout/FlowColumnScope;", "Landroidx/compose/runtime/Composable;", "Lkotlin/ExtensionFunctionType;", "(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/ui/Alignment$Horizontal;IILkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V", "overflow", "Landroidx/compose/foundation/layout/FlowColumnOverflow;", "(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/ui/Alignment$Horizontal;IILandroidx/compose/foundation/layout/FlowColumnOverflow;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V", "FlowRow", "itemVerticalAlignment", "Landroidx/compose/ui/Alignment$Vertical;", "maxItemsInEachRow", "Landroidx/compose/foundation/layout/FlowRowScope;", "(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/ui/Alignment$Vertical;IILkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V", "Landroidx/compose/foundation/layout/FlowRowOverflow;", "(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/ui/Alignment$Vertical;IILandroidx/compose/foundation/layout/FlowRowOverflow;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V", "columnMeasurementHelper", "Landroidx/compose/ui/layout/MeasurePolicy;", "maxItemsInMainAxis", "(Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/foundation/layout/Arrangement$Horizontal;ILandroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;", "columnMeasurementMultiContentHelper", "Landroidx/compose/ui/layout/MultiContentMeasurePolicy;", "overflowState", "Landroidx/compose/foundation/layout/FlowLayoutOverflowState;", "(Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/ui/Alignment$Horizontal;IILandroidx/compose/foundation/layout/FlowLayoutOverflowState;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MultiContentMeasurePolicy;", "intrinsicCrossAxisSize", "Landroidx/collection/IntIntPair;", "children", "", "Landroidx/compose/ui/layout/IntrinsicMeasurable;", "mainAxisSize", "Lkotlin/Function3;", "crossAxisSize", "mainAxisAvailable", "mainAxisSpacing", "crossAxisSpacing", "(Ljava/util/List;Lkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function3;IIIIILandroidx/compose/foundation/layout/FlowLayoutOverflowState;)J", "mainAxisSizes", "", "crossAxisSizes", "(Ljava/util/List;[I[IIIIIILandroidx/compose/foundation/layout/FlowLayoutOverflowState;)J", "maxIntrinsicMainAxisSize", "crossAxisAvailable", "minIntrinsicMainAxisSize", "rowMeasurementHelper", "(Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/layout/Arrangement$Vertical;ILandroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;", "rowMeasurementMultiContentHelper", "(Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/ui/Alignment$Vertical;IILandroidx/compose/foundation/layout/FlowLayoutOverflowState;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MultiContentMeasurePolicy;", "breakDownItems", "Landroidx/compose/ui/layout/MeasureResult;", "Landroidx/compose/ui/layout/MeasureScope;", "measurePolicy", "Landroidx/compose/foundation/layout/FlowLineMeasurePolicy;", "measurablesIterator", "", "Landroidx/compose/ui/layout/Measurable;", "mainAxisSpacingDp", "Landroidx/compose/ui/unit/Dp;", "crossAxisSpacingDp", "constraints", "Landroidx/compose/foundation/layout/OrientationIndependentConstraints;", "breakDownItems-di9J0FM", "(Landroidx/compose/ui/layout/MeasureScope;Landroidx/compose/foundation/layout/FlowLineMeasurePolicy;Ljava/util/Iterator;FFJIILandroidx/compose/foundation/layout/FlowLayoutOverflowState;)Landroidx/compose/ui/layout/MeasureResult;", "crossAxisMin", "isHorizontal", "", "mainAxisMin", "measureAndCache", "Landroidx/compose/ui/unit/Constraints;", "storePlaceable", "Landroidx/compose/ui/layout/Placeable;", "measureAndCache-rqJ1uqs", "(Landroidx/compose/ui/layout/Measurable;Landroidx/compose/foundation/layout/FlowLineMeasurePolicy;JLkotlin/jvm/functions/Function1;)J", "placeHelper", "mainAxisTotalSize", "crossAxisTotalSize", "items", "Landroidx/compose/runtime/collection/MutableVector;", "measureHelper", "outPosition", "placeHelper-BmaY500", "(Landroidx/compose/ui/layout/MeasureScope;JII[ILandroidx/compose/runtime/collection/MutableVector;Landroidx/compose/foundation/layout/FlowLineMeasurePolicy;[I)Landroidx/compose/ui/layout/MeasureResult;", "safeNext", "info", "Landroidx/compose/foundation/layout/FlowLineInfo;", "foundation-layout_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class FlowLayoutKt {
    private static final CrossAxisAlignment CROSS_AXIS_ALIGNMENT_TOP = CrossAxisAlignment.Companion.vertical$foundation_layout_release(Alignment.Companion.getTop());
    private static final CrossAxisAlignment CROSS_AXIS_ALIGNMENT_START = CrossAxisAlignment.Companion.horizontal$foundation_layout_release(Alignment.Companion.getStart());

    /* JADX WARN: Code restructure failed: missing block: B:125:0x0197, code lost:
        if (r4 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L54;
     */
    /* JADX WARN: Code restructure failed: missing block: B:161:0x02a5, code lost:
        if (r1 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L78;
     */
    /* JADX WARN: Removed duplicated region for block: B:160:0x029d  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x02a9  */
    /* JADX WARN: Removed duplicated region for block: B:168:0x0304  */
    /* JADX WARN: Removed duplicated region for block: B:171:0x0310  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x0316  */
    /* JADX WARN: Removed duplicated region for block: B:183:0x039f  */
    @kotlin.Deprecated(message = "The overflow parameter has been deprecated")
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void FlowRow(androidx.compose.ui.Modifier r29, androidx.compose.foundation.layout.Arrangement.Horizontal r30, androidx.compose.foundation.layout.Arrangement.Vertical r31, androidx.compose.ui.Alignment.Vertical r32, int r33, int r34, androidx.compose.foundation.layout.FlowRowOverflow r35, final kotlin.jvm.functions.Function3<? super androidx.compose.foundation.layout.FlowRowScope, ? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r36, androidx.compose.runtime.Composer r37, final int r38, final int r39) {
        /*
            Method dump skipped, instructions count: 975
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.layout.FlowLayoutKt.FlowRow(androidx.compose.ui.Modifier, androidx.compose.foundation.layout.Arrangement$Horizontal, androidx.compose.foundation.layout.Arrangement$Vertical, androidx.compose.ui.Alignment$Vertical, int, int, androidx.compose.foundation.layout.FlowRowOverflow, kotlin.jvm.functions.Function3, androidx.compose.runtime.Composer, int, int):void");
    }

    public static final void FlowRow(Modifier modifier, Arrangement.Horizontal horizontalArrangement, Arrangement.Vertical verticalArrangement, Alignment.Vertical itemVerticalAlignment, int maxItemsInEachRow, int maxLines, final Function3<? super FlowRowScope, ? super Composer, ? super Integer, Unit> function3, Composer $composer, final int $changed, final int i) {
        Object obj;
        Object obj2;
        int maxItemsInEachRow2;
        int i2;
        Composer $composer2;
        final Arrangement.Vertical verticalArrangement2;
        int $dirty;
        final Modifier modifier2;
        final Arrangement.Horizontal horizontalArrangement2;
        final int maxLines2;
        final Alignment.Vertical itemVerticalAlignment2;
        final int maxItemsInEachRow3;
        int i3;
        Arrangement.Horizontal horizontalArrangement3;
        int i4;
        Alignment.Vertical itemVerticalAlignment3;
        Composer $composer3 = $composer.startRestartGroup(-2070229740);
        ComposerKt.sourceInformation($composer3, "C(FlowRow)P(5,1,6,2,3,4)161@7269L215:FlowLayout.kt#2w3rfo");
        int $dirty2 = $changed;
        int i5 = i & 1;
        if (i5 != 0) {
            $dirty2 |= 6;
            obj = modifier;
        } else if (($changed & 6) == 0) {
            obj = modifier;
            $dirty2 |= $composer3.changed(obj) ? 4 : 2;
        } else {
            obj = modifier;
        }
        int i6 = i & 2;
        if (i6 != 0) {
            $dirty2 |= 48;
            obj2 = horizontalArrangement;
        } else if (($changed & 48) == 0) {
            obj2 = horizontalArrangement;
            $dirty2 |= $composer3.changed(obj2) ? 32 : 16;
        } else {
            obj2 = horizontalArrangement;
        }
        int i7 = i & 4;
        if (i7 != 0) {
            $dirty2 |= 384;
        } else if (($changed & 384) == 0) {
            $dirty2 |= $composer3.changed(verticalArrangement) ? 256 : 128;
        }
        int i8 = i & 8;
        if (i8 != 0) {
            $dirty2 |= 3072;
        } else if (($changed & 3072) == 0) {
            $dirty2 |= $composer3.changed(itemVerticalAlignment) ? 2048 : 1024;
        }
        int i9 = i & 16;
        if (i9 != 0) {
            $dirty2 |= 24576;
            maxItemsInEachRow2 = maxItemsInEachRow;
        } else if (($changed & 24576) == 0) {
            maxItemsInEachRow2 = maxItemsInEachRow;
            $dirty2 |= $composer3.changed(maxItemsInEachRow2) ? 16384 : 8192;
        } else {
            maxItemsInEachRow2 = maxItemsInEachRow;
        }
        int i10 = i & 32;
        if (i10 != 0) {
            $dirty2 |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            i2 = maxLines;
        } else if ((196608 & $changed) == 0) {
            i2 = maxLines;
            $dirty2 |= $composer3.changed(i2) ? 131072 : 65536;
        } else {
            i2 = maxLines;
        }
        if ((i & 64) != 0) {
            $dirty2 |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty2 |= $composer3.changedInstance(function3) ? 1048576 : 524288;
        }
        if ($composer3.shouldExecute(($dirty2 & 599187) != 599186, $dirty2 & 1)) {
            Modifier modifier3 = i5 != 0 ? Modifier.Companion : obj;
            if (i6 != 0) {
                horizontalArrangement3 = Arrangement.INSTANCE.getStart();
                i3 = i8;
            } else {
                i3 = i8;
                horizontalArrangement3 = obj2;
            }
            Arrangement.Vertical verticalArrangement3 = i7 != 0 ? Arrangement.INSTANCE.getTop() : verticalArrangement;
            if (i3 != 0) {
                itemVerticalAlignment3 = Alignment.Companion.getTop();
                i4 = i9;
            } else {
                i4 = i9;
                itemVerticalAlignment3 = itemVerticalAlignment;
            }
            if (i4 != 0) {
                maxItemsInEachRow2 = Integer.MAX_VALUE;
            }
            int maxLines3 = i10 != 0 ? Integer.MAX_VALUE : i2;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-2070229740, $dirty2, -1, "androidx.compose.foundation.layout.FlowRow (FlowLayout.kt:161)");
            }
            $composer2 = $composer3;
            FlowRow(modifier3, horizontalArrangement3, verticalArrangement3, itemVerticalAlignment3, maxItemsInEachRow2, maxLines3, FlowRowOverflow.Companion.getClip(), function3, $composer2, ($dirty2 & 14) | 1572864 | ($dirty2 & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty2 & 896) | ($dirty2 & 7168) | (57344 & $dirty2) | (458752 & $dirty2) | (($dirty2 << 3) & 29360128), 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            $dirty = $dirty2;
            modifier2 = modifier3;
            horizontalArrangement2 = horizontalArrangement3;
            verticalArrangement2 = verticalArrangement3;
            itemVerticalAlignment2 = itemVerticalAlignment3;
            maxLines2 = maxLines3;
            maxItemsInEachRow3 = maxItemsInEachRow2;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            verticalArrangement2 = verticalArrangement;
            $dirty = $dirty2;
            modifier2 = obj;
            horizontalArrangement2 = obj2;
            maxLines2 = i2;
            itemVerticalAlignment2 = itemVerticalAlignment;
            maxItemsInEachRow3 = maxItemsInEachRow2;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.layout.FlowLayoutKt$FlowRow$2
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

                public final void invoke(Composer composer, int i11) {
                    FlowLayoutKt.FlowRow(Modifier.this, horizontalArrangement2, verticalArrangement2, itemVerticalAlignment2, maxItemsInEachRow3, maxLines2, function3, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:125:0x0197, code lost:
        if (r4 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L54;
     */
    /* JADX WARN: Code restructure failed: missing block: B:161:0x02a5, code lost:
        if (r1 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L78;
     */
    /* JADX WARN: Removed duplicated region for block: B:160:0x029d  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x02a9  */
    /* JADX WARN: Removed duplicated region for block: B:168:0x0304  */
    /* JADX WARN: Removed duplicated region for block: B:171:0x0310  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x0316  */
    /* JADX WARN: Removed duplicated region for block: B:183:0x039f  */
    @kotlin.Deprecated(message = "The overflow parameter has been deprecated")
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void FlowColumn(androidx.compose.ui.Modifier r29, androidx.compose.foundation.layout.Arrangement.Vertical r30, androidx.compose.foundation.layout.Arrangement.Horizontal r31, androidx.compose.ui.Alignment.Horizontal r32, int r33, int r34, androidx.compose.foundation.layout.FlowColumnOverflow r35, final kotlin.jvm.functions.Function3<? super androidx.compose.foundation.layout.FlowColumnScope, ? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r36, androidx.compose.runtime.Composer r37, final int r38, final int r39) {
        /*
            Method dump skipped, instructions count: 975
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.layout.FlowLayoutKt.FlowColumn(androidx.compose.ui.Modifier, androidx.compose.foundation.layout.Arrangement$Vertical, androidx.compose.foundation.layout.Arrangement$Horizontal, androidx.compose.ui.Alignment$Horizontal, int, int, androidx.compose.foundation.layout.FlowColumnOverflow, kotlin.jvm.functions.Function3, androidx.compose.runtime.Composer, int, int):void");
    }

    public static final void FlowColumn(Modifier modifier, Arrangement.Vertical verticalArrangement, Arrangement.Horizontal horizontalArrangement, Alignment.Horizontal itemHorizontalAlignment, int maxItemsInEachColumn, int maxLines, final Function3<? super FlowColumnScope, ? super Composer, ? super Integer, Unit> function3, Composer $composer, final int $changed, final int i) {
        Object obj;
        Object obj2;
        int maxItemsInEachColumn2;
        int i2;
        Composer $composer2;
        final Arrangement.Horizontal horizontalArrangement2;
        int $dirty;
        final Modifier modifier2;
        final Arrangement.Vertical verticalArrangement2;
        final int maxLines2;
        final Alignment.Horizontal itemHorizontalAlignment2;
        final int maxItemsInEachColumn3;
        int i3;
        Arrangement.Vertical verticalArrangement3;
        int i4;
        Alignment.Horizontal itemHorizontalAlignment3;
        Composer $composer3 = $composer.startRestartGroup(-208106226);
        ComposerKt.sourceInformation($composer3, "C(FlowColumn)P(5,6,1,2,3,4)270@11890L226:FlowLayout.kt#2w3rfo");
        int $dirty2 = $changed;
        int i5 = i & 1;
        if (i5 != 0) {
            $dirty2 |= 6;
            obj = modifier;
        } else if (($changed & 6) == 0) {
            obj = modifier;
            $dirty2 |= $composer3.changed(obj) ? 4 : 2;
        } else {
            obj = modifier;
        }
        int i6 = i & 2;
        if (i6 != 0) {
            $dirty2 |= 48;
            obj2 = verticalArrangement;
        } else if (($changed & 48) == 0) {
            obj2 = verticalArrangement;
            $dirty2 |= $composer3.changed(obj2) ? 32 : 16;
        } else {
            obj2 = verticalArrangement;
        }
        int i7 = i & 4;
        if (i7 != 0) {
            $dirty2 |= 384;
        } else if (($changed & 384) == 0) {
            $dirty2 |= $composer3.changed(horizontalArrangement) ? 256 : 128;
        }
        int i8 = i & 8;
        if (i8 != 0) {
            $dirty2 |= 3072;
        } else if (($changed & 3072) == 0) {
            $dirty2 |= $composer3.changed(itemHorizontalAlignment) ? 2048 : 1024;
        }
        int i9 = i & 16;
        if (i9 != 0) {
            $dirty2 |= 24576;
            maxItemsInEachColumn2 = maxItemsInEachColumn;
        } else if (($changed & 24576) == 0) {
            maxItemsInEachColumn2 = maxItemsInEachColumn;
            $dirty2 |= $composer3.changed(maxItemsInEachColumn2) ? 16384 : 8192;
        } else {
            maxItemsInEachColumn2 = maxItemsInEachColumn;
        }
        int i10 = i & 32;
        if (i10 != 0) {
            $dirty2 |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            i2 = maxLines;
        } else if ((196608 & $changed) == 0) {
            i2 = maxLines;
            $dirty2 |= $composer3.changed(i2) ? 131072 : 65536;
        } else {
            i2 = maxLines;
        }
        if ((i & 64) != 0) {
            $dirty2 |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty2 |= $composer3.changedInstance(function3) ? 1048576 : 524288;
        }
        if ($composer3.shouldExecute(($dirty2 & 599187) != 599186, $dirty2 & 1)) {
            Modifier modifier3 = i5 != 0 ? Modifier.Companion : obj;
            if (i6 != 0) {
                verticalArrangement3 = Arrangement.INSTANCE.getTop();
                i3 = i8;
            } else {
                i3 = i8;
                verticalArrangement3 = obj2;
            }
            Arrangement.Horizontal horizontalArrangement3 = i7 != 0 ? Arrangement.INSTANCE.getStart() : horizontalArrangement;
            if (i3 != 0) {
                itemHorizontalAlignment3 = Alignment.Companion.getStart();
                i4 = i9;
            } else {
                i4 = i9;
                itemHorizontalAlignment3 = itemHorizontalAlignment;
            }
            if (i4 != 0) {
                maxItemsInEachColumn2 = Integer.MAX_VALUE;
            }
            int maxLines3 = i10 != 0 ? Integer.MAX_VALUE : i2;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-208106226, $dirty2, -1, "androidx.compose.foundation.layout.FlowColumn (FlowLayout.kt:270)");
            }
            $composer2 = $composer3;
            FlowColumn(modifier3, verticalArrangement3, horizontalArrangement3, itemHorizontalAlignment3, maxItemsInEachColumn2, maxLines3, FlowColumnOverflow.Companion.getClip(), function3, $composer2, ($dirty2 & 14) | 1572864 | ($dirty2 & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty2 & 896) | ($dirty2 & 7168) | (57344 & $dirty2) | (458752 & $dirty2) | (($dirty2 << 3) & 29360128), 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            $dirty = $dirty2;
            modifier2 = modifier3;
            verticalArrangement2 = verticalArrangement3;
            horizontalArrangement2 = horizontalArrangement3;
            itemHorizontalAlignment2 = itemHorizontalAlignment3;
            maxLines2 = maxLines3;
            maxItemsInEachColumn3 = maxItemsInEachColumn2;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            horizontalArrangement2 = horizontalArrangement;
            $dirty = $dirty2;
            modifier2 = obj;
            verticalArrangement2 = obj2;
            maxLines2 = i2;
            itemHorizontalAlignment2 = itemHorizontalAlignment;
            maxItemsInEachColumn3 = maxItemsInEachColumn2;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.layout.FlowLayoutKt$FlowColumn$2
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

                public final void invoke(Composer composer, int i11) {
                    FlowLayoutKt.FlowColumn(Modifier.this, verticalArrangement2, horizontalArrangement2, itemHorizontalAlignment2, maxItemsInEachColumn3, maxLines2, function3, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x004a, code lost:
        if (r22.changed(r9) == false) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0065, code lost:
        if (r22.changed(r13) == false) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x006c, code lost:
        if ((r23 & 384) == 256) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x006e, code lost:
        r4 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x006f, code lost:
        r2 = r2 | r4;
        r5 = r22.rememberedValue();
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x007a, code lost:
        if (r2 != false) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0082, code lost:
        if (r5 != androidx.compose.runtime.Composer.Companion.getEmpty()) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0086, code lost:
        r6 = new androidx.compose.foundation.layout.FlowMeasurePolicy(true, r8, r9, r8.mo880getSpacingD9Ej5fM(), androidx.compose.foundation.layout.FlowLayoutKt.CROSS_AXIS_ALIGNMENT_TOP, r9.mo880getSpacingD9Ej5fM(), r13, Integer.MAX_VALUE, androidx.compose.foundation.layout.FlowRowOverflow.Companion.getVisible().createOverflowState$foundation_layout_release(), null);
        r7 = (androidx.compose.ui.layout.MeasurePolicy) new androidx.compose.foundation.layout.FlowLayoutKt$rowMeasurementHelper$1$1(r6);
        r22.updateRememberedValue(r7);
        r5 = r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00c0, code lost:
        r5 = (androidx.compose.ui.layout.MeasurePolicy) r5;
        androidx.compose.runtime.ComposerKt.sourceInformationMarkerEnd(r22);
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00ca, code lost:
        if (androidx.compose.runtime.ComposerKt.isTraceInProgress() == false) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00cc, code lost:
        androidx.compose.runtime.ComposerKt.traceEventEnd();
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00cf, code lost:
        androidx.compose.runtime.ComposerKt.sourceInformationMarkerEnd(r22);
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00d2, code lost:
        return r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0030, code lost:
        if (r22.changed(r8) == false) goto L37;
     */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0068  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final androidx.compose.ui.layout.MeasurePolicy rowMeasurementHelper(androidx.compose.foundation.layout.Arrangement.Horizontal r19, androidx.compose.foundation.layout.Arrangement.Vertical r20, int r21, androidx.compose.runtime.Composer r22, int r23) {
        /*
            r0 = r22
            r1 = r23
            r2 = 1479255111(0x582ba447, float:7.548882E14)
            java.lang.String r3 = "C(rowMeasurementHelper)P(!1,2)450@17773L923:FlowLayout.kt#2w3rfo"
            androidx.compose.runtime.ComposerKt.sourceInformationMarkerStart(r0, r2, r3)
            boolean r3 = androidx.compose.runtime.ComposerKt.isTraceInProgress()
            if (r3 == 0) goto L19
            r3 = -1
            java.lang.String r4 = "androidx.compose.foundation.layout.rowMeasurementHelper (FlowLayout.kt:449)"
            androidx.compose.runtime.ComposerKt.traceEventStart(r2, r1, r3, r4)
        L19:
            r2 = -75192171(0xfffffffffb84a895, float:-1.3776049E36)
            java.lang.String r3 = "CC(remember):FlowLayout.kt#9igjgp"
            androidx.compose.runtime.ComposerKt.sourceInformationMarkerStart(r0, r2, r3)
            r2 = r1 & 14
            r2 = r2 ^ 6
            r3 = 4
            r4 = 0
            r5 = 1
            if (r2 <= r3) goto L33
            r8 = r19
            boolean r2 = r0.changed(r8)
            if (r2 != 0) goto L39
            goto L35
        L33:
            r8 = r19
        L35:
            r2 = r1 & 6
            if (r2 != r3) goto L3b
        L39:
            r2 = r5
            goto L3c
        L3b:
            r2 = r4
        L3c:
            r3 = r1 & 112(0x70, float:1.57E-43)
            r3 = r3 ^ 48
            r6 = 32
            if (r3 <= r6) goto L4d
            r9 = r20
            boolean r3 = r0.changed(r9)
            if (r3 != 0) goto L53
            goto L4f
        L4d:
            r9 = r20
        L4f:
            r3 = r1 & 48
            if (r3 != r6) goto L55
        L53:
            r3 = r5
            goto L56
        L55:
            r3 = r4
        L56:
            r2 = r2 | r3
            r3 = r1 & 896(0x380, float:1.256E-42)
            r3 = r3 ^ 384(0x180, float:5.38E-43)
            r6 = 256(0x100, float:3.59E-43)
            if (r3 <= r6) goto L68
            r13 = r21
            boolean r3 = r0.changed(r13)
            if (r3 != 0) goto L6e
            goto L6a
        L68:
            r13 = r21
        L6a:
            r3 = r1 & 384(0x180, float:5.38E-43)
            if (r3 != r6) goto L6f
        L6e:
            r4 = r5
        L6f:
            r2 = r2 | r4
            r3 = r22
            r4 = 0
            java.lang.Object r5 = r3.rememberedValue()
            r17 = 0
            if (r2 != 0) goto L86
            androidx.compose.runtime.Composer$Companion r6 = androidx.compose.runtime.Composer.Companion
            java.lang.Object r6 = r6.getEmpty()
            if (r5 != r6) goto L85
            goto L86
        L85:
            goto Lc0
        L86:
            r18 = 0
            float r10 = r8.mo880getSpacingD9Ej5fM()
            androidx.compose.foundation.layout.CrossAxisAlignment r11 = androidx.compose.foundation.layout.FlowLayoutKt.CROSS_AXIS_ALIGNMENT_TOP
            float r12 = r9.mo880getSpacingD9Ej5fM()
            androidx.compose.foundation.layout.FlowRowOverflow$Companion r6 = androidx.compose.foundation.layout.FlowRowOverflow.Companion
            androidx.compose.foundation.layout.FlowRowOverflow r6 = r6.getVisible()
            androidx.compose.foundation.layout.FlowLayoutOverflowState r15 = r6.createOverflowState$foundation_layout_release()
            androidx.compose.foundation.layout.FlowMeasurePolicy r6 = new androidx.compose.foundation.layout.FlowMeasurePolicy
            r7 = 1
            r14 = 2147483647(0x7fffffff, float:NaN)
            r16 = 0
            r6.<init>(r7, r8, r9, r10, r11, r12, r13, r14, r15, r16)
            androidx.compose.ui.layout.MultiContentMeasurePolicy r6 = (androidx.compose.ui.layout.MultiContentMeasurePolicy) r6
            androidx.compose.foundation.layout.FlowLayoutKt$rowMeasurementHelper$1$1 r7 = new androidx.compose.foundation.layout.FlowLayoutKt$rowMeasurementHelper$1$1
            r7.<init>()
            androidx.compose.ui.layout.MeasurePolicy r7 = (androidx.compose.ui.layout.MeasurePolicy) r7
            r3.updateRememberedValue(r7)
            r5 = r7
        Lc0:
            androidx.compose.ui.layout.MeasurePolicy r5 = (androidx.compose.ui.layout.MeasurePolicy) r5
            androidx.compose.runtime.ComposerKt.sourceInformationMarkerEnd(r0)
            boolean r2 = androidx.compose.runtime.ComposerKt.isTraceInProgress()
            if (r2 == 0) goto Lcf
            androidx.compose.runtime.ComposerKt.traceEventEnd()
        Lcf:
            androidx.compose.runtime.ComposerKt.sourceInformationMarkerEnd(r0)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.layout.FlowLayoutKt.rowMeasurementHelper(androidx.compose.foundation.layout.Arrangement$Horizontal, androidx.compose.foundation.layout.Arrangement$Vertical, int, androidx.compose.runtime.Composer, int):androidx.compose.ui.layout.MeasurePolicy");
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x004c, code lost:
        if (r27.changed(r10) == false) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x007d, code lost:
        if (r27.changed(r14) == false) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x009a, code lost:
        if (r27.changed(r15) == false) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00a1, code lost:
        if ((r28 & 24576) != 16384) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00a3, code lost:
        r5 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00a4, code lost:
        r3 = (r3 | r5) | r27.changed(r26);
        r7 = r27.rememberedValue();
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00b6, code lost:
        if (r3 != false) goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x00be, code lost:
        if (r7 != androidx.compose.runtime.Composer.Companion.getEmpty()) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x00c2, code lost:
        r7 = new androidx.compose.foundation.layout.FlowMeasurePolicy(true, r9, r10, r9.mo880getSpacingD9Ej5fM(), androidx.compose.foundation.layout.CrossAxisAlignment.Companion.vertical$foundation_layout_release(r23), r10.mo880getSpacingD9Ej5fM(), r14, r15, r26, null);
        r27.updateRememberedValue(r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x00f2, code lost:
        r7 = (androidx.compose.foundation.layout.FlowMeasurePolicy) r7;
        androidx.compose.runtime.ComposerKt.sourceInformationMarkerEnd(r27);
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x00fc, code lost:
        if (androidx.compose.runtime.ComposerKt.isTraceInProgress() == false) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x00fe, code lost:
        androidx.compose.runtime.ComposerKt.traceEventEnd();
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x0101, code lost:
        androidx.compose.runtime.ComposerKt.sourceInformationMarkerEnd(r27);
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0106, code lost:
        return r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0032, code lost:
        if (r27.changed(r9) == false) goto L54;
     */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0088  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x009d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final androidx.compose.ui.layout.MultiContentMeasurePolicy rowMeasurementMultiContentHelper(androidx.compose.foundation.layout.Arrangement.Horizontal r21, androidx.compose.foundation.layout.Arrangement.Vertical r22, androidx.compose.ui.Alignment.Vertical r23, int r24, int r25, androidx.compose.foundation.layout.FlowLayoutOverflowState r26, androidx.compose.runtime.Composer r27, int r28) {
        /*
            Method dump skipped, instructions count: 263
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.layout.FlowLayoutKt.rowMeasurementMultiContentHelper(androidx.compose.foundation.layout.Arrangement$Horizontal, androidx.compose.foundation.layout.Arrangement$Vertical, androidx.compose.ui.Alignment$Vertical, int, int, androidx.compose.foundation.layout.FlowLayoutOverflowState, androidx.compose.runtime.Composer, int):androidx.compose.ui.layout.MultiContentMeasurePolicy");
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x004a, code lost:
        if (r22.changed(r8) == false) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0065, code lost:
        if (r22.changed(r13) == false) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x006c, code lost:
        if ((r23 & 384) == 256) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x006e, code lost:
        r4 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x006f, code lost:
        r2 = r2 | r4;
        r5 = r22.rememberedValue();
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x007a, code lost:
        if (r2 != false) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0082, code lost:
        if (r5 != androidx.compose.runtime.Composer.Companion.getEmpty()) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0086, code lost:
        r6 = new androidx.compose.foundation.layout.FlowMeasurePolicy(false, r8, r9, r9.mo880getSpacingD9Ej5fM(), androidx.compose.foundation.layout.FlowLayoutKt.CROSS_AXIS_ALIGNMENT_START, r8.mo880getSpacingD9Ej5fM(), r13, Integer.MAX_VALUE, androidx.compose.foundation.layout.FlowRowOverflow.Companion.getVisible().createOverflowState$foundation_layout_release(), null);
        r7 = (androidx.compose.ui.layout.MeasurePolicy) new androidx.compose.foundation.layout.FlowLayoutKt$columnMeasurementHelper$1$1(r6);
        r22.updateRememberedValue(r7);
        r5 = r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00be, code lost:
        r5 = (androidx.compose.ui.layout.MeasurePolicy) r5;
        androidx.compose.runtime.ComposerKt.sourceInformationMarkerEnd(r22);
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00c8, code lost:
        if (androidx.compose.runtime.ComposerKt.isTraceInProgress() == false) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00ca, code lost:
        androidx.compose.runtime.ComposerKt.traceEventEnd();
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00cd, code lost:
        androidx.compose.runtime.ComposerKt.sourceInformationMarkerEnd(r22);
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00d0, code lost:
        return r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0030, code lost:
        if (r22.changed(r9) == false) goto L37;
     */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0068  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final androidx.compose.ui.layout.MeasurePolicy columnMeasurementHelper(androidx.compose.foundation.layout.Arrangement.Vertical r19, androidx.compose.foundation.layout.Arrangement.Horizontal r20, int r21, androidx.compose.runtime.Composer r22, int r23) {
        /*
            r0 = r22
            r1 = r23
            r2 = -2013098357(0xffffffff88028e8b, float:-3.928801E-34)
            java.lang.String r3 = "C(columnMeasurementHelper)P(2)515@20043L880:FlowLayout.kt#2w3rfo"
            androidx.compose.runtime.ComposerKt.sourceInformationMarkerStart(r0, r2, r3)
            boolean r3 = androidx.compose.runtime.ComposerKt.isTraceInProgress()
            if (r3 == 0) goto L19
            r3 = -1
            java.lang.String r4 = "androidx.compose.foundation.layout.columnMeasurementHelper (FlowLayout.kt:514)"
            androidx.compose.runtime.ComposerKt.traceEventStart(r2, r1, r3, r4)
        L19:
            r2 = 1838024154(0x6d8e05da, float:5.494243E27)
            java.lang.String r3 = "CC(remember):FlowLayout.kt#9igjgp"
            androidx.compose.runtime.ComposerKt.sourceInformationMarkerStart(r0, r2, r3)
            r2 = r1 & 14
            r2 = r2 ^ 6
            r3 = 4
            r4 = 0
            r5 = 1
            if (r2 <= r3) goto L33
            r9 = r19
            boolean r2 = r0.changed(r9)
            if (r2 != 0) goto L39
            goto L35
        L33:
            r9 = r19
        L35:
            r2 = r1 & 6
            if (r2 != r3) goto L3b
        L39:
            r2 = r5
            goto L3c
        L3b:
            r2 = r4
        L3c:
            r3 = r1 & 112(0x70, float:1.57E-43)
            r3 = r3 ^ 48
            r6 = 32
            if (r3 <= r6) goto L4d
            r8 = r20
            boolean r3 = r0.changed(r8)
            if (r3 != 0) goto L53
            goto L4f
        L4d:
            r8 = r20
        L4f:
            r3 = r1 & 48
            if (r3 != r6) goto L55
        L53:
            r3 = r5
            goto L56
        L55:
            r3 = r4
        L56:
            r2 = r2 | r3
            r3 = r1 & 896(0x380, float:1.256E-42)
            r3 = r3 ^ 384(0x180, float:5.38E-43)
            r6 = 256(0x100, float:3.59E-43)
            if (r3 <= r6) goto L68
            r13 = r21
            boolean r3 = r0.changed(r13)
            if (r3 != 0) goto L6e
            goto L6a
        L68:
            r13 = r21
        L6a:
            r3 = r1 & 384(0x180, float:5.38E-43)
            if (r3 != r6) goto L6f
        L6e:
            r4 = r5
        L6f:
            r2 = r2 | r4
            r3 = r22
            r4 = 0
            java.lang.Object r5 = r3.rememberedValue()
            r17 = 0
            if (r2 != 0) goto L86
            androidx.compose.runtime.Composer$Companion r6 = androidx.compose.runtime.Composer.Companion
            java.lang.Object r6 = r6.getEmpty()
            if (r5 != r6) goto L85
            goto L86
        L85:
            goto Lbe
        L86:
            r18 = 0
            float r10 = r9.mo880getSpacingD9Ej5fM()
            androidx.compose.foundation.layout.CrossAxisAlignment r11 = androidx.compose.foundation.layout.FlowLayoutKt.CROSS_AXIS_ALIGNMENT_START
            float r12 = r8.mo880getSpacingD9Ej5fM()
            androidx.compose.foundation.layout.FlowRowOverflow$Companion r6 = androidx.compose.foundation.layout.FlowRowOverflow.Companion
            androidx.compose.foundation.layout.FlowRowOverflow r6 = r6.getVisible()
            androidx.compose.foundation.layout.FlowLayoutOverflowState r15 = r6.createOverflowState$foundation_layout_release()
            androidx.compose.foundation.layout.FlowMeasurePolicy r6 = new androidx.compose.foundation.layout.FlowMeasurePolicy
            r7 = 0
            r14 = 2147483647(0x7fffffff, float:NaN)
            r16 = 0
            r6.<init>(r7, r8, r9, r10, r11, r12, r13, r14, r15, r16)
            androidx.compose.foundation.layout.FlowLayoutKt$columnMeasurementHelper$1$1 r7 = new androidx.compose.foundation.layout.FlowLayoutKt$columnMeasurementHelper$1$1
            r7.<init>()
            androidx.compose.ui.layout.MeasurePolicy r7 = (androidx.compose.ui.layout.MeasurePolicy) r7
            r3.updateRememberedValue(r7)
            r5 = r7
        Lbe:
            androidx.compose.ui.layout.MeasurePolicy r5 = (androidx.compose.ui.layout.MeasurePolicy) r5
            androidx.compose.runtime.ComposerKt.sourceInformationMarkerEnd(r0)
            boolean r2 = androidx.compose.runtime.ComposerKt.isTraceInProgress()
            if (r2 == 0) goto Lcd
            androidx.compose.runtime.ComposerKt.traceEventEnd()
        Lcd:
            androidx.compose.runtime.ComposerKt.sourceInformationMarkerEnd(r0)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.layout.FlowLayoutKt.columnMeasurementHelper(androidx.compose.foundation.layout.Arrangement$Vertical, androidx.compose.foundation.layout.Arrangement$Horizontal, int, androidx.compose.runtime.Composer, int):androidx.compose.ui.layout.MeasurePolicy");
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x004c, code lost:
        if (r27.changed(r9) == false) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x007d, code lost:
        if (r27.changed(r14) == false) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x009a, code lost:
        if (r27.changed(r15) == false) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00a1, code lost:
        if ((r28 & 24576) != 16384) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00a3, code lost:
        r5 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00a4, code lost:
        r3 = (r3 | r5) | r27.changed(r26);
        r7 = r27.rememberedValue();
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00b6, code lost:
        if (r3 != false) goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x00be, code lost:
        if (r7 != androidx.compose.runtime.Composer.Companion.getEmpty()) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x00c2, code lost:
        r7 = new androidx.compose.foundation.layout.FlowMeasurePolicy(false, r9, r10, r10.mo880getSpacingD9Ej5fM(), androidx.compose.foundation.layout.CrossAxisAlignment.Companion.horizontal$foundation_layout_release(r23), r9.mo880getSpacingD9Ej5fM(), r14, r15, r26, null);
        r27.updateRememberedValue(r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x00f2, code lost:
        r7 = (androidx.compose.foundation.layout.FlowMeasurePolicy) r7;
        androidx.compose.runtime.ComposerKt.sourceInformationMarkerEnd(r27);
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x00fc, code lost:
        if (androidx.compose.runtime.ComposerKt.isTraceInProgress() == false) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x00fe, code lost:
        androidx.compose.runtime.ComposerKt.traceEventEnd();
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x0101, code lost:
        androidx.compose.runtime.ComposerKt.sourceInformationMarkerEnd(r27);
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0106, code lost:
        return r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0032, code lost:
        if (r27.changed(r10) == false) goto L54;
     */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0088  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x009d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final androidx.compose.ui.layout.MultiContentMeasurePolicy columnMeasurementMultiContentHelper(androidx.compose.foundation.layout.Arrangement.Vertical r21, androidx.compose.foundation.layout.Arrangement.Horizontal r22, androidx.compose.ui.Alignment.Horizontal r23, int r24, int r25, androidx.compose.foundation.layout.FlowLayoutOverflowState r26, androidx.compose.runtime.Composer r27, int r28) {
        /*
            Method dump skipped, instructions count: 263
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.layout.FlowLayoutKt.columnMeasurementMultiContentHelper(androidx.compose.foundation.layout.Arrangement$Vertical, androidx.compose.foundation.layout.Arrangement$Horizontal, androidx.compose.ui.Alignment$Horizontal, int, int, androidx.compose.foundation.layout.FlowLayoutOverflowState, androidx.compose.runtime.Composer, int):androidx.compose.ui.layout.MultiContentMeasurePolicy");
    }

    private static final int maxIntrinsicMainAxisSize(List<? extends IntrinsicMeasurable> list, Function3<? super IntrinsicMeasurable, ? super Integer, ? super Integer, Integer> function3, int crossAxisAvailable, int mainAxisSpacing, int maxItemsInMainAxis) {
        int $i$f$maxIntrinsicMainAxisSize;
        int $i$f$maxIntrinsicMainAxisSize2 = 0;
        int fixedSpace = 0;
        int currentFixedSpace = 0;
        int lastBreak = 0;
        int index$iv = 0;
        int size = list.size();
        while (index$iv < size) {
            Object item$iv = list.get(index$iv);
            IntrinsicMeasurable child = (IntrinsicMeasurable) item$iv;
            int index = index$iv;
            int size2 = function3.invoke(child, Integer.valueOf(index), Integer.valueOf(crossAxisAvailable)).intValue() + mainAxisSpacing;
            if ((index + 1) - lastBreak != maxItemsInMainAxis) {
                int i = index + 1;
                $i$f$maxIntrinsicMainAxisSize = $i$f$maxIntrinsicMainAxisSize2;
                int $i$f$maxIntrinsicMainAxisSize3 = list.size();
                if (i != $i$f$maxIntrinsicMainAxisSize3) {
                    currentFixedSpace += size2;
                    index$iv++;
                    $i$f$maxIntrinsicMainAxisSize2 = $i$f$maxIntrinsicMainAxisSize;
                }
            } else {
                $i$f$maxIntrinsicMainAxisSize = $i$f$maxIntrinsicMainAxisSize2;
            }
            fixedSpace = Math.max(fixedSpace, (currentFixedSpace + size2) - mainAxisSpacing);
            currentFixedSpace = 0;
            lastBreak = index;
            index$iv++;
            $i$f$maxIntrinsicMainAxisSize2 = $i$f$maxIntrinsicMainAxisSize;
        }
        return fixedSpace;
    }

    /* JADX WARN: Type inference failed for: r0v10, types: [kotlin.collections.IntIterator] */
    /* JADX WARN: Type inference failed for: r0v3, types: [kotlin.collections.IntIterator] */
    private static final int minIntrinsicMainAxisSize(List<? extends IntrinsicMeasurable> list, Function3<? super IntrinsicMeasurable, ? super Integer, ? super Integer, Integer> function3, Function3<? super IntrinsicMeasurable, ? super Integer, ? super Integer, Integer> function32, int crossAxisAvailable, int mainAxisSpacing, int crossAxisSpacing, int maxItemsInMainAxis, int maxLines, FlowLayoutOverflowState overflow) {
        int i = maxItemsInMainAxis;
        int i2 = maxLines;
        int high = 0;
        if (list.isEmpty()) {
            return 0;
        }
        int[] mainAxisSizes = new int[list.size()];
        int[] crossAxisSizes = new int[list.size()];
        int size = list.size();
        for (int index = 0; index < size; index++) {
            IntrinsicMeasurable child = list.get(index);
            int mainAxisItemSize = function3.invoke(child, Integer.valueOf(index), Integer.valueOf(crossAxisAvailable)).intValue();
            mainAxisSizes[index] = mainAxisItemSize;
            crossAxisSizes[index] = function32.invoke(child, Integer.valueOf(index), Integer.valueOf(mainAxisItemSize)).intValue();
        }
        int maxItemsThatCanBeShown = Integer.MAX_VALUE;
        if (i2 != Integer.MAX_VALUE && i != Integer.MAX_VALUE) {
            maxItemsThatCanBeShown = i * i2;
        }
        boolean mustHaveEllipsis = (maxItemsThatCanBeShown >= list.size() || !(overflow.getType$foundation_layout_release() == FlowLayoutOverflow.OverflowType.ExpandIndicator || overflow.getType$foundation_layout_release() == FlowLayoutOverflow.OverflowType.ExpandOrCollapseIndicator)) ? maxItemsThatCanBeShown >= list.size() && i2 >= overflow.getMinLinesToShowCollapse$foundation_layout_release() && overflow.getType$foundation_layout_release() == FlowLayoutOverflow.OverflowType.ExpandOrCollapseIndicator : true;
        int maxItemsThatCanBeShown2 = Math.min(maxItemsThatCanBeShown - (mustHaveEllipsis ? 1 : 0), list.size());
        int $this$minIntrinsicMainAxisSize_u24lambda_u249 = ArraysKt.sum(mainAxisSizes);
        int maxMainAxisSize = ((list.size() - 1) * mainAxisSpacing) + $this$minIntrinsicMainAxisSize_u24lambda_u249;
        int mainAxisUsed = maxMainAxisSize;
        if (crossAxisSizes.length == 0) {
            throw new NoSuchElementException();
        }
        int crossAxisUsed = crossAxisSizes[0];
        ?? it = new IntRange(1, ArraysKt.getLastIndex(crossAxisSizes)).iterator();
        while (it.hasNext()) {
            int it2 = crossAxisSizes[it.nextInt()];
            if (crossAxisUsed < it2) {
                crossAxisUsed = it2;
            }
        }
        if (mainAxisSizes.length == 0) {
            throw new NoSuchElementException();
        }
        int it3 = mainAxisSizes[0];
        ?? it4 = new IntRange(1, ArraysKt.getLastIndex(mainAxisSizes)).iterator();
        int i3 = it3;
        while (it4.hasNext()) {
            int it5 = mainAxisSizes[it4.nextInt()];
            if (i3 < it5) {
                i3 = it5;
            }
        }
        int minimumItemSize = i3;
        int itemShown = minimumItemSize;
        int high2 = maxMainAxisSize;
        while (itemShown <= high2) {
            if (crossAxisUsed == crossAxisAvailable) {
                return mainAxisUsed;
            }
            int mid = (itemShown + high2) / 2;
            int high3 = high2;
            int[] crossAxisSizes2 = crossAxisSizes;
            int low = itemShown;
            int $i$f$minIntrinsicMainAxisSize = high;
            long pair = intrinsicCrossAxisSize(list, mainAxisSizes, crossAxisSizes2, mid, mainAxisSpacing, crossAxisSpacing, i, i2, overflow);
            crossAxisUsed = IntIntPair.m288getFirstimpl(pair);
            int itemShown2 = IntIntPair.m289getSecondimpl(pair);
            if (crossAxisUsed > crossAxisAvailable || itemShown2 < maxItemsThatCanBeShown2) {
                int low2 = mid + 1;
                if (low2 > high3) {
                    return low2;
                }
                i = maxItemsInMainAxis;
                i2 = maxLines;
                itemShown = low2;
                mainAxisUsed = mid;
                crossAxisSizes = crossAxisSizes2;
                high2 = high3;
                high = $i$f$minIntrinsicMainAxisSize;
            } else if (crossAxisUsed >= crossAxisAvailable) {
                return mid;
            } else {
                crossAxisSizes = crossAxisSizes2;
                high2 = mid - 1;
                mainAxisUsed = mid;
                i = maxItemsInMainAxis;
                i2 = maxLines;
                itemShown = low;
                high = $i$f$minIntrinsicMainAxisSize;
            }
        }
        return mainAxisUsed;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final long intrinsicCrossAxisSize(List<? extends IntrinsicMeasurable> list, int[] mainAxisSizes, int[] crossAxisSizes, int mainAxisAvailable, int mainAxisSpacing, int crossAxisSpacing, int maxItemsInMainAxis, int maxLines, FlowLayoutOverflowState overflow) {
        IntIntPair m281boximpl;
        List<? extends IntrinsicMeasurable> list2 = list;
        boolean z = false;
        if (list2.isEmpty()) {
            return IntIntPair.m284constructorimpl(0, 0);
        }
        FlowLayoutBuildingBlocks buildingBlocks$iv = new FlowLayoutBuildingBlocks(maxItemsInMainAxis, overflow, OrientationIndependentConstraints.m960constructorimpl(0, mainAxisAvailable, 0, Integer.MAX_VALUE), maxLines, mainAxisSpacing, crossAxisSpacing, null);
        IntrinsicMeasurable nextChild$iv = (IntrinsicMeasurable) CollectionsKt.getOrNull(list2, 0);
        int index = nextChild$iv != null ? crossAxisSizes[0] : 0;
        int index2 = nextChild$iv != null ? mainAxisSizes[0] : 0;
        int childCrossAxisSize$iv = index2;
        int nextCrossAxisSize$iv = index;
        if (!buildingBlocks$iv.m915getWrapInfoOpUlnko(list2.size() > 1, 0, IntIntPair.m284constructorimpl(mainAxisAvailable, Integer.MAX_VALUE), nextChild$iv == null ? null : IntIntPair.m281boximpl(IntIntPair.m284constructorimpl(index2, index)), 0, 0, 0, false, false).isLastItemInContainer()) {
            int size = list2.size();
            int currentCrossAxisSize$iv = 0;
            int currentCrossAxisSize$iv2 = 0;
            int totalCrossAxisSize$iv = 0;
            int lineIndex$iv = 0;
            int noOfItemsShown$iv = 0;
            int remaining$iv = mainAxisAvailable;
            int lastBreak$iv = 0;
            int nextCrossAxisSize$iv2 = nextCrossAxisSize$iv;
            while (true) {
                if (lineIndex$iv >= size) {
                    break;
                }
                int childCrossAxisSize$iv2 = nextCrossAxisSize$iv2;
                int childMainAxisSize$iv = childCrossAxisSize$iv;
                int remaining$iv2 = remaining$iv - childMainAxisSize$iv;
                int noOfItemsShown$iv2 = lineIndex$iv + 1;
                int index$iv = lineIndex$iv;
                int index$iv2 = totalCrossAxisSize$iv;
                int lineIndex$iv2 = currentCrossAxisSize$iv2;
                int currentCrossAxisSize$iv3 = Math.max(currentCrossAxisSize$iv, childCrossAxisSize$iv2);
                int currentCrossAxisSize$iv4 = index$iv + 1;
                IntrinsicMeasurable nextChild$iv2 = (IntrinsicMeasurable) CollectionsKt.getOrNull(list2, currentCrossAxisSize$iv4);
                int nextCrossAxisSize$iv3 = nextChild$iv2 != null ? crossAxisSizes[index$iv + 1] : size$iv;
                int index3 = nextChild$iv2 != null ? mainAxisSizes[index$iv + 1] + mainAxisSpacing : size$iv;
                boolean z2 = index$iv + 2 < list2.size();
                int nextCrossAxisSize$iv4 = (index$iv + 1) - lastBreak$iv;
                boolean z3 = z;
                long m284constructorimpl = IntIntPair.m284constructorimpl(remaining$iv2, Integer.MAX_VALUE);
                if (nextChild$iv2 == null) {
                    m281boximpl = null;
                } else {
                    m281boximpl = IntIntPair.m281boximpl(IntIntPair.m284constructorimpl(index3, nextCrossAxisSize$iv3));
                }
                int nextMainAxisSize$iv = index3;
                int remaining$iv3 = size;
                FlowLayoutBuildingBlocks.WrapInfo wrapInfo$iv = buildingBlocks$iv.m915getWrapInfoOpUlnko(z2, nextCrossAxisSize$iv4, m284constructorimpl, m281boximpl, index$iv2, lineIndex$iv2, currentCrossAxisSize$iv3, false, false);
                if (!wrapInfo$iv.isLastItemInLine()) {
                    remaining$iv = remaining$iv2;
                    currentCrossAxisSize$iv = currentCrossAxisSize$iv3;
                    childCrossAxisSize$iv = nextMainAxisSize$iv;
                    currentCrossAxisSize$iv2 = lineIndex$iv2;
                    totalCrossAxisSize$iv = index$iv2;
                } else {
                    int totalCrossAxisSize$iv2 = lineIndex$iv2 + currentCrossAxisSize$iv3 + crossAxisSpacing;
                    int lineIndex$iv3 = (index$iv + 1) - lastBreak$iv;
                    FlowLayoutBuildingBlocks.WrapEllipsisInfo ellipsisWrapInfo$iv = buildingBlocks$iv.getWrapEllipsisInfo(wrapInfo$iv, nextChild$iv2 != null, index$iv2, totalCrossAxisSize$iv2, remaining$iv2, lineIndex$iv3);
                    currentCrossAxisSize$iv = 0;
                    remaining$iv = mainAxisAvailable;
                    lastBreak$iv = index$iv + 1;
                    int nextMainAxisSize$iv2 = nextMainAxisSize$iv - mainAxisSpacing;
                    totalCrossAxisSize$iv = index$iv2 + 1;
                    if (!wrapInfo$iv.isLastItemInContainer()) {
                        childCrossAxisSize$iv = nextMainAxisSize$iv2;
                        currentCrossAxisSize$iv2 = totalCrossAxisSize$iv2;
                    } else {
                        if (ellipsisWrapInfo$iv != null) {
                            long it$iv = ellipsisWrapInfo$iv.m916getEllipsisSizeOO21N7I();
                            if (!ellipsisWrapInfo$iv.getPlaceEllipsisOnLastContentLine()) {
                                totalCrossAxisSize$iv2 += IntIntPair.m289getSecondimpl(it$iv) + crossAxisSpacing;
                            }
                        }
                        currentCrossAxisSize$iv2 = totalCrossAxisSize$iv2;
                        noOfItemsShown$iv = noOfItemsShown$iv2;
                    }
                }
                lineIndex$iv = index$iv + 1;
                size = remaining$iv3;
                noOfItemsShown$iv = noOfItemsShown$iv2;
                z = z3;
                list2 = list;
                nextCrossAxisSize$iv2 = nextCrossAxisSize$iv3;
                size$iv = 0;
            }
            int totalCrossAxisSize$iv3 = currentCrossAxisSize$iv2 - crossAxisSpacing;
            return IntIntPair.m284constructorimpl(totalCrossAxisSize$iv3, noOfItemsShown$iv);
        }
        IntIntPair m920ellipsisSizeF35zmw$foundation_layout_release = overflow.m920ellipsisSizeF35zmw$foundation_layout_release(nextChild$iv != null, 0, 0);
        size$iv = m920ellipsisSizeF35zmw$foundation_layout_release != null ? IntIntPair.m289getSecondimpl(m920ellipsisSizeF35zmw$foundation_layout_release.m292unboximpl()) : 0;
        return IntIntPair.m284constructorimpl(size$iv, 0);
    }

    private static final long intrinsicCrossAxisSize(List<? extends IntrinsicMeasurable> list, Function3<? super IntrinsicMeasurable, ? super Integer, ? super Integer, Integer> function3, Function3<? super IntrinsicMeasurable, ? super Integer, ? super Integer, Integer> function32, int mainAxisAvailable, int mainAxisSpacing, int crossAxisSpacing, int maxItemsInMainAxis, int maxLines, FlowLayoutOverflowState overflow) {
        IntIntPair m281boximpl;
        int remaining;
        List<? extends IntrinsicMeasurable> list2 = list;
        Function3<? super IntrinsicMeasurable, ? super Integer, ? super Integer, Integer> function33 = function3;
        if (list2.isEmpty()) {
            return IntIntPair.m284constructorimpl(0, 0);
        }
        FlowLayoutBuildingBlocks buildingBlocks = new FlowLayoutBuildingBlocks(maxItemsInMainAxis, overflow, OrientationIndependentConstraints.m960constructorimpl(0, mainAxisAvailable, 0, Integer.MAX_VALUE), maxLines, mainAxisSpacing, crossAxisSpacing, null);
        IntrinsicMeasurable nextChild = (IntrinsicMeasurable) CollectionsKt.getOrNull(list2, 0);
        int nextCrossAxisSize = nextChild != null ? function32.invoke(nextChild, 0, Integer.valueOf(mainAxisAvailable)).intValue() : 0;
        int nextMainAxisSize = nextChild != null ? function33.invoke(nextChild, 0, Integer.valueOf(nextCrossAxisSize)).intValue() : 0;
        int totalCrossAxisSize = 0;
        int lineIndex = 0;
        int noOfItemsShown = mainAxisAvailable;
        int nextCrossAxisSize2 = nextCrossAxisSize;
        if (buildingBlocks.m915getWrapInfoOpUlnko(list2.size() > 1, 0, IntIntPair.m284constructorimpl(mainAxisAvailable, Integer.MAX_VALUE), nextChild == null ? null : IntIntPair.m281boximpl(IntIntPair.m284constructorimpl(nextMainAxisSize, nextCrossAxisSize)), 0, 0, 0, false, false).isLastItemInContainer()) {
            IntIntPair m920ellipsisSizeF35zmw$foundation_layout_release = overflow.m920ellipsisSizeF35zmw$foundation_layout_release(nextChild != null, 0, 0);
            int size = m920ellipsisSizeF35zmw$foundation_layout_release != null ? IntIntPair.m289getSecondimpl(m920ellipsisSizeF35zmw$foundation_layout_release.m292unboximpl()) : 0;
            return IntIntPair.m284constructorimpl(size, 0);
        }
        int noOfItemsShown2 = 0;
        int index = 0;
        int size2 = list2.size();
        int nextMainAxisSize2 = 0;
        int lastBreak = 0;
        int nextCrossAxisSize3 = nextCrossAxisSize2;
        while (true) {
            if (index >= size2) {
                break;
            }
            int childCrossAxisSize = nextCrossAxisSize3;
            int childMainAxisSize = nextMainAxisSize;
            int remaining2 = noOfItemsShown - childMainAxisSize;
            int remaining3 = index + 1;
            int currentCrossAxisSize = Math.max(nextMainAxisSize2, childCrossAxisSize);
            IntrinsicMeasurable nextChild2 = (IntrinsicMeasurable) CollectionsKt.getOrNull(list2, index + 1);
            int nextCrossAxisSize4 = nextChild2 != null ? function32.invoke(nextChild2, Integer.valueOf(index + 1), Integer.valueOf(mainAxisAvailable)).intValue() : 0;
            int nextMainAxisSize3 = nextChild2 != null ? function33.invoke(nextChild2, Integer.valueOf(index + 1), Integer.valueOf(nextCrossAxisSize4)).intValue() + mainAxisSpacing : 0;
            boolean z = index + 2 < list.size();
            int i = (index + 1) - lastBreak;
            int index2 = index;
            long m284constructorimpl = IntIntPair.m284constructorimpl(remaining2, Integer.MAX_VALUE);
            if (nextChild2 == null) {
                m281boximpl = null;
            } else {
                m281boximpl = IntIntPair.m281boximpl(IntIntPair.m284constructorimpl(nextMainAxisSize3, nextCrossAxisSize4));
            }
            IntIntPair intIntPair = m281boximpl;
            int i2 = size2;
            FlowLayoutBuildingBlocks.WrapInfo wrapInfo = buildingBlocks.m915getWrapInfoOpUlnko(z, i, m284constructorimpl, intIntPair, lineIndex, totalCrossAxisSize, currentCrossAxisSize, false, false);
            int lineIndex2 = lineIndex;
            if (!wrapInfo.isLastItemInLine()) {
                lineIndex = lineIndex2;
                nextMainAxisSize = nextMainAxisSize3;
                remaining = remaining2;
                nextMainAxisSize2 = currentCrossAxisSize;
            } else {
                int totalCrossAxisSize2 = totalCrossAxisSize + currentCrossAxisSize + crossAxisSpacing;
                FlowLayoutBuildingBlocks.WrapEllipsisInfo ellipsisWrapInfo = buildingBlocks.getWrapEllipsisInfo(wrapInfo, nextChild2 != null, lineIndex2, totalCrossAxisSize2, remaining2, (index2 + 1) - lastBreak);
                remaining = mainAxisAvailable;
                lastBreak = index2 + 1;
                int nextMainAxisSize4 = nextMainAxisSize3 - mainAxisSpacing;
                lineIndex = lineIndex2 + 1;
                if (!wrapInfo.isLastItemInContainer()) {
                    nextMainAxisSize = nextMainAxisSize4;
                    nextMainAxisSize2 = 0;
                    totalCrossAxisSize = totalCrossAxisSize2;
                } else {
                    if (ellipsisWrapInfo != null) {
                        long it = ellipsisWrapInfo.m916getEllipsisSizeOO21N7I();
                        if (!ellipsisWrapInfo.getPlaceEllipsisOnLastContentLine()) {
                            totalCrossAxisSize2 += IntIntPair.m289getSecondimpl(it) + crossAxisSpacing;
                        }
                    }
                    totalCrossAxisSize = totalCrossAxisSize2;
                    noOfItemsShown2 = remaining3;
                }
            }
            index = index2 + 1;
            noOfItemsShown2 = remaining3;
            size2 = i2;
            function33 = function3;
            nextCrossAxisSize3 = nextCrossAxisSize4;
            noOfItemsShown = remaining;
            list2 = list;
        }
        return IntIntPair.m284constructorimpl(totalCrossAxisSize - crossAxisSpacing, noOfItemsShown2);
    }

    /* renamed from: breakDownItems-di9J0FM  reason: not valid java name */
    public static final MeasureResult m917breakDownItemsdi9J0FM(MeasureScope $this$breakDownItems_u2ddi9J0FM, FlowLineMeasurePolicy measurePolicy, Iterator<? extends Measurable> it, float mainAxisSpacingDp, float crossAxisSpacingDp, long constraints, int maxItemsInMainAxis, int maxLines, FlowLayoutOverflowState overflow) {
        long m963copyyUG9Ft0;
        int leftOver;
        int leftOverCrossAxis;
        int lineIndex;
        FlowLineInfo lineInfo;
        int spacing;
        final Ref.ObjectRef placeableItem;
        Measurable measurable;
        IntIntPair intIntPair;
        int leftOver2;
        int mainAxisTotalSize;
        int crossAxisTotalSize;
        int mainAxisSize;
        int crossAxisSize;
        int index;
        int nextIndexInLine;
        IntIntPair m281boximpl;
        MutableIntList crossAxisSizes;
        FlowLineInfo lineInfo2;
        MutableIntList endBreakLineList;
        int nextIndexInLine2;
        int i;
        MeasureScope measureScope = $this$breakDownItems_u2ddi9J0FM;
        MutableVector items = new MutableVector(new MeasureResult[16], 0);
        int mainAxisMax = Constraints.m6826getMaxWidthimpl(constraints);
        int m6828getMinWidthimpl = Constraints.m6828getMinWidthimpl(constraints);
        int m6825getMaxHeightimpl = Constraints.m6825getMaxHeightimpl(constraints);
        MutableIntObjectMap placeables = IntObjectMapKt.mutableIntObjectMapOf();
        List measurables = new ArrayList();
        int spacing2 = (int) Math.ceil(measureScope.mo644toPx0680j_4(mainAxisSpacingDp));
        int crossAxisSpacing = (int) Math.ceil(measureScope.mo644toPx0680j_4(crossAxisSpacingDp));
        long subsetConstraints = OrientationIndependentConstraints.m960constructorimpl(0, mainAxisMax, 0, m6825getMaxHeightimpl);
        m963copyyUG9Ft0 = OrientationIndependentConstraints.m963copyyUG9Ft0(subsetConstraints, (r12 & 1) != 0 ? Constraints.m6828getMinWidthimpl(subsetConstraints) : 0, (r12 & 2) != 0 ? Constraints.m6826getMaxWidthimpl(subsetConstraints) : 0, (r12 & 4) != 0 ? Constraints.m6827getMinHeightimpl(subsetConstraints) : 0, (r12 & 8) != 0 ? Constraints.m6825getMaxHeightimpl(subsetConstraints) : 0);
        long measureConstraints = OrientationIndependentConstraints.m975toBoxConstraintsOenEA2s(m963copyyUG9Ft0, measurePolicy.isHorizontal() ? LayoutOrientation.Horizontal : LayoutOrientation.Vertical);
        Ref.ObjectRef placeableItem2 = new Ref.ObjectRef();
        if (it instanceof ContextualFlowItemIterator) {
            leftOver = mainAxisMax;
            leftOverCrossAxis = m6825getMaxHeightimpl;
            lineInfo = new FlowLineInfo(0, 0, measureScope.mo641toDpu2uoSUM(leftOver), measureScope.mo641toDpu2uoSUM(leftOverCrossAxis), null);
            lineIndex = 0;
        } else {
            leftOver = mainAxisMax;
            leftOverCrossAxis = m6825getMaxHeightimpl;
            lineIndex = 0;
            lineInfo = null;
        }
        boolean $this$breakDownItems_di9J0FM_u24lambda_u2415 = it.hasNext();
        MutableVector items2 = items;
        FlowLineInfo lineInfo3 = lineInfo;
        Measurable safeNext = !$this$breakDownItems_di9J0FM_u24lambda_u2415 ? null : safeNext(it, lineInfo3);
        if (safeNext != null) {
            spacing = spacing2;
            placeableItem = placeableItem2;
            measurable = safeNext;
            intIntPair = IntIntPair.m281boximpl(m918measureAndCacherqJ1uqs(measurable, measurePolicy, measureConstraints, new Function1<Placeable, Unit>() { // from class: androidx.compose.foundation.layout.FlowLayoutKt$breakDownItems$nextSize$1$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(Placeable placeable) {
                    invoke2(placeable);
                    return Unit.INSTANCE;
                }

                /* JADX WARN: Multi-variable type inference failed */
                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(Placeable placeable) {
                    placeableItem.element = placeable;
                }
            }));
        } else {
            spacing = spacing2;
            placeableItem = placeableItem2;
            measurable = safeNext;
            intIntPair = null;
        }
        IntIntPair intIntPair2 = intIntPair;
        Integer nextMainAxisSize = intIntPair2 != null ? Integer.valueOf(IntIntPair.m288getFirstimpl(intIntPair2.m292unboximpl())) : null;
        Integer nextCrossAxisSize = intIntPair2 != null ? Integer.valueOf(IntIntPair.m289getSecondimpl(intIntPair2.m292unboximpl())) : null;
        int startBreakLineIndex = 0;
        Integer nextMainAxisSize2 = nextMainAxisSize;
        Measurable measurable2 = measurable;
        MutableIntList endBreakLineList2 = new MutableIntList(0, 1, null);
        MutableIntList endBreakLineList3 = endBreakLineList2;
        MutableIntList crossAxisSizes2 = new MutableIntList(0, 1, null);
        FlowLayoutBuildingBlocks buildingBlocks = new FlowLayoutBuildingBlocks(maxItemsInMainAxis, overflow, constraints, maxLines, spacing, crossAxisSpacing, null);
        FlowLayoutBuildingBlocks.WrapEllipsisInfo wrapEllipsisInfo = null;
        FlowLayoutBuildingBlocks.WrapInfo wrapInfo = buildingBlocks.m915getWrapInfoOpUlnko(it.hasNext(), 0, IntIntPair.m284constructorimpl(leftOver, leftOverCrossAxis), intIntPair2, 0, 0, 0, false, false);
        if (wrapInfo.isLastItemInContainer()) {
            leftOver2 = leftOver;
            wrapEllipsisInfo = buildingBlocks.getWrapEllipsisInfo(wrapInfo, intIntPair2 != null, -1, 0, leftOver2, 0);
        } else {
            leftOver2 = leftOver;
        }
        int currentLineMainAxisSize = 0;
        int crossAxisTotalSize2 = 0;
        int lineIndex2 = lineIndex;
        Measurable measurable3 = measurable2;
        FlowLayoutBuildingBlocks.WrapEllipsisInfo wrapEllipsisInfo2 = wrapEllipsisInfo;
        int mainAxisTotalSize2 = m6828getMinWidthimpl;
        int mainAxisTotalSize3 = 0;
        IntList this_$iv = 1;
        int startBreakLineIndex2 = leftOverCrossAxis;
        int leftOverCrossAxis2 = 0;
        while (!wrapInfo.isLastItemInContainer() && measurable3 != null) {
            Intrinsics.checkNotNull(nextMainAxisSize2);
            int itemMainAxisSize = nextMainAxisSize2.intValue();
            Intrinsics.checkNotNull(nextCrossAxisSize);
            MutableIntList crossAxisSizes3 = crossAxisSizes2;
            int itemCrossAxisSize = nextCrossAxisSize.intValue();
            int mainAxisMax2 = mainAxisMax;
            int mainAxisMax3 = currentLineMainAxisSize + itemMainAxisSize;
            int currentLineCrossAxisSize = Math.max(mainAxisTotalSize3, itemCrossAxisSize);
            int currentLineCrossAxisSize2 = leftOver2 - itemMainAxisSize;
            int itemCrossAxisSize2 = leftOverCrossAxis2 + 1;
            overflow.setItemShown$foundation_layout_release(itemCrossAxisSize2);
            measurables.add(measurable3);
            placeables.set(leftOverCrossAxis2, placeableItem.element);
            int nextIndexInLine3 = (leftOverCrossAxis2 + 1) - startBreakLineIndex;
            boolean willFitLine = nextIndexInLine3 < maxItemsInMainAxis;
            if (lineInfo3 != null) {
                int i2 = willFitLine ? lineIndex2 : lineIndex2 + 1;
                index = leftOverCrossAxis2;
                int index2 = willFitLine ? nextIndexInLine3 : 0;
                if (willFitLine) {
                    int $this$fastCoerceAtLeast$iv = currentLineCrossAxisSize2 - spacing;
                    nextIndexInLine = nextIndexInLine3;
                    nextIndexInLine2 = $this$fastCoerceAtLeast$iv < 0 ? 0 : $this$fastCoerceAtLeast$iv;
                } else {
                    nextIndexInLine = nextIndexInLine3;
                    nextIndexInLine2 = mainAxisMax2;
                }
                float f = measureScope.mo641toDpu2uoSUM(nextIndexInLine2);
                if (willFitLine) {
                    i = startBreakLineIndex2;
                } else {
                    int $this$fastCoerceAtLeast$iv2 = (startBreakLineIndex2 - currentLineCrossAxisSize) - crossAxisSpacing;
                    i = $this$fastCoerceAtLeast$iv2 < 0 ? 0 : $this$fastCoerceAtLeast$iv2;
                }
                lineInfo3.m928update4j6BHR0$foundation_layout_release(i2, index2, f, measureScope.mo641toDpu2uoSUM(i));
            } else {
                index = leftOverCrossAxis2;
                nextIndexInLine = nextIndexInLine3;
            }
            boolean $this$breakDownItems_di9J0FM_u24lambda_u2417 = it.hasNext();
            measurable3 = !$this$breakDownItems_di9J0FM_u24lambda_u2417 ? null : safeNext(it, lineInfo3);
            placeableItem.element = null;
            IntIntPair m281boximpl2 = measurable3 != null ? IntIntPair.m281boximpl(m918measureAndCacherqJ1uqs(measurable3, measurePolicy, measureConstraints, new Function1<Placeable, Unit>() { // from class: androidx.compose.foundation.layout.FlowLayoutKt$breakDownItems$1$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(Placeable placeable) {
                    invoke2(placeable);
                    return Unit.INSTANCE;
                }

                /* JADX WARN: Multi-variable type inference failed */
                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(Placeable placeable) {
                    placeableItem.element = placeable;
                }
            })) : null;
            Integer nextMainAxisSize3 = m281boximpl2 != null ? Integer.valueOf(IntIntPair.m288getFirstimpl(m281boximpl2.m292unboximpl()) + spacing) : null;
            nextCrossAxisSize = m281boximpl2 != null ? Integer.valueOf(IntIntPair.m289getSecondimpl(m281boximpl2.m292unboximpl())) : null;
            boolean hasNext = it.hasNext();
            long m284constructorimpl = IntIntPair.m284constructorimpl(currentLineCrossAxisSize2, startBreakLineIndex2);
            if (m281boximpl2 == null) {
                m281boximpl = null;
            } else {
                Intrinsics.checkNotNull(nextMainAxisSize3);
                int intValue = nextMainAxisSize3.intValue();
                Intrinsics.checkNotNull(nextCrossAxisSize);
                m281boximpl = IntIntPair.m281boximpl(IntIntPair.m284constructorimpl(intValue, nextCrossAxisSize.intValue()));
            }
            FlowLayoutBuildingBlocks.WrapInfo wrapInfo2 = buildingBlocks.m915getWrapInfoOpUlnko(hasNext, nextIndexInLine, m284constructorimpl, m281boximpl, lineIndex2, crossAxisTotalSize2, currentLineCrossAxisSize, false, false);
            if (!wrapInfo2.isLastItemInLine()) {
                leftOver2 = currentLineCrossAxisSize2;
                Integer nextMainAxisSize4 = nextMainAxisSize3;
                crossAxisSizes = crossAxisSizes3;
                lineInfo2 = lineInfo3;
                endBreakLineList = endBreakLineList3;
                nextMainAxisSize2 = nextMainAxisSize4;
                mainAxisTotalSize3 = currentLineCrossAxisSize;
                currentLineMainAxisSize = mainAxisMax3;
            } else {
                Integer nextMainAxisSize5 = nextMainAxisSize3;
                mainAxisTotalSize2 = Math.min(Math.max(mainAxisTotalSize2, mainAxisMax3), mainAxisMax2);
                int crossAxisTotalSize3 = crossAxisTotalSize2 + currentLineCrossAxisSize;
                FlowLayoutBuildingBlocks.WrapEllipsisInfo wrapEllipsisInfo3 = buildingBlocks.getWrapEllipsisInfo(wrapInfo2, m281boximpl2 != null, lineIndex2, crossAxisTotalSize3, currentLineCrossAxisSize2, (index + 1) - startBreakLineIndex);
                mainAxisMax2 = mainAxisMax2;
                crossAxisSizes = crossAxisSizes3;
                crossAxisSizes.add(currentLineCrossAxisSize);
                int leftOverCrossAxis3 = (m6825getMaxHeightimpl - crossAxisTotalSize3) - crossAxisSpacing;
                int leftOverCrossAxis4 = index + 1;
                lineInfo2 = lineInfo3;
                endBreakLineList = endBreakLineList3;
                endBreakLineList.add(index + 1);
                Integer nextMainAxisSize6 = nextMainAxisSize5 != null ? Integer.valueOf(nextMainAxisSize5.intValue() - spacing) : null;
                lineIndex2++;
                currentLineMainAxisSize = 0;
                startBreakLineIndex = leftOverCrossAxis4;
                leftOver2 = mainAxisMax2;
                startBreakLineIndex2 = leftOverCrossAxis3;
                nextMainAxisSize2 = nextMainAxisSize6;
                crossAxisTotalSize2 = crossAxisTotalSize3 + crossAxisSpacing;
                wrapEllipsisInfo2 = wrapEllipsisInfo3;
                mainAxisTotalSize3 = 0;
            }
            leftOverCrossAxis2 = index + 1;
            crossAxisSizes2 = crossAxisSizes;
            endBreakLineList3 = endBreakLineList;
            lineInfo3 = lineInfo2;
            mainAxisMax = mainAxisMax2;
            wrapInfo = wrapInfo2;
        }
        FlowLineInfo lineInfo4 = lineInfo3;
        MutableIntList crossAxisSizes4 = crossAxisSizes2;
        MutableIntList endBreakLineList4 = endBreakLineList3;
        if (wrapEllipsisInfo2 != null) {
            FlowLayoutBuildingBlocks.WrapEllipsisInfo it2 = wrapEllipsisInfo2;
            measurables.add(it2.getEllipsis());
            placeables.set(measurables.size() - 1, it2.getPlaceable());
            MutableIntList this_$iv2 = endBreakLineList4;
            int lineIndex3 = this_$iv2._size - 1;
            if (it2.getPlaceEllipsisOnLastContentLine()) {
                MutableIntList this_$iv3 = endBreakLineList4;
                int lastIndex = this_$iv3._size - 1;
                int lastLineCrossAxis = crossAxisSizes4.get(lineIndex3);
                crossAxisSizes4.set(lineIndex3, Math.max(lastLineCrossAxis, IntIntPair.m289getSecondimpl(it2.m916getEllipsisSizeOO21N7I())));
                endBreakLineList4.set(lastIndex, endBreakLineList4.last() + 1);
            } else {
                crossAxisSizes4.add(IntIntPair.m289getSecondimpl(it2.m916getEllipsisSizeOO21N7I()));
                endBreakLineList4.add(endBreakLineList4.last() + 1);
            }
        }
        int size = measurables.size();
        Placeable[] arrayOfPlaceables = new Placeable[size];
        for (int i3 = 0; i3 < size; i3++) {
            arrayOfPlaceables[i3] = placeables.get(i3);
        }
        MutableIntList this_$iv4 = endBreakLineList4;
        int[] crossAxisOffsets = new int[this_$iv4._size];
        MutableIntList this_$iv5 = endBreakLineList4;
        int[] crossAxisSizesArray = new int[this_$iv5._size];
        int startIndex = 0;
        MutableIntList this_$iv6 = endBreakLineList4;
        int[] content$iv = this_$iv6.content;
        int i4 = this_$iv6._size;
        int i$iv = 0;
        int startIndex2 = 0;
        while (startIndex2 < i4) {
            long measureConstraints2 = measureConstraints;
            int endIndex = content$iv[startIndex2];
            int currentLineIndex = startIndex2;
            int leftOverCrossAxis5 = startBreakLineIndex2;
            Placeable[] arrayOfPlaceables2 = arrayOfPlaceables;
            int crossAxisSize2 = crossAxisSizes4.get(currentLineIndex);
            MutableIntList crossAxisSizes5 = crossAxisSizes4;
            int[] crossAxisOffsets2 = crossAxisOffsets;
            int mainAxisTotalSize4 = mainAxisTotalSize2;
            int mainAxisTotalSize5 = startIndex;
            IntList i$iv2 = this_$iv;
            IntList this_$iv7 = this_$iv6;
            MutableVector items3 = items2;
            MutableIntList endBreakLineList5 = endBreakLineList4;
            int i$iv3 = startIndex2;
            int i$iv4 = spacing;
            FlowLineInfo lineInfo5 = lineInfo4;
            MutableIntObjectMap placeables2 = placeables;
            MeasureResult result = RowColumnMeasurePolicyKt.measure(measurePolicy, mainAxisTotalSize4, Constraints.m6827getMinHeightimpl(subsetConstraints), Constraints.m6826getMaxWidthimpl(subsetConstraints), crossAxisSize2, i$iv4, measureScope, measurables, arrayOfPlaceables2, mainAxisTotalSize5, endIndex, crossAxisOffsets2, currentLineIndex);
            List measurables2 = measurables;
            if (measurePolicy.isHorizontal()) {
                mainAxisSize = result.getWidth();
                crossAxisSize = result.getHeight();
            } else {
                mainAxisSize = result.getHeight();
                crossAxisSize = result.getWidth();
            }
            crossAxisSizesArray[currentLineIndex] = crossAxisSize;
            i$iv += crossAxisSize;
            int mainAxisTotalSize6 = Math.max(mainAxisTotalSize4, mainAxisSize);
            items3.add(result);
            items2 = items3;
            this_$iv6 = this_$iv7;
            this_$iv = i$iv2;
            measureScope = $this$breakDownItems_u2ddi9J0FM;
            startIndex = endIndex;
            measurables = measurables2;
            arrayOfPlaceables = arrayOfPlaceables2;
            placeables = placeables2;
            lineInfo4 = lineInfo5;
            endBreakLineList4 = endBreakLineList5;
            startIndex2 = i$iv3 + 1;
            mainAxisTotalSize2 = mainAxisTotalSize6;
            crossAxisOffsets = crossAxisOffsets2;
            spacing = i$iv4;
            startBreakLineIndex2 = leftOverCrossAxis5;
            crossAxisSizes4 = crossAxisSizes5;
            measureConstraints = measureConstraints2;
        }
        MutableVector items4 = items2;
        IntList items5 = this_$iv;
        int[] crossAxisOffsets3 = crossAxisOffsets;
        int mainAxisTotalSize7 = mainAxisTotalSize2;
        if (items4.getSize() != 0) {
            items5 = null;
        }
        if (items5 == null) {
            mainAxisTotalSize = mainAxisTotalSize7;
            crossAxisTotalSize = i$iv;
        } else {
            mainAxisTotalSize = 0;
            crossAxisTotalSize = 0;
        }
        return m919placeHelperBmaY500($this$breakDownItems_u2ddi9J0FM, constraints, mainAxisTotalSize, crossAxisTotalSize, crossAxisSizesArray, items4, measurePolicy, crossAxisOffsets3);
    }

    private static final Measurable safeNext(Iterator<? extends Measurable> it, FlowLineInfo info) {
        Measurable next;
        try {
            if (it instanceof ContextualFlowItemIterator) {
                Intrinsics.checkNotNull(info);
                next = ((ContextualFlowItemIterator) it).getNext$foundation_layout_release(info);
            } else {
                next = it.next();
            }
            return next;
        } catch (IndexOutOfBoundsException e) {
            return null;
        }
    }

    public static final int mainAxisMin(IntrinsicMeasurable $this$mainAxisMin, boolean isHorizontal, int crossAxisSize) {
        if (isHorizontal) {
            return $this$mainAxisMin.minIntrinsicWidth(crossAxisSize);
        }
        return $this$mainAxisMin.minIntrinsicHeight(crossAxisSize);
    }

    public static final int crossAxisMin(IntrinsicMeasurable $this$crossAxisMin, boolean isHorizontal, int mainAxisSize) {
        if (isHorizontal) {
            return $this$crossAxisMin.minIntrinsicHeight(mainAxisSize);
        }
        return $this$crossAxisMin.minIntrinsicWidth(mainAxisSize);
    }

    public static final CrossAxisAlignment getCROSS_AXIS_ALIGNMENT_TOP() {
        return CROSS_AXIS_ALIGNMENT_TOP;
    }

    public static final CrossAxisAlignment getCROSS_AXIS_ALIGNMENT_START() {
        return CROSS_AXIS_ALIGNMENT_START;
    }

    /* renamed from: measureAndCache-rqJ1uqs  reason: not valid java name */
    public static final long m918measureAndCacherqJ1uqs(Measurable $this$measureAndCache_u2drqJ1uqs, FlowLineMeasurePolicy measurePolicy, long constraints, Function1<? super Placeable, Unit> function1) {
        FlowLayoutData flowLayoutData;
        if (RowColumnImplKt.getWeight(RowColumnImplKt.getRowColumnParentData($this$measureAndCache_u2drqJ1uqs)) == 0.0f) {
            RowColumnParentData rowColumnParentData = RowColumnImplKt.getRowColumnParentData($this$measureAndCache_u2drqJ1uqs);
            if (((rowColumnParentData == null || (flowLayoutData = rowColumnParentData.getFlowLayoutData()) == null) ? null : Float.valueOf(flowLayoutData.getFillCrossAxisFraction())) == null) {
                Placeable placeable = $this$measureAndCache_u2drqJ1uqs.mo5637measureBRTryo0(constraints);
                function1.invoke(placeable);
                int mainAxis = measurePolicy.mainAxisSize(placeable);
                int crossAxis = measurePolicy.crossAxisSize(placeable);
                return IntIntPair.m284constructorimpl(mainAxis, crossAxis);
            }
        }
        int mainAxis2 = mainAxisMin($this$measureAndCache_u2drqJ1uqs, measurePolicy.isHorizontal(), Integer.MAX_VALUE);
        int crossAxis2 = crossAxisMin($this$measureAndCache_u2drqJ1uqs, measurePolicy.isHorizontal(), mainAxis2);
        return IntIntPair.m284constructorimpl(mainAxis2, crossAxis2);
    }

    /* renamed from: placeHelper-BmaY500  reason: not valid java name */
    public static final MeasureResult m919placeHelperBmaY500(MeasureScope $this$placeHelper_u2dBmaY500, long constraints, int mainAxisTotalSize, int crossAxisTotalSize, int[] crossAxisSizes, final MutableVector<MeasureResult> mutableVector, FlowLineMeasurePolicy measureHelper, int[] outPosition) {
        int $this$fastCoerceAtLeast$iv$iv;
        int layoutWidth;
        int layoutHeight;
        boolean isHorizontal = measureHelper.isHorizontal();
        Arrangement.Vertical verticalArrangement = measureHelper.getVerticalArrangement();
        Arrangement.Horizontal horizontalArrangement = measureHelper.getHorizontalArrangement();
        if (isHorizontal) {
            int totalCrossAxisSpacing = $this$placeHelper_u2dBmaY500.mo638roundToPx0680j_4(verticalArrangement.mo880getSpacingD9Ej5fM()) * (mutableVector.getSize() - 1);
            int totalCrossAxisSize = crossAxisTotalSize + totalCrossAxisSpacing;
            int m6827getMinHeightimpl = Constraints.m6827getMinHeightimpl(constraints);
            int m6825getMaxHeightimpl = Constraints.m6825getMaxHeightimpl(constraints);
            $this$fastCoerceAtLeast$iv$iv = totalCrossAxisSize;
            if ($this$fastCoerceAtLeast$iv$iv < m6827getMinHeightimpl) {
                $this$fastCoerceAtLeast$iv$iv = m6827getMinHeightimpl;
            }
            if ($this$fastCoerceAtLeast$iv$iv > m6825getMaxHeightimpl) {
                $this$fastCoerceAtLeast$iv$iv = m6825getMaxHeightimpl;
            }
            verticalArrangement.arrange($this$placeHelper_u2dBmaY500, $this$fastCoerceAtLeast$iv$iv, crossAxisSizes, outPosition);
        } else {
            int totalCrossAxisSpacing2 = $this$placeHelper_u2dBmaY500.mo638roundToPx0680j_4(horizontalArrangement.mo880getSpacingD9Ej5fM()) * (mutableVector.getSize() - 1);
            int totalCrossAxisSize2 = crossAxisTotalSize + totalCrossAxisSpacing2;
            int m6827getMinHeightimpl2 = Constraints.m6827getMinHeightimpl(constraints);
            int m6825getMaxHeightimpl2 = Constraints.m6825getMaxHeightimpl(constraints);
            int $this$fastCoerceAtLeast$iv$iv2 = totalCrossAxisSize2;
            if ($this$fastCoerceAtLeast$iv$iv2 < m6827getMinHeightimpl2) {
                $this$fastCoerceAtLeast$iv$iv2 = m6827getMinHeightimpl2;
            }
            int $i$f$fastCoerceAtMost = $this$fastCoerceAtLeast$iv$iv2 > m6825getMaxHeightimpl2 ? m6825getMaxHeightimpl2 : $this$fastCoerceAtLeast$iv$iv2;
            horizontalArrangement.arrange($this$placeHelper_u2dBmaY500, $i$f$fastCoerceAtMost, crossAxisSizes, $this$placeHelper_u2dBmaY500.getLayoutDirection(), outPosition);
            $this$fastCoerceAtLeast$iv$iv = $i$f$fastCoerceAtMost;
        }
        int m6828getMinWidthimpl = Constraints.m6828getMinWidthimpl(constraints);
        int m6826getMaxWidthimpl = Constraints.m6826getMaxWidthimpl(constraints);
        int $this$fastCoerceAtLeast$iv$iv3 = mainAxisTotalSize;
        if ($this$fastCoerceAtLeast$iv$iv3 < m6828getMinWidthimpl) {
            $this$fastCoerceAtLeast$iv$iv3 = m6828getMinWidthimpl;
        }
        if ($this$fastCoerceAtLeast$iv$iv3 > m6826getMaxWidthimpl) {
            $this$fastCoerceAtLeast$iv$iv3 = m6826getMaxWidthimpl;
        }
        int finalMainAxisTotalSize = $this$fastCoerceAtLeast$iv$iv3;
        if (isHorizontal) {
            layoutWidth = finalMainAxisTotalSize;
            layoutHeight = $this$fastCoerceAtLeast$iv$iv;
        } else {
            layoutWidth = $this$fastCoerceAtLeast$iv$iv;
            layoutHeight = finalMainAxisTotalSize;
        }
        return MeasureScope.layout$default($this$placeHelper_u2dBmaY500, layoutWidth, layoutHeight, null, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.layout.FlowLayoutKt$placeHelper$3
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Placeable.PlacementScope placementScope) {
                invoke2(placementScope);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(Placeable.PlacementScope $this$layout) {
                MutableVector this_$iv = mutableVector;
                Object[] content$iv = this_$iv.content;
                int size$iv = this_$iv.getSize();
                for (int i$iv = 0; i$iv < size$iv; i$iv++) {
                    MeasureResult measureResult = (MeasureResult) content$iv[i$iv];
                    measureResult.placeChildren();
                }
            }
        }, 4, null);
    }
}
