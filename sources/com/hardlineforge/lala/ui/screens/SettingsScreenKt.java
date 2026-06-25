package com.hardlineforge.lala.ui.screens;

import androidx.compose.foundation.BorderStroke;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.material3.MaterialTheme;
import androidx.compose.material3.SegmentedButtonColors;
import androidx.compose.material3.SegmentedButtonKt;
import androidx.compose.material3.SingleChoiceSegmentedButtonRowScope;
import androidx.compose.material3.TextKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.Shape;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import com.hardlineforge.lala.data.CustomCategory;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import java.util.List;
import java.util.Locale;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: SettingsScreen.kt */
@Metadata(d1 = {"\u0000&\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\u001a\u0017\u0010\u0000\u001a\u00020\u00012\b\b\u0002\u0010\u0002\u001a\u00020\u0003H\u0007¢\u0006\u0002\u0010\u0004¨\u0006\u0005²\u0006\n\u0010\u0006\u001a\u00020\u0007X\u008a\u008e\u0002²\u0006\n\u0010\b\u001a\u00020\tX\u008a\u008e\u0002²\u0006\n\u0010\n\u001a\u00020\tX\u008a\u008e\u0002²\u0006\u0010\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\r0\fX\u008a\u0084\u0002"}, d2 = {"SettingsScreen", "", "vm", "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;", "(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V", "app_debug", "darkMode", "", "fontSize", "", "accentColor", "cats", "", "Lcom/hardlineforge/lala/data/CustomCategory;"}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class SettingsScreenKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SettingsScreen$lambda$34(LalaViewModel lalaViewModel, int i, int i2, Composer composer, int i3) {
        SettingsScreen(lalaViewModel, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1), i2);
        return Unit.INSTANCE;
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x0694  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x0818  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x0824  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x08b0  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x037a  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0386  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x038c  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x046c  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x047a  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x057a  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x05df  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void SettingsScreen(com.hardlineforge.lala.ui.viewmodel.LalaViewModel r95, androidx.compose.runtime.Composer r96, final int r97, final int r98) {
        /*
            Method dump skipped, instructions count: 2255
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.SettingsScreenKt.SettingsScreen(com.hardlineforge.lala.ui.viewmodel.LalaViewModel, androidx.compose.runtime.Composer, int, int):void");
    }

    private static final boolean SettingsScreen$lambda$1(MutableState<Boolean> mutableState) {
        return mutableState.getValue().booleanValue();
    }

    private static final void SettingsScreen$lambda$2(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    private static final String SettingsScreen$lambda$4(MutableState<String> mutableState) {
        return mutableState.getValue();
    }

    private static final String SettingsScreen$lambda$7(MutableState<String> mutableState) {
        return mutableState.getValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SettingsScreen$lambda$33$lambda$11$lambda$10$lambda$9(MutableState $darkMode$delegate, boolean it) {
        SettingsScreen$lambda$2($darkMode$delegate, it);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SettingsScreen$lambda$33$lambda$17(final MutableState $fontSize$delegate, SingleChoiceSegmentedButtonRowScope $this$SingleChoiceSegmentedButtonRow, Composer $composer, int $changed) {
        SingleChoiceSegmentedButtonRowScope SingleChoiceSegmentedButtonRow = $this$SingleChoiceSegmentedButtonRow;
        Composer composer = $composer;
        Intrinsics.checkNotNullParameter(SingleChoiceSegmentedButtonRow, "$this$SingleChoiceSegmentedButtonRow");
        ComposerKt.sourceInformation(composer, "C*32@1534L19,33@1597L6,34@1629L50,30@1438L241:SettingsScreen.kt#4cebsy");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= composer.changed(SingleChoiceSegmentedButtonRow) ? 4 : 2;
        }
        int $dirty2 = $dirty;
        boolean z = true;
        if (!composer.shouldExecute(($dirty2 & 19) != 18, $dirty2 & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-2145292849, $dirty2, -1, "com.hardlineforge.lala.ui.screens.SettingsScreen.<anonymous>.<anonymous> (SettingsScreen.kt:29)");
            }
            for (final String str : CollectionsKt.listOf((Object[]) new String[]{"small", "default", "large", "xlarge"})) {
                boolean areEqual = Intrinsics.areEqual(SettingsScreen$lambda$4($fontSize$delegate), str);
                ComposerKt.sourceInformationMarkerStart(composer, 1564795666, "CC(remember):SettingsScreen.kt#9igjgp");
                boolean changed = composer.changed(str);
                Object rememberedValue = $composer.rememberedValue();
                if (changed || rememberedValue == Composer.Companion.getEmpty()) {
                    Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.SettingsScreenKt$$ExternalSyntheticLambda9
                        @Override // kotlin.jvm.functions.Function0
                        public final Object invoke() {
                            return SettingsScreenKt.SettingsScreen$lambda$33$lambda$17$lambda$16$lambda$13$lambda$12(str, $fontSize$delegate);
                        }
                    };
                    $composer.updateRememberedValue(obj);
                    rememberedValue = obj;
                }
                ComposerKt.sourceInformationMarkerEnd(composer);
                SegmentedButtonKt.SegmentedButton(SingleChoiceSegmentedButtonRow, areEqual, (Function0<Unit>) rememberedValue, (Shape) MaterialTheme.INSTANCE.getShapes(composer, MaterialTheme.$stable).getMedium(), (Modifier) null, false, (SegmentedButtonColors) null, (BorderStroke) null, (MutableInteractionSource) null, (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) ComposableLambdaKt.rememberComposableLambda(1768850639, z, new Function2() { // from class: com.hardlineforge.lala.ui.screens.SettingsScreenKt$$ExternalSyntheticLambda10
                    @Override // kotlin.jvm.functions.Function2
                    public final Object invoke(Object obj2, Object obj3) {
                        return SettingsScreenKt.SettingsScreen$lambda$33$lambda$17$lambda$16$lambda$15(str, (Composer) obj2, ((Integer) obj3).intValue());
                    }
                }, composer, 54), composer, $dirty2 & 14, 6, (int) TypedValues.PositionType.TYPE_PERCENT_HEIGHT);
                SingleChoiceSegmentedButtonRow = $this$SingleChoiceSegmentedButtonRow;
                composer = $composer;
                z = z;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SettingsScreen$lambda$33$lambda$17$lambda$16$lambda$13$lambda$12(String $size, MutableState $fontSize$delegate) {
        $fontSize$delegate.setValue($size);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SettingsScreen$lambda$33$lambda$17$lambda$16$lambda$15(String $size, Composer $composer, int $changed) {
        String str;
        ComposerKt.sourceInformation($composer, "C34@1631L46:SettingsScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1768850639, $changed, -1, "com.hardlineforge.lala.ui.screens.SettingsScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous> (SettingsScreen.kt:34)");
            }
            if ($size.length() > 0) {
                StringBuilder sb = new StringBuilder();
                String valueOf = String.valueOf($size.charAt(0));
                Intrinsics.checkNotNull(valueOf, "null cannot be cast to non-null type java.lang.String");
                String upperCase = valueOf.toUpperCase(Locale.ROOT);
                Intrinsics.checkNotNullExpressionValue(upperCase, "toUpperCase(...)");
                StringBuilder append = sb.append((Object) upperCase);
                String substring = $size.substring(1);
                Intrinsics.checkNotNullExpressionValue(substring, "substring(...)");
                str = append.append(substring).toString();
            } else {
                str = $size;
            }
            TextKt.m2743Text4IGK_g(str, (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 0, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SettingsScreen$lambda$33$lambda$23(final MutableState $accentColor$delegate, SingleChoiceSegmentedButtonRowScope $this$SingleChoiceSegmentedButtonRow, Composer $composer, int $changed) {
        SingleChoiceSegmentedButtonRowScope SingleChoiceSegmentedButtonRow = $this$SingleChoiceSegmentedButtonRow;
        Composer composer = $composer;
        Intrinsics.checkNotNullParameter(SingleChoiceSegmentedButtonRow, "$this$SingleChoiceSegmentedButtonRow");
        ComposerKt.sourceInformation(composer, "C*43@2011L23,44@2078L6,45@2110L51,41@1911L250:SettingsScreen.kt#4cebsy");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= composer.changed(SingleChoiceSegmentedButtonRow) ? 4 : 2;
        }
        int $dirty2 = $dirty;
        boolean z = true;
        if (!composer.shouldExecute(($dirty2 & 19) != 18, $dirty2 & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-2098880072, $dirty2, -1, "com.hardlineforge.lala.ui.screens.SettingsScreen.<anonymous>.<anonymous> (SettingsScreen.kt:40)");
            }
            for (final String str : CollectionsKt.listOf((Object[]) new String[]{"blue", "green", "purple", "orange"})) {
                boolean areEqual = Intrinsics.areEqual(SettingsScreen$lambda$7($accentColor$delegate), str);
                ComposerKt.sourceInformationMarkerStart(composer, -329575073, "CC(remember):SettingsScreen.kt#9igjgp");
                boolean changed = composer.changed(str);
                Object rememberedValue = $composer.rememberedValue();
                if (changed || rememberedValue == Composer.Companion.getEmpty()) {
                    Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.SettingsScreenKt$$ExternalSyntheticLambda0
                        @Override // kotlin.jvm.functions.Function0
                        public final Object invoke() {
                            return SettingsScreenKt.SettingsScreen$lambda$33$lambda$23$lambda$22$lambda$19$lambda$18(str, $accentColor$delegate);
                        }
                    };
                    $composer.updateRememberedValue(obj);
                    rememberedValue = obj;
                }
                ComposerKt.sourceInformationMarkerEnd(composer);
                SegmentedButtonKt.SegmentedButton(SingleChoiceSegmentedButtonRow, areEqual, (Function0<Unit>) rememberedValue, (Shape) MaterialTheme.INSTANCE.getShapes(composer, MaterialTheme.$stable).getMedium(), (Modifier) null, false, (SegmentedButtonColors) null, (BorderStroke) null, (MutableInteractionSource) null, (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) ComposableLambdaKt.rememberComposableLambda(1296627896, z, new Function2() { // from class: com.hardlineforge.lala.ui.screens.SettingsScreenKt$$ExternalSyntheticLambda1
                    @Override // kotlin.jvm.functions.Function2
                    public final Object invoke(Object obj2, Object obj3) {
                        return SettingsScreenKt.SettingsScreen$lambda$33$lambda$23$lambda$22$lambda$21(str, (Composer) obj2, ((Integer) obj3).intValue());
                    }
                }, composer, 54), composer, $dirty2 & 14, 6, (int) TypedValues.PositionType.TYPE_PERCENT_HEIGHT);
                SingleChoiceSegmentedButtonRow = $this$SingleChoiceSegmentedButtonRow;
                composer = $composer;
                z = z;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SettingsScreen$lambda$33$lambda$23$lambda$22$lambda$19$lambda$18(String $color, MutableState $accentColor$delegate) {
        $accentColor$delegate.setValue($color);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SettingsScreen$lambda$33$lambda$23$lambda$22$lambda$21(String $color, Composer $composer, int $changed) {
        String str;
        ComposerKt.sourceInformation($composer, "C45@2112L47:SettingsScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1296627896, $changed, -1, "com.hardlineforge.lala.ui.screens.SettingsScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous> (SettingsScreen.kt:45)");
            }
            if ($color.length() > 0) {
                StringBuilder sb = new StringBuilder();
                String valueOf = String.valueOf($color.charAt(0));
                Intrinsics.checkNotNull(valueOf, "null cannot be cast to non-null type java.lang.String");
                String upperCase = valueOf.toUpperCase(Locale.ROOT);
                Intrinsics.checkNotNullExpressionValue(upperCase, "toUpperCase(...)");
                StringBuilder append = sb.append((Object) upperCase);
                String substring = $color.substring(1);
                Intrinsics.checkNotNullExpressionValue(substring, "substring(...)");
                str = append.append(substring).toString();
            } else {
                str = $color;
            }
            TextKt.m2743Text4IGK_g(str, (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 0, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    private static final List<CustomCategory> SettingsScreen$lambda$33$lambda$28(State<? extends List<CustomCategory>> state) {
        return (List) state.getValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit SettingsScreen$lambda$33$lambda$32$lambda$31$lambda$30$lambda$29(LalaViewModel $vm, CustomCategory $cat) {
        $vm.deleteCustomCategory($cat);
        return Unit.INSTANCE;
    }
}
