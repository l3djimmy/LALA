package androidx.compose.material3;

import androidx.compose.animation.core.AnimationSpecKt;
import androidx.compose.animation.core.DecayAnimationSpec;
import androidx.compose.animation.core.DecayAnimationSpecKt;
import androidx.compose.foundation.gestures.FlingBehavior;
import androidx.compose.foundation.gestures.TargetedFlingBehavior;
import androidx.compose.foundation.gestures.snapping.LazyListSnapLayoutInfoProviderKt;
import androidx.compose.foundation.gestures.snapping.SnapFlingBehaviorKt;
import androidx.compose.foundation.gestures.snapping.SnapLayoutInfoProvider;
import androidx.compose.foundation.lazy.LazyListState;
import androidx.compose.material3.internal.Strings;
import androidx.compose.material3.internal.Strings_androidKt;
import androidx.compose.material3.tokens.DatePickerModalTokens;
import androidx.compose.material3.tokens.DividerTokens;
import androidx.compose.material3.tokens.ElevationTokens;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.Shape;
import androidx.compose.ui.semantics.LiveRegionMode;
import androidx.compose.ui.semantics.SemanticsModifierKt;
import androidx.compose.ui.semantics.SemanticsPropertiesKt;
import androidx.compose.ui.semantics.SemanticsPropertyReceiver;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.text.style.TextDecoration;
import com.itextpdf.layout.properties.Property;
import java.util.Arrays;
import java.util.Locale;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;
/* compiled from: DatePicker.kt */
@Metadata(d1 = {"\u0000\u0088\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0018\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0007\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J6\u0010\u001d\u001a\u00020\u001e2\b\u0010\u001f\u001a\u0004\u0018\u00010 2\u0006\u0010!\u001a\u00020\"2\u0006\u0010#\u001a\u00020$2\b\b\u0002\u0010%\u001a\u00020&H\u0007ø\u0001\u0000¢\u0006\u0004\b'\u0010(J$\u0010)\u001a\u00020\u001e2\u0006\u0010!\u001a\u00020\"2\b\b\u0002\u0010%\u001a\u00020&H\u0007ø\u0001\u0000¢\u0006\u0004\b*\u0010+J\r\u0010,\u001a\u00020\u0019H\u0007¢\u0006\u0002\u0010-J\u008e\u0002\u0010,\u001a\u00020\u00192\b\b\u0002\u0010.\u001a\u00020/2\b\b\u0002\u00100\u001a\u00020/2\b\b\u0002\u00101\u001a\u00020/2\b\b\u0002\u00102\u001a\u00020/2\b\b\u0002\u00103\u001a\u00020/2\b\b\u0002\u00104\u001a\u00020/2\b\b\u0002\u00105\u001a\u00020/2\b\b\u0002\u00106\u001a\u00020/2\b\b\u0002\u00107\u001a\u00020/2\b\b\u0002\u00108\u001a\u00020/2\b\b\u0002\u00109\u001a\u00020/2\b\b\u0002\u0010:\u001a\u00020/2\b\b\u0002\u0010;\u001a\u00020/2\b\b\u0002\u0010<\u001a\u00020/2\b\b\u0002\u0010=\u001a\u00020/2\b\b\u0002\u0010>\u001a\u00020/2\b\b\u0002\u0010?\u001a\u00020/2\b\b\u0002\u0010@\u001a\u00020/2\b\b\u0002\u0010A\u001a\u00020/2\b\b\u0002\u0010B\u001a\u00020/2\b\b\u0002\u0010C\u001a\u00020/2\b\b\u0002\u0010D\u001a\u00020/2\b\b\u0002\u0010E\u001a\u00020/2\b\b\u0002\u0010F\u001a\u00020/2\n\b\u0002\u0010G\u001a\u0004\u0018\u00010HH\u0007ø\u0001\u0000¢\u0006\u0004\bI\u0010JJ$\u0010#\u001a\u00020$2\b\b\u0002\u0010K\u001a\u00020\r2\b\b\u0002\u0010L\u001a\u00020\r2\b\b\u0002\u0010M\u001a\u00020\rJ'\u0010N\u001a\u00020O2\u0006\u0010P\u001a\u00020Q2\u000e\b\u0002\u0010R\u001a\b\u0012\u0004\u0012\u00020T0SH\u0001¢\u0006\u0004\bU\u0010VR\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006R\u0019\u0010\u0007\u001a\u00020\bø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u000b\u001a\u0004\b\t\u0010\nR\u000e\u0010\f\u001a\u00020\rX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\rX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\rX\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0010\u001a\u00020\u0011¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\u0014\u001a\u00020\u00158G¢\u0006\u0006\u001a\u0004\b\u0016\u0010\u0017R\u0018\u0010\u0018\u001a\u00020\u0019*\u00020\u001a8AX\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u001b\u0010\u001c\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006W"}, d2 = {"Landroidx/compose/material3/DatePickerDefaults;", "", "()V", "AllDates", "Landroidx/compose/material3/SelectableDates;", "getAllDates", "()Landroidx/compose/material3/SelectableDates;", "TonalElevation", "Landroidx/compose/ui/unit/Dp;", "getTonalElevation-D9Ej5fM", "()F", "F", "YearAbbrMonthDaySkeleton", "", "YearMonthSkeleton", "YearMonthWeekdayDaySkeleton", "YearRange", "Lkotlin/ranges/IntRange;", "getYearRange", "()Lkotlin/ranges/IntRange;", "shape", "Landroidx/compose/ui/graphics/Shape;", "getShape", "(Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/graphics/Shape;", "defaultDatePickerColors", "Landroidx/compose/material3/DatePickerColors;", "Landroidx/compose/material3/ColorScheme;", "getDefaultDatePickerColors", "(Landroidx/compose/material3/ColorScheme;Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/DatePickerColors;", "DatePickerHeadline", "", "selectedDateMillis", "", "displayMode", "Landroidx/compose/material3/DisplayMode;", "dateFormatter", "Landroidx/compose/material3/DatePickerFormatter;", "modifier", "Landroidx/compose/ui/Modifier;", "DatePickerHeadline-3kbWawI", "(Ljava/lang/Long;ILandroidx/compose/material3/DatePickerFormatter;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V", "DatePickerTitle", "DatePickerTitle-hOD91z4", "(ILandroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V", "colors", "(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/DatePickerColors;", "containerColor", "Landroidx/compose/ui/graphics/Color;", "titleContentColor", "headlineContentColor", "weekdayContentColor", "subheadContentColor", "navigationContentColor", "yearContentColor", "disabledYearContentColor", "currentYearContentColor", "selectedYearContentColor", "disabledSelectedYearContentColor", "selectedYearContainerColor", "disabledSelectedYearContainerColor", "dayContentColor", "disabledDayContentColor", "selectedDayContentColor", "disabledSelectedDayContentColor", "selectedDayContainerColor", "disabledSelectedDayContainerColor", "todayContentColor", "todayDateBorderColor", "dayInSelectionRangeContentColor", "dayInSelectionRangeContainerColor", "dividerColor", "dateTextFieldColors", "Landroidx/compose/material3/TextFieldColors;", "colors-bSRYm20", "(JJJJJJJJJJJJJJJJJJJJJJJJLandroidx/compose/material3/TextFieldColors;Landroidx/compose/runtime/Composer;IIII)Landroidx/compose/material3/DatePickerColors;", "yearSelectionSkeleton", "selectedDateSkeleton", "selectedDateDescriptionSkeleton", "rememberSnapFlingBehavior", "Landroidx/compose/foundation/gestures/FlingBehavior;", "lazyListState", "Landroidx/compose/foundation/lazy/LazyListState;", "decayAnimationSpec", "Landroidx/compose/animation/core/DecayAnimationSpec;", "", "rememberSnapFlingBehavior$material3_release", "(Landroidx/compose/foundation/lazy/LazyListState;Landroidx/compose/animation/core/DecayAnimationSpec;Landroidx/compose/runtime/Composer;II)Landroidx/compose/foundation/gestures/FlingBehavior;", "material3_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class DatePickerDefaults {
    public static final int $stable = 0;
    public static final String YearAbbrMonthDaySkeleton = "yMMMd";
    public static final String YearMonthSkeleton = "yMMMM";
    public static final String YearMonthWeekdayDaySkeleton = "yMMMMEEEEd";
    public static final DatePickerDefaults INSTANCE = new DatePickerDefaults();
    private static final IntRange YearRange = new IntRange(1900, 2100);
    private static final float TonalElevation = ElevationTokens.INSTANCE.m3222getLevel0D9Ej5fM();
    private static final SelectableDates AllDates = new SelectableDates() { // from class: androidx.compose.material3.DatePickerDefaults$AllDates$1
    };

    private DatePickerDefaults() {
    }

    public final DatePickerColors colors(Composer $composer, int $changed) {
        ComposerKt.sourceInformationMarkerStart($composer, -275219611, "C(colors)432@18805L11,432@18817L23:DatePicker.kt#uh7d8r");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-275219611, $changed, -1, "androidx.compose.material3.DatePickerDefaults.colors (DatePicker.kt:432)");
        }
        DatePickerColors defaultDatePickerColors = getDefaultDatePickerColors(MaterialTheme.INSTANCE.getColorScheme($composer, 6), $composer, ($changed << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return defaultDatePickerColors;
    }

    /* renamed from: colors-bSRYm20  reason: not valid java name */
    public final DatePickerColors m2072colorsbSRYm20(long containerColor, long titleContentColor, long headlineContentColor, long weekdayContentColor, long subheadContentColor, long navigationContentColor, long yearContentColor, long disabledYearContentColor, long currentYearContentColor, long selectedYearContentColor, long disabledSelectedYearContentColor, long selectedYearContainerColor, long disabledSelectedYearContainerColor, long dayContentColor, long disabledDayContentColor, long selectedDayContentColor, long disabledSelectedDayContentColor, long selectedDayContainerColor, long disabledSelectedDayContainerColor, long todayContentColor, long todayDateBorderColor, long dayInSelectionRangeContentColor, long dayInSelectionRangeContainerColor, long dividerColor, TextFieldColors dateTextFieldColors, Composer $composer, int $changed, int $changed1, int $changed2, int i) {
        ComposerKt.sourceInformationMarkerStart($composer, 1991626358, "C(colors)P(0:c#ui.graphics.Color,20:c#ui.graphics.Color,13:c#ui.graphics.Color,23:c#ui.graphics.Color,19:c#ui.graphics.Color,14:c#ui.graphics.Color,24:c#ui.graphics.Color,11:c#ui.graphics.Color,1:c#ui.graphics.Color,18:c#ui.graphics.Color,10:c#ui.graphics.Color,17:c#ui.graphics.Color,9:c#ui.graphics.Color,3:c#ui.graphics.Color,6:c#ui.graphics.Color,16:c#ui.graphics.Color,8:c#ui.graphics.Color,15:c#ui.graphics.Color,7:c#ui.graphics.Color,21:c#ui.graphics.Color,22:c#ui.graphics.Color,5:c#ui.graphics.Color,4:c#ui.graphics.Color,12:c#ui.graphics.Color)501@23101L11,501@23113L23:DatePicker.kt#uh7d8r");
        long containerColor2 = (i & 1) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : containerColor;
        long titleContentColor2 = (i & 2) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : titleContentColor;
        long headlineContentColor2 = (i & 4) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : headlineContentColor;
        long weekdayContentColor2 = (i & 8) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : weekdayContentColor;
        long subheadContentColor2 = (i & 16) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : subheadContentColor;
        long navigationContentColor2 = (i & 32) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : navigationContentColor;
        long yearContentColor2 = (i & 64) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : yearContentColor;
        long disabledYearContentColor2 = (i & 128) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : disabledYearContentColor;
        long currentYearContentColor2 = (i & 256) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : currentYearContentColor;
        long selectedYearContentColor2 = (i & 512) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : selectedYearContentColor;
        long disabledSelectedYearContentColor2 = (i & 1024) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : disabledSelectedYearContentColor;
        long selectedYearContainerColor2 = (i & 2048) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : selectedYearContainerColor;
        long disabledSelectedYearContainerColor2 = (i & 4096) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : disabledSelectedYearContainerColor;
        long dayContentColor2 = (i & 8192) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : dayContentColor;
        long disabledDayContentColor2 = (i & 16384) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : disabledDayContentColor;
        long selectedDayContentColor2 = (32768 & i) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : selectedDayContentColor;
        long disabledSelectedDayContentColor2 = (65536 & i) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : disabledSelectedDayContentColor;
        long selectedDayContainerColor2 = (131072 & i) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : selectedDayContainerColor;
        long disabledSelectedDayContainerColor2 = (262144 & i) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : disabledSelectedDayContainerColor;
        long todayContentColor2 = (524288 & i) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : todayContentColor;
        long todayDateBorderColor2 = (1048576 & i) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : todayDateBorderColor;
        long dayInSelectionRangeContentColor2 = (2097152 & i) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : dayInSelectionRangeContentColor;
        long dayInSelectionRangeContainerColor2 = (4194304 & i) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : dayInSelectionRangeContainerColor;
        long dividerColor2 = (8388608 & i) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : dividerColor;
        TextFieldColors dateTextFieldColors2 = (i & 16777216) != 0 ? null : dateTextFieldColors;
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(1991626358, $changed, $changed1, "androidx.compose.material3.DatePickerDefaults.colors (DatePicker.kt:501)");
        }
        DatePickerColors m2045copytNwlRmA = getDefaultDatePickerColors(MaterialTheme.INSTANCE.getColorScheme($composer, 6), $composer, ($changed2 >> 12) & Property.BORDER_BOTTOM_RIGHT_RADIUS).m2045copytNwlRmA(containerColor2, titleContentColor2, headlineContentColor2, weekdayContentColor2, subheadContentColor2, navigationContentColor2, yearContentColor2, disabledYearContentColor2, currentYearContentColor2, selectedYearContentColor2, disabledSelectedYearContentColor2, selectedYearContainerColor2, disabledSelectedYearContainerColor2, dayContentColor2, disabledDayContentColor2, selectedDayContentColor2, disabledSelectedDayContentColor2, selectedDayContainerColor2, disabledSelectedDayContainerColor2, todayContentColor2, todayDateBorderColor2, dayInSelectionRangeContainerColor2, dayInSelectionRangeContentColor2, dividerColor2, dateTextFieldColors2);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return m2045copytNwlRmA;
    }

    public final DatePickerColors getDefaultDatePickerColors(ColorScheme $this$defaultDatePickerColors, Composer $composer, int $changed) {
        long m4287copywmQWz5c;
        long m4287copywmQWz5c2;
        long m4287copywmQWz5c3;
        long m4287copywmQWz5c4;
        long m4287copywmQWz5c5;
        long m4287copywmQWz5c6;
        ComposerKt.sourceInformationMarkerStart($composer, 1180555308, "C:DatePicker.kt#uh7d8r");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(1180555308, $changed, -1, "androidx.compose.material3.DatePickerDefaults.<get-defaultDatePickerColors> (DatePicker.kt:531)");
        }
        DatePickerColors it = $this$defaultDatePickerColors.getDefaultDatePickerColorsCached$material3_release();
        $composer.startReplaceGroup(-653681037);
        ComposerKt.sourceInformation($composer, "*589@28839L30");
        if (it == null) {
            long fromToken = ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getContainerColor());
            long fromToken2 = ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getHeaderSupportingTextColor());
            long fromToken3 = ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getHeaderHeadlineColor());
            long fromToken4 = ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getWeekdaysLabelTextColor());
            long fromToken5 = ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getRangeSelectionMonthSubheadColor());
            long m1955getOnSurfaceVariant0d7_KjU = $this$defaultDatePickerColors.m1955getOnSurfaceVariant0d7_KjU();
            long fromToken6 = ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getSelectionYearUnselectedLabelTextColor());
            m4287copywmQWz5c = Color.m4287copywmQWz5c(r19, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r19) : 0.38f, (r12 & 2) != 0 ? Color.m4295getRedimpl(r19) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r19) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getSelectionYearUnselectedLabelTextColor())) : 0.0f);
            long fromToken7 = ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getDateTodayLabelTextColor());
            long fromToken8 = ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getSelectionYearSelectedLabelTextColor());
            m4287copywmQWz5c2 = Color.m4287copywmQWz5c(r25, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r25) : 0.38f, (r12 & 2) != 0 ? Color.m4295getRedimpl(r25) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r25) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getSelectionYearSelectedLabelTextColor())) : 0.0f);
            long fromToken9 = ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getSelectionYearSelectedContainerColor());
            m4287copywmQWz5c3 = Color.m4287copywmQWz5c(r29, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r29) : 0.38f, (r12 & 2) != 0 ? Color.m4295getRedimpl(r29) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r29) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getSelectionYearSelectedContainerColor())) : 0.0f);
            long fromToken10 = ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getDateUnselectedLabelTextColor());
            m4287copywmQWz5c4 = Color.m4287copywmQWz5c(r33, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r33) : 0.38f, (r12 & 2) != 0 ? Color.m4295getRedimpl(r33) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r33) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getDateUnselectedLabelTextColor())) : 0.0f);
            long fromToken11 = ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getDateSelectedLabelTextColor());
            m4287copywmQWz5c5 = Color.m4287copywmQWz5c(r37, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r37) : 0.38f, (r12 & 2) != 0 ? Color.m4295getRedimpl(r37) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r37) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getDateSelectedLabelTextColor())) : 0.0f);
            long fromToken12 = ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getDateSelectedContainerColor());
            m4287copywmQWz5c6 = Color.m4287copywmQWz5c(r41, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r41) : 0.38f, (r12 & 2) != 0 ? Color.m4295getRedimpl(r41) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r41) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getDateSelectedContainerColor())) : 0.0f);
            it = new DatePickerColors(fromToken, fromToken2, fromToken3, fromToken4, fromToken5, m1955getOnSurfaceVariant0d7_KjU, fromToken6, m4287copywmQWz5c, fromToken7, fromToken8, m4287copywmQWz5c2, fromToken9, m4287copywmQWz5c3, fromToken10, m4287copywmQWz5c4, fromToken11, m4287copywmQWz5c5, fromToken12, m4287copywmQWz5c6, ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getDateTodayLabelTextColor()), ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getDateTodayContainerOutlineColor()), ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getRangeSelectionActiveIndicatorContainerColor()), ColorSchemeKt.fromToken($this$defaultDatePickerColors, DatePickerModalTokens.INSTANCE.getSelectionDateInRangeLabelTextColor()), ColorSchemeKt.fromToken($this$defaultDatePickerColors, DividerTokens.INSTANCE.getColor()), OutlinedTextFieldDefaults.INSTANCE.getDefaultOutlinedTextFieldColors($this$defaultDatePickerColors, $composer, ($changed & 14) | 48), null);
            $this$defaultDatePickerColors.setDefaultDatePickerColorsCached$material3_release(it);
        }
        $composer.endReplaceGroup();
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return it;
    }

    public static /* synthetic */ DatePickerFormatter dateFormatter$default(DatePickerDefaults datePickerDefaults, String str, String str2, String str3, int i, Object obj) {
        if ((i & 1) != 0) {
            str = YearMonthSkeleton;
        }
        if ((i & 2) != 0) {
            str2 = YearAbbrMonthDaySkeleton;
        }
        if ((i & 4) != 0) {
            str3 = YearMonthWeekdayDaySkeleton;
        }
        return datePickerDefaults.dateFormatter(str, str2, str3);
    }

    public final DatePickerFormatter dateFormatter(String yearSelectionSkeleton, String selectedDateSkeleton, String selectedDateDescriptionSkeleton) {
        return new DatePickerFormatterImpl(yearSelectionSkeleton, selectedDateSkeleton, selectedDateDescriptionSkeleton);
    }

    /* renamed from: DatePickerTitle-hOD91z4  reason: not valid java name */
    public final void m2071DatePickerTitlehOD91z4(final int displayMode, Modifier modifier, Composer $composer, final int $changed, final int i) {
        Object obj;
        Composer $composer2;
        final Modifier modifier2;
        Composer $composer3 = $composer.startRestartGroup(327413563);
        ComposerKt.sourceInformation($composer3, "C(DatePickerTitle)P(0:c#material3.DisplayMode):DatePicker.kt#uh7d8r");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
        } else if (($changed & 6) == 0) {
            $dirty |= $composer3.changed(displayMode) ? 4 : 2;
        }
        int i2 = i & 2;
        if (i2 != 0) {
            $dirty |= 48;
            obj = modifier;
        } else if (($changed & 48) == 0) {
            obj = modifier;
            $dirty |= $composer3.changed(obj) ? 32 : 16;
        } else {
            obj = modifier;
        }
        if (($dirty & 19) != 18 || !$composer3.getSkipping()) {
            Modifier.Companion modifier3 = i2 != 0 ? Modifier.Companion : obj;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(327413563, $dirty, -1, "androidx.compose.material3.DatePickerDefaults.DatePickerTitle (DatePicker.kt:629)");
            }
            if (!DisplayMode.m2114equalsimpl0(displayMode, DisplayMode.Companion.m2119getPickerjFl4v0())) {
                int $dirty2 = $dirty;
                if (DisplayMode.m2114equalsimpl0(displayMode, DisplayMode.Companion.m2118getInputjFl4v0())) {
                    $composer3.startReplaceGroup(406443211);
                    ComposerKt.sourceInformation($composer3, "634@30948L42,634@30936L76");
                    Strings.Companion companion = Strings.Companion;
                    TextKt.m2743Text4IGK_g(Strings_androidKt.m3024getString2EP1pXo(Strings.m2954constructorimpl(R.string.m3c_date_input_title), $composer3, 0), modifier3, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer3, $dirty2 & Property.BORDER_BOTTOM_RIGHT_RADIUS, 0, 131068);
                    $composer2 = $composer3;
                    $composer2.endReplaceGroup();
                } else {
                    $composer2 = $composer3;
                    $composer2.startReplaceGroup(-285079389);
                    $composer2.endReplaceGroup();
                }
            } else {
                $composer3.startReplaceGroup(406439148);
                ComposerKt.sourceInformation($composer3, "632@30821L43,632@30809L77");
                Strings.Companion companion2 = Strings.Companion;
                TextKt.m2743Text4IGK_g(Strings_androidKt.m3024getString2EP1pXo(Strings.m2954constructorimpl(R.string.m3c_date_picker_title), $composer3, 0), modifier3, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer3, $dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS, 0, 131068);
                $composer3.endReplaceGroup();
                $composer2 = $composer3;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier3;
        } else {
            $composer3.skipToGroupEnd();
            $composer2 = $composer3;
            modifier2 = obj;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerDefaults$DatePickerTitle$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i3) {
                    DatePickerDefaults.this.m2071DatePickerTitlehOD91z4(displayMode, modifier2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    /* renamed from: DatePickerHeadline-3kbWawI  reason: not valid java name */
    public final void m2070DatePickerHeadline3kbWawI(final Long selectedDateMillis, final int displayMode, final DatePickerFormatter dateFormatter, Modifier modifier, Composer $composer, final int $changed, final int i) {
        final Object modifier2;
        String headlineText;
        Object value$iv;
        Composer $composer2;
        Composer $composer3 = $composer.startRestartGroup(1502835813);
        ComposerKt.sourceInformation($composer3, "C(DatePickerHeadline)P(3,1:c#material3.DisplayMode)655@31791L15,688@33142L135,685@33045L268:DatePicker.kt#uh7d8r");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
        } else if (($changed & 6) == 0) {
            $dirty |= $composer3.changed(selectedDateMillis) ? 4 : 2;
        }
        if ((i & 2) != 0) {
            $dirty |= 48;
        } else if (($changed & 48) == 0) {
            $dirty |= $composer3.changed(displayMode) ? 32 : 16;
        }
        if ((i & 4) != 0) {
            $dirty |= 384;
        } else if (($changed & 384) == 0) {
            $dirty |= ($changed & 512) == 0 ? $composer3.changed(dateFormatter) : $composer3.changedInstance(dateFormatter) ? 256 : 128;
        }
        int i2 = i & 8;
        if (i2 != 0) {
            $dirty |= 3072;
            modifier2 = modifier;
        } else if (($changed & 3072) == 0) {
            modifier2 = modifier;
            $dirty |= $composer3.changed(modifier2) ? 2048 : 1024;
        } else {
            modifier2 = modifier;
        }
        int $dirty2 = $dirty;
        if (($dirty2 & 1171) == 1170 && $composer3.getSkipping()) {
            $composer3.skipToGroupEnd();
            $composer2 = $composer3;
        } else {
            Modifier modifier3 = i2 != 0 ? Modifier.Companion : modifier2;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1502835813, $dirty2, -1, "androidx.compose.material3.DatePickerDefaults.DatePickerHeadline (DatePicker.kt:654)");
            }
            Locale defaultLocale = CalendarLocale_androidKt.defaultLocale($composer3, 0);
            String formattedDate = DatePickerFormatter.formatDate$default(dateFormatter, selectedDateMillis, defaultLocale, false, 4, null);
            String verboseDateDescription = dateFormatter.formatDate(selectedDateMillis, defaultLocale, true);
            $composer3.startReplaceGroup(1148835145);
            String str = "";
            ComposerKt.sourceInformation($composer3, "");
            if (verboseDateDescription == null) {
                if (DisplayMode.m2114equalsimpl0(displayMode, DisplayMode.Companion.m2119getPickerjFl4v0())) {
                    $composer3.startReplaceGroup(1148842944);
                    ComposerKt.sourceInformation($composer3, "665@32234L51");
                    Strings.Companion companion = Strings.Companion;
                    verboseDateDescription = Strings_androidKt.m3024getString2EP1pXo(Strings.m2954constructorimpl(R.string.m3c_date_picker_no_selection_description), $composer3, 0);
                    $composer3.endReplaceGroup();
                } else if (DisplayMode.m2114equalsimpl0(displayMode, DisplayMode.Companion.m2118getInputjFl4v0())) {
                    $composer3.startReplaceGroup(1148845915);
                    ComposerKt.sourceInformation($composer3, "666@32327L46");
                    Strings.Companion companion2 = Strings.Companion;
                    verboseDateDescription = Strings_androidKt.m3024getString2EP1pXo(Strings.m2954constructorimpl(R.string.m3c_date_input_no_input_description), $composer3, 0);
                    $composer3.endReplaceGroup();
                } else {
                    $composer3.startReplaceGroup(1254558033);
                    $composer3.endReplaceGroup();
                    verboseDateDescription = "";
                }
            }
            $composer3.endReplaceGroup();
            $composer3.startReplaceGroup(1148850481);
            ComposerKt.sourceInformation($composer3, "");
            if (formattedDate != null) {
                headlineText = formattedDate;
            } else if (DisplayMode.m2114equalsimpl0(displayMode, DisplayMode.Companion.m2119getPickerjFl4v0())) {
                $composer3.startReplaceGroup(1148853330);
                ComposerKt.sourceInformation($composer3, "673@32559L37");
                Strings.Companion companion3 = Strings.Companion;
                headlineText = Strings_androidKt.m3024getString2EP1pXo(Strings.m2954constructorimpl(R.string.m3c_date_picker_headline), $composer3, 0);
                $composer3.endReplaceGroup();
            } else if (DisplayMode.m2114equalsimpl0(displayMode, DisplayMode.Companion.m2118getInputjFl4v0())) {
                $composer3.startReplaceGroup(1148855857);
                ComposerKt.sourceInformation($composer3, "674@32638L36");
                Strings.Companion companion4 = Strings.Companion;
                headlineText = Strings_androidKt.m3024getString2EP1pXo(Strings.m2954constructorimpl(R.string.m3c_date_input_headline), $composer3, 0);
                $composer3.endReplaceGroup();
            } else {
                $composer3.startReplaceGroup(1254856625);
                $composer3.endReplaceGroup();
                headlineText = "";
            }
            $composer3.endReplaceGroup();
            if (DisplayMode.m2114equalsimpl0(displayMode, DisplayMode.Companion.m2119getPickerjFl4v0())) {
                $composer3.startReplaceGroup(1148862013);
                ComposerKt.sourceInformation($composer3, "680@32830L48");
                Strings.Companion companion5 = Strings.Companion;
                str = Strings_androidKt.m3024getString2EP1pXo(Strings.m2954constructorimpl(R.string.m3c_date_picker_headline_description), $composer3, 0);
                $composer3.endReplaceGroup();
            } else if (DisplayMode.m2114equalsimpl0(displayMode, DisplayMode.Companion.m2118getInputjFl4v0())) {
                $composer3.startReplaceGroup(1148864764);
                ComposerKt.sourceInformation($composer3, "681@32916L47");
                Strings.Companion companion6 = Strings.Companion;
                str = Strings_androidKt.m3024getString2EP1pXo(Strings.m2954constructorimpl(R.string.m3c_date_input_headline_description), $composer3, 0);
                $composer3.endReplaceGroup();
            } else {
                $composer3.startReplaceGroup(1255139345);
                $composer3.endReplaceGroup();
            }
            final String headlineDescription = String.format(str, Arrays.copyOf(new Object[]{verboseDateDescription}, 1));
            Intrinsics.checkNotNullExpressionValue(headlineDescription, "format(this, *args)");
            ComposerKt.sourceInformationMarkerStart($composer3, 1148872084, "CC(remember):DatePicker.kt#9igjgp");
            boolean invalid$iv = $composer3.changed(headlineDescription);
            Object it$iv = $composer3.rememberedValue();
            if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                value$iv = (Function1) new Function1<SemanticsPropertyReceiver, Unit>() { // from class: androidx.compose.material3.DatePickerDefaults$DatePickerHeadline$1$1
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
                        SemanticsPropertiesKt.m6121setLiveRegionhR3wRGc($this$semantics, LiveRegionMode.Companion.m6095getPolite0phEisY());
                        SemanticsPropertiesKt.setContentDescription($this$semantics, headlineDescription);
                    }
                };
                $composer3.updateRememberedValue(value$iv);
            } else {
                value$iv = it$iv;
            }
            ComposerKt.sourceInformationMarkerEnd($composer3);
            Modifier modifier4 = modifier3;
            $composer2 = $composer3;
            TextKt.m2743Text4IGK_g(headlineText, SemanticsModifierKt.semantics$default(modifier3, false, (Function1) value$iv, 1, null), 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 1, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer2, 0, 3072, 122876);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier4;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerDefaults$DatePickerHeadline$2
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i3) {
                    DatePickerDefaults.this.m2070DatePickerHeadline3kbWawI(selectedDateMillis, displayMode, dateFormatter, modifier2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    public final FlingBehavior rememberSnapFlingBehavior$material3_release(LazyListState lazyListState, DecayAnimationSpec<Float> decayAnimationSpec, Composer $composer, int $changed, int i) {
        Object value$iv;
        ComposerKt.sourceInformationMarkerStart($composer, -2036003494, "C(rememberSnapFlingBehavior)P(1)708@33801L669:DatePicker.kt#uh7d8r");
        DecayAnimationSpec decayAnimationSpec2 = (i & 2) != 0 ? DecayAnimationSpecKt.exponentialDecay$default(0.0f, 0.0f, 3, null) : decayAnimationSpec;
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-2036003494, $changed, -1, "androidx.compose.material3.DatePickerDefaults.rememberSnapFlingBehavior (DatePicker.kt:707)");
        }
        ComposerKt.sourceInformationMarkerStart($composer, 2078676503, "CC(remember):DatePicker.kt#9igjgp");
        boolean invalid$iv = $composer.changed(decayAnimationSpec2) | (((($changed & 14) ^ 6) > 4 && $composer.changed(lazyListState)) || ($changed & 6) == 4);
        Object it$iv = $composer.rememberedValue();
        if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
            final SnapLayoutInfoProvider original = LazyListSnapLayoutInfoProviderKt.SnapLayoutInfoProvider$default(lazyListState, null, 2, null);
            value$iv = SnapFlingBehaviorKt.snapFlingBehavior(new SnapLayoutInfoProvider() { // from class: androidx.compose.material3.DatePickerDefaults$rememberSnapFlingBehavior$1$snapLayoutInfoProvider$1
                @Override // androidx.compose.foundation.gestures.snapping.SnapLayoutInfoProvider
                public float calculateSnapOffset(float f) {
                    return SnapLayoutInfoProvider.this.calculateSnapOffset(f);
                }

                @Override // androidx.compose.foundation.gestures.snapping.SnapLayoutInfoProvider
                public float calculateApproachOffset(float velocity, float decayOffset) {
                    return 0.0f;
                }
            }, decayAnimationSpec2, AnimationSpecKt.spring$default(0.0f, 400.0f, null, 5, null));
            $composer.updateRememberedValue(value$iv);
        } else {
            value$iv = it$iv;
        }
        TargetedFlingBehavior targetedFlingBehavior = (TargetedFlingBehavior) value$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return targetedFlingBehavior;
    }

    public final IntRange getYearRange() {
        return YearRange;
    }

    /* renamed from: getTonalElevation-D9Ej5fM  reason: not valid java name */
    public final float m2073getTonalElevationD9Ej5fM() {
        return TonalElevation;
    }

    public final Shape getShape(Composer $composer, int $changed) {
        ComposerKt.sourceInformationMarkerStart($composer, 700927667, "C734@34850L5:DatePicker.kt#uh7d8r");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(700927667, $changed, -1, "androidx.compose.material3.DatePickerDefaults.<get-shape> (DatePicker.kt:734)");
        }
        Shape value = ShapesKt.getValue(DatePickerModalTokens.INSTANCE.getContainerShape(), $composer, 6);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return value;
    }

    public final SelectableDates getAllDates() {
        return AllDates;
    }
}
