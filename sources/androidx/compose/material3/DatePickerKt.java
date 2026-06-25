package androidx.compose.material3;

import androidx.autofill.HintConstants;
import androidx.compose.animation.AnimatedContentKt;
import androidx.compose.animation.AnimatedContentScope;
import androidx.compose.animation.AnimatedContentTransitionScope;
import androidx.compose.animation.ContentTransform;
import androidx.compose.animation.EnterExitTransitionKt;
import androidx.compose.animation.EnterTransition;
import androidx.compose.animation.ExitTransition;
import androidx.compose.animation.core.AnimationSpecKt;
import androidx.compose.animation.core.FiniteAnimationSpec;
import androidx.compose.foundation.BackgroundKt;
import androidx.compose.foundation.BorderStroke;
import androidx.compose.foundation.BorderStrokeKt;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.layout.Arrangement;
import androidx.compose.foundation.layout.ColumnKt;
import androidx.compose.foundation.layout.ColumnScopeInstance;
import androidx.compose.foundation.layout.PaddingKt;
import androidx.compose.foundation.layout.PaddingValues;
import androidx.compose.foundation.layout.RowScope;
import androidx.compose.foundation.layout.SizeKt;
import androidx.compose.foundation.layout.SpacerKt;
import androidx.compose.foundation.lazy.LazyListState;
import androidx.compose.foundation.lazy.grid.LazyGridState;
import androidx.compose.foundation.shape.RoundedCornerShapeKt;
import androidx.compose.material.icons.Icons;
import androidx.compose.material.icons.filled.ArrowDropDownKt;
import androidx.compose.material3.internal.CalendarDate;
import androidx.compose.material3.internal.CalendarModel;
import androidx.compose.material3.internal.CalendarMonth;
import androidx.compose.material3.internal.Strings;
import androidx.compose.material3.internal.Strings_androidKt;
import androidx.compose.material3.tokens.DatePickerModalTokens;
import androidx.compose.material3.tokens.MotionTokens;
import androidx.compose.runtime.Applier;
import androidx.compose.runtime.ComposablesKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.CompositionLocalMap;
import androidx.compose.runtime.EffectsKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.Updater;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.runtime.saveable.RememberSaveableKt;
import androidx.compose.runtime.saveable.Saver;
import androidx.compose.ui.Alignment;
import androidx.compose.ui.ComposedModifierKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.draw.RotateKt;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.Shape;
import androidx.compose.ui.graphics.vector.ImageVector;
import androidx.compose.ui.layout.MeasurePolicy;
import androidx.compose.ui.node.ComposeUiNode;
import androidx.compose.ui.platform.CompositionLocalsKt;
import androidx.compose.ui.semantics.CustomAccessibilityAction;
import androidx.compose.ui.semantics.Role;
import androidx.compose.ui.semantics.SemanticsModifierKt;
import androidx.compose.ui.semantics.SemanticsPropertiesKt;
import androidx.compose.ui.semantics.SemanticsPropertyReceiver;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.Dp;
import androidx.compose.ui.unit.IntSize;
import androidx.profileinstaller.ProfileVerifier;
import com.itextpdf.io.font.constants.FontWeights;
import com.itextpdf.kernel.xmp.PdfConst;
import com.itextpdf.kernel.xmp.options.PropertyOptions;
import com.itextpdf.layout.properties.Property;
import java.util.List;
import java.util.Locale;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.flow.FlowCollector;
/* compiled from: DatePicker.kt */
@Metadata(d1 = {"\u0000Ì\u0001\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u001a\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\u001a\u0084\u0001\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0013\u0010\u0017\u001a\u000f\u0012\u0004\u0012\u00020\u0014\u0018\u00010\u0018¢\u0006\u0002\b\u00192\u0013\u0010\u001a\u001a\u000f\u0012\u0004\u0012\u00020\u0014\u0018\u00010\u0018¢\u0006\u0002\b\u00192\u0013\u0010\u001b\u001a\u000f\u0012\u0004\u0012\u00020\u0014\u0018\u00010\u0018¢\u0006\u0002\b\u00192\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020\u00032\u0011\u0010!\u001a\r\u0012\u0004\u0012\u00020\u00140\u0018¢\u0006\u0002\b\u0019H\u0001ø\u0001\u0000¢\u0006\u0004\b\"\u0010#\u001ak\u0010$\u001a\u00020\u00142\u0006\u0010%\u001a\u00020&2\b\b\u0002\u0010\u0015\u001a\u00020\u00162\b\b\u0002\u0010'\u001a\u00020(2\u0015\b\u0002\u0010\u0017\u001a\u000f\u0012\u0004\u0012\u00020\u0014\u0018\u00010\u0018¢\u0006\u0002\b\u00192\u0015\b\u0002\u0010\u001a\u001a\u000f\u0012\u0004\u0012\u00020\u0014\u0018\u00010\u0018¢\u0006\u0002\b\u00192\b\b\u0002\u0010)\u001a\u00020*2\b\b\u0002\u0010\u001c\u001a\u00020\u001dH\u0007¢\u0006\u0002\u0010+\u001a\u008d\u0001\u0010,\u001a\u00020\u00142\b\u0010-\u001a\u0004\u0018\u00010.2\u0006\u0010/\u001a\u00020.2!\u00100\u001a\u001d\u0012\u0013\u0012\u00110.¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(4\u0012\u0004\u0012\u00020\u0014012!\u00105\u001a\u001d\u0012\u0013\u0012\u00110.¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(6\u0012\u0004\u0012\u00020\u0014012\u0006\u00107\u001a\u0002082\u0006\u00109\u001a\u00020:2\u0006\u0010'\u001a\u00020(2\u0006\u0010;\u001a\u00020<2\u0006\u0010\u001c\u001a\u00020\u001dH\u0003¢\u0006\u0002\u0010=\u001aZ\u0010>\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0013\u0010\u0017\u001a\u000f\u0012\u0004\u0012\u00020\u0014\u0018\u00010\u0018¢\u0006\u0002\b\u00192\u0006\u0010?\u001a\u00020@2\u0006\u0010A\u001a\u00020@2\u0006\u0010B\u001a\u00020\u00032\u0011\u0010!\u001a\r\u0012\u0004\u0012\u00020\u00140\u0018¢\u0006\u0002\b\u0019H\u0001ø\u0001\u0000¢\u0006\u0004\bC\u0010D\u001aT\u0010E\u001a\u00020&2\n\u0010F\u001a\u00060Gj\u0002`H2\n\b\u0002\u0010I\u001a\u0004\u0018\u00010.2\n\b\u0002\u0010J\u001a\u0004\u0018\u00010.2\b\b\u0002\u00109\u001a\u00020:2\b\b\u0002\u0010K\u001a\u00020L2\b\b\u0002\u0010;\u001a\u00020<H\u0007ø\u0001\u0000¢\u0006\u0004\bM\u0010N\u001an\u0010O\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010P\u001a\u00020*2\f\u0010Q\u001a\b\u0012\u0004\u0012\u00020\u00140\u00182\u0006\u0010R\u001a\u00020*2\u0006\u0010S\u001a\u00020*2\u0006\u0010T\u001a\u00020*2\u0006\u0010U\u001a\u00020*2\u0006\u0010V\u001a\u00020W2\u0006\u0010\u001c\u001a\u00020\u001d2\u0011\u0010!\u001a\r\u0012\u0004\u0012\u00020\u00140\u0018¢\u0006\u0002\b\u0019H\u0003¢\u0006\u0002\u0010X\u001a6\u0010Y\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010Z\u001a\u00020L2\u0012\u0010[\u001a\u000e\u0012\u0004\u0012\u00020L\u0012\u0004\u0012\u00020\u001401H\u0001ø\u0001\u0000¢\u0006\u0004\b\\\u0010]\u001a\u008d\u0001\u0010^\u001a\u00020\u00142\u0006\u0010_\u001a\u00020`2\b\u0010-\u001a\u0004\u0018\u00010.2!\u00100\u001a\u001d\u0012\u0013\u0012\u00110.¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(4\u0012\u0004\u0012\u00020\u0014012!\u00105\u001a\u001d\u0012\u0013\u0012\u00110.¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(6\u0012\u0004\u0012\u00020\u0014012\u0006\u00107\u001a\u0002082\u0006\u00109\u001a\u00020:2\u0006\u0010'\u001a\u00020(2\u0006\u0010;\u001a\u00020<2\u0006\u0010\u001c\u001a\u00020\u001dH\u0003¢\u0006\u0002\u0010a\u001av\u0010b\u001a\u00020\u00142\u0006\u0010c\u001a\u00020d2!\u00100\u001a\u001d\u0012\u0013\u0012\u00110.¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(4\u0012\u0004\u0012\u00020\u0014012\u0006\u0010e\u001a\u00020.2\b\u0010f\u001a\u0004\u0018\u00010.2\b\u0010g\u001a\u0004\u0018\u00010.2\b\u0010h\u001a\u0004\u0018\u00010i2\u0006\u0010'\u001a\u00020(2\u0006\u0010;\u001a\u00020<2\u0006\u0010\u001c\u001a\u00020\u001dH\u0001¢\u0006\u0002\u0010j\u001ag\u0010k\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010l\u001a\u00020*2\u0006\u0010m\u001a\u00020*2\u0006\u0010n\u001a\u00020*2\u0006\u0010o\u001a\u00020W2\f\u0010p\u001a\b\u0012\u0004\u0012\u00020\u00140\u00182\f\u0010q\u001a\b\u0012\u0004\u0012\u00020\u00140\u00182\f\u0010r\u001a\b\u0012\u0004\u0012\u00020\u00140\u00182\u0006\u0010\u001c\u001a\u00020\u001dH\u0003¢\u0006\u0002\u0010s\u001a\u009c\u0001\u0010t\u001a\u00020\u00142\b\u0010-\u001a\u0004\u0018\u00010.2\u0006\u0010/\u001a\u00020.2\u0006\u0010Z\u001a\u00020L2#\u00100\u001a\u001f\u0012\u0015\u0012\u0013\u0018\u00010.¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(4\u0012\u0004\u0012\u00020\u0014012!\u00105\u001a\u001d\u0012\u0013\u0012\u00110.¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(6\u0012\u0004\u0012\u00020\u0014012\u0006\u00107\u001a\u0002082\u0006\u00109\u001a\u00020:2\u0006\u0010'\u001a\u00020(2\u0006\u0010;\u001a\u00020<2\u0006\u0010\u001c\u001a\u00020\u001dH\u0003ø\u0001\u0000¢\u0006\u0004\bu\u0010v\u001a\u001d\u0010w\u001a\u00020\u00142\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u00107\u001a\u000208H\u0001¢\u0006\u0002\u0010x\u001a^\u0010y\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010P\u001a\u00020*2\u0006\u0010z\u001a\u00020*2\f\u0010Q\u001a\b\u0012\u0004\u0012\u00020\u00140\u00182\u0006\u0010S\u001a\u00020*2\u0006\u0010V\u001a\u00020W2\u0006\u0010\u001c\u001a\u00020\u001d2\u0011\u0010!\u001a\r\u0012\u0004\u0012\u00020\u00140\u0018¢\u0006\u0002\b\u0019H\u0003¢\u0006\u0002\u0010{\u001a`\u0010|\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010/\u001a\u00020.2!\u0010}\u001a\u001d\u0012\u0013\u0012\u00110\f¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(~\u0012\u0004\u0012\u00020\u0014012\u0006\u0010;\u001a\u00020<2\u0006\u00107\u001a\u0002082\u0006\u00109\u001a\u00020:2\u0006\u0010\u001c\u001a\u00020\u001dH\u0003¢\u0006\u0002\u0010\u007f\u001aC\u0010\u0080\u0001\u001a\u00020\u00142\f\u0010Q\u001a\b\u0012\u0004\u0012\u00020\u00140\u00182\u0007\u0010\u0081\u0001\u001a\u00020*2\b\b\u0002\u0010\u0015\u001a\u00020\u00162\u0011\u0010!\u001a\r\u0012\u0004\u0012\u00020\u00140\u0018¢\u0006\u0002\b\u0019H\u0003¢\u0006\u0003\u0010\u0082\u0001\u001a6\u0010\u0083\u0001\u001a\n\u0012\u0005\u0012\u00030\u0085\u00010\u0084\u00012\u0007\u0010%\u001a\u00030\u0086\u00012\b\u0010\u0087\u0001\u001a\u00030\u0088\u00012\u0007\u0010\u0089\u0001\u001a\u00020W2\u0007\u0010\u008a\u0001\u001a\u00020WH\u0002\u001a>\u0010\u008b\u0001\u001a\u0004\u0018\u00010W2\u0007\u0010\u008c\u0001\u001a\u00020*2\u0007\u0010\u008d\u0001\u001a\u00020*2\u0007\u0010\u008e\u0001\u001a\u00020*2\u0007\u0010\u008f\u0001\u001a\u00020*2\u0007\u0010\u0090\u0001\u001a\u00020*H\u0003¢\u0006\u0003\u0010\u0091\u0001\u001a\u0011\u0010\u0092\u0001\u001a\u00020\f2\u0006\u00109\u001a\u00020:H\u0000\u001aK\u0010\u0093\u0001\u001a\u00020&2\n\b\u0002\u0010I\u001a\u0004\u0018\u00010.2\n\b\u0002\u0010J\u001a\u0004\u0018\u00010.2\b\b\u0002\u00109\u001a\u00020:2\b\b\u0002\u0010K\u001a\u00020L2\b\b\u0002\u0010;\u001a\u00020<H\u0007ø\u0001\u0000¢\u0006\u0006\b\u0094\u0001\u0010\u0095\u0001\u001aK\u0010\u0096\u0001\u001a\u00020\u00142\u0006\u0010_\u001a\u00020`2!\u00105\u001a\u001d\u0012\u0013\u0012\u00110.¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(6\u0012\u0004\u0012\u00020\u0014012\u0006\u00107\u001a\u0002082\u0006\u00109\u001a\u00020:H\u0080@¢\u0006\u0003\u0010\u0097\u0001\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u0016\u0010\u0002\u001a\u00020\u0003X\u0080\u0004¢\u0006\n\n\u0002\u0010\u0006\u001a\u0004\b\u0004\u0010\u0005\"\u0014\u0010\u0007\u001a\u00020\u0001X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\t\"\u000e\u0010\n\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u000e\u0010\u000b\u001a\u00020\fX\u0082T¢\u0006\u0002\n\u0000\"\u0016\u0010\r\u001a\u00020\u0003X\u0080\u0004¢\u0006\n\n\u0002\u0010\u0006\u001a\u0004\b\u000e\u0010\u0005\"\u0016\u0010\u000f\u001a\u00020\u0003X\u0080\u0004¢\u0006\n\n\u0002\u0010\u0006\u001a\u0004\b\u0010\u0010\u0005\"\u000e\u0010\u0011\u001a\u00020\fX\u0082T¢\u0006\u0002\n\u0000\"\u0010\u0010\u0012\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0006\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0098\u0001²\u0006\n\u0010n\u001a\u00020*X\u008a\u008e\u0002"}, d2 = {"DatePickerHeadlinePadding", "Landroidx/compose/foundation/layout/PaddingValues;", "DatePickerHorizontalPadding", "Landroidx/compose/ui/unit/Dp;", "getDatePickerHorizontalPadding", "()F", "F", "DatePickerModeTogglePadding", "getDatePickerModeTogglePadding", "()Landroidx/compose/foundation/layout/PaddingValues;", "DatePickerTitlePadding", "MaxCalendarRows", "", "MonthYearHeight", "getMonthYearHeight", "RecommendedSizeForAccessibility", "getRecommendedSizeForAccessibility", "YearsInRow", "YearsVerticalPadding", "DateEntryContainer", "", "modifier", "Landroidx/compose/ui/Modifier;", "title", "Lkotlin/Function0;", "Landroidx/compose/runtime/Composable;", "headline", "modeToggleButton", "colors", "Landroidx/compose/material3/DatePickerColors;", "headlineTextStyle", "Landroidx/compose/ui/text/TextStyle;", "headerMinHeight", "content", "DateEntryContainer-au3_HiA", "(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/material3/DatePickerColors;Landroidx/compose/ui/text/TextStyle;FLkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V", "DatePicker", "state", "Landroidx/compose/material3/DatePickerState;", "dateFormatter", "Landroidx/compose/material3/DatePickerFormatter;", "showModeToggle", "", "(Landroidx/compose/material3/DatePickerState;Landroidx/compose/ui/Modifier;Landroidx/compose/material3/DatePickerFormatter;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/material3/DatePickerColors;Landroidx/compose/runtime/Composer;II)V", "DatePickerContent", "selectedDateMillis", "", "displayedMonthMillis", "onDateSelectionChange", "Lkotlin/Function1;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "dateInMillis", "onDisplayedMonthChange", "monthInMillis", "calendarModel", "Landroidx/compose/material3/internal/CalendarModel;", "yearRange", "Lkotlin/ranges/IntRange;", "selectableDates", "Landroidx/compose/material3/SelectableDates;", "(Ljava/lang/Long;JLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/material3/internal/CalendarModel;Lkotlin/ranges/IntRange;Landroidx/compose/material3/DatePickerFormatter;Landroidx/compose/material3/SelectableDates;Landroidx/compose/material3/DatePickerColors;Landroidx/compose/runtime/Composer;I)V", "DatePickerHeader", "titleContentColor", "Landroidx/compose/ui/graphics/Color;", "headlineContentColor", "minHeight", "DatePickerHeader-pc5RIQQ", "(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;JJFLkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V", "DatePickerState", "locale", "Ljava/util/Locale;", "Landroidx/compose/material3/CalendarLocale;", "initialSelectedDateMillis", "initialDisplayedMonthMillis", "initialDisplayMode", "Landroidx/compose/material3/DisplayMode;", "DatePickerState-sHin3Bw", "(Ljava/util/Locale;Ljava/lang/Long;Ljava/lang/Long;Lkotlin/ranges/IntRange;ILandroidx/compose/material3/SelectableDates;)Landroidx/compose/material3/DatePickerState;", "Day", "selected", "onClick", "animateChecked", "enabled", "today", "inRange", PdfConst.Description, "", "(Landroidx/compose/ui/Modifier;ZLkotlin/jvm/functions/Function0;ZZZZLjava/lang/String;Landroidx/compose/material3/DatePickerColors;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V", "DisplayModeToggleButton", "displayMode", "onDisplayModeChange", "DisplayModeToggleButton-tER2X8s", "(Landroidx/compose/ui/Modifier;ILkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V", "HorizontalMonthsList", "lazyListState", "Landroidx/compose/foundation/lazy/LazyListState;", "(Landroidx/compose/foundation/lazy/LazyListState;Ljava/lang/Long;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/material3/internal/CalendarModel;Lkotlin/ranges/IntRange;Landroidx/compose/material3/DatePickerFormatter;Landroidx/compose/material3/SelectableDates;Landroidx/compose/material3/DatePickerColors;Landroidx/compose/runtime/Composer;I)V", "Month", "month", "Landroidx/compose/material3/internal/CalendarMonth;", "todayMillis", "startDateMillis", "endDateMillis", "rangeSelectionInfo", "Landroidx/compose/material3/SelectedRangeInfo;", "(Landroidx/compose/material3/internal/CalendarMonth;Lkotlin/jvm/functions/Function1;JLjava/lang/Long;Ljava/lang/Long;Landroidx/compose/material3/SelectedRangeInfo;Landroidx/compose/material3/DatePickerFormatter;Landroidx/compose/material3/SelectableDates;Landroidx/compose/material3/DatePickerColors;Landroidx/compose/runtime/Composer;I)V", "MonthsNavigation", "nextAvailable", "previousAvailable", "yearPickerVisible", "yearPickerText", "onNextClicked", "onPreviousClicked", "onYearPickerButtonClicked", "(Landroidx/compose/ui/Modifier;ZZZLjava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Landroidx/compose/material3/DatePickerColors;Landroidx/compose/runtime/Composer;I)V", "SwitchableDateEntryContent", "SwitchableDateEntryContent-d7iavvg", "(Ljava/lang/Long;JILkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/material3/internal/CalendarModel;Lkotlin/ranges/IntRange;Landroidx/compose/material3/DatePickerFormatter;Landroidx/compose/material3/SelectableDates;Landroidx/compose/material3/DatePickerColors;Landroidx/compose/runtime/Composer;I)V", "WeekDays", "(Landroidx/compose/material3/DatePickerColors;Landroidx/compose/material3/internal/CalendarModel;Landroidx/compose/runtime/Composer;I)V", "Year", "currentYear", "(Landroidx/compose/ui/Modifier;ZZLkotlin/jvm/functions/Function0;ZLjava/lang/String;Landroidx/compose/material3/DatePickerColors;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V", "YearPicker", "onYearSelected", "year", "(Landroidx/compose/ui/Modifier;JLkotlin/jvm/functions/Function1;Landroidx/compose/material3/SelectableDates;Landroidx/compose/material3/internal/CalendarModel;Lkotlin/ranges/IntRange;Landroidx/compose/material3/DatePickerColors;Landroidx/compose/runtime/Composer;I)V", "YearPickerMenuButton", "expanded", "(Lkotlin/jvm/functions/Function0;ZLandroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V", "customScrollActions", "", "Landroidx/compose/ui/semantics/CustomAccessibilityAction;", "Landroidx/compose/foundation/lazy/grid/LazyGridState;", "coroutineScope", "Lkotlinx/coroutines/CoroutineScope;", "scrollUpLabel", "scrollDownLabel", "dayContentDescription", "rangeSelectionEnabled", "isToday", "isStartDate", "isEndDate", "isInRange", "(ZZZZZLandroidx/compose/runtime/Composer;I)Ljava/lang/String;", "numberOfMonthsInRange", "rememberDatePickerState", "rememberDatePickerState-EU0dCGE", "(Ljava/lang/Long;Ljava/lang/Long;Lkotlin/ranges/IntRange;ILandroidx/compose/material3/SelectableDates;Landroidx/compose/runtime/Composer;II)Landroidx/compose/material3/DatePickerState;", "updateDisplayedMonth", "(Landroidx/compose/foundation/lazy/LazyListState;Lkotlin/jvm/functions/Function1;Landroidx/compose/material3/internal/CalendarModel;Lkotlin/ranges/IntRange;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "material3_release"}, k = 2, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class DatePickerKt {
    private static final int MaxCalendarRows = 6;
    private static final int YearsInRow = 3;
    private static final float RecommendedSizeForAccessibility = Dp.m6873constructorimpl(48);
    private static final float MonthYearHeight = Dp.m6873constructorimpl(56);
    private static final float DatePickerHorizontalPadding = Dp.m6873constructorimpl(12);
    private static final PaddingValues DatePickerModeTogglePadding = PaddingKt.m990PaddingValuesa9UjIt4$default(0.0f, 0.0f, Dp.m6873constructorimpl(12), Dp.m6873constructorimpl(12), 3, null);
    private static final PaddingValues DatePickerTitlePadding = PaddingKt.m990PaddingValuesa9UjIt4$default(Dp.m6873constructorimpl(24), Dp.m6873constructorimpl(16), Dp.m6873constructorimpl(12), 0.0f, 8, null);
    private static final PaddingValues DatePickerHeadlinePadding = PaddingKt.m990PaddingValuesa9UjIt4$default(Dp.m6873constructorimpl(24), 0.0f, Dp.m6873constructorimpl(12), Dp.m6873constructorimpl(12), 2, null);
    private static final float YearsVerticalPadding = Dp.m6873constructorimpl(16);

    /* JADX WARN: Removed duplicated region for block: B:131:0x0219  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x022c  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x0282  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void DatePicker(final androidx.compose.material3.DatePickerState r27, androidx.compose.ui.Modifier r28, androidx.compose.material3.DatePickerFormatter r29, kotlin.jvm.functions.Function2<? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r30, kotlin.jvm.functions.Function2<? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r31, boolean r32, androidx.compose.material3.DatePickerColors r33, androidx.compose.runtime.Composer r34, final int r35, final int r36) {
        /*
            Method dump skipped, instructions count: 676
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.DatePickerKt.DatePicker(androidx.compose.material3.DatePickerState, androidx.compose.ui.Modifier, androidx.compose.material3.DatePickerFormatter, kotlin.jvm.functions.Function2, kotlin.jvm.functions.Function2, boolean, androidx.compose.material3.DatePickerColors, androidx.compose.runtime.Composer, int, int):void");
    }

    /* renamed from: rememberDatePickerState-EU0dCGE  reason: not valid java name */
    public static final DatePickerState m2082rememberDatePickerStateEU0dCGE(Long initialSelectedDateMillis, Long initialDisplayedMonthMillis, IntRange yearRange, int initialDisplayMode, SelectableDates selectableDates, Composer $composer, int $changed, int i) {
        Object value$iv;
        ComposerKt.sourceInformationMarkerStart($composer, 2065763010, "C(rememberDatePickerState)P(2,1,4,0:c#material3.DisplayMode)365@15667L15,*366@15771L383,366@15694L460:DatePicker.kt#uh7d8r");
        final Long initialSelectedDateMillis2 = (i & 1) != 0 ? null : initialSelectedDateMillis;
        final Long initialDisplayedMonthMillis2 = (i & 2) != 0 ? initialSelectedDateMillis2 : initialDisplayedMonthMillis;
        final IntRange yearRange2 = (i & 4) != 0 ? DatePickerDefaults.INSTANCE.getYearRange() : yearRange;
        final int initialDisplayMode2 = (i & 8) != 0 ? DisplayMode.Companion.m2119getPickerjFl4v0() : initialDisplayMode;
        final SelectableDates selectableDates2 = (i & 16) != 0 ? DatePickerDefaults.INSTANCE.getAllDates() : selectableDates;
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(2065763010, $changed, -1, "androidx.compose.material3.rememberDatePickerState (DatePicker.kt:364)");
        }
        final Locale locale = CalendarLocale_androidKt.defaultLocale($composer, 0);
        boolean z = false;
        Object[] objArr = new Object[0];
        Saver<DatePickerStateImpl, Object> Saver = DatePickerStateImpl.Companion.Saver(selectableDates2, locale);
        ComposerKt.sourceInformationMarkerStart($composer, -390857660, "CC(remember):DatePicker.kt#9igjgp");
        boolean changedInstance = (((($changed & 14) ^ 6) > 4 && $composer.changed(initialSelectedDateMillis2)) || ($changed & 6) == 4) | (((($changed & Property.BORDER_BOTTOM_RIGHT_RADIUS) ^ 48) > 32 && $composer.changed(initialDisplayedMonthMillis2)) || ($changed & 48) == 32) | $composer.changedInstance(yearRange2) | (((($changed & 7168) ^ 3072) > 2048 && $composer.changed(initialDisplayMode2)) || ($changed & 3072) == 2048);
        if ((((57344 & $changed) ^ 24576) > 16384 && $composer.changed(selectableDates2)) || ($changed & 24576) == 16384) {
            z = true;
        }
        boolean invalid$iv = z | changedInstance | $composer.changedInstance(locale);
        Object it$iv = $composer.rememberedValue();
        if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
            Object value$iv2 = (Function0) new Function0<DatePickerStateImpl>() { // from class: androidx.compose.material3.DatePickerKt$rememberDatePickerState$1$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // kotlin.jvm.functions.Function0
                public final DatePickerStateImpl invoke() {
                    return new DatePickerStateImpl(initialSelectedDateMillis2, initialDisplayedMonthMillis2, yearRange2, initialDisplayMode2, selectableDates2, locale, null);
                }
            };
            $composer.updateRememberedValue(value$iv2);
            value$iv = value$iv2;
        } else {
            value$iv = it$iv;
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        Object m3846rememberSaveable = RememberSaveableKt.m3846rememberSaveable(objArr, Saver, (String) null, (Function0<? extends Object>) value$iv, $composer, 0, 4);
        DatePickerStateImpl $this$rememberDatePickerState_EU0dCGE_u24lambda_u243 = (DatePickerStateImpl) m3846rememberSaveable;
        $this$rememberDatePickerState_EU0dCGE_u24lambda_u243.setSelectableDates(selectableDates2);
        DatePickerStateImpl datePickerStateImpl = (DatePickerStateImpl) m3846rememberSaveable;
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return datePickerStateImpl;
    }

    /* renamed from: DatePickerState-sHin3Bw$default  reason: not valid java name */
    public static /* synthetic */ DatePickerState m2078DatePickerStatesHin3Bw$default(Locale locale, Long l, Long l2, IntRange intRange, int i, SelectableDates selectableDates, int i2, Object obj) {
        if ((i2 & 2) != 0) {
            l = null;
        }
        if ((i2 & 4) != 0) {
            l2 = l;
        }
        if ((i2 & 8) != 0) {
            intRange = DatePickerDefaults.INSTANCE.getYearRange();
        }
        if ((i2 & 16) != 0) {
            i = DisplayMode.Companion.m2119getPickerjFl4v0();
        }
        return m2077DatePickerStatesHin3Bw(locale, l, l2, intRange, i, (i2 & 32) != 0 ? DatePickerDefaults.INSTANCE.getAllDates() : selectableDates);
    }

    /* renamed from: DatePickerState-sHin3Bw  reason: not valid java name */
    public static final DatePickerState m2077DatePickerStatesHin3Bw(Locale locale, Long initialSelectedDateMillis, Long initialDisplayedMonthMillis, IntRange yearRange, int initialDisplayMode, SelectableDates selectableDates) {
        return new DatePickerStateImpl(initialSelectedDateMillis, initialDisplayedMonthMillis, yearRange, initialDisplayMode, selectableDates, locale, null);
    }

    /* renamed from: DateEntryContainer-au3_HiA  reason: not valid java name */
    public static final void m2075DateEntryContainerau3_HiA(final Modifier modifier, final Function2<? super Composer, ? super Integer, Unit> function2, final Function2<? super Composer, ? super Integer, Unit> function22, final Function2<? super Composer, ? super Integer, Unit> function23, final DatePickerColors colors, final TextStyle headlineTextStyle, final float headerMinHeight, final Function2<? super Composer, ? super Integer, Unit> function24, Composer $composer, final int $changed) {
        Modifier modifier2;
        Object obj;
        DatePickerColors datePickerColors;
        Object obj2;
        float f;
        Function0<ComposeUiNode> function0;
        Composer $composer2 = $composer.startRestartGroup(1507356255);
        ComposerKt.sourceInformation($composer2, "C(DateEntryContainer)P(6,7,3,5!1,4,2:c#ui.unit.Dp)1309@61230L1775:DatePicker.kt#uh7d8r");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            modifier2 = modifier;
            $dirty |= $composer2.changed(modifier2) ? 4 : 2;
        } else {
            modifier2 = modifier;
        }
        if (($changed & 48) == 0) {
            $dirty |= $composer2.changedInstance(function2) ? 32 : 16;
        }
        if (($changed & 384) == 0) {
            $dirty |= $composer2.changedInstance(function22) ? 256 : 128;
        }
        if (($changed & 3072) == 0) {
            obj = function23;
            $dirty |= $composer2.changedInstance(obj) ? 2048 : 1024;
        } else {
            obj = function23;
        }
        if (($changed & 24576) == 0) {
            datePickerColors = colors;
            $dirty |= $composer2.changed(datePickerColors) ? 16384 : 8192;
        } else {
            datePickerColors = colors;
        }
        if ((196608 & $changed) == 0) {
            obj2 = headlineTextStyle;
            $dirty |= $composer2.changed(obj2) ? 131072 : 65536;
        } else {
            obj2 = headlineTextStyle;
        }
        if ((1572864 & $changed) == 0) {
            f = headerMinHeight;
            $dirty |= $composer2.changed(f) ? 1048576 : 524288;
        } else {
            f = headerMinHeight;
        }
        if ((12582912 & $changed) == 0) {
            $dirty |= $composer2.changedInstance(function24) ? 8388608 : 4194304;
        }
        if ((4793491 & $dirty) != 4793490 || !$composer2.getSkipping()) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1507356255, $dirty, -1, "androidx.compose.material3.DateEntryContainer (DatePicker.kt:1308)");
            }
            Modifier modifier$iv = BackgroundKt.m502backgroundbw27NRU$default(SemanticsModifierKt.semantics$default(SizeKt.m1044sizeInqDBjuR0$default(modifier2, DatePickerModalTokens.INSTANCE.m3190getContainerWidthD9Ej5fM(), 0.0f, 0.0f, 0.0f, 14, null), false, new Function1<SemanticsPropertyReceiver, Unit>() { // from class: androidx.compose.material3.DatePickerKt$DateEntryContainer$1
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(SemanticsPropertyReceiver semanticsPropertyReceiver) {
                    invoke2(semanticsPropertyReceiver);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(SemanticsPropertyReceiver $this$semantics) {
                    SemanticsPropertiesKt.setContainer($this$semantics, true);
                }
            }, 1, null), datePickerColors.m2046getContainerColor0d7_KjU(), null, 2, null);
            ComposerKt.sourceInformationMarkerStart($composer2, -483455358, "CC(Column)P(2,3,1)85@4251L61,86@4317L133:Column.kt#2w3rfo");
            Arrangement.Vertical verticalArrangement$iv = Arrangement.INSTANCE.getTop();
            Alignment.Horizontal horizontalAlignment$iv = Alignment.Companion.getStart();
            MeasurePolicy measurePolicy$iv = ColumnKt.columnMeasurePolicy(verticalArrangement$iv, horizontalAlignment$iv, $composer2, ((0 >> 3) & 14) | ((0 >> 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS));
            int $changed$iv$iv = (0 << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS;
            ComposerKt.sourceInformationMarkerStart($composer2, -1323940314, "CC(Layout)P(!1,2)78@3182L23,81@3333L411:Layout.kt#80mrfh");
            int compositeKeyHash$iv$iv = ComposablesKt.getCurrentCompositeKeyHash($composer2, 0);
            CompositionLocalMap localMap$iv$iv = $composer2.getCurrentCompositionLocalMap();
            Modifier materialized$iv$iv = ComposedModifierKt.materializeModifier($composer2, modifier$iv);
            Function0<ComposeUiNode> constructor = ComposeUiNode.Companion.getConstructor();
            int $changed$iv$iv$iv = (($changed$iv$iv << 6) & 896) | 6;
            int $dirty2 = $dirty;
            ComposerKt.sourceInformationMarkerStart($composer2, -692256719, "CC(ReusableComposeNode)P(1,2)376@14062L9:Composables.kt#9igjgp");
            if (!($composer2.getApplier() instanceof Applier)) {
                ComposablesKt.invalidApplier();
            }
            $composer2.startReusableNode();
            if ($composer2.getInserting()) {
                function0 = constructor;
                $composer2.createNode(function0);
            } else {
                function0 = constructor;
                $composer2.useNode();
            }
            Composer $this$Layout_u24lambda_u240$iv$iv = Updater.m3731constructorimpl($composer2);
            Updater.m3738setimpl($this$Layout_u24lambda_u240$iv$iv, measurePolicy$iv, ComposeUiNode.Companion.getSetMeasurePolicy());
            Updater.m3738setimpl($this$Layout_u24lambda_u240$iv$iv, localMap$iv$iv, ComposeUiNode.Companion.getSetResolvedCompositionLocals());
            Function2 block$iv$iv$iv = ComposeUiNode.Companion.getSetCompositeKeyHash();
            if ($this$Layout_u24lambda_u240$iv$iv.getInserting() || !Intrinsics.areEqual($this$Layout_u24lambda_u240$iv$iv.rememberedValue(), Integer.valueOf(compositeKeyHash$iv$iv))) {
                $this$Layout_u24lambda_u240$iv$iv.updateRememberedValue(Integer.valueOf(compositeKeyHash$iv$iv));
                $this$Layout_u24lambda_u240$iv$iv.apply(Integer.valueOf(compositeKeyHash$iv$iv), block$iv$iv$iv);
            }
            Updater.m3738setimpl($this$Layout_u24lambda_u240$iv$iv, materialized$iv$iv, ComposeUiNode.Companion.getSetModifier());
            int i = ($changed$iv$iv$iv >> 6) & 14;
            ComposerKt.sourceInformationMarkerStart($composer2, -384862393, "C87@4365L9:Column.kt#2w3rfo");
            ColumnScopeInstance columnScopeInstance = ColumnScopeInstance.INSTANCE;
            int i2 = ((0 >> 6) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | 6;
            ComposerKt.sourceInformationMarkerStart($composer2, 133465402, "C1325@61799L1182,1319@61549L1432,1351@62990L9:DatePicker.kt#uh7d8r");
            final DatePickerColors datePickerColors2 = datePickerColors;
            final TextStyle textStyle = obj2;
            final Function2<? super Composer, ? super Integer, Unit> function25 = obj;
            m2076DatePickerHeaderpc5RIQQ(Modifier.Companion, function2, datePickerColors.m2065getTitleContentColor0d7_KjU(), datePickerColors.m2058getHeadlineContentColor0d7_KjU(), f, ComposableLambdaKt.rememberComposableLambda(-229007058, true, new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$DateEntryContainer$2$1
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

                /* JADX WARN: Removed duplicated region for block: B:31:0x015c  */
                /* JADX WARN: Removed duplicated region for block: B:32:0x0163  */
                /* JADX WARN: Removed duplicated region for block: B:35:0x01e0  */
                /* JADX WARN: Removed duplicated region for block: B:38:0x01ec  */
                /* JADX WARN: Removed duplicated region for block: B:39:0x01f2  */
                /* JADX WARN: Removed duplicated region for block: B:50:0x0296  */
                /* JADX WARN: Removed duplicated region for block: B:51:0x02b1  */
                /* JADX WARN: Removed duplicated region for block: B:55:0x02c6  */
                /* JADX WARN: Removed duplicated region for block: B:58:0x02f6 A[ADDED_TO_REGION] */
                /* JADX WARN: Removed duplicated region for block: B:65:0x0331  */
                /* JADX WARN: Removed duplicated region for block: B:68:? A[RETURN, SYNTHETIC] */
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final void invoke(androidx.compose.runtime.Composer r53, int r54) {
                    /*
                        Method dump skipped, instructions count: 821
                        To view this dump add '--comments-level debug' option
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.DatePickerKt$DateEntryContainer$2$1.invoke(androidx.compose.runtime.Composer, int):void");
                }
            }, $composer2, 54), $composer2, ($dirty2 & Property.BORDER_BOTTOM_RIGHT_RADIUS) | 196614 | (($dirty2 >> 6) & 57344));
            function24.invoke($composer2, Integer.valueOf(($dirty2 >> 21) & 14));
            ComposerKt.sourceInformationMarkerEnd($composer2);
            ComposerKt.sourceInformationMarkerEnd($composer2);
            $composer2.endNode();
            ComposerKt.sourceInformationMarkerEnd($composer2);
            ComposerKt.sourceInformationMarkerEnd($composer2);
            ComposerKt.sourceInformationMarkerEnd($composer2);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$DateEntryContainer$3
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

                public final void invoke(Composer composer, int i3) {
                    DatePickerKt.m2075DateEntryContainerau3_HiA(Modifier.this, function2, function22, function23, colors, headlineTextStyle, headerMinHeight, function24, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    /* renamed from: DisplayModeToggleButton-tER2X8s  reason: not valid java name */
    public static final void m2079DisplayModeToggleButtontER2X8s(Modifier modifier, final int displayMode, final Function1<? super DisplayMode, Unit> function1, Composer $composer, final int $changed) {
        boolean invalid$iv;
        Object value$iv;
        final Modifier modifier2;
        Object value$iv2;
        Composer $composer2 = $composer.startRestartGroup(1393846115);
        ComposerKt.sourceInformation($composer2, "C(DisplayModeToggleButton)P(1,0:c#material3.DisplayMode):DatePicker.kt#uh7d8r");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer2.changed(modifier) ? 4 : 2;
        }
        if (($changed & 48) == 0) {
            $dirty |= $composer2.changed(displayMode) ? 32 : 16;
        }
        if (($changed & 384) == 0) {
            $dirty |= $composer2.changedInstance(function1) ? 256 : 128;
        }
        if (($dirty & 147) != 146 || !$composer2.getSkipping()) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1393846115, $dirty, -1, "androidx.compose.material3.DisplayModeToggleButton (DatePicker.kt:1361)");
            }
            if (DisplayMode.m2114equalsimpl0(displayMode, DisplayMode.Companion.m2119getPickerjFl4v0())) {
                $composer2.startReplaceGroup(-411219388);
                ComposerKt.sourceInformation($composer2, "1363@63278L42,1363@63257L262");
                ComposerKt.sourceInformationMarkerStart($composer2, -428906382, "CC(remember):DatePicker.kt#9igjgp");
                invalid$iv = ($dirty & 896) == 256;
                Object it$iv = $composer2.rememberedValue();
                if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                    value$iv2 = (Function0) new Function0<Unit>() { // from class: androidx.compose.material3.DatePickerKt$DisplayModeToggleButton$1$1
                        /* JADX INFO: Access modifiers changed from: package-private */
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        /* JADX WARN: Multi-variable type inference failed */
                        {
                            super(0);
                        }

                        @Override // kotlin.jvm.functions.Function0
                        public /* bridge */ /* synthetic */ Unit invoke() {
                            invoke2();
                            return Unit.INSTANCE;
                        }

                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                        public final void invoke2() {
                            function1.invoke(DisplayMode.m2111boximpl(DisplayMode.Companion.m2118getInputjFl4v0()));
                        }
                    };
                    $composer2.updateRememberedValue(value$iv2);
                } else {
                    value$iv2 = it$iv;
                }
                ComposerKt.sourceInformationMarkerEnd($composer2);
                modifier2 = modifier;
                IconButtonKt.IconButton((Function0) value$iv2, modifier2, false, null, null, ComposableSingletons$DatePickerKt.INSTANCE.m2010getLambda1$material3_release(), $composer2, (($dirty << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 28);
                $composer2.endReplaceGroup();
            } else {
                $composer2.startReplaceGroup(-410937381);
                ComposerKt.sourceInformation($composer2, "1370@63562L43,1370@63541L271");
                ComposerKt.sourceInformationMarkerStart($composer2, -428897293, "CC(remember):DatePicker.kt#9igjgp");
                invalid$iv = ($dirty & 896) == 256;
                Object it$iv2 = $composer2.rememberedValue();
                if (invalid$iv || it$iv2 == Composer.Companion.getEmpty()) {
                    value$iv = (Function0) new Function0<Unit>() { // from class: androidx.compose.material3.DatePickerKt$DisplayModeToggleButton$2$1
                        /* JADX INFO: Access modifiers changed from: package-private */
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        /* JADX WARN: Multi-variable type inference failed */
                        {
                            super(0);
                        }

                        @Override // kotlin.jvm.functions.Function0
                        public /* bridge */ /* synthetic */ Unit invoke() {
                            invoke2();
                            return Unit.INSTANCE;
                        }

                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                        public final void invoke2() {
                            function1.invoke(DisplayMode.m2111boximpl(DisplayMode.Companion.m2119getPickerjFl4v0()));
                        }
                    };
                    $composer2.updateRememberedValue(value$iv);
                } else {
                    value$iv = it$iv2;
                }
                ComposerKt.sourceInformationMarkerEnd($composer2);
                modifier2 = modifier;
                IconButtonKt.IconButton((Function0) value$iv, modifier2, false, null, null, ComposableSingletons$DatePickerKt.INSTANCE.m2011getLambda2$material3_release(), $composer2, (($dirty << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 28);
                $composer2.endReplaceGroup();
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
            modifier2 = modifier;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$DisplayModeToggleButton$3
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

                public final void invoke(Composer composer, int i) {
                    DatePickerKt.m2079DisplayModeToggleButtontER2X8s(Modifier.this, displayMode, function1, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: SwitchableDateEntryContent-d7iavvg  reason: not valid java name */
    public static final void m2080SwitchableDateEntryContentd7iavvg(final Long selectedDateMillis, final long displayedMonthMillis, int displayMode, final Function1<? super Long, Unit> function1, final Function1<? super Long, Unit> function12, final CalendarModel calendarModel, final IntRange yearRange, final DatePickerFormatter dateFormatter, final SelectableDates selectableDates, final DatePickerColors colors, Composer $composer, final int $changed) {
        int i;
        Object obj;
        Object obj2;
        Object obj3;
        Object obj4;
        Object obj5;
        Object obj6;
        Function1 function13;
        Composer $composer2;
        Composer $composer3 = $composer.startRestartGroup(-895379221);
        ComposerKt.sourceInformation($composer3, "C(SwitchableDateEntryContent)P(8,4,3:c#material3.DisplayMode,5,6!1,9,2,7)*1399@64608L7,1407@64864L2301,1451@67222L1081,1400@64644L3659:DatePicker.kt#uh7d8r");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer3.changed(selectedDateMillis) ? 4 : 2;
        }
        if (($changed & 48) == 0) {
            $dirty |= $composer3.changed(displayedMonthMillis) ? 32 : 16;
        }
        if (($changed & 384) == 0) {
            i = displayMode;
            $dirty |= $composer3.changed(i) ? 256 : 128;
        } else {
            i = displayMode;
        }
        if (($changed & 3072) == 0) {
            obj = function1;
            $dirty |= $composer3.changedInstance(obj) ? 2048 : 1024;
        } else {
            obj = function1;
        }
        if (($changed & 24576) == 0) {
            obj2 = function12;
            $dirty |= $composer3.changedInstance(obj2) ? 16384 : 8192;
        } else {
            obj2 = function12;
        }
        if ((196608 & $changed) == 0) {
            obj3 = calendarModel;
            $dirty |= $composer3.changedInstance(obj3) ? 131072 : 65536;
        } else {
            obj3 = calendarModel;
        }
        if ((1572864 & $changed) == 0) {
            obj4 = yearRange;
            $dirty |= $composer3.changedInstance(obj4) ? 1048576 : 524288;
        } else {
            obj4 = yearRange;
        }
        if ((12582912 & $changed) == 0) {
            $dirty |= (16777216 & $changed) == 0 ? $composer3.changed(dateFormatter) : $composer3.changedInstance(dateFormatter) ? 8388608 : 4194304;
        }
        if ((100663296 & $changed) == 0) {
            obj5 = selectableDates;
            $dirty |= $composer3.changed(obj5) ? 67108864 : 33554432;
        } else {
            obj5 = selectableDates;
        }
        if ((805306368 & $changed) == 0) {
            obj6 = colors;
            $dirty |= $composer3.changed(obj6) ? PropertyOptions.DELETE_EXISTING : 268435456;
        } else {
            obj6 = colors;
        }
        int $dirty2 = $dirty;
        if ((306783379 & $dirty2) == 306783378 && $composer3.getSkipping()) {
            $composer3.skipToGroupEnd();
            $composer2 = $composer3;
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-895379221, $dirty2, -1, "androidx.compose.material3.SwitchableDateEntryContent (DatePicker.kt:1396)");
            }
            ComposerKt.sourceInformationMarkerStart($composer3, 2023513938, "CC:CompositionLocal.kt#9igjgp");
            Object consume = $composer3.consume(CompositionLocalsKt.getLocalDensity());
            ComposerKt.sourceInformationMarkerEnd($composer3);
            Density $this$SwitchableDateEntryContent_d7iavvg_u24lambda_u247 = (Density) consume;
            final int parallaxTarget = -$this$SwitchableDateEntryContent_d7iavvg_u24lambda_u247.mo638roundToPx0680j_4(Dp.m6873constructorimpl(48));
            DisplayMode m2111boximpl = DisplayMode.m2111boximpl(i);
            Modifier semantics$default = SemanticsModifierKt.semantics$default(Modifier.Companion, false, new Function1<SemanticsPropertyReceiver, Unit>() { // from class: androidx.compose.material3.DatePickerKt$SwitchableDateEntryContent$1
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(SemanticsPropertyReceiver semanticsPropertyReceiver) {
                    invoke2(semanticsPropertyReceiver);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(SemanticsPropertyReceiver $this$semantics) {
                    SemanticsPropertiesKt.setContainer($this$semantics, true);
                }
            }, 1, null);
            ComposerKt.sourceInformationMarkerStart($composer3, -742566717, "CC(remember):DatePicker.kt#9igjgp");
            boolean invalid$iv = $composer3.changed(parallaxTarget);
            Object it$iv = $composer3.rememberedValue();
            if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                function13 = new Function1<AnimatedContentTransitionScope<DisplayMode>, ContentTransform>() { // from class: androidx.compose.material3.DatePickerKt$SwitchableDateEntryContent$2$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public final ContentTransform invoke(AnimatedContentTransitionScope<DisplayMode> animatedContentTransitionScope) {
                        ContentTransform contentTransform;
                        if (DisplayMode.m2114equalsimpl0(animatedContentTransitionScope.getTargetState().m2117unboximpl(), DisplayMode.Companion.m2118getInputjFl4v0())) {
                            EnterTransition plus = EnterExitTransitionKt.slideInVertically$default(null, new Function1<Integer, Integer>() { // from class: androidx.compose.material3.DatePickerKt$SwitchableDateEntryContent$2$1.1
                                public final Integer invoke(int height) {
                                    return Integer.valueOf(height);
                                }

                                @Override // kotlin.jvm.functions.Function1
                                public /* bridge */ /* synthetic */ Integer invoke(Integer num) {
                                    return invoke(num.intValue());
                                }
                            }, 1, null).plus(EnterExitTransitionKt.fadeIn$default(AnimationSpecKt.tween$default(100, 100, null, 4, null), 0.0f, 2, null));
                            ExitTransition fadeOut$default = EnterExitTransitionKt.fadeOut$default(AnimationSpecKt.tween$default(100, 0, null, 6, null), 0.0f, 2, null);
                            final int i2 = parallaxTarget;
                            contentTransform = AnimatedContentKt.togetherWith(plus, fadeOut$default.plus(EnterExitTransitionKt.slideOutVertically$default(null, new Function1<Integer, Integer>() { // from class: androidx.compose.material3.DatePickerKt$SwitchableDateEntryContent$2$1.2
                                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                {
                                    super(1);
                                }

                                public final Integer invoke(int i3) {
                                    return Integer.valueOf(i2);
                                }

                                @Override // kotlin.jvm.functions.Function1
                                public /* bridge */ /* synthetic */ Integer invoke(Integer num) {
                                    return invoke(num.intValue());
                                }
                            }, 1, null)));
                        } else {
                            final int i3 = parallaxTarget;
                            contentTransform = AnimatedContentKt.togetherWith(EnterExitTransitionKt.slideInVertically(AnimationSpecKt.tween$default(0, 50, null, 5, null), new Function1<Integer, Integer>() { // from class: androidx.compose.material3.DatePickerKt$SwitchableDateEntryContent$2$1.3
                                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                {
                                    super(1);
                                }

                                @Override // kotlin.jvm.functions.Function1
                                public /* bridge */ /* synthetic */ Integer invoke(Integer num) {
                                    return invoke(num.intValue());
                                }

                                public final Integer invoke(int i4) {
                                    return Integer.valueOf(i3);
                                }
                            }).plus(EnterExitTransitionKt.fadeIn$default(AnimationSpecKt.tween$default(100, 100, null, 4, null), 0.0f, 2, null)), EnterExitTransitionKt.slideOutVertically$default(null, new Function1<Integer, Integer>() { // from class: androidx.compose.material3.DatePickerKt$SwitchableDateEntryContent$2$1.4
                                public final Integer invoke(int fullHeight) {
                                    return Integer.valueOf(fullHeight);
                                }

                                @Override // kotlin.jvm.functions.Function1
                                public /* bridge */ /* synthetic */ Integer invoke(Integer num) {
                                    return invoke(num.intValue());
                                }
                            }, 1, null).plus(EnterExitTransitionKt.fadeOut$default(AnimationSpecKt.tween$default(100, 0, null, 6, null), 0.0f, 2, null)));
                        }
                        return animatedContentTransitionScope.using(contentTransform, AnimatedContentKt.SizeTransform(true, new Function2<IntSize, IntSize, FiniteAnimationSpec<IntSize>>() { // from class: androidx.compose.material3.DatePickerKt$SwitchableDateEntryContent$2$1.5
                            @Override // kotlin.jvm.functions.Function2
                            public /* bridge */ /* synthetic */ FiniteAnimationSpec<IntSize> invoke(IntSize intSize, IntSize intSize2) {
                                return m2084invokeTemP2vQ(intSize.m7048unboximpl(), intSize2.m7048unboximpl());
                            }

                            /* renamed from: invoke-TemP2vQ  reason: not valid java name */
                            public final FiniteAnimationSpec<IntSize> m2084invokeTemP2vQ(long j, long j2) {
                                return AnimationSpecKt.tween$default(FontWeights.MEDIUM, 0, MotionTokens.INSTANCE.getEasingEmphasizedDecelerateCubicBezier(), 2, null);
                            }
                        }));
                    }
                };
                $composer3.updateRememberedValue(function13);
            } else {
                function13 = it$iv;
            }
            ComposerKt.sourceInformationMarkerEnd($composer3);
            final Function1<? super Long, Unit> function14 = obj;
            final Function1<? super Long, Unit> function15 = obj2;
            final CalendarModel calendarModel2 = obj3;
            final IntRange intRange = obj4;
            final SelectableDates selectableDates2 = obj5;
            final DatePickerColors datePickerColors = obj6;
            AnimatedContentKt.AnimatedContent(m2111boximpl, semantics$default, function13, null, "DatePickerDisplayModeAnimation", null, ComposableLambdaKt.rememberComposableLambda(-459778869, true, new Function4<AnimatedContentScope, DisplayMode, Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$SwitchableDateEntryContent$3
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(4);
                }

                @Override // kotlin.jvm.functions.Function4
                public /* bridge */ /* synthetic */ Unit invoke(AnimatedContentScope animatedContentScope, DisplayMode displayMode2, Composer composer, Integer num) {
                    m2085invokefYndouo(animatedContentScope, displayMode2.m2117unboximpl(), composer, num.intValue());
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke-fYndouo  reason: not valid java name */
                public final void m2085invokefYndouo(AnimatedContentScope $this$AnimatedContent, int mode, Composer $composer4, int $changed2) {
                    ComposerKt.sourceInformation($composer4, "CP(0:c#material3.DisplayMode):DatePicker.kt#uh7d8r");
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventStart(-459778869, $changed2, -1, "androidx.compose.material3.SwitchableDateEntryContent.<anonymous> (DatePicker.kt:1452)");
                    }
                    if (DisplayMode.m2114equalsimpl0(mode, DisplayMode.Companion.m2119getPickerjFl4v0())) {
                        $composer4.startReplaceGroup(-1870116901);
                        ComposerKt.sourceInformation($composer4, "1454@67304L534");
                        DatePickerKt.DatePickerContent(selectedDateMillis, displayedMonthMillis, function14, function15, calendarModel2, intRange, dateFormatter, selectableDates2, datePickerColors, $composer4, 0);
                        $composer4.endReplaceGroup();
                    } else if (DisplayMode.m2114equalsimpl0(mode, DisplayMode.Companion.m2118getInputjFl4v0())) {
                        $composer4.startReplaceGroup(-1870098348);
                        ComposerKt.sourceInformation($composer4, "1466@67888L399");
                        DateInputKt.DateInputContent(selectedDateMillis, function14, calendarModel2, intRange, dateFormatter, selectableDates2, datePickerColors, $composer4, 0);
                        $composer4.endReplaceGroup();
                    } else {
                        $composer4.startReplaceGroup(-2138080579);
                        $composer4.endReplaceGroup();
                    }
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventEnd();
                    }
                }
            }, $composer3, 54), $composer3, (($dirty2 >> 6) & 14) | 1597440, 40);
            $composer2 = $composer3;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            final int i2 = i;
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$SwitchableDateEntryContent$4
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

                public final void invoke(Composer composer, int i3) {
                    DatePickerKt.m2080SwitchableDateEntryContentd7iavvg(selectedDateMillis, displayedMonthMillis, i2, function1, function12, calendarModel, yearRange, dateFormatter, selectableDates, colors, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:109:0x0313  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x037c  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x038c A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:128:0x03bd  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x03cb  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x046e  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x047a  */
    /* JADX WARN: Removed duplicated region for block: B:140:0x047e  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x04ad  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x04c1  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x0578  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x0584  */
    /* JADX WARN: Removed duplicated region for block: B:155:0x058a  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x05bb  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x05d1  */
    /* JADX WARN: Removed duplicated region for block: B:166:0x0747  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void DatePickerContent(final java.lang.Long r82, final long r83, final kotlin.jvm.functions.Function1<? super java.lang.Long, kotlin.Unit> r85, final kotlin.jvm.functions.Function1<? super java.lang.Long, kotlin.Unit> r86, final androidx.compose.material3.internal.CalendarModel r87, final kotlin.ranges.IntRange r88, final androidx.compose.material3.DatePickerFormatter r89, final androidx.compose.material3.SelectableDates r90, final androidx.compose.material3.DatePickerColors r91, androidx.compose.runtime.Composer r92, final int r93) {
        /*
            Method dump skipped, instructions count: 1903
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.DatePickerKt.DatePickerContent(java.lang.Long, long, kotlin.jvm.functions.Function1, kotlin.jvm.functions.Function1, androidx.compose.material3.internal.CalendarModel, kotlin.ranges.IntRange, androidx.compose.material3.DatePickerFormatter, androidx.compose.material3.SelectableDates, androidx.compose.material3.DatePickerColors, androidx.compose.runtime.Composer, int):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean DatePickerContent$lambda$10(MutableState<Boolean> mutableState) {
        MutableState<Boolean> $this$getValue$iv = mutableState;
        return $this$getValue$iv.getValue().booleanValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void DatePickerContent$lambda$11(MutableState<Boolean> mutableState, boolean value) {
        mutableState.setValue(Boolean.valueOf(value));
    }

    /* JADX WARN: Removed duplicated region for block: B:76:0x01e4  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x021b  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0255  */
    /* renamed from: DatePickerHeader-pc5RIQQ  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void m2076DatePickerHeaderpc5RIQQ(final androidx.compose.ui.Modifier r35, final kotlin.jvm.functions.Function2<? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r36, final long r37, final long r39, final float r41, final kotlin.jvm.functions.Function2<? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r42, androidx.compose.runtime.Composer r43, final int r44) {
        /*
            Method dump skipped, instructions count: 625
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.DatePickerKt.m2076DatePickerHeaderpc5RIQQ(androidx.compose.ui.Modifier, kotlin.jvm.functions.Function2, long, long, float, kotlin.jvm.functions.Function2, androidx.compose.runtime.Composer, int):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void HorizontalMonthsList(final LazyListState lazyListState, final Long selectedDateMillis, final Function1<? super Long, Unit> function1, final Function1<? super Long, Unit> function12, final CalendarModel calendarModel, final IntRange yearRange, final DatePickerFormatter dateFormatter, final SelectableDates selectableDates, final DatePickerColors colors, Composer $composer, final int $changed) {
        final Function1<? super Long, Unit> function13;
        Object obj;
        Object obj2;
        Object obj3;
        CalendarDate today;
        Object value$iv;
        Object value$iv2;
        final LazyListState lazyListState2 = lazyListState;
        Composer $composer2 = $composer.startRestartGroup(-1994757941);
        ComposerKt.sourceInformation($composer2, "C(HorizontalMonthsList)P(3,7,4,5!1,8,2,6)1659@76284L158,1665@76504L5,1665@76511L1365,1665@76447L1429,1696@77912L228,1696@77882L258:DatePicker.kt#uh7d8r");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer2.changed(lazyListState2) ? 4 : 2;
        }
        if (($changed & 48) == 0) {
            $dirty |= $composer2.changed(selectedDateMillis) ? 32 : 16;
        }
        if (($changed & 384) == 0) {
            function13 = function1;
            $dirty |= $composer2.changedInstance(function13) ? 256 : 128;
        } else {
            function13 = function1;
        }
        if (($changed & 3072) == 0) {
            obj = function12;
            $dirty |= $composer2.changedInstance(obj) ? 2048 : 1024;
        } else {
            obj = function12;
        }
        if (($changed & 24576) == 0) {
            $dirty |= $composer2.changedInstance(calendarModel) ? 16384 : 8192;
        }
        if ((196608 & $changed) == 0) {
            $dirty |= $composer2.changedInstance(yearRange) ? 131072 : 65536;
        }
        if ((1572864 & $changed) == 0) {
            $dirty |= (2097152 & $changed) == 0 ? $composer2.changed(dateFormatter) : $composer2.changedInstance(dateFormatter) ? 1048576 : 524288;
        }
        if ((12582912 & $changed) == 0) {
            obj2 = selectableDates;
            $dirty |= $composer2.changed(obj2) ? 8388608 : 4194304;
        } else {
            obj2 = selectableDates;
        }
        if ((100663296 & $changed) == 0) {
            obj3 = colors;
            $dirty |= $composer2.changed(obj3) ? 67108864 : 33554432;
        } else {
            obj3 = colors;
        }
        if ((38347923 & $dirty) != 38347922 || !$composer2.getSkipping()) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1994757941, $dirty, -1, "androidx.compose.material3.HorizontalMonthsList (DatePicker.kt:1656)");
            }
            CalendarDate today2 = calendarModel.getToday();
            ComposerKt.sourceInformationMarkerStart($composer2, -1217520394, "CC(remember):DatePicker.kt#9igjgp");
            boolean invalid$iv = $composer2.changed(yearRange);
            Object it$iv = $composer2.rememberedValue();
            if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                today = today2;
                value$iv = calendarModel.getMonth(yearRange.getFirst(), 1);
                $composer2.updateRememberedValue(value$iv);
            } else {
                today = today2;
                value$iv = it$iv;
            }
            final CalendarMonth firstMonth = (CalendarMonth) value$iv;
            ComposerKt.sourceInformationMarkerEnd($composer2);
            int $dirty2 = $dirty;
            final DatePickerColors datePickerColors = obj3;
            final CalendarDate today3 = today;
            final SelectableDates selectableDates2 = obj2;
            TextKt.ProvideTextStyle(TypographyKt.getValue(DatePickerModalTokens.INSTANCE.getDateLabelTextFont(), $composer2, 6), ComposableLambdaKt.rememberComposableLambda(1504086906, true, new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$HorizontalMonthsList$1
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

                /* JADX WARN: Removed duplicated region for block: B:21:0x00fb  */
                /* JADX WARN: Removed duplicated region for block: B:24:? A[RETURN, SYNTHETIC] */
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final void invoke(androidx.compose.runtime.Composer r29, int r30) {
                    /*
                        Method dump skipped, instructions count: 255
                        To view this dump add '--comments-level debug' option
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.DatePickerKt$HorizontalMonthsList$1.invoke(androidx.compose.runtime.Composer, int):void");
                }
            }, $composer2, 54), $composer2, 48);
            ComposerKt.sourceInformationMarkerStart($composer2, -1217468228, "CC(remember):DatePicker.kt#9igjgp");
            boolean invalid$iv2 = (($dirty2 & 14) == 4) | (($dirty2 & 7168) == 2048) | $composer2.changedInstance(calendarModel) | $composer2.changedInstance(yearRange);
            Object it$iv2 = $composer2.rememberedValue();
            if (invalid$iv2 || it$iv2 == Composer.Companion.getEmpty()) {
                lazyListState2 = lazyListState;
                value$iv2 = (Function2) new DatePickerKt$HorizontalMonthsList$2$1(lazyListState2, obj, calendarModel, yearRange, null);
                $composer2.updateRememberedValue(value$iv2);
            } else {
                lazyListState2 = lazyListState;
                value$iv2 = it$iv2;
            }
            ComposerKt.sourceInformationMarkerEnd($composer2);
            EffectsKt.LaunchedEffect(lazyListState2, (Function2) value$iv2, $composer2, $dirty2 & 14);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$HorizontalMonthsList$3
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

                public final void invoke(Composer composer, int i) {
                    DatePickerKt.HorizontalMonthsList(LazyListState.this, selectedDateMillis, function1, function12, calendarModel, yearRange, dateFormatter, selectableDates, colors, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    public static final Object updateDisplayedMonth(final LazyListState lazyListState, final Function1<? super Long, Unit> function1, final CalendarModel calendarModel, final IntRange yearRange, Continuation<? super Unit> continuation) {
        Object collect = SnapshotStateKt.snapshotFlow(new Function0<Integer>() { // from class: androidx.compose.material3.DatePickerKt$updateDisplayedMonth$2
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Integer invoke() {
                return Integer.valueOf(LazyListState.this.getFirstVisibleItemIndex());
            }
        }).collect(new FlowCollector() { // from class: androidx.compose.material3.DatePickerKt$updateDisplayedMonth$3
            @Override // kotlinx.coroutines.flow.FlowCollector
            public /* bridge */ /* synthetic */ Object emit(Object value, Continuation $completion) {
                return emit(((Number) value).intValue(), $completion);
            }

            public final Object emit(int it, Continuation<? super Unit> continuation2) {
                int yearOffset = LazyListState.this.getFirstVisibleItemIndex() / 12;
                int month = (LazyListState.this.getFirstVisibleItemIndex() % 12) + 1;
                function1.invoke(Boxing.boxLong(calendarModel.getMonth(yearRange.getFirst() + yearOffset, month).getStartUtcTimeMillis()));
                return Unit.INSTANCE;
            }
        }, continuation);
        return collect == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? collect : Unit.INSTANCE;
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x01d3  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0293  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x029f  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x02a5  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x041c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void WeekDays(final androidx.compose.material3.DatePickerColors r87, final androidx.compose.material3.internal.CalendarModel r88, androidx.compose.runtime.Composer r89, final int r90) {
        /*
            Method dump skipped, instructions count: 1072
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.DatePickerKt.WeekDays(androidx.compose.material3.DatePickerColors, androidx.compose.material3.internal.CalendarModel, androidx.compose.runtime.Composer, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:116:0x02ab  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x03e3  */
    /* JADX WARN: Removed duplicated region for block: B:211:0x059b  */
    /* JADX WARN: Removed duplicated region for block: B:212:0x059d  */
    /* JADX WARN: Removed duplicated region for block: B:215:0x05ac  */
    /* JADX WARN: Removed duplicated region for block: B:219:0x05bc  */
    /* JADX WARN: Removed duplicated region for block: B:229:0x05f8  */
    /* JADX WARN: Removed duplicated region for block: B:230:0x0610  */
    /* JADX WARN: Removed duplicated region for block: B:238:0x0740  */
    /* JADX WARN: Removed duplicated region for block: B:243:0x0712 A[EDGE_INSN: B:243:0x0712->B:236:0x0712 ?: BREAK  , SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void Month(final androidx.compose.material3.internal.CalendarMonth r86, final kotlin.jvm.functions.Function1<? super java.lang.Long, kotlin.Unit> r87, final long r88, final java.lang.Long r90, final java.lang.Long r91, final androidx.compose.material3.SelectedRangeInfo r92, final androidx.compose.material3.DatePickerFormatter r93, final androidx.compose.material3.SelectableDates r94, final androidx.compose.material3.DatePickerColors r95, androidx.compose.runtime.Composer r96, final int r97) {
        /*
            Method dump skipped, instructions count: 1896
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.DatePickerKt.Month(androidx.compose.material3.internal.CalendarMonth, kotlin.jvm.functions.Function1, long, java.lang.Long, java.lang.Long, androidx.compose.material3.SelectedRangeInfo, androidx.compose.material3.DatePickerFormatter, androidx.compose.material3.SelectableDates, androidx.compose.material3.DatePickerColors, androidx.compose.runtime.Composer, int):void");
    }

    public static final int numberOfMonthsInRange(IntRange yearRange) {
        return ((yearRange.getLast() - yearRange.getFirst()) + 1) * 12;
    }

    private static final String dayContentDescription(boolean rangeSelectionEnabled, boolean isToday, boolean isStartDate, boolean isEndDate, boolean isInRange, Composer $composer, int $changed) {
        boolean z;
        ComposerKt.sourceInformationMarkerStart($composer, 502032503, "C(dayContentDescription)P(4,3,2):DatePicker.kt#uh7d8r");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(502032503, $changed, -1, "androidx.compose.material3.dayContentDescription (DatePicker.kt:1909)");
        }
        StringBuilder descriptionBuilder = new StringBuilder();
        $composer.startReplaceGroup(-647730741);
        ComposerKt.sourceInformation($composer, "");
        boolean z2 = false;
        if (rangeSelectionEnabled) {
            if (isStartDate) {
                $composer.startReplaceGroup(-647727716);
                ComposerKt.sourceInformation($composer, "1914@87077L56");
                Strings.Companion companion = Strings.Companion;
                descriptionBuilder.append(Strings_androidKt.m3024getString2EP1pXo(Strings.m2954constructorimpl(R.string.m3c_date_range_picker_start_headline), $composer, 0));
                $composer.endReplaceGroup();
            } else if (isEndDate) {
                $composer.startReplaceGroup(-647723718);
                ComposerKt.sourceInformation($composer, "1916@87202L54");
                Strings.Companion companion2 = Strings.Companion;
                descriptionBuilder.append(Strings_androidKt.m3024getString2EP1pXo(Strings.m2954constructorimpl(R.string.m3c_date_range_picker_end_headline), $composer, 0));
                $composer.endReplaceGroup();
            } else if (isInRange) {
                $composer.startReplaceGroup(-647719783);
                ComposerKt.sourceInformation($composer, "1918@87325L53");
                Strings.Companion companion3 = Strings.Companion;
                descriptionBuilder.append(Strings_androidKt.m3024getString2EP1pXo(Strings.m2954constructorimpl(R.string.m3c_date_range_picker_day_in_range), $composer, 0));
                $composer.endReplaceGroup();
            } else {
                $composer.startReplaceGroup(1395591750);
                $composer.endReplaceGroup();
            }
        }
        $composer.endReplaceGroup();
        $composer.startReplaceGroup(-647717033);
        ComposerKt.sourceInformation($composer, "1923@87526L54");
        if (isToday) {
            if (descriptionBuilder.length() <= 0) {
                z = false;
            } else {
                z = true;
            }
            if (z) {
                descriptionBuilder.append(", ");
            }
            Strings.Companion companion4 = Strings.Companion;
            descriptionBuilder.append(Strings_androidKt.m3024getString2EP1pXo(Strings.m2954constructorimpl(R.string.m3c_date_picker_today_description), $composer, 0));
        }
        $composer.endReplaceGroup();
        if (descriptionBuilder.length() == 0) {
            z2 = true;
        }
        String sb = z2 ? null : descriptionBuilder.toString();
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return sb;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void Day(final Modifier modifier, final boolean selected, final Function0<Unit> function0, final boolean animateChecked, final boolean enabled, final boolean today, final boolean inRange, final String description, final DatePickerColors colors, final Function2<? super Composer, ? super Integer, Unit> function2, Composer $composer, final int $changed) {
        boolean z;
        boolean z2;
        boolean z3;
        DatePickerColors datePickerColors;
        Object value$iv;
        BorderStroke borderStroke;
        Composer $composer2;
        Composer $composer3 = $composer.startRestartGroup(-1434777861);
        ComposerKt.sourceInformation($composer3, "C(Day)P(6,8,7!1,4,9,5,3)1951@88438L114,1956@88638L5,1959@88697L83,1963@88864L190,1979@89366L319,1942@88009L1676:DatePicker.kt#uh7d8r");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer3.changed(modifier) ? 4 : 2;
        }
        if (($changed & 48) == 0) {
            $dirty |= $composer3.changed(selected) ? 32 : 16;
        }
        if (($changed & 384) == 0) {
            $dirty |= $composer3.changedInstance(function0) ? 256 : 128;
        }
        if (($changed & 3072) == 0) {
            z = animateChecked;
            $dirty |= $composer3.changed(z) ? 2048 : 1024;
        } else {
            z = animateChecked;
        }
        if (($changed & 24576) == 0) {
            z2 = enabled;
            $dirty |= $composer3.changed(z2) ? 16384 : 8192;
        } else {
            z2 = enabled;
        }
        if ((196608 & $changed) == 0) {
            $dirty |= $composer3.changed(today) ? 131072 : 65536;
        }
        if ((1572864 & $changed) == 0) {
            z3 = inRange;
            $dirty |= $composer3.changed(z3) ? 1048576 : 524288;
        } else {
            z3 = inRange;
        }
        if ((12582912 & $changed) == 0) {
            $dirty |= $composer3.changed(description) ? 8388608 : 4194304;
        }
        if ((100663296 & $changed) == 0) {
            datePickerColors = colors;
            $dirty |= $composer3.changed(datePickerColors) ? 67108864 : 33554432;
        } else {
            datePickerColors = colors;
        }
        if ((805306368 & $changed) == 0) {
            $dirty |= $composer3.changedInstance(function2) ? PropertyOptions.DELETE_EXISTING : 268435456;
        }
        int $dirty2 = $dirty;
        if ((306783379 & $dirty2) != 306783378 || !$composer3.getSkipping()) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1434777861, $dirty2, -1, "androidx.compose.material3.Day (DatePicker.kt:1941)");
            }
            ComposerKt.sourceInformationMarkerStart($composer3, 67509195, "CC(remember):DatePicker.kt#9igjgp");
            boolean invalid$iv = (29360128 & $dirty2) == 8388608;
            Object it$iv = $composer3.rememberedValue();
            if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                value$iv = (Function1) new Function1<SemanticsPropertyReceiver, Unit>() { // from class: androidx.compose.material3.DatePickerKt$Day$1$1
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
                        SemanticsPropertiesKt.setText($this$semantics, new AnnotatedString(description, null, null, 6, null));
                        SemanticsPropertiesKt.m6122setRolekuIjeqM($this$semantics, Role.Companion.m6103getButtono7Vup1c());
                    }
                };
                $composer3.updateRememberedValue(value$iv);
            } else {
                value$iv = it$iv;
            }
            ComposerKt.sourceInformationMarkerEnd($composer3);
            Modifier semantics = SemanticsModifierKt.semantics(modifier, true, (Function1) value$iv);
            Shape value = ShapesKt.getValue(DatePickerModalTokens.INSTANCE.getDateContainerShape(), $composer3, 6);
            long m4299unboximpl = datePickerColors.dayContainerColor$material3_release(selected, z2, z, $composer3, (($dirty2 >> 3) & 14) | (($dirty2 >> 9) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | (($dirty2 >> 3) & 896) | (($dirty2 >> 15) & 7168)).getValue().m4299unboximpl();
            long m4299unboximpl2 = colors.dayContentColor$material3_release(today, selected, z3, enabled, $composer3, (($dirty2 >> 15) & 14) | ($dirty2 & Property.BORDER_BOTTOM_RIGHT_RADIUS) | (($dirty2 >> 12) & 896) | (($dirty2 >> 3) & 7168) | (57344 & ($dirty2 >> 12))).getValue().m4299unboximpl();
            if (today && !selected) {
                borderStroke = BorderStrokeKt.m529BorderStrokecXLIe8U(DatePickerModalTokens.INSTANCE.m3195getDateTodayContainerOutlineWidthD9Ej5fM(), colors.m2067getTodayDateBorderColor0d7_KjU());
            } else {
                borderStroke = null;
            }
            $composer2 = $composer3;
            SurfaceKt.m2594Surfaced85dljk(selected, function0, semantics, enabled, value, m4299unboximpl, m4299unboximpl2, 0.0f, 0.0f, borderStroke, (MutableInteractionSource) null, ComposableLambdaKt.rememberComposableLambda(-2031780827, true, new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$Day$2
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

                /* JADX WARN: Removed duplicated region for block: B:28:0x0164  */
                /* JADX WARN: Removed duplicated region for block: B:31:? A[RETURN, SYNTHETIC] */
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final void invoke(androidx.compose.runtime.Composer r28, int r29) {
                    /*
                        Method dump skipped, instructions count: 360
                        To view this dump add '--comments-level debug' option
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.DatePickerKt$Day$2.invoke(androidx.compose.runtime.Composer, int):void");
                }
            }, $composer3, 54), $composer2, (($dirty2 >> 3) & 14) | (($dirty2 >> 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | (($dirty2 >> 3) & 7168), 48, 1408);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer3.skipToGroupEnd();
            $composer2 = $composer3;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$Day$3
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

                public final void invoke(Composer composer, int i) {
                    DatePickerKt.Day(Modifier.this, selected, function0, animateChecked, enabled, today, inRange, description, colors, function2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void YearPicker(final Modifier modifier, final long displayedMonthMillis, final Function1<? super Integer, Unit> function1, final SelectableDates selectableDates, final CalendarModel calendarModel, final IntRange yearRange, final DatePickerColors colors, Composer $composer, final int $changed) {
        Object obj;
        final long j;
        Object obj2;
        Object obj3;
        Object obj4;
        Object obj5;
        Object obj6;
        Composer $composer2 = $composer.startRestartGroup(-1286899812);
        ComposerKt.sourceInformation($composer2, "C(YearPicker)P(3,2,4,5!1,6)2004@90070L5,2004@90077L4227,2004@89996L4308:DatePicker.kt#uh7d8r");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            obj = modifier;
            $dirty |= $composer2.changed(obj) ? 4 : 2;
        } else {
            obj = modifier;
        }
        if (($changed & 48) == 0) {
            j = displayedMonthMillis;
            $dirty |= $composer2.changed(j) ? 32 : 16;
        } else {
            j = displayedMonthMillis;
        }
        if (($changed & 384) == 0) {
            obj2 = function1;
            $dirty |= $composer2.changedInstance(obj2) ? 256 : 128;
        } else {
            obj2 = function1;
        }
        if (($changed & 3072) == 0) {
            obj3 = selectableDates;
            $dirty |= $composer2.changed(obj3) ? 2048 : 1024;
        } else {
            obj3 = selectableDates;
        }
        if (($changed & 24576) == 0) {
            obj4 = calendarModel;
            $dirty |= $composer2.changedInstance(obj4) ? 16384 : 8192;
        } else {
            obj4 = calendarModel;
        }
        if ((196608 & $changed) == 0) {
            obj5 = yearRange;
            $dirty |= $composer2.changedInstance(obj5) ? 131072 : 65536;
        } else {
            obj5 = yearRange;
        }
        if ((1572864 & $changed) == 0) {
            obj6 = colors;
            $dirty |= $composer2.changed(obj6) ? 1048576 : 524288;
        } else {
            obj6 = colors;
        }
        if ((599187 & $dirty) != 599186 || !$composer2.getSkipping()) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1286899812, $dirty, -1, "androidx.compose.material3.YearPicker (DatePicker.kt:2003)");
            }
            final Modifier modifier2 = obj;
            final Function1<? super Integer, Unit> function12 = obj2;
            final SelectableDates selectableDates2 = obj3;
            final CalendarModel calendarModel2 = obj4;
            final IntRange intRange = obj5;
            final DatePickerColors datePickerColors = obj6;
            TextKt.ProvideTextStyle(TypographyKt.getValue(DatePickerModalTokens.INSTANCE.getSelectionYearLabelTextFont(), $composer2, 6), ComposableLambdaKt.rememberComposableLambda(1301915789, true, new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$YearPicker$1
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

                /* JADX WARN: Removed duplicated region for block: B:25:0x01b8  */
                /* JADX WARN: Removed duplicated region for block: B:28:? A[RETURN, SYNTHETIC] */
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final void invoke(androidx.compose.runtime.Composer r32, int r33) {
                    /*
                        Method dump skipped, instructions count: 444
                        To view this dump add '--comments-level debug' option
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.DatePickerKt$YearPicker$1.invoke(androidx.compose.runtime.Composer, int):void");
                }
            }, $composer2, 54), $composer2, 48);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$YearPicker$2
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

                public final void invoke(Composer composer, int i) {
                    DatePickerKt.YearPicker(Modifier.this, displayedMonthMillis, function1, selectableDates, calendarModel, yearRange, colors, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void Year(final Modifier modifier, final boolean selected, final boolean currentYear, final Function0<Unit> function0, final boolean enabled, final String description, final DatePickerColors colors, final Function2<? super Composer, ? super Integer, Unit> function2, Composer $composer, final int $changed) {
        int $dirty;
        BorderStroke value$iv;
        Object value$iv2;
        Composer $composer2;
        Composer $composer3 = $composer.startRestartGroup(238547184);
        ComposerKt.sourceInformation($composer3, "C(Year)P(5,7,2,6,4,3)2099@94618L393,2117@95386L102,2122@95584L5,2123@95614L58,2126@95739L83,2129@95878L106,2110@95016L968:DatePicker.kt#uh7d8r");
        int $dirty2 = $changed;
        if (($changed & 6) == 0) {
            $dirty2 |= $composer3.changed(modifier) ? 4 : 2;
        }
        if (($changed & 48) == 0) {
            $dirty2 |= $composer3.changed(selected) ? 32 : 16;
        }
        if (($changed & 384) == 0) {
            $dirty2 |= $composer3.changed(currentYear) ? 256 : 128;
        }
        if (($changed & 3072) == 0) {
            $dirty2 |= $composer3.changedInstance(function0) ? 2048 : 1024;
        }
        if (($changed & 24576) == 0) {
            $dirty2 |= $composer3.changed(enabled) ? 16384 : 8192;
        }
        if ((196608 & $changed) == 0) {
            $dirty2 |= $composer3.changed(description) ? 131072 : 65536;
        }
        if ((1572864 & $changed) == 0) {
            $dirty2 |= $composer3.changed(colors) ? 1048576 : 524288;
        }
        if ((12582912 & $changed) == 0) {
            $dirty2 |= $composer3.changedInstance(function2) ? 8388608 : 4194304;
        }
        if ((4793491 & $dirty2) != 4793490 || !$composer3.getSkipping()) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(238547184, $dirty2, -1, "androidx.compose.material3.Year (DatePicker.kt:2097)");
            }
            ComposerKt.sourceInformationMarkerStart($composer3, -1682587287, "CC(remember):DatePicker.kt#9igjgp");
            boolean invalid$iv = (($dirty2 & 896) == 256) | (($dirty2 & Property.BORDER_BOTTOM_RIGHT_RADIUS) == 32);
            Object it$iv = $composer3.rememberedValue();
            if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                if (currentYear && !selected) {
                    $dirty = $dirty2;
                    value$iv = BorderStrokeKt.m529BorderStrokecXLIe8U(DatePickerModalTokens.INSTANCE.m3195getDateTodayContainerOutlineWidthD9Ej5fM(), colors.m2067getTodayDateBorderColor0d7_KjU());
                } else {
                    $dirty = $dirty2;
                    value$iv = null;
                }
                $composer3.updateRememberedValue(value$iv);
            } else {
                $dirty = $dirty2;
                value$iv = it$iv;
            }
            BorderStroke border = value$iv;
            ComposerKt.sourceInformationMarkerEnd($composer3);
            ComposerKt.sourceInformationMarkerStart($composer3, -1682563002, "CC(remember):DatePicker.kt#9igjgp");
            boolean invalid$iv2 = ($dirty & 458752) == 131072;
            Object it$iv2 = $composer3.rememberedValue();
            if (invalid$iv2 || it$iv2 == Composer.Companion.getEmpty()) {
                value$iv2 = (Function1) new Function1<SemanticsPropertyReceiver, Unit>() { // from class: androidx.compose.material3.DatePickerKt$Year$1$1
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
                        SemanticsPropertiesKt.setText($this$semantics, new AnnotatedString(description, null, null, 6, null));
                        SemanticsPropertiesKt.m6122setRolekuIjeqM($this$semantics, Role.Companion.m6103getButtono7Vup1c());
                    }
                };
                $composer3.updateRememberedValue(value$iv2);
            } else {
                value$iv2 = it$iv2;
            }
            ComposerKt.sourceInformationMarkerEnd($composer3);
            $composer2 = $composer3;
            SurfaceKt.m2594Surfaced85dljk(selected, function0, SemanticsModifierKt.semantics(modifier, true, (Function1) value$iv2), enabled, ShapesKt.getValue(DatePickerModalTokens.INSTANCE.getSelectionYearStateLayerShape(), $composer3, 6), colors.yearContainerColor$material3_release(selected, enabled, $composer3, (($dirty >> 3) & 14) | (($dirty >> 9) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | (($dirty >> 12) & 896)).getValue().m4299unboximpl(), colors.yearContentColor$material3_release(currentYear, selected, enabled, $composer3, (($dirty >> 6) & 14) | ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | (($dirty >> 6) & 896) | (($dirty >> 9) & 7168)).getValue().m4299unboximpl(), 0.0f, 0.0f, border, (MutableInteractionSource) null, ComposableLambdaKt.rememberComposableLambda(-1573188346, true, new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$Year$2
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

                /* JADX WARN: Removed duplicated region for block: B:28:0x015a  */
                /* JADX WARN: Removed duplicated region for block: B:31:? A[RETURN, SYNTHETIC] */
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final void invoke(androidx.compose.runtime.Composer r28, int r29) {
                    /*
                        Method dump skipped, instructions count: 350
                        To view this dump add '--comments-level debug' option
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.DatePickerKt$Year$2.invoke(androidx.compose.runtime.Composer, int):void");
                }
            }, $composer3, 54), $composer2, (($dirty >> 3) & 14) | (($dirty >> 6) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | (($dirty >> 3) & 7168), 48, 1408);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer3.skipToGroupEnd();
            $composer2 = $composer3;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$Year$3
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

                public final void invoke(Composer composer, int i) {
                    DatePickerKt.Year(Modifier.this, selected, currentYear, function0, enabled, description, colors, function2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:102:0x0261  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void MonthsNavigation(final androidx.compose.ui.Modifier r34, final boolean r35, final boolean r36, final boolean r37, final java.lang.String r38, final kotlin.jvm.functions.Function0<kotlin.Unit> r39, final kotlin.jvm.functions.Function0<kotlin.Unit> r40, final kotlin.jvm.functions.Function0<kotlin.Unit> r41, androidx.compose.material3.DatePickerColors r42, androidx.compose.runtime.Composer r43, final int r44) {
        /*
            Method dump skipped, instructions count: 646
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.DatePickerKt.MonthsNavigation(androidx.compose.ui.Modifier, boolean, boolean, boolean, java.lang.String, kotlin.jvm.functions.Function0, kotlin.jvm.functions.Function0, kotlin.jvm.functions.Function0, androidx.compose.material3.DatePickerColors, androidx.compose.runtime.Composer, int):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void YearPickerMenuButton(final Function0<Unit> function0, final boolean expanded, Modifier modifier, final Function2<? super Composer, ? super Integer, Unit> function2, Composer $composer, final int $changed, final int i) {
        Object obj;
        Object obj2;
        final Modifier modifier2;
        Composer $composer2 = $composer.startRestartGroup(409654418);
        ComposerKt.sourceInformation($composer2, "C(YearPickerMenuButton)P(3,1,2)2212@98959L7,2212@98909L58,2215@99024L453,2208@98780L697:DatePicker.kt#uh7d8r");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
            obj = function0;
        } else if (($changed & 6) == 0) {
            obj = function0;
            $dirty |= $composer2.changedInstance(obj) ? 4 : 2;
        } else {
            obj = function0;
        }
        if ((i & 2) != 0) {
            $dirty |= 48;
        } else if (($changed & 48) == 0) {
            $dirty |= $composer2.changed(expanded) ? 32 : 16;
        }
        int i2 = i & 4;
        if (i2 != 0) {
            $dirty |= 384;
            obj2 = modifier;
        } else if (($changed & 384) == 0) {
            obj2 = modifier;
            $dirty |= $composer2.changed(obj2) ? 256 : 128;
        } else {
            obj2 = modifier;
        }
        if ((i & 8) != 0) {
            $dirty |= 3072;
        } else if (($changed & 3072) == 0) {
            $dirty |= $composer2.changedInstance(function2) ? 2048 : 1024;
        }
        if (($dirty & 1171) == 1170 && $composer2.getSkipping()) {
            $composer2.skipToGroupEnd();
            modifier2 = obj2;
        } else {
            Modifier modifier3 = i2 != 0 ? Modifier.Companion : obj2;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(409654418, $dirty, -1, "androidx.compose.material3.YearPickerMenuButton (DatePicker.kt:2207)");
            }
            ButtonDefaults buttonDefaults = ButtonDefaults.INSTANCE;
            ComposerKt.sourceInformationMarkerStart($composer2, 2023513938, "CC:CompositionLocal.kt#9igjgp");
            Object consume = $composer2.consume(ContentColorKt.getLocalContentColor());
            ComposerKt.sourceInformationMarkerEnd($composer2);
            Modifier modifier4 = modifier3;
            ButtonKt.TextButton(obj, modifier4, false, RoundedCornerShapeKt.getCircleShape(), buttonDefaults.m1869textButtonColorsro_MJ88(0L, ((Color) consume).m4299unboximpl(), 0L, 0L, $composer2, 24576, 13), null, null, null, null, ComposableLambdaKt.rememberComposableLambda(1899012021, true, new Function3<RowScope, Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$YearPickerMenuButton$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(3);
                }

                @Override // kotlin.jvm.functions.Function3
                public /* bridge */ /* synthetic */ Unit invoke(RowScope rowScope, Composer composer, Integer num) {
                    invoke(rowScope, composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(RowScope $this$TextButton, Composer $composer3, int $changed2) {
                    String str;
                    ComposerKt.sourceInformation($composer3, "C2216@99034L9,2217@99052L49,2218@99110L361:DatePicker.kt#uh7d8r");
                    if (($changed2 & 17) != 16 || !$composer3.getSkipping()) {
                        if (ComposerKt.isTraceInProgress()) {
                            ComposerKt.traceEventStart(1899012021, $changed2, -1, "androidx.compose.material3.YearPickerMenuButton.<anonymous> (DatePicker.kt:2216)");
                        }
                        function2.invoke($composer3, 0);
                        SpacerKt.Spacer(SizeKt.m1040size3ABfNKs(Modifier.Companion, ButtonDefaults.INSTANCE.m1865getIconSpacingD9Ej5fM()), $composer3, 6);
                        ImageVector arrowDropDown = ArrowDropDownKt.getArrowDropDown(Icons.Filled.INSTANCE);
                        if (expanded) {
                            $composer3.startReplaceGroup(-1360040181);
                            ComposerKt.sourceInformation($composer3, "2222@99241L49");
                            Strings.Companion companion = Strings.Companion;
                            String m3024getString2EP1pXo = Strings_androidKt.m3024getString2EP1pXo(Strings.m2954constructorimpl(R.string.m3c_date_picker_switch_to_day_selection), $composer3, 0);
                            $composer3.endReplaceGroup();
                            str = m3024getString2EP1pXo;
                        } else {
                            $composer3.startReplaceGroup(-1359945910);
                            ComposerKt.sourceInformation($composer3, "2224@99336L50");
                            Strings.Companion companion2 = Strings.Companion;
                            String m3024getString2EP1pXo2 = Strings_androidKt.m3024getString2EP1pXo(Strings.m2954constructorimpl(R.string.m3c_date_picker_switch_to_year_selection), $composer3, 0);
                            $composer3.endReplaceGroup();
                            str = m3024getString2EP1pXo2;
                        }
                        IconKt.m2200Iconww6aTOc(arrowDropDown, str, RotateKt.rotate(Modifier.Companion, expanded ? 180.0f : 0.0f), 0L, $composer3, 0, 8);
                        if (ComposerKt.isTraceInProgress()) {
                            ComposerKt.traceEventEnd();
                            return;
                        }
                        return;
                    }
                    $composer3.skipToGroupEnd();
                }
            }, $composer2, 54), $composer2, ($dirty & 14) | 807075840 | (($dirty >> 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS), 388);
            $composer2 = $composer2;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier4;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.DatePickerKt$YearPickerMenuButton$2
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

                public final void invoke(Composer composer, int i3) {
                    DatePickerKt.YearPickerMenuButton(function0, expanded, modifier2, function2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final List<CustomAccessibilityAction> customScrollActions(final LazyGridState state, final CoroutineScope coroutineScope, String scrollUpLabel, String scrollDownLabel) {
        Function0 scrollUpAction = new Function0<Boolean>() { // from class: androidx.compose.material3.DatePickerKt$customScrollActions$scrollUpAction$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Boolean invoke() {
                boolean z;
                if (LazyGridState.this.getCanScrollBackward()) {
                    BuildersKt__Builders_commonKt.launch$default(coroutineScope, null, null, new AnonymousClass1(LazyGridState.this, null), 3, null);
                    z = true;
                } else {
                    z = false;
                }
                return Boolean.valueOf(z);
            }

            /* JADX INFO: Access modifiers changed from: package-private */
            /* compiled from: DatePicker.kt */
            @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 8, 0}, xi = 48)
            @DebugMetadata(c = "androidx.compose.material3.DatePickerKt$customScrollActions$scrollUpAction$1$1", f = "DatePicker.kt", i = {}, l = {2242}, m = "invokeSuspend", n = {}, s = {})
            /* renamed from: androidx.compose.material3.DatePickerKt$customScrollActions$scrollUpAction$1$1  reason: invalid class name */
            /* loaded from: classes11.dex */
            public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                final /* synthetic */ LazyGridState $state;
                int label;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                AnonymousClass1(LazyGridState lazyGridState, Continuation<? super AnonymousClass1> continuation) {
                    super(2, continuation);
                    this.$state = lazyGridState;
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                    return new AnonymousClass1(this.$state, continuation);
                }

                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                    return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Object invokeSuspend(Object $result) {
                    Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                    switch (this.label) {
                        case 0:
                            ResultKt.throwOnFailure($result);
                            this.label = 1;
                            if (LazyGridState.scrollToItem$default(this.$state, this.$state.getFirstVisibleItemIndex() - 3, 0, this, 2, null) != coroutine_suspended) {
                                break;
                            } else {
                                return coroutine_suspended;
                            }
                        case 1:
                            ResultKt.throwOnFailure($result);
                            break;
                        default:
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    return Unit.INSTANCE;
                }
            }
        };
        Function0 scrollDownAction = new Function0<Boolean>() { // from class: androidx.compose.material3.DatePickerKt$customScrollActions$scrollDownAction$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Boolean invoke() {
                boolean z;
                if (LazyGridState.this.getCanScrollForward()) {
                    BuildersKt__Builders_commonKt.launch$default(coroutineScope, null, null, new AnonymousClass1(LazyGridState.this, null), 3, null);
                    z = true;
                } else {
                    z = false;
                }
                return Boolean.valueOf(z);
            }

            /* JADX INFO: Access modifiers changed from: package-private */
            /* compiled from: DatePicker.kt */
            @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 8, 0}, xi = 48)
            @DebugMetadata(c = "androidx.compose.material3.DatePickerKt$customScrollActions$scrollDownAction$1$1", f = "DatePicker.kt", i = {}, l = {2250}, m = "invokeSuspend", n = {}, s = {})
            /* renamed from: androidx.compose.material3.DatePickerKt$customScrollActions$scrollDownAction$1$1  reason: invalid class name */
            /* loaded from: classes11.dex */
            public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                final /* synthetic */ LazyGridState $state;
                int label;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                AnonymousClass1(LazyGridState lazyGridState, Continuation<? super AnonymousClass1> continuation) {
                    super(2, continuation);
                    this.$state = lazyGridState;
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                    return new AnonymousClass1(this.$state, continuation);
                }

                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                    return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Object invokeSuspend(Object $result) {
                    Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                    switch (this.label) {
                        case 0:
                            ResultKt.throwOnFailure($result);
                            this.label = 1;
                            if (LazyGridState.scrollToItem$default(this.$state, this.$state.getFirstVisibleItemIndex() + 3, 0, this, 2, null) != coroutine_suspended) {
                                break;
                            } else {
                                return coroutine_suspended;
                            }
                        case 1:
                            ResultKt.throwOnFailure($result);
                            break;
                        default:
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    return Unit.INSTANCE;
                }
            }
        };
        return CollectionsKt.listOf((Object[]) new CustomAccessibilityAction[]{new CustomAccessibilityAction(scrollUpLabel, scrollUpAction), new CustomAccessibilityAction(scrollDownLabel, scrollDownAction)});
    }

    public static final float getRecommendedSizeForAccessibility() {
        return RecommendedSizeForAccessibility;
    }

    public static final float getMonthYearHeight() {
        return MonthYearHeight;
    }

    public static final float getDatePickerHorizontalPadding() {
        return DatePickerHorizontalPadding;
    }

    public static final PaddingValues getDatePickerModeTogglePadding() {
        return DatePickerModeTogglePadding;
    }
}
