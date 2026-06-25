package com.hardlineforge.lala.ui.screens;

import androidx.compose.foundation.ClickableKt;
import androidx.compose.foundation.layout.Arrangement;
import androidx.compose.foundation.layout.ColumnScope;
import androidx.compose.foundation.layout.PaddingKt;
import androidx.compose.foundation.layout.PaddingValues;
import androidx.compose.foundation.layout.SizeKt;
import androidx.compose.foundation.lazy.LazyDslKt;
import androidx.compose.foundation.lazy.LazyItemScope;
import androidx.compose.foundation.lazy.LazyListScope;
import androidx.compose.material3.CardDefaults;
import androidx.compose.material3.CardKt;
import androidx.compose.material3.FloatingActionButtonKt;
import androidx.compose.material3.MaterialTheme;
import androidx.compose.material3.TextKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.State;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.unit.Dp;
import androidx.core.view.PointerIconCompat;
import androidx.navigation.NavController;
import androidx.navigation.NavHostController;
import androidx.profileinstaller.ProfileVerifier;
import com.hardlineforge.lala.data.LogEntry;
import com.hardlineforge.lala.ui.ColorUtilsKt;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: TimelineScreen.kt */
@Metadata(d1 = {"\u0000(\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000e\u001a\u001f\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005H\u0007¢\u0006\u0002\u0010\u0006\u001a%\u0010\u0007\u001a\u00020\u00012\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0003¢\u0006\u0002\u0010\n¨\u0006\u000b²\u0006\u0010\u0010\f\u001a\b\u0012\u0004\u0012\u00020\t0\rX\u008a\u0084\u0002²\u0006\f\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u008a\u008e\u0002"}, d2 = {"TimelineScreen", "", "navController", "Landroidx/navigation/NavHostController;", "vm", "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;", "(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V", "TimelineCard", "entry", "Lcom/hardlineforge/lala/data/LogEntry;", "(Lcom/hardlineforge/lala/data/LogEntry;Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;I)V", "app_debug", "entries", "", "selectedCategory", ""}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class TimelineScreenKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit TimelineCard$lambda$25(LogEntry logEntry, NavHostController navHostController, LalaViewModel lalaViewModel, int i, Composer composer, int i2) {
        TimelineCard(logEntry, navHostController, lalaViewModel, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1));
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit TimelineScreen$lambda$16(NavHostController navHostController, LalaViewModel lalaViewModel, int i, int i2, Composer composer, int i3) {
        TimelineScreen(navHostController, lalaViewModel, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1), i2);
        return Unit.INSTANCE;
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x0103  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x012a  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0145  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x01db  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void TimelineScreen(final androidx.navigation.NavHostController r24, com.hardlineforge.lala.ui.viewmodel.LalaViewModel r25, androidx.compose.runtime.Composer r26, final int r27, final int r28) {
        /*
            Method dump skipped, instructions count: 503
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.TimelineScreenKt.TimelineScreen(androidx.navigation.NavHostController, com.hardlineforge.lala.ui.viewmodel.LalaViewModel, androidx.compose.runtime.Composer, int, int):void");
    }

    private static final List<LogEntry> TimelineScreen$lambda$0(State<? extends List<LogEntry>> state) {
        return (List) state.getValue();
    }

    private static final String TimelineScreen$lambda$2(MutableState<String> mutableState) {
        return mutableState.getValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit TimelineScreen$lambda$7(final NavHostController $navController, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C39@1638L39,38@1582L207:TimelineScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-557889618, $changed, -1, "com.hardlineforge.lala.ui.screens.TimelineScreen.<anonymous> (TimelineScreen.kt:38)");
            }
            Function2<Composer, Integer, Unit> lambda$1905197210$app_debug = ComposableSingletons$TimelineScreenKt.INSTANCE.getLambda$1905197210$app_debug();
            Function2<Composer, Integer, Unit> m7321getLambda$279078727$app_debug = ComposableSingletons$TimelineScreenKt.INSTANCE.m7321getLambda$279078727$app_debug();
            ComposerKt.sourceInformationMarkerStart($composer, 738991381, "CC(remember):TimelineScreen.kt#9igjgp");
            boolean changedInstance = $composer.changedInstance($navController);
            Object rememberedValue = $composer.rememberedValue();
            if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.TimelineScreenKt$$ExternalSyntheticLambda0
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return TimelineScreenKt.TimelineScreen$lambda$7$lambda$6$lambda$5(NavHostController.this);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            FloatingActionButtonKt.m2173ExtendedFloatingActionButtonElI57k(lambda$1905197210$app_debug, m7321getLambda$279078727$app_debug, (Function0) rememberedValue, null, false, null, 0L, 0L, null, null, $composer, 54, PointerIconCompat.TYPE_TOP_RIGHT_DIAGONAL_DOUBLE_ARROW);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit TimelineScreen$lambda$7$lambda$6$lambda$5(NavHostController $navController) {
        NavController.navigate$default($navController, "new_entry", null, null, 6, null);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit TimelineScreen$lambda$15(final List $filtered, final NavHostController $navController, final LalaViewModel $vm, PaddingValues padding, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(padding, "padding");
        ComposerKt.sourceInformation($composer, "C49@2012L789,45@1827L974:TimelineScreen.kt#4cebsy");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer.changed(padding) ? 4 : 2;
        }
        if ($composer.shouldExecute(($dirty & 19) != 18, $dirty & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1900588518, $dirty, -1, "com.hardlineforge.lala.ui.screens.TimelineScreen.<anonymous> (TimelineScreen.kt:45)");
            }
            Modifier padding2 = PaddingKt.padding(Modifier.Companion, padding);
            PaddingValues m986PaddingValues0680j_4 = PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(16));
            Arrangement.HorizontalOrVertical m874spacedBy0680j_4 = Arrangement.INSTANCE.m874spacedBy0680j_4(Dp.m6873constructorimpl(12));
            ComposerKt.sourceInformationMarkerStart($composer, 1104472379, "CC(remember):TimelineScreen.kt#9igjgp");
            boolean changedInstance = $composer.changedInstance($filtered) | $composer.changedInstance($navController) | $composer.changedInstance($vm);
            Object rememberedValue = $composer.rememberedValue();
            if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function1() { // from class: com.hardlineforge.lala.ui.screens.TimelineScreenKt$$ExternalSyntheticLambda4
                    @Override // kotlin.jvm.functions.Function1
                    public final Object invoke(Object obj2) {
                        return TimelineScreenKt.TimelineScreen$lambda$15$lambda$14$lambda$13($filtered, $navController, $vm, (LazyListScope) obj2);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            LazyDslKt.LazyColumn(padding2, null, m986PaddingValues0680j_4, false, m874spacedBy0680j_4, null, null, false, null, (Function1) rememberedValue, $composer, 24960, 490);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit TimelineScreen$lambda$15$lambda$14$lambda$13(List $filtered, final NavHostController $navController, final LalaViewModel $vm, LazyListScope $this$LazyColumn) {
        ArrayList arrayList;
        LazyListScope LazyColumn = $this$LazyColumn;
        Intrinsics.checkNotNullParameter(LazyColumn, "$this$LazyColumn");
        Map linkedHashMap = new LinkedHashMap();
        for (Object obj : $filtered) {
            LocalDate localDate = ((LogEntry) obj).getTimestamp().atZone(ZoneId.systemDefault()).toLocalDate();
            Object obj2 = linkedHashMap.get(localDate);
            if (obj2 == null) {
                arrayList = new ArrayList();
                linkedHashMap.put(localDate, arrayList);
            } else {
                arrayList = obj2;
            }
            ((List) arrayList).add(obj);
        }
        Map grouped = linkedHashMap;
        for (Map.Entry entry : grouped.entrySet()) {
            final LocalDate localDate2 = (LocalDate) entry.getKey();
            final List list = (List) entry.getValue();
            LazyListScope.item$default(LazyColumn, null, null, ComposableLambdaKt.composableLambdaInstance(-1447384234, true, new Function3() { // from class: com.hardlineforge.lala.ui.screens.TimelineScreenKt$$ExternalSyntheticLambda1
                @Override // kotlin.jvm.functions.Function3
                public final Object invoke(Object obj3, Object obj4, Object obj5) {
                    return TimelineScreenKt.TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$lambda$9(localDate2, (LazyItemScope) obj3, (Composer) obj4, ((Integer) obj5).intValue());
                }
            }), 3, null);
            final Function1 function1 = new Function1() { // from class: com.hardlineforge.lala.ui.screens.TimelineScreenKt$$ExternalSyntheticLambda2
                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj3) {
                    return TimelineScreenKt.TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$lambda$10((LogEntry) obj3);
                }
            };
            final Function1 function12 = new Function1() { // from class: com.hardlineforge.lala.ui.screens.TimelineScreenKt$TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$$inlined$items$default$1
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Object p1) {
                    return invoke((LogEntry) p1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final Void invoke(LogEntry logEntry) {
                    return null;
                }
            };
            $this$LazyColumn.items(list.size(), new Function1<Integer, Object>() { // from class: com.hardlineforge.lala.ui.screens.TimelineScreenKt$TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$$inlined$items$default$2
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Integer num) {
                    return invoke(num.intValue());
                }

                public final Object invoke(int index) {
                    return Function1.this.invoke(list.get(index));
                }
            }, new Function1<Integer, Object>() { // from class: com.hardlineforge.lala.ui.screens.TimelineScreenKt$TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$$inlined$items$default$3
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Integer num) {
                    return invoke(num.intValue());
                }

                public final Object invoke(int index) {
                    return Function1.this.invoke(list.get(index));
                }
            }, ComposableLambdaKt.composableLambdaInstance(-632812321, true, new Function4<LazyItemScope, Integer, Composer, Integer, Unit>() { // from class: com.hardlineforge.lala.ui.screens.TimelineScreenKt$TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$$inlined$items$default$4
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(4);
                }

                @Override // kotlin.jvm.functions.Function4
                public /* bridge */ /* synthetic */ Unit invoke(LazyItemScope lazyItemScope, Integer num, Composer composer, Integer num2) {
                    invoke(lazyItemScope, num.intValue(), composer, num2.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(LazyItemScope $this$items, int it, Composer $composer, int $changed) {
                    ComposerKt.sourceInformation($composer, "C178@8826L22:LazyDsl.kt#428nma");
                    int $dirty = $changed;
                    if (($changed & 6) == 0) {
                        $dirty |= $composer.changed($this$items) ? 4 : 2;
                    }
                    if (($changed & 48) == 0) {
                        $dirty |= $composer.changed(it) ? 32 : 16;
                    }
                    if (!$composer.shouldExecute(($dirty & 147) != 146, $dirty & 1)) {
                        $composer.skipToGroupEnd();
                        return;
                    }
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventStart(-632812321, $dirty, -1, "androidx.compose.foundation.lazy.items.<anonymous> (LazyDsl.kt:178)");
                    }
                    $composer.startReplaceGroup(962361863);
                    ComposerKt.sourceInformation($composer, "C*65@2721L38:TimelineScreen.kt#4cebsy");
                    TimelineScreenKt.TimelineCard((LogEntry) list.get(it), $navController, $vm, $composer, (($dirty & 14) >> 3) & 14);
                    $composer.endReplaceGroup();
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventEnd();
                    }
                }
            }));
            LazyColumn = $this$LazyColumn;
            grouped = grouped;
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$lambda$9(LocalDate $date, LazyItemScope item, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(item, "$this$item");
        ComposerKt.sourceInformation($composer, "C59@2430L10,60@2499L11,57@2289L331:TimelineScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1447384234, $changed, -1, "com.hardlineforge.lala.ui.screens.TimelineScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (TimelineScreen.kt:57)");
            }
            String format = $date.format(DateTimeFormatter.ofPattern("MMMM d, yyyy"));
            Intrinsics.checkNotNullExpressionValue(format, "format(...)");
            TextKt.m2743Text4IGK_g(format, PaddingKt.m997paddingqDBjuR0$default(Modifier.Companion, 0.0f, Dp.m6873constructorimpl(8), 0.0f, Dp.m6873constructorimpl(4), 5, null), MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1960getPrimary0d7_KjU(), 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, MaterialTheme.INSTANCE.getTypography($composer, MaterialTheme.$stable).getTitleLarge(), $composer, 48, 0, 65528);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Object TimelineScreen$lambda$15$lambda$14$lambda$13$lambda$12$lambda$10(LogEntry it) {
        Intrinsics.checkNotNullParameter(it, "it");
        return it.getId();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void TimelineCard(final LogEntry entry, final NavHostController navController, final LalaViewModel vm, Composer $composer, final int $changed) {
        Composer $composer2 = $composer.startRestartGroup(1025670957);
        ComposerKt.sourceInformation($composer2, "C(TimelineCard)80@3163L54,81@3249L6,82@3335L11,82@3293L62,83@3362L2596,77@3078L2880:TimelineScreen.kt#4cebsy");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer2.changedInstance(entry) ? 4 : 2;
        }
        if (($changed & 48) == 0) {
            $dirty |= $composer2.changedInstance(navController) ? 32 : 16;
        }
        if ($composer2.shouldExecute(($dirty & 19) != 18, $dirty & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1025670957, $dirty, -1, "com.hardlineforge.lala.ui.screens.TimelineCard (TimelineScreen.kt:73)");
            }
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("h:mm a");
            final String localTime = entry.getTimestamp().atZone(ZoneId.systemDefault()).format(formatter);
            Modifier fillMaxWidth$default = SizeKt.fillMaxWidth$default(Modifier.Companion, 0.0f, 1, null);
            ComposerKt.sourceInformationMarkerStart($composer2, 2122290211, "CC(remember):TimelineScreen.kt#9igjgp");
            boolean changedInstance = $composer2.changedInstance(navController) | $composer2.changedInstance(entry);
            Object rememberedValue = $composer2.rememberedValue();
            if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.TimelineScreenKt$$ExternalSyntheticLambda5
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return TimelineScreenKt.TimelineCard$lambda$18$lambda$17(NavHostController.this, entry);
                    }
                };
                $composer2.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer2);
            CardKt.Card(ClickableKt.m536clickableXHw0xAI$default(fillMaxWidth$default, false, null, null, (Function0) rememberedValue, 7, null), MaterialTheme.INSTANCE.getShapes($composer2, MaterialTheme.$stable).getLarge(), CardDefaults.INSTANCE.m1878cardColorsro_MJ88(MaterialTheme.INSTANCE.getColorScheme($composer2, MaterialTheme.$stable).m1965getSurface0d7_KjU(), 0L, 0L, 0L, $composer2, CardDefaults.$stable << 12, 14), null, null, ComposableLambdaKt.rememberComposableLambda(2143778335, true, new Function3() { // from class: com.hardlineforge.lala.ui.screens.TimelineScreenKt$$ExternalSyntheticLambda6
                @Override // kotlin.jvm.functions.Function3
                public final Object invoke(Object obj2, Object obj3, Object obj4) {
                    return TimelineScreenKt.TimelineCard$lambda$24(LogEntry.this, localTime, (ColumnScope) obj2, (Composer) obj3, ((Integer) obj4).intValue());
                }
            }, $composer2, 54), $composer2, ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 24);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2() { // from class: com.hardlineforge.lala.ui.screens.TimelineScreenKt$$ExternalSyntheticLambda7
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj2, Object obj3) {
                    return TimelineScreenKt.TimelineCard$lambda$25(LogEntry.this, navController, vm, $changed, (Composer) obj2, ((Integer) obj3).intValue());
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit TimelineCard$lambda$18$lambda$17(NavHostController $navController, LogEntry $entry) {
        NavController.navigate$default($navController, "entry_detail/" + $entry.getId(), null, null, 6, null);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0234  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0240  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0246  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x035d  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0369  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x036f  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x03a2  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x03b8 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x052a  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0536  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x070e  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x074b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final kotlin.Unit TimelineCard$lambda$24(final com.hardlineforge.lala.data.LogEntry r112, java.lang.String r113, androidx.compose.foundation.layout.ColumnScope r114, androidx.compose.runtime.Composer r115, int r116) {
        /*
            Method dump skipped, instructions count: 1877
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.TimelineScreenKt.TimelineCard$lambda$24(com.hardlineforge.lala.data.LogEntry, java.lang.String, androidx.compose.foundation.layout.ColumnScope, androidx.compose.runtime.Composer, int):kotlin.Unit");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit TimelineCard$lambda$24$lambda$23$lambda$22$lambda$20$lambda$19(LogEntry $entry, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C108@4523L10,109@4582L29,106@4416L314:TimelineScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1252356744, $changed, -1, "com.hardlineforge.lala.ui.screens.TimelineCard.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (TimelineScreen.kt:106)");
            }
            TextKt.m2743Text4IGK_g($entry.getCategory(), PaddingKt.m994paddingVpY3zN4(Modifier.Companion, Dp.m6873constructorimpl(8), Dp.m6873constructorimpl(2)), ColorUtilsKt.categoryColor($entry.getCategory(), $composer, 0), 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, MaterialTheme.INSTANCE.getTypography($composer, MaterialTheme.$stable).getLabelSmall(), $composer, 48, 0, 65528);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }
}
