package com.hardlineforge.lala.ui.screens;

import androidx.compose.foundation.ClickableKt;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.layout.Arrangement;
import androidx.compose.foundation.layout.ColumnKt;
import androidx.compose.foundation.layout.ColumnScope;
import androidx.compose.foundation.layout.ColumnScopeInstance;
import androidx.compose.foundation.layout.PaddingKt;
import androidx.compose.foundation.layout.PaddingValues;
import androidx.compose.foundation.layout.SizeKt;
import androidx.compose.foundation.lazy.LazyDslKt;
import androidx.compose.foundation.lazy.LazyItemScope;
import androidx.compose.foundation.lazy.LazyListScope;
import androidx.compose.foundation.shape.CornerBasedShape;
import androidx.compose.foundation.text.KeyboardActions;
import androidx.compose.foundation.text.KeyboardOptions;
import androidx.compose.material3.AppBarKt;
import androidx.compose.material3.CardKt;
import androidx.compose.material3.IconButtonKt;
import androidx.compose.material3.MaterialTheme;
import androidx.compose.material3.OutlinedTextFieldKt;
import androidx.compose.material3.TextFieldColors;
import androidx.compose.material3.TextKt;
import androidx.compose.runtime.Applier;
import androidx.compose.runtime.ComposablesKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.CompositionLocalMap;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.Updater;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Alignment;
import androidx.compose.ui.ComposedModifierKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.Shape;
import androidx.compose.ui.layout.MeasurePolicy;
import androidx.compose.ui.node.ComposeUiNode;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.input.VisualTransformation;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.unit.Dp;
import androidx.navigation.NavController;
import androidx.navigation.NavHostController;
import androidx.profileinstaller.ProfileVerifier;
import androidx.recyclerview.widget.ItemTouchHelper;
import com.google.android.gms.actions.SearchIntents;
import com.hardlineforge.lala.data.LogEntry;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import com.itextpdf.layout.properties.Property;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: SearchScreen.kt */
@Metadata(d1 = {"\u0000$\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\u001a\u001f\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005H\u0007¢\u0006\u0002\u0010\u0006¨\u0006\u0007²\u0006\u0010\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\tX\u008a\u0084\u0002²\u0006\n\u0010\u000b\u001a\u00020\fX\u008a\u008e\u0002"}, d2 = {"SearchScreen", "", "navController", "Landroidx/navigation/NavHostController;", "vm", "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;", "(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V", "app_debug", "results", "", "Lcom/hardlineforge/lala/data/LogEntry;", SearchIntents.EXTRA_QUERY, ""}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class SearchScreenKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SearchScreen$lambda$21(NavHostController navHostController, LalaViewModel lalaViewModel, int i, int i2, Composer composer, int i3) {
        SearchScreen(navHostController, lalaViewModel, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1), i2);
        return Unit.INSTANCE;
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x0103  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x012a  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x01c9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void SearchScreen(final androidx.navigation.NavHostController r24, com.hardlineforge.lala.ui.viewmodel.LalaViewModel r25, androidx.compose.runtime.Composer r26, final int r27, final int r28) {
        /*
            Method dump skipped, instructions count: 485
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.SearchScreenKt.SearchScreen(androidx.navigation.NavHostController, com.hardlineforge.lala.ui.viewmodel.LalaViewModel, androidx.compose.runtime.Composer, int, int):void");
    }

    private static final List<LogEntry> SearchScreen$lambda$0(State<? extends List<LogEntry>> state) {
        return (List) state.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String SearchScreen$lambda$2(MutableState<String> mutableState) {
        return mutableState.getValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SearchScreen$lambda$14(final MutableState $query$delegate, final NavHostController $navController, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C29@1127L735,46@1897L192,28@1092L1011:SearchScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1944022671, $changed, -1, "com.hardlineforge.lala.ui.screens.SearchScreen.<anonymous> (SearchScreen.kt:28)");
            }
            AppBarKt.m1823TopAppBarGHTll3U(ComposableLambdaKt.rememberComposableLambda(-1549908939, true, new Function2() { // from class: com.hardlineforge.lala.ui.screens.SearchScreenKt$$ExternalSyntheticLambda1
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return SearchScreenKt.SearchScreen$lambda$14$lambda$10(MutableState.this, (Composer) obj, ((Integer) obj2).intValue());
                }
            }, $composer, 54), null, ComposableLambdaKt.rememberComposableLambda(-901316169, true, new Function2() { // from class: com.hardlineforge.lala.ui.screens.SearchScreenKt$$ExternalSyntheticLambda2
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return SearchScreenKt.SearchScreen$lambda$14$lambda$13(NavHostController.this, (Composer) obj, ((Integer) obj2).intValue());
                }
            }, $composer, 54), null, 0.0f, null, null, null, $composer, 390, ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SearchScreen$lambda$14$lambda$10(final MutableState $query$delegate, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C36@1481L6,32@1247L14,37@1535L287,30@1149L695:SearchScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1549908939, $changed, -1, "com.hardlineforge.lala.ui.screens.SearchScreen.<anonymous>.<anonymous> (SearchScreen.kt:30)");
            }
            String SearchScreen$lambda$2 = SearchScreen$lambda$2($query$delegate);
            Modifier fillMaxWidth$default = SizeKt.fillMaxWidth$default(Modifier.Companion, 0.0f, 1, null);
            CornerBasedShape medium = MaterialTheme.INSTANCE.getShapes($composer, MaterialTheme.$stable).getMedium();
            ComposerKt.sourceInformationMarkerStart($composer, 891165187, "CC(remember):SearchScreen.kt#9igjgp");
            Object rememberedValue = $composer.rememberedValue();
            if (rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function1() { // from class: com.hardlineforge.lala.ui.screens.SearchScreenKt$$ExternalSyntheticLambda5
                    @Override // kotlin.jvm.functions.Function1
                    public final Object invoke(Object obj2) {
                        return SearchScreenKt.SearchScreen$lambda$14$lambda$10$lambda$6$lambda$5(MutableState.this, (String) obj2);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            OutlinedTextFieldKt.OutlinedTextField(SearchScreen$lambda$2, (Function1<? super String, Unit>) rememberedValue, fillMaxWidth$default, false, false, (TextStyle) null, (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) ComposableSingletons$SearchScreenKt.INSTANCE.getLambda$2026943214$app_debug(), (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) ComposableLambdaKt.rememberComposableLambda(320813612, true, new Function2() { // from class: com.hardlineforge.lala.ui.screens.SearchScreenKt$$ExternalSyntheticLambda6
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj2, Object obj3) {
                    return SearchScreenKt.SearchScreen$lambda$14$lambda$10$lambda$9(MutableState.this, (Composer) obj2, ((Integer) obj3).intValue());
                }
            }, $composer, 54), (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) null, false, (VisualTransformation) null, (KeyboardOptions) null, (KeyboardActions) null, true, 0, 0, (MutableInteractionSource) null, (Shape) medium, (TextFieldColors) null, $composer, 817889712, 12582912, 0, 6159736);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SearchScreen$lambda$14$lambda$10$lambda$6$lambda$5(MutableState $query$delegate, String it) {
        Intrinsics.checkNotNullParameter(it, "it");
        $query$delegate.setValue(it);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SearchScreen$lambda$14$lambda$10$lambda$9(final MutableState $query$delegate, Composer $composer, int $changed) {
        Composer $composer2;
        ComposerKt.sourceInformation($composer, "C:SearchScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(320813612, $changed, -1, "com.hardlineforge.lala.ui.screens.SearchScreen.<anonymous>.<anonymous>.<anonymous> (SearchScreen.kt:38)");
            }
            if (SearchScreen$lambda$2($query$delegate).length() > 0) {
                $composer.startReplaceGroup(1056141479);
                ComposerKt.sourceInformation($composer, "39@1644L14,39@1623L143");
                ComposerKt.sourceInformationMarkerStart($composer, -935760678, "CC(remember):SearchScreen.kt#9igjgp");
                Object rememberedValue = $composer.rememberedValue();
                if (rememberedValue == Composer.Companion.getEmpty()) {
                    Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.SearchScreenKt$$ExternalSyntheticLambda0
                        @Override // kotlin.jvm.functions.Function0
                        public final Object invoke() {
                            return SearchScreenKt.SearchScreen$lambda$14$lambda$10$lambda$9$lambda$8$lambda$7(MutableState.this);
                        }
                    };
                    $composer.updateRememberedValue(obj);
                    rememberedValue = obj;
                }
                ComposerKt.sourceInformationMarkerEnd($composer);
                $composer2 = $composer;
                IconButtonKt.IconButton((Function0) rememberedValue, null, false, null, null, ComposableSingletons$SearchScreenKt.INSTANCE.getLambda$1953766196$app_debug(), $composer2, 196614, 30);
            } else {
                $composer2 = $composer;
                $composer2.startReplaceGroup(1054557782);
            }
            $composer2.endReplaceGroup();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SearchScreen$lambda$14$lambda$10$lambda$9$lambda$8$lambda$7(MutableState $query$delegate) {
        $query$delegate.setValue("");
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SearchScreen$lambda$14$lambda$13(final NavHostController $navController, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C47@1940L32,47@1919L152:SearchScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-901316169, $changed, -1, "com.hardlineforge.lala.ui.screens.SearchScreen.<anonymous>.<anonymous> (SearchScreen.kt:47)");
            }
            ComposerKt.sourceInformationMarkerStart($composer, 1418556791, "CC(remember):SearchScreen.kt#9igjgp");
            boolean changedInstance = $composer.changedInstance($navController);
            Object rememberedValue = $composer.rememberedValue();
            if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.SearchScreenKt$$ExternalSyntheticLambda7
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return SearchScreenKt.SearchScreen$lambda$14$lambda$13$lambda$12$lambda$11(NavHostController.this);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            IconButtonKt.IconButton((Function0) rememberedValue, null, false, null, null, ComposableSingletons$SearchScreenKt.INSTANCE.getLambda$909937556$app_debug(), $composer, ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 30);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SearchScreen$lambda$14$lambda$13$lambda$12$lambda$11(NavHostController $navController) {
        $navController.popBackStack();
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SearchScreen$lambda$20(final State $results$delegate, final NavHostController $navController, PaddingValues padding, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(padding, "padding");
        ComposerKt.sourceInformation($composer, "C58@2326L924,54@2141L1109:SearchScreen.kt#4cebsy");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer.changed(padding) ? 4 : 2;
        }
        if ($composer.shouldExecute(($dirty & 19) != 18, $dirty & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1078102202, $dirty, -1, "com.hardlineforge.lala.ui.screens.SearchScreen.<anonymous> (SearchScreen.kt:54)");
            }
            Modifier padding2 = PaddingKt.padding(Modifier.Companion, padding);
            PaddingValues m986PaddingValues0680j_4 = PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(16));
            Arrangement.HorizontalOrVertical m874spacedBy0680j_4 = Arrangement.INSTANCE.m874spacedBy0680j_4(Dp.m6873constructorimpl(12));
            ComposerKt.sourceInformationMarkerStart($composer, -969090270, "CC(remember):SearchScreen.kt#9igjgp");
            boolean changed = $composer.changed($results$delegate) | $composer.changedInstance($navController);
            Object rememberedValue = $composer.rememberedValue();
            if (changed || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function1() { // from class: com.hardlineforge.lala.ui.screens.SearchScreenKt$$ExternalSyntheticLambda3
                    @Override // kotlin.jvm.functions.Function1
                    public final Object invoke(Object obj2) {
                        return SearchScreenKt.SearchScreen$lambda$20$lambda$19$lambda$18(State.this, $navController, (LazyListScope) obj2);
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
    public static final Unit SearchScreen$lambda$20$lambda$19$lambda$18(State $results$delegate, final NavHostController $navController, LazyListScope LazyColumn) {
        Intrinsics.checkNotNullParameter(LazyColumn, "$this$LazyColumn");
        final List SearchScreen$lambda$0 = SearchScreen$lambda$0($results$delegate);
        final Function1 function1 = new Function1() { // from class: com.hardlineforge.lala.ui.screens.SearchScreenKt$$ExternalSyntheticLambda4
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return SearchScreenKt.SearchScreen$lambda$20$lambda$19$lambda$18$lambda$15((LogEntry) obj);
            }
        };
        final Function1 function12 = new Function1() { // from class: com.hardlineforge.lala.ui.screens.SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object p1) {
                return invoke((LogEntry) p1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Void invoke(LogEntry logEntry) {
                return null;
            }
        };
        LazyColumn.items(SearchScreen$lambda$0.size(), new Function1<Integer, Object>() { // from class: com.hardlineforge.lala.ui.screens.SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Integer num) {
                return invoke(num.intValue());
            }

            public final Object invoke(int index) {
                return Function1.this.invoke(SearchScreen$lambda$0.get(index));
            }
        }, new Function1<Integer, Object>() { // from class: com.hardlineforge.lala.ui.screens.SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$3
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Integer num) {
                return invoke(num.intValue());
            }

            public final Object invoke(int index) {
                return Function1.this.invoke(SearchScreen$lambda$0.get(index));
            }
        }, ComposableLambdaKt.composableLambdaInstance(-632812321, true, new Function4<LazyItemScope, Integer, Composer, Integer, Unit>() { // from class: com.hardlineforge.lala.ui.screens.SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$4
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
                int i = $dirty & 14;
                final LogEntry logEntry = (LogEntry) SearchScreen$lambda$0.get(it);
                $composer.startReplaceGroup(-198853267);
                ComposerKt.sourceInformation($composer, "C*63@2520L54,64@2618L6,65@2649L577,60@2399L827:SearchScreen.kt#4cebsy");
                Modifier fillMaxWidth$default = SizeKt.fillMaxWidth$default(Modifier.Companion, 0.0f, 1, null);
                ComposerKt.sourceInformationMarkerStart($composer, -422053519, "CC(remember):SearchScreen.kt#9igjgp");
                boolean changedInstance = $composer.changedInstance($navController) | $composer.changedInstance(logEntry);
                Object rememberedValue = $composer.rememberedValue();
                if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                    final NavHostController navHostController = $navController;
                    Object obj = (Function0) new Function0<Unit>() { // from class: com.hardlineforge.lala.ui.screens.SearchScreenKt$SearchScreen$3$1$1$2$1$1
                        @Override // kotlin.jvm.functions.Function0
                        public /* bridge */ /* synthetic */ Unit invoke() {
                            invoke2();
                            return Unit.INSTANCE;
                        }

                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                        public final void invoke2() {
                            NavController.navigate$default(NavHostController.this, "entry_detail/" + logEntry.getId(), null, null, 6, null);
                        }
                    };
                    $composer.updateRememberedValue(obj);
                    rememberedValue = obj;
                }
                ComposerKt.sourceInformationMarkerEnd($composer);
                CardKt.Card(ClickableKt.m536clickableXHw0xAI$default(fillMaxWidth$default, false, null, null, (Function0) rememberedValue, 7, null), MaterialTheme.INSTANCE.getShapes($composer, MaterialTheme.$stable).getLarge(), null, null, null, ComposableLambdaKt.rememberComposableLambda(768085321, true, new Function3<ColumnScope, Composer, Integer, Unit>() { // from class: com.hardlineforge.lala.ui.screens.SearchScreenKt$SearchScreen$3$1$1$2$2
                    @Override // kotlin.jvm.functions.Function3
                    public /* bridge */ /* synthetic */ Unit invoke(ColumnScope columnScope, Composer composer, Integer num) {
                        invoke(columnScope, composer, num.intValue());
                        return Unit.INSTANCE;
                    }

                    public final void invoke(ColumnScope Card, Composer $composer2, int $changed2) {
                        Function0<ComposeUiNode> function0;
                        Intrinsics.checkNotNullParameter(Card, "$this$Card");
                        ComposerKt.sourceInformation($composer2, "C66@2671L537:SearchScreen.kt#4cebsy");
                        if (!$composer2.shouldExecute(($changed2 & 17) != 16, $changed2 & 1)) {
                            $composer2.skipToGroupEnd();
                            return;
                        }
                        if (ComposerKt.isTraceInProgress()) {
                            ComposerKt.traceEventStart(768085321, $changed2, -1, "com.hardlineforge.lala.ui.screens.SearchScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (SearchScreen.kt:66)");
                        }
                        Modifier m993padding3ABfNKs = PaddingKt.m993padding3ABfNKs(Modifier.Companion, Dp.m6873constructorimpl(16));
                        LogEntry logEntry2 = LogEntry.this;
                        ComposerKt.sourceInformationMarkerStart($composer2, -483455358, "CC(Column)P(2,3,1)87@4442L61,88@4508L133:Column.kt#2w3rfo");
                        MeasurePolicy columnMeasurePolicy = ColumnKt.columnMeasurePolicy(Arrangement.INSTANCE.getTop(), Alignment.Companion.getStart(), $composer2, ((6 >> 3) & 14) | ((6 >> 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS));
                        int i2 = (6 << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS;
                        ComposerKt.sourceInformationMarkerStart($composer2, -1323940314, "CC(Layout)P(!1,2)79@3206L23,82@3357L359:Layout.kt#80mrfh");
                        int currentCompositeKeyHash = ComposablesKt.getCurrentCompositeKeyHash($composer2, 0);
                        CompositionLocalMap currentCompositionLocalMap = $composer2.getCurrentCompositionLocalMap();
                        Modifier materializeModifier = ComposedModifierKt.materializeModifier($composer2, m993padding3ABfNKs);
                        Function0<ComposeUiNode> constructor = ComposeUiNode.Companion.getConstructor();
                        int i3 = ((i2 << 6) & 896) | 6;
                        ComposerKt.sourceInformationMarkerStart($composer2, -692256719, "CC(ReusableComposeNode)P(1,2)355@14017L9:Composables.kt#9igjgp");
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
                        Composer m3731constructorimpl = Updater.m3731constructorimpl($composer2);
                        Updater.m3738setimpl(m3731constructorimpl, columnMeasurePolicy, ComposeUiNode.Companion.getSetMeasurePolicy());
                        Updater.m3738setimpl(m3731constructorimpl, currentCompositionLocalMap, ComposeUiNode.Companion.getSetResolvedCompositionLocals());
                        Function2 setCompositeKeyHash = ComposeUiNode.Companion.getSetCompositeKeyHash();
                        if (m3731constructorimpl.getInserting() || !Intrinsics.areEqual(m3731constructorimpl.rememberedValue(), Integer.valueOf(currentCompositeKeyHash))) {
                            m3731constructorimpl.updateRememberedValue(Integer.valueOf(currentCompositeKeyHash));
                            m3731constructorimpl.apply(Integer.valueOf(currentCompositeKeyHash), setCompositeKeyHash);
                        }
                        Updater.m3738setimpl(m3731constructorimpl, materializeModifier, ComposeUiNode.Companion.getSetModifier());
                        int i4 = (i3 >> 6) & 14;
                        ComposerKt.sourceInformationMarkerStart($composer2, -384672921, "C89@4556L9:Column.kt#2w3rfo");
                        ColumnScopeInstance columnScopeInstance = ColumnScopeInstance.INSTANCE;
                        int i5 = ((6 >> 6) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | 6;
                        ComposerKt.sourceInformationMarkerStart($composer2, 862926546, "C69@2847L10,70@2921L11,67@2740L226,74@3097L10,72@2991L195:SearchScreen.kt#4cebsy");
                        TextKt.m2743Text4IGK_g(logEntry2.getCategory(), (Modifier) null, MaterialTheme.INSTANCE.getColorScheme($composer2, MaterialTheme.$stable).m1960getPrimary0d7_KjU(), 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, MaterialTheme.INSTANCE.getTypography($composer2, MaterialTheme.$stable).getLabelMedium(), $composer2, 0, 0, 65530);
                        TextKt.m2743Text4IGK_g(logEntry2.getComment(), (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 2, 0, (Function1<? super TextLayoutResult, Unit>) null, MaterialTheme.INSTANCE.getTypography($composer2, MaterialTheme.$stable).getBodyMedium(), $composer2, 0, 3072, 57342);
                        ComposerKt.sourceInformationMarkerEnd($composer2);
                        ComposerKt.sourceInformationMarkerEnd($composer2);
                        $composer2.endNode();
                        ComposerKt.sourceInformationMarkerEnd($composer2);
                        ComposerKt.sourceInformationMarkerEnd($composer2);
                        ComposerKt.sourceInformationMarkerEnd($composer2);
                        if (ComposerKt.isTraceInProgress()) {
                            ComposerKt.traceEventEnd();
                        }
                    }
                }, $composer, 54), $composer, ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 28);
                $composer.endReplaceGroup();
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventEnd();
                }
            }
        }));
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Object SearchScreen$lambda$20$lambda$19$lambda$18$lambda$15(LogEntry it) {
        Intrinsics.checkNotNullParameter(it, "it");
        return it.getId();
    }
}
