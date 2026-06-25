package androidx.compose.material3;

import androidx.autofill.HintConstants;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.saveable.RememberSaveableKt;
import androidx.compose.runtime.saveable.Saver;
import androidx.compose.ui.platform.CompositionLocalsKt;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.Dp;
import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
/* compiled from: SwipeToDismissBox.kt */
@Metadata(d1 = {"\u0000J\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\u0018\u0002\n\u0002\b\u0004\u001ay\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u001c\u0010\u0007\u001a\u0018\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00040\b¢\u0006\u0002\b\n¢\u0006\u0002\b\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u000f2\b\b\u0002\u0010\u0011\u001a\u00020\u000f2\u001c\u0010\u0012\u001a\u0018\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00040\b¢\u0006\u0002\b\n¢\u0006\u0002\b\u000bH\u0007¢\u0006\u0002\u0010\u0013\u001aR\u0010\u0014\u001a\u00020\u00062\b\b\u0002\u0010\u0015\u001a\u00020\u00162\u0014\b\u0002\u0010\u0017\u001a\u000e\u0012\u0004\u0012\u00020\u0016\u0012\u0004\u0012\u00020\u000f0\b2#\b\u0002\u0010\u0018\u001a\u001d\u0012\u0013\u0012\u00110\u0019¢\u0006\f\b\u001a\u0012\b\b\u001b\u0012\u0004\b\b(\u001c\u0012\u0004\u0012\u00020\u00190\bH\u0007¢\u0006\u0002\u0010\u001d\"\u0010\u0010\u0000\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0002¨\u0006\u001e"}, d2 = {"DismissVelocityThreshold", "Landroidx/compose/ui/unit/Dp;", "F", "SwipeToDismissBox", "", "state", "Landroidx/compose/material3/SwipeToDismissBoxState;", "backgroundContent", "Lkotlin/Function1;", "Landroidx/compose/foundation/layout/RowScope;", "Landroidx/compose/runtime/Composable;", "Lkotlin/ExtensionFunctionType;", "modifier", "Landroidx/compose/ui/Modifier;", "enableDismissFromStartToEnd", "", "enableDismissFromEndToStart", "gesturesEnabled", "content", "(Landroidx/compose/material3/SwipeToDismissBoxState;Lkotlin/jvm/functions/Function3;Landroidx/compose/ui/Modifier;ZZZLkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V", "rememberSwipeToDismissBoxState", "initialValue", "Landroidx/compose/material3/SwipeToDismissBoxValue;", "confirmValueChange", "positionalThreshold", "", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "totalDistance", "(Landroidx/compose/material3/SwipeToDismissBoxValue;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)Landroidx/compose/material3/SwipeToDismissBoxState;", "material3_release"}, k = 2, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SwipeToDismissBoxKt {
    private static final float DismissVelocityThreshold = Dp.m6873constructorimpl((float) Property.OBJECT_FIT);

    public static final /* synthetic */ float access$getDismissVelocityThreshold$p() {
        return DismissVelocityThreshold;
    }

    public static final SwipeToDismissBoxState rememberSwipeToDismissBoxState(final SwipeToDismissBoxValue initialValue, final Function1<? super SwipeToDismissBoxValue, Boolean> function1, final Function1<? super Float, Float> function12, Composer $composer, int $changed, int i) {
        Object value$iv;
        ComposerKt.sourceInformationMarkerStart($composer, -246335487, "C(rememberSwipeToDismissBoxState)P(1)185@7607L19,187@7687L7,195@7929L102,188@7706L325:SwipeToDismissBox.kt#uh7d8r");
        if ((i & 1) != 0) {
            initialValue = SwipeToDismissBoxValue.Settled;
        }
        if ((i & 2) != 0) {
            Function1 confirmValueChange = new Function1<SwipeToDismissBoxValue, Boolean>() { // from class: androidx.compose.material3.SwipeToDismissBoxKt$rememberSwipeToDismissBoxState$1
                @Override // kotlin.jvm.functions.Function1
                public final Boolean invoke(SwipeToDismissBoxValue it) {
                    return true;
                }
            };
            function1 = confirmValueChange;
        }
        if ((i & 4) != 0) {
            function12 = SwipeToDismissBoxDefaults.INSTANCE.getPositionalThreshold($composer, 6);
        }
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-246335487, $changed, -1, "androidx.compose.material3.rememberSwipeToDismissBoxState (SwipeToDismissBox.kt:186)");
        }
        ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC:CompositionLocal.kt#9igjgp");
        Object consume = $composer.consume(CompositionLocalsKt.getLocalDensity());
        ComposerKt.sourceInformationMarkerEnd($composer);
        final Density density = (Density) consume;
        Object[] objArr = new Object[0];
        Saver<SwipeToDismissBoxState, SwipeToDismissBoxValue> Saver = SwipeToDismissBoxState.Companion.Saver(function1, function12, density);
        ComposerKt.sourceInformationMarkerStart($composer, -1333458863, "CC(remember):SwipeToDismissBox.kt#9igjgp");
        boolean invalid$iv = (((($changed & 896) ^ 384) > 256 && $composer.changed(function12)) || ($changed & 384) == 256) | (((6 ^ ($changed & 14)) > 4 && $composer.changed(initialValue)) || ($changed & 6) == 4) | $composer.changed(density) | (((($changed & Property.BORDER_BOTTOM_RIGHT_RADIUS) ^ 48) > 32 && $composer.changed(function1)) || ($changed & 48) == 32);
        Object it$iv = $composer.rememberedValue();
        if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
            Object value$iv2 = (Function0) new Function0<SwipeToDismissBoxState>() { // from class: androidx.compose.material3.SwipeToDismissBoxKt$rememberSwipeToDismissBoxState$2$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(0);
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // kotlin.jvm.functions.Function0
                public final SwipeToDismissBoxState invoke() {
                    return new SwipeToDismissBoxState(SwipeToDismissBoxValue.this, density, function1, function12);
                }
            };
            $composer.updateRememberedValue(value$iv2);
            value$iv = value$iv2;
        } else {
            value$iv = it$iv;
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        SwipeToDismissBoxState swipeToDismissBoxState = (SwipeToDismissBoxState) RememberSaveableKt.m3846rememberSaveable(objArr, Saver, (String) null, (Function0<? extends Object>) value$iv, $composer, 0, 4);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return swipeToDismissBoxState;
    }

    /* JADX WARN: Removed duplicated region for block: B:263:0x00f8  */
    /* JADX WARN: Removed duplicated region for block: B:264:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:266:0x0103  */
    /* JADX WARN: Removed duplicated region for block: B:268:0x0107  */
    /* JADX WARN: Removed duplicated region for block: B:270:0x010b  */
    /* JADX WARN: Removed duplicated region for block: B:271:0x010d  */
    /* JADX WARN: Removed duplicated region for block: B:274:0x0114  */
    /* JADX WARN: Removed duplicated region for block: B:277:0x0139  */
    /* JADX WARN: Removed duplicated region for block: B:278:0x013b  */
    /* JADX WARN: Removed duplicated region for block: B:287:0x01bc  */
    /* JADX WARN: Removed duplicated region for block: B:290:0x01c8  */
    /* JADX WARN: Removed duplicated region for block: B:291:0x01ce  */
    /* JADX WARN: Removed duplicated region for block: B:302:0x02db  */
    /* JADX WARN: Removed duplicated region for block: B:305:0x02e7  */
    /* JADX WARN: Removed duplicated region for block: B:306:0x02ed  */
    /* JADX WARN: Removed duplicated region for block: B:309:0x0320  */
    /* JADX WARN: Removed duplicated region for block: B:313:0x0336 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:317:0x03a2  */
    /* JADX WARN: Removed duplicated region for block: B:318:0x03a4  */
    /* JADX WARN: Removed duplicated region for block: B:321:0x03b2  */
    /* JADX WARN: Removed duplicated region for block: B:322:0x03b4  */
    /* JADX WARN: Removed duplicated region for block: B:325:0x03bb  */
    /* JADX WARN: Removed duplicated region for block: B:326:0x03bd  */
    /* JADX WARN: Removed duplicated region for block: B:329:0x03cb  */
    /* JADX WARN: Removed duplicated region for block: B:333:0x03d9  */
    /* JADX WARN: Removed duplicated region for block: B:337:0x0458  */
    /* JADX WARN: Removed duplicated region for block: B:340:0x0464  */
    /* JADX WARN: Removed duplicated region for block: B:341:0x046a  */
    /* JADX WARN: Removed duplicated region for block: B:344:0x049b  */
    /* JADX WARN: Removed duplicated region for block: B:348:0x04b1  */
    /* JADX WARN: Removed duplicated region for block: B:352:0x0522  */
    /* JADX WARN: Removed duplicated region for block: B:356:0x0531  */
    /* JADX WARN: Removed duplicated region for block: B:357:0x0546  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void SwipeToDismissBox(final androidx.compose.material3.SwipeToDismissBoxState r55, final kotlin.jvm.functions.Function3<? super androidx.compose.foundation.layout.RowScope, ? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r56, androidx.compose.ui.Modifier r57, boolean r58, boolean r59, boolean r60, final kotlin.jvm.functions.Function3<? super androidx.compose.foundation.layout.RowScope, ? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r61, androidx.compose.runtime.Composer r62, final int r63, final int r64) {
        /*
            Method dump skipped, instructions count: 1353
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.SwipeToDismissBoxKt.SwipeToDismissBox(androidx.compose.material3.SwipeToDismissBoxState, kotlin.jvm.functions.Function3, androidx.compose.ui.Modifier, boolean, boolean, boolean, kotlin.jvm.functions.Function3, androidx.compose.runtime.Composer, int, int):void");
    }
}
