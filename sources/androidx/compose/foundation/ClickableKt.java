package androidx.compose.foundation;

import android.view.KeyEvent;
import androidx.compose.foundation.gestures.ScrollableContainerNode;
import androidx.compose.foundation.interaction.InteractionSourceKt;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.ui.ComposedModifierKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.input.key.Key;
import androidx.compose.ui.input.key.KeyEventType;
import androidx.compose.ui.input.key.KeyEvent_androidKt;
import androidx.compose.ui.node.TraversableNode;
import androidx.compose.ui.node.TraversableNodeKt;
import androidx.compose.ui.platform.InspectableValueKt;
import androidx.compose.ui.platform.InspectorInfo;
import androidx.compose.ui.semantics.Role;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
/* compiled from: Clickable.kt */
@Metadata(d1 = {"\u0000L\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0000\u001aV\u0010\t\u001a\u00020\n*\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u00012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00132\f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00160\u0015ø\u0001\u0000¢\u0006\u0002\b\u0017\u001aB\u0010\t\u001a\u00020\n*\u00020\n2\b\b\u0002\u0010\u000f\u001a\u00020\u00012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00132\f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00160\u0015ø\u0001\u0000¢\u0006\u0002\b\u0018\u001aA\u0010\u0019\u001a\u00020\n*\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000e2\u001e\b\u0004\u0010\u001a\u001a\u0018\u0012\u0006\u0012\u0004\u0018\u00010\f\u0012\u0006\u0012\u0004\u0018\u00010\u001c\u0012\u0004\u0012\u00020\n0\u001bH\u0080\b\u001a\u0088\u0001\u0010\u001d\u001a\u00020\n*\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u00012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u00112\u0010\b\u0002\u0010\u001f\u001a\n\u0012\u0004\u0012\u00020\u0016\u0018\u00010\u00152\u0010\b\u0002\u0010 \u001a\n\u0012\u0004\u0012\u00020\u0016\u0018\u00010\u00152\f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00160\u0015H\u0007ø\u0001\u0000¢\u0006\u0002\b!\u001a\u0090\u0001\u0010\u001d\u001a\u00020\n*\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u00012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u00112\u0010\b\u0002\u0010\u001f\u001a\n\u0012\u0004\u0012\u00020\u0016\u0018\u00010\u00152\u0010\b\u0002\u0010 \u001a\n\u0012\u0004\u0012\u00020\u0016\u0018\u00010\u00152\b\b\u0002\u0010\"\u001a\u00020\u00012\f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00160\u0015ø\u0001\u0000¢\u0006\u0002\b#\u001at\u0010\u001d\u001a\u00020\n*\u00020\n2\b\b\u0002\u0010\u000f\u001a\u00020\u00012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u00112\u0010\b\u0002\u0010\u001f\u001a\n\u0012\u0004\u0012\u00020\u0016\u0018\u00010\u00152\u0010\b\u0002\u0010 \u001a\n\u0012\u0004\u0012\u00020\u0016\u0018\u00010\u00152\f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00160\u0015H\u0007ø\u0001\u0000¢\u0006\u0002\b$\u001a|\u0010\u001d\u001a\u00020\n*\u00020\n2\b\b\u0002\u0010\u000f\u001a\u00020\u00012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u00112\u0010\b\u0002\u0010\u001f\u001a\n\u0012\u0004\u0012\u00020\u0016\u0018\u00010\u00152\u0010\b\u0002\u0010 \u001a\n\u0012\u0004\u0012\u00020\u0016\u0018\u00010\u00152\b\b\u0002\u0010\"\u001a\u00020\u00012\f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00160\u0015ø\u0001\u0000¢\u0006\u0002\b%\u001a\f\u0010&\u001a\u00020\u0001*\u00020'H\u0000\"\u0018\u0010\u0000\u001a\u00020\u0001*\u00020\u00028BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0003\u0010\u0004\"\u0018\u0010\u0005\u001a\u00020\u0001*\u00020\u00028BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0006\u0010\u0004\"\u0018\u0010\u0007\u001a\u00020\u0001*\u00020\u00028BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\b\u0010\u0004\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006("}, d2 = {"isClick", "", "Landroidx/compose/ui/input/key/KeyEvent;", "isClick-ZmokQxo", "(Landroid/view/KeyEvent;)Z", "isEnter", "isEnter-ZmokQxo", "isPress", "isPress-ZmokQxo", "clickable", "Landroidx/compose/ui/Modifier;", "interactionSource", "Landroidx/compose/foundation/interaction/MutableInteractionSource;", "indication", "Landroidx/compose/foundation/Indication;", "enabled", "onClickLabel", "", "role", "Landroidx/compose/ui/semantics/Role;", "onClick", "Lkotlin/Function0;", "", "clickable-O2vRcR0", "clickable-XHw0xAI", "clickableWithIndicationIfNeeded", "createClickable", "Lkotlin/Function2;", "Landroidx/compose/foundation/IndicationNodeFactory;", "combinedClickable", "onLongClickLabel", "onLongClick", "onDoubleClick", "combinedClickable-XVZzFYc", "hapticFeedbackEnabled", "combinedClickable-auXiCPI", "combinedClickable-cJG_KMw", "combinedClickable-f5TDLPQ", "hasScrollableContainer", "Landroidx/compose/ui/node/TraversableNode;", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ClickableKt {
    /* renamed from: clickable-XHw0xAI$default */
    public static /* synthetic */ Modifier m536clickableXHw0xAI$default(Modifier modifier, boolean z, String str, Role role, Function0 function0, int i, Object obj) {
        if ((i & 1) != 0) {
            z = true;
        }
        if ((i & 2) != 0) {
            str = null;
        }
        if ((i & 4) != 0) {
            role = null;
        }
        return m535clickableXHw0xAI(modifier, z, str, role, function0);
    }

    /* renamed from: clickable-XHw0xAI */
    public static final Modifier m535clickableXHw0xAI(Modifier $this$clickable_u2dXHw0xAI, final boolean enabled, final String onClickLabel, final Role role, final Function0<Unit> function0) {
        return ComposedModifierKt.composed($this$clickable_u2dXHw0xAI, InspectableValueKt.isDebugInspectorInfoEnabled() ? new Function1<InspectorInfo, Unit>() { // from class: androidx.compose.foundation.ClickableKt$clickable-XHw0xAI$$inlined$debugInspectorInfo$1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(InspectorInfo inspectorInfo) {
                invoke2(inspectorInfo);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(InspectorInfo $this$null) {
                $this$null.setName("clickable");
                $this$null.getProperties().set("enabled", Boolean.valueOf(enabled));
                $this$null.getProperties().set("onClickLabel", onClickLabel);
                $this$null.getProperties().set("role", role);
                $this$null.getProperties().set("onClick", function0);
            }
        } : InspectableValueKt.getNoInspectorInfo(), new Function3<Modifier, Composer, Integer, Modifier>() { // from class: androidx.compose.foundation.ClickableKt$clickable$2
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(3);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ Modifier invoke(Modifier modifier, Composer composer, Integer num) {
                return invoke(modifier, composer, num.intValue());
            }

            public final Modifier invoke(Modifier $this$composed, Composer $composer, int $changed) {
                MutableInteractionSource interactionSource;
                $composer.startReplaceGroup(-756081143);
                ComposerKt.sourceInformation($composer, "C120@5625L7:Clickable.kt#71ulvw");
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventStart(-756081143, $changed, -1, "androidx.compose.foundation.clickable.<anonymous> (Clickable.kt:120)");
                }
                ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                Object consume = $composer.consume(IndicationKt.getLocalIndication());
                ComposerKt.sourceInformationMarkerEnd($composer);
                Indication localIndication = (Indication) consume;
                if (localIndication instanceof IndicationNodeFactory) {
                    $composer.startReplaceGroup(617653824);
                    $composer.endReplaceGroup();
                    interactionSource = null;
                } else {
                    $composer.startReplaceGroup(617786442);
                    ComposerKt.sourceInformation($composer, "129@6072L39");
                    ComposerKt.sourceInformationMarkerStart($composer, 1266861390, "CC(remember):Clickable.kt#9igjgp");
                    Object it$iv = $composer.rememberedValue();
                    if (it$iv == Composer.Companion.getEmpty()) {
                        Object value$iv = InteractionSourceKt.MutableInteractionSource();
                        $composer.updateRememberedValue(value$iv);
                        it$iv = value$iv;
                    }
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    $composer.endReplaceGroup();
                    interactionSource = (MutableInteractionSource) it$iv;
                }
                Modifier m533clickableO2vRcR0 = ClickableKt.m533clickableO2vRcR0(Modifier.Companion, interactionSource, localIndication, enabled, onClickLabel, role, function0);
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventEnd();
                }
                $composer.endReplaceGroup();
                return m533clickableO2vRcR0;
            }
        });
    }

    /* renamed from: clickable-O2vRcR0 */
    public static final Modifier m533clickableO2vRcR0(Modifier $this$clickable_u2dO2vRcR0, MutableInteractionSource interactionSource, final Indication indication, final boolean enabled, final String onClickLabel, final Role role, final Function0<Unit> function0) {
        ClickableElement clickableElement;
        if (indication instanceof IndicationNodeFactory) {
            IndicationNodeFactory indicationNodeFactory = (IndicationNodeFactory) indication;
            clickableElement = new ClickableElement(interactionSource, indicationNodeFactory, enabled, onClickLabel, role, function0, null);
        } else {
            clickableElement = indication == null ? new ClickableElement(interactionSource, null, enabled, onClickLabel, role, function0, null) : interactionSource != null ? IndicationKt.indication(Modifier.Companion, interactionSource, indication).then(new ClickableElement(interactionSource, null, enabled, onClickLabel, role, function0, null)) : ComposedModifierKt.composed$default(Modifier.Companion, null, new Function3<Modifier, Composer, Integer, Modifier>() { // from class: androidx.compose.foundation.ClickableKt$clickable-O2vRcR0$$inlined$clickableWithIndicationIfNeeded$1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(3);
                }

                @Override // kotlin.jvm.functions.Function3
                public /* bridge */ /* synthetic */ Modifier invoke(Modifier modifier, Composer composer, Integer num) {
                    return invoke(modifier, composer, num.intValue());
                }

                public final Modifier invoke(Modifier $this$composed, Composer $composer, int $changed) {
                    $composer.startReplaceGroup(-1525724089);
                    ComposerKt.sourceInformation($composer, "C473@22196L39:Clickable.kt#71ulvw");
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventStart(-1525724089, $changed, -1, "androidx.compose.foundation.clickableWithIndicationIfNeeded.<anonymous> (Clickable.kt:473)");
                    }
                    ComposerKt.sourceInformationMarkerStart($composer, -442512382, "CC(remember):Clickable.kt#9igjgp");
                    Object it$iv = $composer.rememberedValue();
                    if (it$iv == Composer.Companion.getEmpty()) {
                        Object value$iv = InteractionSourceKt.MutableInteractionSource();
                        $composer.updateRememberedValue(value$iv);
                        it$iv = value$iv;
                    }
                    MutableInteractionSource newInteractionSource = (MutableInteractionSource) it$iv;
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    Modifier then = IndicationKt.indication(Modifier.Companion, newInteractionSource, Indication.this).then(new ClickableElement(newInteractionSource, null, enabled, onClickLabel, role, function0, null));
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventEnd();
                    }
                    $composer.endReplaceGroup();
                    return then;
                }
            }, 1, null);
        }
        return $this$clickable_u2dO2vRcR0.then(clickableElement);
    }

    /* renamed from: combinedClickable-f5TDLPQ$default */
    public static /* synthetic */ Modifier m544combinedClickablef5TDLPQ$default(Modifier modifier, boolean z, String str, Role role, String str2, Function0 function0, Function0 function02, boolean z2, Function0 function03, int i, Object obj) {
        if ((i & 1) != 0) {
            z = true;
        }
        if ((i & 2) != 0) {
            str = null;
        }
        if ((i & 4) != 0) {
            role = null;
        }
        if ((i & 8) != 0) {
            str2 = null;
        }
        if ((i & 16) != 0) {
            function0 = null;
        }
        if ((i & 32) != 0) {
            function02 = null;
        }
        if ((i & 64) != 0) {
            z2 = true;
        }
        return m543combinedClickablef5TDLPQ(modifier, z, str, role, str2, function0, function02, z2, function03);
    }

    /* renamed from: combinedClickable-f5TDLPQ */
    public static final Modifier m543combinedClickablef5TDLPQ(Modifier $this$combinedClickable_u2df5TDLPQ, final boolean enabled, final String onClickLabel, final Role role, final String onLongClickLabel, final Function0<Unit> function0, final Function0<Unit> function02, final boolean hapticFeedbackEnabled, final Function0<Unit> function03) {
        return ComposedModifierKt.composed($this$combinedClickable_u2df5TDLPQ, InspectableValueKt.isDebugInspectorInfoEnabled() ? new Function1<InspectorInfo, Unit>() { // from class: androidx.compose.foundation.ClickableKt$combinedClickable-f5TDLPQ$$inlined$debugInspectorInfo$1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(InspectorInfo inspectorInfo) {
                invoke2(inspectorInfo);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(InspectorInfo $this$null) {
                $this$null.setName("combinedClickable");
                $this$null.getProperties().set("enabled", Boolean.valueOf(enabled));
                $this$null.getProperties().set("onClickLabel", onClickLabel);
                $this$null.getProperties().set("role", role);
                $this$null.getProperties().set("onClick", function03);
                $this$null.getProperties().set("onDoubleClick", function02);
                $this$null.getProperties().set("onLongClick", function0);
                $this$null.getProperties().set("onLongClickLabel", onLongClickLabel);
                $this$null.getProperties().set("hapticFeedbackEnabled", Boolean.valueOf(hapticFeedbackEnabled));
            }
        } : InspectableValueKt.getNoInspectorInfo(), new Function3<Modifier, Composer, Integer, Modifier>() { // from class: androidx.compose.foundation.ClickableKt$combinedClickable$2
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(3);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ Modifier invoke(Modifier modifier, Composer composer, Integer num) {
                return invoke(modifier, composer, num.intValue());
            }

            public final Modifier invoke(Modifier $this$composed, Composer $composer, int $changed) {
                MutableInteractionSource interactionSource;
                $composer.startReplaceGroup(-1534186401);
                ComposerKt.sourceInformation($composer, "C264@12689L7:Clickable.kt#71ulvw");
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventStart(-1534186401, $changed, -1, "androidx.compose.foundation.combinedClickable.<anonymous> (Clickable.kt:264)");
                }
                ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                Object consume = $composer.consume(IndicationKt.getLocalIndication());
                ComposerKt.sourceInformationMarkerEnd($composer);
                Indication localIndication = (Indication) consume;
                if (localIndication instanceof IndicationNodeFactory) {
                    $composer.startReplaceGroup(-1726068379);
                    $composer.endReplaceGroup();
                    interactionSource = null;
                } else {
                    $composer.startReplaceGroup(-1725935761);
                    ComposerKt.sourceInformation($composer, "273@13136L39");
                    ComposerKt.sourceInformationMarkerStart($composer, -1995331191, "CC(remember):Clickable.kt#9igjgp");
                    Object it$iv = $composer.rememberedValue();
                    if (it$iv == Composer.Companion.getEmpty()) {
                        Object value$iv = InteractionSourceKt.MutableInteractionSource();
                        $composer.updateRememberedValue(value$iv);
                        it$iv = value$iv;
                    }
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    $composer.endReplaceGroup();
                    interactionSource = (MutableInteractionSource) it$iv;
                }
                Modifier m539combinedClickableauXiCPI = ClickableKt.m539combinedClickableauXiCPI(Modifier.Companion, interactionSource, localIndication, enabled, onClickLabel, role, onLongClickLabel, function0, function02, hapticFeedbackEnabled, function03);
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventEnd();
                }
                $composer.endReplaceGroup();
                return m539combinedClickableauXiCPI;
            }
        });
    }

    /* renamed from: combinedClickable-cJG_KMw$default */
    public static /* synthetic */ Modifier m542combinedClickablecJG_KMw$default(Modifier modifier, boolean z, String str, Role role, String str2, Function0 function0, Function0 function02, Function0 function03, int i, Object obj) {
        if ((i & 1) != 0) {
            z = true;
        }
        if ((i & 2) != 0) {
            str = null;
        }
        if ((i & 4) != 0) {
            role = null;
        }
        if ((i & 8) != 0) {
            str2 = null;
        }
        if ((i & 16) != 0) {
            function0 = null;
        }
        return m541combinedClickablecJG_KMw(modifier, z, str, role, str2, function0, (i & 32) != 0 ? null : function02, function03);
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Maintained for binary compatibility")
    /* renamed from: combinedClickable-cJG_KMw */
    public static final /* synthetic */ Modifier m541combinedClickablecJG_KMw(Modifier $this$combinedClickable_u2dcJG_KMw, final boolean enabled, final String onClickLabel, final Role role, final String onLongClickLabel, final Function0 onLongClick, final Function0 onDoubleClick, final Function0 onClick) {
        return ComposedModifierKt.composed($this$combinedClickable_u2dcJG_KMw, InspectableValueKt.isDebugInspectorInfoEnabled() ? new Function1<InspectorInfo, Unit>() { // from class: androidx.compose.foundation.ClickableKt$combinedClickable-cJG_KMw$$inlined$debugInspectorInfo$1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(InspectorInfo inspectorInfo) {
                invoke2(inspectorInfo);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(InspectorInfo $this$null) {
                $this$null.setName("combinedClickable");
                $this$null.getProperties().set("enabled", Boolean.valueOf(enabled));
                $this$null.getProperties().set("onClickLabel", onClickLabel);
                $this$null.getProperties().set("role", role);
                $this$null.getProperties().set("onClick", onClick);
                $this$null.getProperties().set("onDoubleClick", onDoubleClick);
                $this$null.getProperties().set("onLongClick", onLongClick);
                $this$null.getProperties().set("onLongClickLabel", onLongClickLabel);
            }
        } : InspectableValueKt.getNoInspectorInfo(), new Function3<Modifier, Composer, Integer, Modifier>() { // from class: androidx.compose.foundation.ClickableKt$combinedClickable$4
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(3);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ Modifier invoke(Modifier modifier, Composer composer, Integer num) {
                return invoke(modifier, composer, num.intValue());
            }

            public final Modifier invoke(Modifier $this$composed, Composer $composer, int $changed) {
                MutableInteractionSource interactionSource;
                $composer.startReplaceGroup(1969174843);
                ComposerKt.sourceInformation($composer, "C312@14572L7:Clickable.kt#71ulvw");
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventStart(1969174843, $changed, -1, "androidx.compose.foundation.combinedClickable.<anonymous> (Clickable.kt:312)");
                }
                ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                Object consume = $composer.consume(IndicationKt.getLocalIndication());
                ComposerKt.sourceInformationMarkerEnd($composer);
                Indication localIndication = (Indication) consume;
                if (localIndication instanceof IndicationNodeFactory) {
                    $composer.startReplaceGroup(-1724200443);
                    $composer.endReplaceGroup();
                    interactionSource = null;
                } else {
                    $composer.startReplaceGroup(-1724067825);
                    ComposerKt.sourceInformation($composer, "321@15019L39");
                    ComposerKt.sourceInformationMarkerStart($composer, -1995270935, "CC(remember):Clickable.kt#9igjgp");
                    Object it$iv = $composer.rememberedValue();
                    if (it$iv == Composer.Companion.getEmpty()) {
                        Object value$iv = InteractionSourceKt.MutableInteractionSource();
                        $composer.updateRememberedValue(value$iv);
                        it$iv = value$iv;
                    }
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    $composer.endReplaceGroup();
                    interactionSource = (MutableInteractionSource) it$iv;
                }
                Modifier m539combinedClickableauXiCPI = ClickableKt.m539combinedClickableauXiCPI(Modifier.Companion, interactionSource, localIndication, enabled, onClickLabel, role, onLongClickLabel, onLongClick, onDoubleClick, true, onClick);
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventEnd();
                }
                $composer.endReplaceGroup();
                return m539combinedClickableauXiCPI;
            }
        });
    }

    /* renamed from: combinedClickable-auXiCPI$default */
    public static /* synthetic */ Modifier m540combinedClickableauXiCPI$default(Modifier modifier, MutableInteractionSource mutableInteractionSource, Indication indication, boolean z, String str, Role role, String str2, Function0 function0, Function0 function02, boolean z2, Function0 function03, int i, Object obj) {
        if ((i & 4) != 0) {
            z = true;
        }
        if ((i & 8) != 0) {
            str = null;
        }
        if ((i & 16) != 0) {
            role = null;
        }
        if ((i & 32) != 0) {
            str2 = null;
        }
        if ((i & 64) != 0) {
            function0 = null;
        }
        if ((i & 128) != 0) {
            function02 = null;
        }
        if ((i & 256) != 0) {
            z2 = true;
        }
        return m539combinedClickableauXiCPI(modifier, mutableInteractionSource, indication, z, str, role, str2, function0, function02, z2, function03);
    }

    /* renamed from: combinedClickable-auXiCPI */
    public static final Modifier m539combinedClickableauXiCPI(Modifier $this$combinedClickable_u2dauXiCPI, MutableInteractionSource interactionSource, final Indication indication, final boolean enabled, final String onClickLabel, final Role role, final String onLongClickLabel, final Function0<Unit> function0, final Function0<Unit> function02, final boolean hapticFeedbackEnabled, final Function0<Unit> function03) {
        CombinedClickableElement combinedClickableElement;
        if (indication instanceof IndicationNodeFactory) {
            IndicationNodeFactory indicationNodeFactory = (IndicationNodeFactory) indication;
            combinedClickableElement = new CombinedClickableElement(interactionSource, indicationNodeFactory, enabled, onClickLabel, role, function03, onLongClickLabel, function0, function02, hapticFeedbackEnabled, null);
        } else {
            combinedClickableElement = indication == null ? new CombinedClickableElement(interactionSource, null, enabled, onClickLabel, role, function03, onLongClickLabel, function0, function02, hapticFeedbackEnabled, null) : interactionSource != null ? IndicationKt.indication(Modifier.Companion, interactionSource, indication).then(new CombinedClickableElement(interactionSource, null, enabled, onClickLabel, role, function03, onLongClickLabel, function0, function02, hapticFeedbackEnabled, null)) : ComposedModifierKt.composed$default(Modifier.Companion, null, new Function3<Modifier, Composer, Integer, Modifier>() { // from class: androidx.compose.foundation.ClickableKt$combinedClickable-auXiCPI$$inlined$clickableWithIndicationIfNeeded$1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(3);
                }

                @Override // kotlin.jvm.functions.Function3
                public /* bridge */ /* synthetic */ Modifier invoke(Modifier modifier, Composer composer, Integer num) {
                    return invoke(modifier, composer, num.intValue());
                }

                public final Modifier invoke(Modifier $this$composed, Composer $composer, int $changed) {
                    $composer.startReplaceGroup(-1525724089);
                    ComposerKt.sourceInformation($composer, "C473@22196L39:Clickable.kt#71ulvw");
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventStart(-1525724089, $changed, -1, "androidx.compose.foundation.clickableWithIndicationIfNeeded.<anonymous> (Clickable.kt:473)");
                    }
                    ComposerKt.sourceInformationMarkerStart($composer, -442512382, "CC(remember):Clickable.kt#9igjgp");
                    Object it$iv = $composer.rememberedValue();
                    if (it$iv == Composer.Companion.getEmpty()) {
                        Object value$iv = InteractionSourceKt.MutableInteractionSource();
                        $composer.updateRememberedValue(value$iv);
                        it$iv = value$iv;
                    }
                    MutableInteractionSource newInteractionSource = (MutableInteractionSource) it$iv;
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    Modifier then = IndicationKt.indication(Modifier.Companion, newInteractionSource, Indication.this).then(new CombinedClickableElement(newInteractionSource, null, enabled, onClickLabel, role, function03, onLongClickLabel, function0, function02, hapticFeedbackEnabled, null));
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventEnd();
                    }
                    $composer.endReplaceGroup();
                    return then;
                }
            }, 1, null);
        }
        return $this$combinedClickable_u2dauXiCPI.then(combinedClickableElement);
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Maintained for binary compatibility")
    /* renamed from: combinedClickable-XVZzFYc */
    public static final /* synthetic */ Modifier m537combinedClickableXVZzFYc(Modifier $this$combinedClickable_u2dXVZzFYc, MutableInteractionSource interactionSource, final Indication indication, final boolean enabled, final String onClickLabel, final Role role, final String onLongClickLabel, final Function0 onLongClick, final Function0 onDoubleClick, final Function0 onClick) {
        CombinedClickableElement combinedClickableElement;
        if (indication instanceof IndicationNodeFactory) {
            IndicationNodeFactory indicationNodeFactory = (IndicationNodeFactory) indication;
            combinedClickableElement = new CombinedClickableElement(interactionSource, indicationNodeFactory, enabled, onClickLabel, role, onClick, onLongClickLabel, onLongClick, onDoubleClick, true, null);
        } else {
            combinedClickableElement = indication == null ? new CombinedClickableElement(interactionSource, null, enabled, onClickLabel, role, onClick, onLongClickLabel, onLongClick, onDoubleClick, true, null) : interactionSource != null ? IndicationKt.indication(Modifier.Companion, interactionSource, indication).then(new CombinedClickableElement(interactionSource, null, enabled, onClickLabel, role, onClick, onLongClickLabel, onLongClick, onDoubleClick, true, null)) : ComposedModifierKt.composed$default(Modifier.Companion, null, new Function3<Modifier, Composer, Integer, Modifier>() { // from class: androidx.compose.foundation.ClickableKt$combinedClickable-XVZzFYc$$inlined$clickableWithIndicationIfNeeded$1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(3);
                }

                @Override // kotlin.jvm.functions.Function3
                public /* bridge */ /* synthetic */ Modifier invoke(Modifier modifier, Composer composer, Integer num) {
                    return invoke(modifier, composer, num.intValue());
                }

                public final Modifier invoke(Modifier $this$composed, Composer $composer, int $changed) {
                    $composer.startReplaceGroup(-1525724089);
                    ComposerKt.sourceInformation($composer, "C473@22196L39:Clickable.kt#71ulvw");
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventStart(-1525724089, $changed, -1, "androidx.compose.foundation.clickableWithIndicationIfNeeded.<anonymous> (Clickable.kt:473)");
                    }
                    ComposerKt.sourceInformationMarkerStart($composer, -442512382, "CC(remember):Clickable.kt#9igjgp");
                    Object it$iv = $composer.rememberedValue();
                    if (it$iv == Composer.Companion.getEmpty()) {
                        Object value$iv = InteractionSourceKt.MutableInteractionSource();
                        $composer.updateRememberedValue(value$iv);
                        it$iv = value$iv;
                    }
                    MutableInteractionSource newInteractionSource = (MutableInteractionSource) it$iv;
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    Modifier then = IndicationKt.indication(Modifier.Companion, newInteractionSource, Indication.this).then(new CombinedClickableElement(newInteractionSource, null, enabled, onClickLabel, role, onClick, onLongClickLabel, onLongClick, onDoubleClick, true, null));
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventEnd();
                    }
                    $composer.endReplaceGroup();
                    return then;
                }
            }, 1, null);
        }
        return $this$combinedClickable_u2dXVZzFYc.then(combinedClickableElement);
    }

    public static final Modifier clickableWithIndicationIfNeeded(Modifier $this$clickableWithIndicationIfNeeded, MutableInteractionSource interactionSource, final Indication indication, final Function2<? super MutableInteractionSource, ? super IndicationNodeFactory, ? extends Modifier> function2) {
        Modifier then;
        if (indication instanceof IndicationNodeFactory) {
            then = function2.invoke(interactionSource, indication);
        } else if (indication == null) {
            then = function2.invoke(interactionSource, null);
        } else {
            then = interactionSource != null ? IndicationKt.indication(Modifier.Companion, interactionSource, indication).then(function2.invoke(interactionSource, null)) : ComposedModifierKt.composed$default(Modifier.Companion, null, new Function3<Modifier, Composer, Integer, Modifier>() { // from class: androidx.compose.foundation.ClickableKt$clickableWithIndicationIfNeeded$1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(3);
                }

                @Override // kotlin.jvm.functions.Function3
                public /* bridge */ /* synthetic */ Modifier invoke(Modifier modifier, Composer composer, Integer num) {
                    return invoke(modifier, composer, num.intValue());
                }

                public final Modifier invoke(Modifier $this$composed, Composer $composer, int $changed) {
                    $composer.startReplaceGroup(-1525724089);
                    ComposerKt.sourceInformation($composer, "C473@22196L39:Clickable.kt#71ulvw");
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventStart(-1525724089, $changed, -1, "androidx.compose.foundation.clickableWithIndicationIfNeeded.<anonymous> (Clickable.kt:473)");
                    }
                    ComposerKt.sourceInformationMarkerStart($composer, -442512382, "CC(remember):Clickable.kt#9igjgp");
                    Object it$iv = $composer.rememberedValue();
                    if (it$iv == Composer.Companion.getEmpty()) {
                        Object value$iv = InteractionSourceKt.MutableInteractionSource();
                        $composer.updateRememberedValue(value$iv);
                        it$iv = value$iv;
                    }
                    MutableInteractionSource newInteractionSource = (MutableInteractionSource) it$iv;
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    Modifier then2 = IndicationKt.indication(Modifier.Companion, newInteractionSource, Indication.this).then(function2.invoke(newInteractionSource, null));
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventEnd();
                    }
                    $composer.endReplaceGroup();
                    return then2;
                }
            }, 1, null);
        }
        return $this$clickableWithIndicationIfNeeded.then(then);
    }

    /* renamed from: isPress-ZmokQxo */
    public static final boolean m547isPressZmokQxo(KeyEvent $this$isPress) {
        return KeyEventType.m5361equalsimpl0(KeyEvent_androidKt.m5369getTypeZmokQxo($this$isPress), KeyEventType.Companion.m5365getKeyDownCS__XNY()) && m546isEnterZmokQxo($this$isPress);
    }

    /* renamed from: isClick-ZmokQxo */
    public static final boolean m545isClickZmokQxo(KeyEvent $this$isClick) {
        return KeyEventType.m5361equalsimpl0(KeyEvent_androidKt.m5369getTypeZmokQxo($this$isClick), KeyEventType.Companion.m5366getKeyUpCS__XNY()) && m546isEnterZmokQxo($this$isClick);
    }

    /* renamed from: isEnter-ZmokQxo */
    private static final boolean m546isEnterZmokQxo(KeyEvent $this$isEnter) {
        long m5368getKeyZmokQxo = KeyEvent_androidKt.m5368getKeyZmokQxo($this$isEnter);
        return Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5132getDirectionCenterEK5gGoQ()) ? true : Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5146getEnterEK5gGoQ()) ? true : Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5238getNumPadEnterEK5gGoQ()) ? true : Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5284getSpacebarEK5gGoQ());
    }

    public static final boolean hasScrollableContainer(TraversableNode $this$hasScrollableContainer) {
        final Ref.BooleanRef hasScrollable = new Ref.BooleanRef();
        TraversableNodeKt.traverseAncestors($this$hasScrollableContainer, ScrollableContainerNode.TraverseKey, new Function1<TraversableNode, Boolean>() { // from class: androidx.compose.foundation.ClickableKt$hasScrollableContainer$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(TraversableNode node) {
                boolean z;
                Ref.BooleanRef booleanRef = Ref.BooleanRef.this;
                if (!Ref.BooleanRef.this.element) {
                    Intrinsics.checkNotNull(node, "null cannot be cast to non-null type androidx.compose.foundation.gestures.ScrollableContainerNode");
                    if (!((ScrollableContainerNode) node).getEnabled()) {
                        z = false;
                        booleanRef.element = z;
                        return Boolean.valueOf(!Ref.BooleanRef.this.element);
                    }
                }
                z = true;
                booleanRef.element = z;
                return Boolean.valueOf(!Ref.BooleanRef.this.element);
            }
        });
        return hasScrollable.element;
    }
}
