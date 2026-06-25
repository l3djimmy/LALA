package androidx.compose.material3;

import androidx.compose.animation.core.AnimateAsStateKt;
import androidx.compose.animation.core.AnimationSpec;
import androidx.compose.foundation.layout.OffsetKt;
import androidx.compose.foundation.layout.SizeKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.Alignment;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.Dp;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntOffsetKt;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Lambda;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: TabRow.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0001H\u000b¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"<anonymous>", "Landroidx/compose/ui/Modifier;", "invoke", "(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/Modifier;"}, k = 3, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class TabRowDefaults$tabIndicatorOffset$2 extends Lambda implements Function3<Modifier, Composer, Integer, Modifier> {
    final /* synthetic */ TabPosition $currentTabPosition;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public TabRowDefaults$tabIndicatorOffset$2(TabPosition tabPosition) {
        super(3);
        this.$currentTabPosition = tabPosition;
    }

    @Override // kotlin.jvm.functions.Function3
    public /* bridge */ /* synthetic */ Modifier invoke(Modifier modifier, Composer composer, Integer num) {
        return invoke(modifier, composer, num.intValue());
    }

    private static final float invoke$lambda$0(State<Dp> state) {
        return state.getValue().m6887unboximpl();
    }

    public final Modifier invoke(Modifier $this$composed, Composer $composer, int $changed) {
        AnimationSpec animationSpec;
        AnimationSpec animationSpec2;
        Object value$iv;
        $composer.startReplaceGroup(-1541271084);
        ComposerKt.sourceInformation($composer, "C1272@54128L151,1277@54331L150,1283@54589L53:TabRow.kt#uh7d8r");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-1541271084, $changed, -1, "androidx.compose.material3.TabRowDefaults.tabIndicatorOffset.<anonymous> (TabRow.kt:1271)");
        }
        float m2635getWidthD9Ej5fM = this.$currentTabPosition.m2635getWidthD9Ej5fM();
        animationSpec = TabRowKt.TabRowIndicatorSpec;
        State currentTabWidth$delegate = AnimateAsStateKt.m392animateDpAsStateAjpBEmI(m2635getWidthD9Ej5fM, animationSpec, null, null, $composer, 0, 12);
        float m2633getLeftD9Ej5fM = this.$currentTabPosition.m2633getLeftD9Ej5fM();
        animationSpec2 = TabRowKt.TabRowIndicatorSpec;
        final State indicatorOffset$delegate = AnimateAsStateKt.m392animateDpAsStateAjpBEmI(m2633getLeftD9Ej5fM, animationSpec2, null, null, $composer, 0, 12);
        Modifier wrapContentSize$default = SizeKt.wrapContentSize$default(SizeKt.fillMaxWidth$default($this$composed, 0.0f, 1, null), Alignment.Companion.getBottomStart(), false, 2, null);
        ComposerKt.sourceInformationMarkerStart($composer, -1825070699, "CC(remember):TabRow.kt#9igjgp");
        boolean invalid$iv = $composer.changed(indicatorOffset$delegate);
        Object it$iv = $composer.rememberedValue();
        if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
            Object value$iv2 = (Function1) new Function1<Density, IntOffset>() { // from class: androidx.compose.material3.TabRowDefaults$tabIndicatorOffset$2$1$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ IntOffset invoke(Density density) {
                    return IntOffset.m6992boximpl(m2640invokeBjo55l4(density));
                }

                /* renamed from: invoke-Bjo55l4  reason: not valid java name */
                public final long m2640invokeBjo55l4(Density $this$offset) {
                    float invoke$lambda$1;
                    invoke$lambda$1 = TabRowDefaults$tabIndicatorOffset$2.invoke$lambda$1(indicatorOffset$delegate);
                    return IntOffsetKt.IntOffset($this$offset.mo638roundToPx0680j_4(invoke$lambda$1), 0);
                }
            };
            $composer.updateRememberedValue(value$iv2);
            value$iv = value$iv2;
        } else {
            value$iv = it$iv;
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        Modifier m1045width3ABfNKs = SizeKt.m1045width3ABfNKs(OffsetKt.offset(wrapContentSize$default, (Function1) value$iv), invoke$lambda$0(currentTabWidth$delegate));
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        $composer.endReplaceGroup();
        return m1045width3ABfNKs;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final float invoke$lambda$1(State<Dp> state) {
        return state.getValue().m6887unboximpl();
    }
}
