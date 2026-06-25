package androidx.compose.foundation.contextmenu;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import androidx.autofill.HintConstants;
import androidx.compose.foundation.layout.ColumnScope;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.ColorKt;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import androidx.compose.ui.window.AndroidPopup_androidKt;
import androidx.compose.ui.window.PopupPositionProvider;
import androidx.compose.ui.window.PopupProperties;
import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: ContextMenuUi.android.kt */
@Metadata(d1 = {"\u0000\u0080\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0006\u001a=\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\u00012\b\b\u0002\u0010\r\u001a\u00020\u000e2\u001c\u0010\u000f\u001a\u0018\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u000b0\u0010¢\u0006\u0002\b\u0012¢\u0006\u0002\b\u0013H\u0001¢\u0006\u0002\u0010\u0014\u001ai\u0010\u0015\u001a\u00020\u000b2\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\f\u001a\u00020\u00012\b\b\u0002\u0010\r\u001a\u00020\u000e2*\b\u0002\u0010\u001a\u001a$\u0012\u0013\u0012\u00110\u001b¢\u0006\f\b\u001c\u0012\b\b\u001d\u0012\u0004\b\b(\u001e\u0012\u0004\u0012\u00020\u000b\u0018\u00010\u0010¢\u0006\u0002\b\u00122\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020\u000b0 H\u0001¢\u0006\u0002\u0010!\u001aN\u0010\"\u001a\u00020\u000b2\u0006\u0010#\u001a\u00020$2\f\u0010%\u001a\b\u0012\u0004\u0012\u00020\u000b0 2\b\b\u0002\u0010\r\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u00012\u0017\u0010&\u001a\u0013\u0012\u0004\u0012\u00020'\u0012\u0004\u0012\u00020\u000b0\u0010¢\u0006\u0002\b\u0013H\u0001¢\u0006\u0002\u0010(\u001aF\u0010\"\u001a\u00020\u000b2\u0006\u0010#\u001a\u00020$2\f\u0010%\u001a\b\u0012\u0004\u0012\u00020\u000b0 2\b\b\u0002\u0010\r\u001a\u00020\u000e2\u0017\u0010&\u001a\u0013\u0012\u0004\u0012\u00020'\u0012\u0004\u0012\u00020\u000b0\u0010¢\u0006\u0002\b\u0013H\u0001¢\u0006\u0002\u0010)\u001a!\u0010*\u001a\u00020\u00012\b\b\u0003\u0010+\u001a\u00020,2\b\b\u0003\u0010-\u001a\u00020,H\u0001¢\u0006\u0002\u0010.\u001a \u0010/\u001a\u00020\u001b*\u0004\u0018\u0001002\u0006\u00101\u001a\u00020\u001bH\u0002ø\u0001\u0000¢\u0006\u0004\b2\u00103\u001a \u00104\u001a\u00020\u001b*\u0004\u0018\u0001002\u0006\u00101\u001a\u00020\u001bH\u0002ø\u0001\u0000¢\u0006\u0004\b5\u00103\u001a2\u00106\u001a\u00020\u001b*\u0002072\b\b\u0001\u00108\u001a\u00020,2\b\b\u0001\u00109\u001a\u00020,2\u0006\u00101\u001a\u00020\u001bH\u0002ø\u0001\u0000¢\u0006\u0004\b:\u0010;\u001a\"\u0010<\u001a\u0004\u0018\u000100*\u0002072\b\b\u0001\u00108\u001a\u00020,2\b\b\u0001\u00109\u001a\u00020,H\u0002\"\u001c\u0010\u0000\u001a\u00020\u00018\u0000X\u0081\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0002\u0010\u0003\u001a\u0004\b\u0004\u0010\u0005\"\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000\"\u000e\u0010\b\u001a\u00020\tX\u0082T¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006="}, d2 = {"DefaultContextMenuColors", "Landroidx/compose/foundation/contextmenu/ContextMenuColors;", "getDefaultContextMenuColors$annotations", "()V", "getDefaultContextMenuColors", "()Landroidx/compose/foundation/contextmenu/ContextMenuColors;", "DefaultPopupProperties", "Landroidx/compose/ui/window/PopupProperties;", "DisabledAlpha", "", "ContextMenuColumn", "", "colors", "modifier", "Landroidx/compose/ui/Modifier;", "content", "Lkotlin/Function1;", "Landroidx/compose/foundation/layout/ColumnScope;", "Landroidx/compose/runtime/Composable;", "Lkotlin/ExtensionFunctionType;", "(Landroidx/compose/foundation/contextmenu/ContextMenuColors;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V", "ContextMenuItem", "label", "", "enabled", "", "leadingIcon", "Landroidx/compose/ui/graphics/Color;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "iconColor", "onClick", "Lkotlin/Function0;", "(Ljava/lang/String;ZLandroidx/compose/foundation/contextmenu/ContextMenuColors;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)V", "ContextMenuPopup", "popupPositionProvider", "Landroidx/compose/ui/window/PopupPositionProvider;", "onDismiss", "contextMenuBuilderBlock", "Landroidx/compose/foundation/contextmenu/ContextMenuScope;", "(Landroidx/compose/ui/window/PopupPositionProvider;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/contextmenu/ContextMenuColors;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V", "(Landroidx/compose/ui/window/PopupPositionProvider;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V", "computeContextMenuColors", "backgroundStyleId", "", "foregroundStyleId", "(IILandroidx/compose/runtime/Composer;II)Landroidx/compose/foundation/contextmenu/ContextMenuColors;", "disabledColor", "Landroid/content/res/ColorStateList;", "defaultColor", "disabledColor-4WTKRHQ", "(Landroid/content/res/ColorStateList;J)J", "enabledColor", "enabledColor-4WTKRHQ", "resolveColor", "Landroid/content/Context;", "resId", "attrId", "resolveColor-g2O1Hgs", "(Landroid/content/Context;IIJ)J", "resolveColorStateList", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ContextMenuUi_androidKt {
    private static final ContextMenuColors DefaultContextMenuColors;
    private static final PopupProperties DefaultPopupProperties = new PopupProperties(true, false, false, false, 14, (DefaultConstructorMarker) null);
    private static final float DisabledAlpha = 0.38f;

    public static /* synthetic */ void getDefaultContextMenuColors$annotations() {
    }

    static {
        long m4287copywmQWz5c;
        long m4287copywmQWz5c2;
        long m4326getWhite0d7_KjU = Color.Companion.m4326getWhite0d7_KjU();
        long m4315getBlack0d7_KjU = Color.Companion.m4315getBlack0d7_KjU();
        long m4315getBlack0d7_KjU2 = Color.Companion.m4315getBlack0d7_KjU();
        m4287copywmQWz5c = Color.m4287copywmQWz5c(r8, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r8) : 0.38f, (r12 & 2) != 0 ? Color.m4295getRedimpl(r8) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r8) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(Color.Companion.m4315getBlack0d7_KjU()) : 0.0f);
        m4287copywmQWz5c2 = Color.m4287copywmQWz5c(r10, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r10) : 0.38f, (r12 & 2) != 0 ? Color.m4295getRedimpl(r10) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r10) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(Color.Companion.m4315getBlack0d7_KjU()) : 0.0f);
        DefaultContextMenuColors = new ContextMenuColors(m4326getWhite0d7_KjU, m4315getBlack0d7_KjU, m4315getBlack0d7_KjU2, m4287copywmQWz5c, m4287copywmQWz5c2, null);
    }

    public static final void ContextMenuPopup(final PopupPositionProvider popupPositionProvider, final Function0<Unit> function0, Modifier modifier, final Function1<? super ContextMenuScope, Unit> function1, Composer $composer, final int $changed, final int i) {
        Object obj;
        Object obj2;
        Function1<? super ContextMenuScope, Unit> function12;
        final Modifier modifier2;
        Modifier modifier3;
        Composer $composer2 = $composer.startRestartGroup(712057293);
        ComposerKt.sourceInformation($composer2, "C(ContextMenuPopup)P(3,2,1)111@4263L26,107@4113L241:ContextMenuUi.android.kt#3xeu6s");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
        } else if (($changed & 6) == 0) {
            $dirty |= $composer2.changed(popupPositionProvider) ? 4 : 2;
        }
        if ((i & 2) != 0) {
            $dirty |= 48;
            obj = function0;
        } else if (($changed & 48) == 0) {
            obj = function0;
            $dirty |= $composer2.changedInstance(obj) ? 32 : 16;
        } else {
            obj = function0;
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
            function12 = function1;
        } else if (($changed & 3072) == 0) {
            function12 = function1;
            $dirty |= $composer2.changedInstance(function12) ? 2048 : 1024;
        } else {
            function12 = function1;
        }
        int $dirty2 = $dirty;
        if ($composer2.shouldExecute(($dirty2 & 1171) != 1170, $dirty2 & 1)) {
            if (i2 != 0) {
                modifier3 = Modifier.Companion;
            } else {
                modifier3 = obj2;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(712057293, $dirty2, -1, "androidx.compose.foundation.contextmenu.ContextMenuPopup (ContextMenuUi.android.kt:106)");
            }
            ContextMenuPopup(popupPositionProvider, obj, modifier3, computeContextMenuColors(0, 0, $composer2, 0, 3), function12, $composer2, ($dirty2 & 14) | ($dirty2 & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty2 & 896) | (($dirty2 << 3) & 57344), 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier3;
        } else {
            $composer2.skipToGroupEnd();
            modifier2 = obj2;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.contextmenu.ContextMenuUi_androidKt$ContextMenuPopup$1
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
                    ContextMenuUi_androidKt.ContextMenuPopup(PopupPositionProvider.this, function0, modifier2, function1, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    public static final void ContextMenuPopup(final PopupPositionProvider popupPositionProvider, final Function0<Unit> function0, Modifier modifier, final ContextMenuColors colors, final Function1<? super ContextMenuScope, Unit> function1, Composer $composer, final int $changed, final int i) {
        Function0<Unit> function02;
        final Object modifier2;
        final Modifier.Companion modifier3;
        Composer $composer2 = $composer.startRestartGroup(1447189339);
        ComposerKt.sourceInformation($composer2, "C(ContextMenuPopup)P(4,3,2)129@4780L257,125@4629L408:ContextMenuUi.android.kt#3xeu6s");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
        } else if (($changed & 6) == 0) {
            $dirty |= $composer2.changed(popupPositionProvider) ? 4 : 2;
        }
        if ((i & 2) != 0) {
            $dirty |= 48;
            function02 = function0;
        } else if (($changed & 48) == 0) {
            function02 = function0;
            $dirty |= $composer2.changedInstance(function02) ? 32 : 16;
        } else {
            function02 = function0;
        }
        int i2 = i & 4;
        if (i2 != 0) {
            $dirty |= 384;
            modifier2 = modifier;
        } else if (($changed & 384) == 0) {
            modifier2 = modifier;
            $dirty |= $composer2.changed(modifier2) ? 256 : 128;
        } else {
            modifier2 = modifier;
        }
        if ((i & 8) != 0) {
            $dirty |= 3072;
        } else if (($changed & 3072) == 0) {
            $dirty |= $composer2.changed(colors) ? 2048 : 1024;
        }
        if ((i & 16) != 0) {
            $dirty |= 24576;
        } else if (($changed & 24576) == 0) {
            $dirty |= $composer2.changedInstance(function1) ? 16384 : 8192;
        }
        int $dirty2 = $dirty;
        if ($composer2.shouldExecute(($dirty2 & 9363) != 9362, $dirty2 & 1)) {
            if (i2 != 0) {
                modifier3 = Modifier.Companion;
            } else {
                modifier3 = modifier2;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1447189339, $dirty2, -1, "androidx.compose.foundation.contextmenu.ContextMenuPopup (ContextMenuUi.android.kt:124)");
            }
            AndroidPopup_androidKt.Popup(popupPositionProvider, function02, DefaultPopupProperties, ComposableLambdaKt.rememberComposableLambda(795909757, true, new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.contextmenu.ContextMenuUi_androidKt$ContextMenuPopup$2
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

                public final void invoke(Composer $composer3, int $changed2) {
                    ComposerKt.sourceInformation($composer3, "C130@4826L205,130@4790L241:ContextMenuUi.android.kt#3xeu6s");
                    if (!$composer3.shouldExecute(($changed2 & 3) != 2, $changed2 & 1)) {
                        $composer3.skipToGroupEnd();
                        return;
                    }
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventStart(795909757, $changed2, -1, "androidx.compose.foundation.contextmenu.ContextMenuPopup.<anonymous> (ContextMenuUi.android.kt:130)");
                    }
                    ContextMenuColors contextMenuColors = ContextMenuColors.this;
                    Modifier modifier4 = modifier3;
                    final Function1<ContextMenuScope, Unit> function12 = function1;
                    final ContextMenuColors contextMenuColors2 = ContextMenuColors.this;
                    ContextMenuUi_androidKt.ContextMenuColumn(contextMenuColors, modifier4, ComposableLambdaKt.rememberComposableLambda(1156688164, true, new Function3<ColumnScope, Composer, Integer, Unit>() { // from class: androidx.compose.foundation.contextmenu.ContextMenuUi_androidKt$ContextMenuPopup$2.1
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        /* JADX WARN: Multi-variable type inference failed */
                        {
                            super(3);
                        }

                        @Override // kotlin.jvm.functions.Function3
                        public /* bridge */ /* synthetic */ Unit invoke(ColumnScope columnScope, Composer composer, Integer num) {
                            invoke(columnScope, composer, num.intValue());
                            return Unit.INSTANCE;
                        }

                        public final void invoke(ColumnScope $this$ContextMenuColumn, Composer $composer4, int $changed3) {
                            ComposerKt.sourceInformation($composer4, "C131@4852L31,*135@4992L15:ContextMenuUi.android.kt#3xeu6s");
                            if (!$composer4.shouldExecute(($changed3 & 17) != 16, $changed3 & 1)) {
                                $composer4.skipToGroupEnd();
                                return;
                            }
                            if (ComposerKt.isTraceInProgress()) {
                                ComposerKt.traceEventStart(1156688164, $changed3, -1, "androidx.compose.foundation.contextmenu.ContextMenuPopup.<anonymous>.<anonymous> (ContextMenuUi.android.kt:131)");
                            }
                            ComposerKt.sourceInformationMarkerStart($composer4, 1358379317, "CC(remember):ContextMenuUi.android.kt#9igjgp");
                            Object it$iv = $composer4.rememberedValue();
                            if (it$iv == Composer.Companion.getEmpty()) {
                                Object value$iv = new ContextMenuScope();
                                $composer4.updateRememberedValue(value$iv);
                                it$iv = value$iv;
                            }
                            ContextMenuScope scope = (ContextMenuScope) it$iv;
                            ComposerKt.sourceInformationMarkerEnd($composer4);
                            Function1<ContextMenuScope, Unit> function13 = function12;
                            ContextMenuColors contextMenuColors3 = contextMenuColors2;
                            scope.clear$foundation_release();
                            function13.invoke(scope);
                            scope.Content$foundation_release(contextMenuColors3, $composer4, 0);
                            if (ComposerKt.isTraceInProgress()) {
                                ComposerKt.traceEventEnd();
                            }
                        }
                    }, $composer3, 54), $composer3, 384, 0);
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventEnd();
                    }
                }
            }, $composer2, 54), $composer2, ($dirty2 & 14) | 3456 | ($dirty2 & Property.BORDER_BOTTOM_RIGHT_RADIUS), 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier3;
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.contextmenu.ContextMenuUi_androidKt$ContextMenuPopup$3
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
                    ContextMenuUi_androidKt.ContextMenuPopup(PopupPositionProvider.this, function0, modifier2, colors, function1, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:63:0x01fa  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void ContextMenuColumn(final androidx.compose.foundation.contextmenu.ContextMenuColors r28, androidx.compose.ui.Modifier r29, final kotlin.jvm.functions.Function3<? super androidx.compose.foundation.layout.ColumnScope, ? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r30, androidx.compose.runtime.Composer r31, final int r32, final int r33) {
        /*
            Method dump skipped, instructions count: 538
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.contextmenu.ContextMenuUi_androidKt.ContextMenuColumn(androidx.compose.foundation.contextmenu.ContextMenuColors, androidx.compose.ui.Modifier, kotlin.jvm.functions.Function3, androidx.compose.runtime.Composer, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:113:0x028c  */
    /* JADX WARN: Removed duplicated region for block: B:114:0x029f  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x03e2  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x03e7  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x041b  */
    /* JADX WARN: Removed duplicated region for block: B:137:0x0420  */
    /* JADX WARN: Removed duplicated region for block: B:140:0x0475  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void ContextMenuItem(final java.lang.String r51, final boolean r52, final androidx.compose.foundation.contextmenu.ContextMenuColors r53, androidx.compose.ui.Modifier r54, kotlin.jvm.functions.Function3<? super androidx.compose.ui.graphics.Color, ? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r55, final kotlin.jvm.functions.Function0<kotlin.Unit> r56, androidx.compose.runtime.Composer r57, final int r58, final int r59) {
        /*
            Method dump skipped, instructions count: 1183
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.contextmenu.ContextMenuUi_androidKt.ContextMenuItem(java.lang.String, boolean, androidx.compose.foundation.contextmenu.ContextMenuColors, androidx.compose.ui.Modifier, kotlin.jvm.functions.Function3, kotlin.jvm.functions.Function0, androidx.compose.runtime.Composer, int, int):void");
    }

    public static final ContextMenuColors getDefaultContextMenuColors() {
        return DefaultContextMenuColors;
    }

    public static final ContextMenuColors computeContextMenuColors(int backgroundStyleId, int foregroundStyleId, Composer $composer, int $changed, int i) {
        ComposerKt.sourceInformationMarkerStart($composer, 1689505294, "C(computeContextMenuColors)364@13466L7,365@13522L7,365@13485L898:ContextMenuUi.android.kt#3xeu6s");
        int backgroundStyleId2 = (i & 1) != 0 ? 16973958 : backgroundStyleId;
        int foregroundStyleId2 = (i & 2) != 0 ? 16973952 : foregroundStyleId;
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(1689505294, $changed, -1, "androidx.compose.foundation.contextmenu.computeContextMenuColors (ContextMenuUi.android.kt:363)");
        }
        ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
        Object consume = $composer.consume(AndroidCompositionLocals_androidKt.getLocalContext());
        ComposerKt.sourceInformationMarkerEnd($composer);
        Context context = (Context) consume;
        ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
        Object consume2 = $composer.consume(AndroidCompositionLocals_androidKt.getLocalConfiguration());
        ComposerKt.sourceInformationMarkerEnd($composer);
        ComposerKt.sourceInformationMarkerStart($composer, -753188989, "CC(remember):ContextMenuUi.android.kt#9igjgp");
        boolean invalid$iv = $composer.changed(context) | $composer.changed((Configuration) consume2);
        Object it$iv = $composer.rememberedValue();
        if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
            long backgroundColor = m630resolveColorg2O1Hgs(context, backgroundStyleId2, 16842801, DefaultContextMenuColors.m607getBackgroundColor0d7_KjU());
            ColorStateList textColorStateList = resolveColorStateList(context, foregroundStyleId2, 16842806);
            long enabledColor = m629enabledColor4WTKRHQ(textColorStateList, DefaultContextMenuColors.m611getTextColor0d7_KjU());
            long disabledColor = m628disabledColor4WTKRHQ(textColorStateList, DefaultContextMenuColors.m609getDisabledTextColor0d7_KjU());
            Object value$iv = new ContextMenuColors(backgroundColor, enabledColor, enabledColor, disabledColor, disabledColor, null);
            $composer.updateRememberedValue(value$iv);
            it$iv = value$iv;
        }
        ContextMenuColors contextMenuColors = (ContextMenuColors) it$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return contextMenuColors;
    }

    /* renamed from: resolveColor-g2O1Hgs  reason: not valid java name */
    private static final long m630resolveColorg2O1Hgs(Context $this$resolveColor_u2dg2O1Hgs, int resId, int attrId, long defaultColor) {
        TypedArray typedArray = $this$resolveColor_u2dg2O1Hgs.obtainStyledAttributes(resId, new int[]{attrId});
        int defaultColorAndroid = ColorKt.m4343toArgb8_81llA(defaultColor);
        int colorInt = typedArray.getColor(0, defaultColorAndroid);
        typedArray.recycle();
        return colorInt == defaultColorAndroid ? defaultColor : ColorKt.Color(colorInt);
    }

    private static final ColorStateList resolveColorStateList(Context $this$resolveColorStateList, int resId, int attrId) {
        TypedArray typedArray = $this$resolveColorStateList.obtainStyledAttributes(resId, new int[]{attrId});
        ColorStateList colorStateList = typedArray.getColorStateList(0);
        typedArray.recycle();
        return colorStateList;
    }

    /* renamed from: enabledColor-4WTKRHQ  reason: not valid java name */
    private static final long m629enabledColor4WTKRHQ(ColorStateList $this$enabledColor_u2d4WTKRHQ, long defaultColor) {
        int defaultColorArgb = ColorKt.m4343toArgb8_81llA(defaultColor);
        Integer color = $this$enabledColor_u2d4WTKRHQ != null ? Integer.valueOf($this$enabledColor_u2d4WTKRHQ.getColorForState(new int[]{16842910}, defaultColorArgb)) : null;
        return (color == null || color.intValue() == defaultColorArgb) ? defaultColor : ColorKt.Color(color.intValue());
    }

    /* renamed from: disabledColor-4WTKRHQ  reason: not valid java name */
    private static final long m628disabledColor4WTKRHQ(ColorStateList $this$disabledColor_u2d4WTKRHQ, long defaultColor) {
        int defaultColorArgb = ColorKt.m4343toArgb8_81llA(defaultColor);
        Integer color = $this$disabledColor_u2d4WTKRHQ != null ? Integer.valueOf($this$disabledColor_u2d4WTKRHQ.getColorForState(new int[]{-16842910}, defaultColorArgb)) : null;
        return (color == null || color.intValue() == defaultColorArgb) ? defaultColor : ColorKt.Color(color.intValue());
    }
}
