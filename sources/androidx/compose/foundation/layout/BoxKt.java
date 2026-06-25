package androidx.compose.foundation.layout;

import androidx.collection.MutableScatterMap;
import androidx.compose.runtime.Applier;
import androidx.compose.runtime.ComposablesKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.CompositionLocalMap;
import androidx.compose.runtime.Updater;
import androidx.compose.ui.Alignment;
import androidx.compose.ui.ComposedModifierKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasurePolicy;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.node.ComposeUiNode;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.IntSize;
import androidx.compose.ui.unit.LayoutDirection;
import com.itextpdf.layout.properties.Property;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Box.kt */
@Metadata(d1 = {"\u0000d\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\u001a\u0015\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0007¢\u0006\u0002\u0010\u0016\u001aJ\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u0010\u0014\u001a\u00020\u00152\b\b\u0002\u0010\u0017\u001a\u00020\u00022\b\b\u0002\u0010\u0018\u001a\u00020\u000f2\u001c\u0010\u0019\u001a\u0018\u0012\u0004\u0012\u00020\u001b\u0012\u0004\u0012\u00020\u00130\u001a¢\u0006\u0002\b\u001c¢\u0006\u0002\b\u001dH\u0087\b¢\u0006\u0002\u0010\u001e\u001a\u001c\u0010\u001f\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u00012\u0006\u0010 \u001a\u00020\u000fH\u0002\u001a\u0018\u0010!\u001a\u00020\u00032\u0006\u0010\"\u001a\u00020\u00022\u0006\u0010\u0018\u001a\u00020\u000fH\u0001\u001a\u001d\u0010#\u001a\u00020\u00032\u0006\u0010\"\u001a\u00020\u00022\u0006\u0010\u0018\u001a\u00020\u000fH\u0001¢\u0006\u0002\u0010$\u001a<\u0010%\u001a\u00020\u0013*\u00020&2\u0006\u0010'\u001a\u00020(2\u0006\u0010)\u001a\u00020\u000b2\u0006\u0010*\u001a\u00020+2\u0006\u0010,\u001a\u00020-2\u0006\u0010.\u001a\u00020-2\u0006\u0010\"\u001a\u00020\u0002H\u0002\"\u001a\u0010\u0000\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u000e\u0010\u0005\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000\"\u0014\u0010\u0006\u001a\u00020\u0003X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b\"\u001a\u0010\t\u001a\u0004\u0018\u00010\n*\u00020\u000b8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\f\u0010\r\"\u0018\u0010\u000e\u001a\u00020\u000f*\u00020\u000b8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0011¨\u0006/"}, d2 = {"Cache1", "Landroidx/collection/MutableScatterMap;", "Landroidx/compose/ui/Alignment;", "Landroidx/compose/ui/layout/MeasurePolicy;", "Cache2", "DefaultBoxMeasurePolicy", "EmptyBoxMeasurePolicy", "getEmptyBoxMeasurePolicy", "()Landroidx/compose/ui/layout/MeasurePolicy;", "boxChildDataNode", "Landroidx/compose/foundation/layout/BoxChildDataNode;", "Landroidx/compose/ui/layout/Measurable;", "getBoxChildDataNode", "(Landroidx/compose/ui/layout/Measurable;)Landroidx/compose/foundation/layout/BoxChildDataNode;", "matchesParentSize", "", "getMatchesParentSize", "(Landroidx/compose/ui/layout/Measurable;)Z", "Box", "", "modifier", "Landroidx/compose/ui/Modifier;", "(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V", "contentAlignment", "propagateMinConstraints", "content", "Lkotlin/Function1;", "Landroidx/compose/foundation/layout/BoxScope;", "Landroidx/compose/runtime/Composable;", "Lkotlin/ExtensionFunctionType;", "(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;ZLkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V", "cacheFor", "propagate", "maybeCachedBoxMeasurePolicy", "alignment", "rememberBoxMeasurePolicy", "(Landroidx/compose/ui/Alignment;ZLandroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;", "placeInBox", "Landroidx/compose/ui/layout/Placeable$PlacementScope;", "placeable", "Landroidx/compose/ui/layout/Placeable;", "measurable", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "boxWidth", "", "boxHeight", "foundation-layout_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class BoxKt {
    private static final MutableScatterMap<Alignment, MeasurePolicy> Cache1 = cacheFor(true);
    private static final MutableScatterMap<Alignment, MeasurePolicy> Cache2 = cacheFor(false);
    private static final MeasurePolicy DefaultBoxMeasurePolicy = new BoxMeasurePolicy(Alignment.Companion.getTopStart(), false);
    private static final MeasurePolicy EmptyBoxMeasurePolicy = new MeasurePolicy() { // from class: androidx.compose.foundation.layout.BoxKt$EmptyBoxMeasurePolicy$1
        @Override // androidx.compose.ui.layout.MeasurePolicy
        /* renamed from: measure-3p2s80s */
        public final MeasureResult mo300measure3p2s80s(MeasureScope $this$MeasurePolicy, List<? extends Measurable> list, long constraints) {
            return MeasureScope.layout$default($this$MeasurePolicy, Constraints.m6828getMinWidthimpl(constraints), Constraints.m6827getMinHeightimpl(constraints), null, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.layout.BoxKt$EmptyBoxMeasurePolicy$1.1
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(Placeable.PlacementScope placementScope) {
                    invoke2(placementScope);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(Placeable.PlacementScope $this$layout) {
                }
            }, 4, null);
        }
    };

    public static final void Box(Modifier modifier, Alignment contentAlignment, boolean propagateMinConstraints, Function3<? super BoxScope, ? super Composer, ? super Integer, Unit> function3, Composer $composer, int $changed, int i) {
        Modifier.Companion modifier2;
        Alignment contentAlignment2;
        boolean propagateMinConstraints2;
        ComposerKt.sourceInformationMarkerStart($composer, 733328855, "CC(Box)P(2,1,3)71@3423L130:Box.kt#2w3rfo");
        if ((i & 1) != 0) {
            modifier2 = Modifier.Companion;
        } else {
            modifier2 = modifier;
        }
        if ((i & 2) == 0) {
            contentAlignment2 = contentAlignment;
        } else {
            contentAlignment2 = Alignment.Companion.getTopStart();
        }
        if ((i & 4) == 0) {
            propagateMinConstraints2 = propagateMinConstraints;
        } else {
            propagateMinConstraints2 = false;
        }
        MeasurePolicy measurePolicy = maybeCachedBoxMeasurePolicy(contentAlignment2, propagateMinConstraints2);
        int $changed$iv = ($changed << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS;
        Modifier modifier$iv = modifier2;
        ComposerKt.sourceInformationMarkerStart($composer, -1323940314, "CC(Layout)P(!1,2)79@3206L23,82@3357L359:Layout.kt#80mrfh");
        int compositeKeyHash$iv = ComposablesKt.getCurrentCompositeKeyHash($composer, 0);
        CompositionLocalMap localMap$iv = $composer.getCurrentCompositionLocalMap();
        Modifier materialized$iv = ComposedModifierKt.materializeModifier($composer, modifier$iv);
        Function0 factory$iv$iv = ComposeUiNode.Companion.getConstructor();
        int $changed$iv$iv = (($changed$iv << 6) & 896) | 6;
        ComposerKt.sourceInformationMarkerStart($composer, -692256719, "CC(ReusableComposeNode)P(1,2)355@14017L9:Composables.kt#9igjgp");
        if (!($composer.getApplier() instanceof Applier)) {
            ComposablesKt.invalidApplier();
        }
        $composer.startReusableNode();
        if ($composer.getInserting()) {
            $composer.createNode(factory$iv$iv);
        } else {
            $composer.useNode();
        }
        Composer $this$Layout_u24lambda_u240$iv = Updater.m3731constructorimpl($composer);
        Updater.m3738setimpl($this$Layout_u24lambda_u240$iv, measurePolicy, ComposeUiNode.Companion.getSetMeasurePolicy());
        Updater.m3738setimpl($this$Layout_u24lambda_u240$iv, localMap$iv, ComposeUiNode.Companion.getSetResolvedCompositionLocals());
        Function2 block$iv$iv = ComposeUiNode.Companion.getSetCompositeKeyHash();
        if (!$this$Layout_u24lambda_u240$iv.getInserting() && Intrinsics.areEqual($this$Layout_u24lambda_u240$iv.rememberedValue(), Integer.valueOf(compositeKeyHash$iv))) {
            Updater.m3738setimpl($this$Layout_u24lambda_u240$iv, materialized$iv, ComposeUiNode.Companion.getSetModifier());
            int i2 = ($changed$iv$iv >> 6) & 14;
            ComposerKt.sourceInformationMarkerStart($composer, -2146730711, "C72@3468L9:Box.kt#2w3rfo");
            function3.invoke(BoxScopeInstance.INSTANCE, $composer, Integer.valueOf((($changed >> 6) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | 6));
            ComposerKt.sourceInformationMarkerEnd($composer);
            $composer.endNode();
            ComposerKt.sourceInformationMarkerEnd($composer);
            ComposerKt.sourceInformationMarkerEnd($composer);
            ComposerKt.sourceInformationMarkerEnd($composer);
        }
        $this$Layout_u24lambda_u240$iv.updateRememberedValue(Integer.valueOf(compositeKeyHash$iv));
        $this$Layout_u24lambda_u240$iv.apply(Integer.valueOf(compositeKeyHash$iv), block$iv$iv);
        Updater.m3738setimpl($this$Layout_u24lambda_u240$iv, materialized$iv, ComposeUiNode.Companion.getSetModifier());
        int i22 = ($changed$iv$iv >> 6) & 14;
        ComposerKt.sourceInformationMarkerStart($composer, -2146730711, "C72@3468L9:Box.kt#2w3rfo");
        function3.invoke(BoxScopeInstance.INSTANCE, $composer, Integer.valueOf((($changed >> 6) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | 6));
        ComposerKt.sourceInformationMarkerEnd($composer);
        $composer.endNode();
        ComposerKt.sourceInformationMarkerEnd($composer);
        ComposerKt.sourceInformationMarkerEnd($composer);
        ComposerKt.sourceInformationMarkerEnd($composer);
    }

    private static final MutableScatterMap<Alignment, MeasurePolicy> cacheFor(boolean propagate) {
        MutableScatterMap $this$cacheFor_u24lambda_u241 = new MutableScatterMap(9);
        $this$cacheFor_u24lambda_u241.set(Alignment.Companion.getTopStart(), new BoxMeasurePolicy(Alignment.Companion.getTopStart(), propagate));
        $this$cacheFor_u24lambda_u241.set(Alignment.Companion.getTopCenter(), new BoxMeasurePolicy(Alignment.Companion.getTopCenter(), propagate));
        $this$cacheFor_u24lambda_u241.set(Alignment.Companion.getTopEnd(), new BoxMeasurePolicy(Alignment.Companion.getTopEnd(), propagate));
        $this$cacheFor_u24lambda_u241.set(Alignment.Companion.getCenterStart(), new BoxMeasurePolicy(Alignment.Companion.getCenterStart(), propagate));
        $this$cacheFor_u24lambda_u241.set(Alignment.Companion.getCenter(), new BoxMeasurePolicy(Alignment.Companion.getCenter(), propagate));
        $this$cacheFor_u24lambda_u241.set(Alignment.Companion.getCenterEnd(), new BoxMeasurePolicy(Alignment.Companion.getCenterEnd(), propagate));
        $this$cacheFor_u24lambda_u241.set(Alignment.Companion.getBottomStart(), new BoxMeasurePolicy(Alignment.Companion.getBottomStart(), propagate));
        $this$cacheFor_u24lambda_u241.set(Alignment.Companion.getBottomCenter(), new BoxMeasurePolicy(Alignment.Companion.getBottomCenter(), propagate));
        $this$cacheFor_u24lambda_u241.set(Alignment.Companion.getBottomEnd(), new BoxMeasurePolicy(Alignment.Companion.getBottomEnd(), propagate));
        return $this$cacheFor_u24lambda_u241;
    }

    public static final MeasurePolicy maybeCachedBoxMeasurePolicy(Alignment alignment, boolean propagateMinConstraints) {
        MutableScatterMap cache = propagateMinConstraints ? Cache1 : Cache2;
        MeasurePolicy measurePolicy = cache.get(alignment);
        return measurePolicy == null ? new BoxMeasurePolicy(alignment, propagateMinConstraints) : measurePolicy;
    }

    public static final MeasurePolicy rememberBoxMeasurePolicy(Alignment alignment, boolean propagateMinConstraints, Composer $composer, int $changed) {
        BoxMeasurePolicy boxMeasurePolicy;
        ComposerKt.sourceInformationMarkerStart($composer, 56522820, "C(rememberBoxMeasurePolicy):Box.kt#2w3rfo");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(56522820, $changed, -1, "androidx.compose.foundation.layout.rememberBoxMeasurePolicy (Box.kt:109)");
        }
        if (Intrinsics.areEqual(alignment, Alignment.Companion.getTopStart()) && !propagateMinConstraints) {
            $composer.startReplaceGroup(-1709785313);
            $composer.endReplaceGroup();
            boxMeasurePolicy = DefaultBoxMeasurePolicy;
        } else {
            $composer.startReplaceGroup(-1709737635);
            ComposerKt.sourceInformation($composer, "112@5065L121");
            ComposerKt.sourceInformationMarkerStart($composer, -55152523, "CC(remember):Box.kt#9igjgp");
            boolean invalid$iv = (((($changed & 14) ^ 6) > 4 && $composer.changed(alignment)) || ($changed & 6) == 4) | (((($changed & Property.BORDER_BOTTOM_RIGHT_RADIUS) ^ 48) > 32 && $composer.changed(propagateMinConstraints)) || ($changed & 48) == 32);
            Object it$iv = $composer.rememberedValue();
            if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                Object value$iv = new BoxMeasurePolicy(alignment, propagateMinConstraints);
                $composer.updateRememberedValue(value$iv);
                it$iv = value$iv;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            $composer.endReplaceGroup();
            boxMeasurePolicy = (BoxMeasurePolicy) it$iv;
        }
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return boxMeasurePolicy;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void placeInBox(Placeable.PlacementScope $this$placeInBox, Placeable placeable, Measurable measurable, LayoutDirection layoutDirection, int boxWidth, int boxHeight, Alignment alignment) {
        Alignment alignment2;
        BoxChildDataNode boxChildDataNode = getBoxChildDataNode(measurable);
        if (boxChildDataNode == null || (alignment2 = boxChildDataNode.getAlignment()) == null) {
            alignment2 = alignment;
        }
        Alignment childAlignment = alignment2;
        int width$iv = placeable.getWidth();
        int height$iv = placeable.getHeight();
        long position = childAlignment.mo3865alignKFBX0sM(IntSize.m7039constructorimpl((width$iv << 32) | (height$iv & 4294967295L)), IntSize.m7039constructorimpl((boxWidth << 32) | (boxHeight & 4294967295L)), layoutDirection);
        Placeable.PlacementScope.m5701place70tqf50$default($this$placeInBox, placeable, position, 0.0f, 2, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x00f7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void Box(final androidx.compose.ui.Modifier r19, androidx.compose.runtime.Composer r20, final int r21) {
        /*
            Method dump skipped, instructions count: 275
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.layout.BoxKt.Box(androidx.compose.ui.Modifier, androidx.compose.runtime.Composer, int):void");
    }

    public static final MeasurePolicy getEmptyBoxMeasurePolicy() {
        return EmptyBoxMeasurePolicy;
    }

    private static final BoxChildDataNode getBoxChildDataNode(Measurable $this$boxChildDataNode) {
        Object parentData = $this$boxChildDataNode.getParentData();
        if (parentData instanceof BoxChildDataNode) {
            return (BoxChildDataNode) parentData;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean getMatchesParentSize(Measurable $this$matchesParentSize) {
        BoxChildDataNode boxChildDataNode = getBoxChildDataNode($this$matchesParentSize);
        if (boxChildDataNode != null) {
            return boxChildDataNode.getMatchParentSize();
        }
        return false;
    }
}
