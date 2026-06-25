package androidx.compose.foundation.text;

import androidx.compose.foundation.text.modifiers.SelectableTextAnnotatedStringElement;
import androidx.compose.foundation.text.modifiers.SelectionController;
import androidx.compose.foundation.text.modifiers.TextAnnotatedStringElement;
import androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode;
import androidx.compose.foundation.text.modifiers.TextAnnotatedStringNodeKt;
import androidx.compose.foundation.text.selection.SelectionRegistrar;
import androidx.compose.foundation.text.selection.SelectionRegistrarKt;
import androidx.compose.foundation.text.selection.TextSelectionColors;
import androidx.compose.foundation.text.selection.TextSelectionColorsKt;
import androidx.compose.runtime.Applier;
import androidx.compose.runtime.ComposablesKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.CompositionLocalMap;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.Updater;
import androidx.compose.runtime.saveable.RememberSaveableKt;
import androidx.compose.runtime.saveable.Saver;
import androidx.compose.runtime.saveable.SaverKt;
import androidx.compose.runtime.saveable.SaverScope;
import androidx.compose.ui.ComposedModifierKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.graphics.ColorProducer;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasurePolicy;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.node.ComposeUiNode;
import androidx.compose.ui.platform.CompositionLocalsKt;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.Placeholder;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.style.TextOverflow;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.IntOffset;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.profileinstaller.ProfileVerifier;
import com.google.android.material.internal.ViewUtils;
import com.itextpdf.kernel.xmp.options.PropertyOptions;
import com.itextpdf.layout.properties.Property;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: BasicText.kt */
@Metadata(d1 = {"\u0000®\u0001\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\u001a\u0084\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\u0016\b\u0002\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u00102\b\b\u0002\u0010\u0011\u001a\u00020\u00102\u0014\b\u0002\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u00150\u0013H\u0007ø\u0001\u0000¢\u0006\u0004\b\u0016\u0010\u0017\u001a\u0090\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\u0016\b\u0002\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u00102\b\b\u0002\u0010\u0011\u001a\u00020\u00102\u0014\b\u0002\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u00150\u00132\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0019H\u0007ø\u0001\u0000¢\u0006\u0004\b\u001a\u0010\u001b\u001a\u009c\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\u0016\b\u0002\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u00102\b\b\u0002\u0010\u0011\u001a\u00020\u00102\u0014\b\u0002\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u00150\u00132\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00192\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u001dH\u0007ø\u0001\u0000¢\u0006\u0004\b\u001e\u0010\u001f\u001az\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\u0016\b\u0002\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u00102\u0014\b\u0002\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u00150\u0013H\u0007ø\u0001\u0000¢\u0006\u0004\b \u0010!\u001ad\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00142\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\u0016\b\u0002\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u0010H\u0007ø\u0001\u0000¢\u0006\u0004\b\"\u0010#\u001an\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00142\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\u0016\b\u0002\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u00102\b\b\u0002\u0010\u0011\u001a\u00020\u0010H\u0007ø\u0001\u0000¢\u0006\u0004\b \u0010$\u001az\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00142\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\u0016\b\u0002\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u00102\b\b\u0002\u0010\u0011\u001a\u00020\u00102\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0019H\u0007ø\u0001\u0000¢\u0006\u0004\b\u0016\u0010%\u001a\u0086\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00142\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\u0016\b\u0002\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u00102\b\b\u0002\u0010\u0011\u001a\u00020\u00102\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00192\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u001dH\u0007ø\u0001\u0000¢\u0006\u0004\b\u001a\u0010&\u001aº\u0001\u0010'\u001a\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0002\u001a\u00020\u00032\u0014\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\u0006\u0010(\u001a\u00020\u000e2\u0014\b\u0002\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u00150\u00132\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010)\u001a\u00020*2\b\u0010+\u001a\u0004\u0018\u00010,2\b\u0010\u0018\u001a\u0004\u0018\u00010\u00192\u0014\u0010-\u001a\u0010\u0012\u0004\u0012\u00020.\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\b\u0010\u001c\u001a\u0004\u0018\u00010\u001dH\u0003ø\u0001\u0000¢\u0006\u0004\b/\u00100\u001a@\u00101\u001a\u001e\u0012\u0018\u0012\u0016\u0012\u0004\u0012\u000204\u0012\f\u0012\n\u0012\u0004\u0012\u000206\u0018\u00010503\u0018\u0001022\f\u00107\u001a\b\u0012\u0004\u0012\u000208022\f\u00109\u001a\b\u0012\u0004\u0012\u00020\u000e05H\u0002\u001a\u001e\u0010:\u001a\u000e\u0012\u0004\u0012\u00020<\u0012\u0004\u0012\u00020<0;2\b\u0010=\u001a\u0004\u0018\u00010>H\u0002\u001aÌ\u0001\u0010?\u001a\u00020\u0005*\u00020\u00052\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00072\u0014\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010)\u001a\u00020*2\u0014\u0010@\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020B0A\u0018\u0001022\u001c\u0010C\u001a\u0018\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010D02\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\b\u0010+\u001a\u0004\u0018\u00010,2\b\u0010\u0018\u001a\u0004\u0018\u00010\u00192\u0014\u0010-\u001a\u0010\u0012\u0004\u0012\u00020.\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\b\u0010\u001c\u001a\u0004\u0018\u00010\u001dH\u0002ø\u0001\u0000¢\u0006\u0004\bE\u0010F\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006G²\u0006\n\u0010H\u001a\u00020\u0003X\u008a\u008e\u0002"}, d2 = {"BasicText", "", "text", "Landroidx/compose/ui/text/AnnotatedString;", "modifier", "Landroidx/compose/ui/Modifier;", "style", "Landroidx/compose/ui/text/TextStyle;", "onTextLayout", "Lkotlin/Function1;", "Landroidx/compose/ui/text/TextLayoutResult;", "overflow", "Landroidx/compose/ui/text/style/TextOverflow;", "softWrap", "", "maxLines", "", "minLines", "inlineContent", "", "", "Landroidx/compose/foundation/text/InlineTextContent;", "BasicText-VhcvRP8", "(Landroidx/compose/ui/text/AnnotatedString;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function1;IZIILjava/util/Map;Landroidx/compose/runtime/Composer;II)V", TypedValues.Custom.S_COLOR, "Landroidx/compose/ui/graphics/ColorProducer;", "BasicText-RWo7tUw", "(Landroidx/compose/ui/text/AnnotatedString;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function1;IZIILjava/util/Map;Landroidx/compose/ui/graphics/ColorProducer;Landroidx/compose/runtime/Composer;II)V", "autoSize", "Landroidx/compose/foundation/text/TextAutoSize;", "BasicText-CL7eQgs", "(Landroidx/compose/ui/text/AnnotatedString;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function1;IZIILjava/util/Map;Landroidx/compose/ui/graphics/ColorProducer;Landroidx/compose/foundation/text/TextAutoSize;Landroidx/compose/runtime/Composer;III)V", "BasicText-4YKlhWE", "(Landroidx/compose/ui/text/AnnotatedString;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function1;IZILjava/util/Map;Landroidx/compose/runtime/Composer;II)V", "BasicText-BpD7jsM", "(Ljava/lang/String;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function1;IZILandroidx/compose/runtime/Composer;II)V", "(Ljava/lang/String;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function1;IZIILandroidx/compose/runtime/Composer;II)V", "(Ljava/lang/String;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function1;IZIILandroidx/compose/ui/graphics/ColorProducer;Landroidx/compose/runtime/Composer;II)V", "(Ljava/lang/String;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function1;IZIILandroidx/compose/ui/graphics/ColorProducer;Landroidx/compose/foundation/text/TextAutoSize;Landroidx/compose/runtime/Composer;II)V", "LayoutWithLinksAndInlineContent", "hasInlineContent", "fontFamilyResolver", "Landroidx/compose/ui/text/font/FontFamily$Resolver;", "selectionController", "Landroidx/compose/foundation/text/modifiers/SelectionController;", "onShowTranslation", "Landroidx/compose/foundation/text/modifiers/TextAnnotatedStringNode$TextSubstitutionValue;", "LayoutWithLinksAndInlineContent-11Od_4g", "(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/text/AnnotatedString;Lkotlin/jvm/functions/Function1;ZLjava/util/Map;Landroidx/compose/ui/text/TextStyle;IZIILandroidx/compose/ui/text/font/FontFamily$Resolver;Landroidx/compose/foundation/text/modifiers/SelectionController;Landroidx/compose/ui/graphics/ColorProducer;Lkotlin/jvm/functions/Function1;Landroidx/compose/foundation/text/TextAutoSize;Landroidx/compose/runtime/Composer;III)V", "measureWithTextRangeMeasureConstraints", "", "Lkotlin/Pair;", "Landroidx/compose/ui/layout/Placeable;", "Lkotlin/Function0;", "Landroidx/compose/ui/unit/IntOffset;", "measurables", "Landroidx/compose/ui/layout/Measurable;", "shouldMeasureLinks", "selectionIdSaver", "Landroidx/compose/runtime/saveable/Saver;", "", "selectionRegistrar", "Landroidx/compose/foundation/text/selection/SelectionRegistrar;", "textModifier", "placeholders", "Landroidx/compose/ui/text/AnnotatedString$Range;", "Landroidx/compose/ui/text/Placeholder;", "onPlaceholderLayout", "Landroidx/compose/ui/geometry/Rect;", "textModifier-CL7eQgs", "(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/text/AnnotatedString;Landroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function1;IZIILandroidx/compose/ui/text/font/FontFamily$Resolver;Ljava/util/List;Lkotlin/jvm/functions/Function1;Landroidx/compose/foundation/text/modifiers/SelectionController;Landroidx/compose/ui/graphics/ColorProducer;Lkotlin/jvm/functions/Function1;Landroidx/compose/foundation/text/TextAutoSize;)Landroidx/compose/ui/Modifier;", "foundation_release", "displayedText"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class BasicTextKt {
    public static final /* synthetic */ List access$measureWithTextRangeMeasureConstraints(List measurables, Function0 shouldMeasureLinks) {
        return measureWithTextRangeMeasureConstraints(measurables, shouldMeasureLinks);
    }

    /* JADX WARN: Code restructure failed: missing block: B:353:0x0239, code lost:
        if (r9 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L63;
     */
    /* JADX WARN: Removed duplicated region for block: B:315:0x0166  */
    /* JADX WARN: Removed duplicated region for block: B:316:0x0168  */
    /* JADX WARN: Removed duplicated region for block: B:319:0x0171  */
    /* JADX WARN: Removed duplicated region for block: B:378:0x03cd  */
    /* JADX WARN: Removed duplicated region for block: B:381:0x03d9  */
    /* JADX WARN: Removed duplicated region for block: B:382:0x03dd  */
    /* JADX WARN: Removed duplicated region for block: B:385:0x0414  */
    /* JADX WARN: Removed duplicated region for block: B:389:0x042a  */
    /* JADX WARN: Removed duplicated region for block: B:393:0x0454  */
    /* JADX WARN: Removed duplicated region for block: B:395:0x046b  */
    /* JADX WARN: Removed duplicated region for block: B:398:0x0483  */
    /* JADX WARN: Removed duplicated region for block: B:399:0x0492  */
    /* renamed from: BasicText-RWo7tUw */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void m1301BasicTextRWo7tUw(final java.lang.String r39, androidx.compose.ui.Modifier r40, androidx.compose.ui.text.TextStyle r41, kotlin.jvm.functions.Function1<? super androidx.compose.ui.text.TextLayoutResult, kotlin.Unit> r42, int r43, boolean r44, int r45, int r46, androidx.compose.ui.graphics.ColorProducer r47, androidx.compose.foundation.text.TextAutoSize r48, androidx.compose.runtime.Composer r49, final int r50, final int r51) {
        /*
            Method dump skipped, instructions count: 1172
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.BasicTextKt.m1301BasicTextRWo7tUw(java.lang.String, androidx.compose.ui.Modifier, androidx.compose.ui.text.TextStyle, kotlin.jvm.functions.Function1, int, boolean, int, int, androidx.compose.ui.graphics.ColorProducer, androidx.compose.foundation.text.TextAutoSize, androidx.compose.runtime.Composer, int, int):void");
    }

    /* renamed from: BasicText-CL7eQgs */
    public static final void m1299BasicTextCL7eQgs(AnnotatedString text, Modifier modifier, TextStyle style, Function1<? super TextLayoutResult, Unit> function1, int overflow, boolean softWrap, int maxLines, int minLines, Map<String, InlineTextContent> map, ColorProducer color, TextAutoSize autoSize, Composer $composer, final int $changed, final int $changed1, final int i) {
        Object obj;
        Object obj2;
        Function1 function12;
        int i2;
        int i3;
        int i4;
        int i5;
        final AnnotatedString annotatedString;
        Composer $composer2;
        final boolean softWrap2;
        final int minLines2;
        final Map inlineContent;
        final TextAutoSize autoSize2;
        final int overflow2;
        final Modifier modifier2;
        final TextStyle style2;
        final Function1 onTextLayout;
        final int minLines3;
        final ColorProducer color2;
        Modifier.Companion modifier3;
        TextStyle style3;
        Function1 onTextLayout2;
        int overflow3;
        boolean softWrap3;
        int maxLines2;
        boolean softWrap4;
        int minLines4;
        Map inlineContent2;
        ColorProducer color3;
        TextAutoSize autoSize3;
        int overflow4;
        TextStyle style4;
        Function1 onTextLayout3;
        int $dirty;
        int $dirty1;
        SelectionController selectionController;
        int maxLines3;
        boolean softWrap5;
        Object value$iv;
        Function1 onTextLayout4;
        Composer $composer3;
        boolean invalid$iv;
        Composer $composer4 = $composer.startRestartGroup(-1343466571);
        ComposerKt.sourceInformation($composer4, "C(BasicText)P(10,5,9,6,7:c#ui.text.style.TextOverflow,8,3,4,2,1)196@10069L7:BasicText.kt#423gt5");
        int $dirty2 = $changed;
        int $dirty12 = $changed1;
        if ((i & 1) != 0) {
            $dirty2 |= 6;
        } else if (($changed & 6) == 0) {
            $dirty2 |= $composer4.changed(text) ? 4 : 2;
        }
        int i6 = i & 2;
        if (i6 != 0) {
            $dirty2 |= 48;
            obj = modifier;
        } else if (($changed & 48) == 0) {
            obj = modifier;
            $dirty2 |= $composer4.changed(obj) ? 32 : 16;
        } else {
            obj = modifier;
        }
        int i7 = i & 4;
        if (i7 != 0) {
            $dirty2 |= 384;
            obj2 = style;
        } else if (($changed & 384) == 0) {
            obj2 = style;
            $dirty2 |= $composer4.changed(obj2) ? 256 : 128;
        } else {
            obj2 = style;
        }
        int i8 = i & 8;
        if (i8 != 0) {
            $dirty2 |= 3072;
            function12 = function1;
        } else if (($changed & 3072) == 0) {
            function12 = function1;
            $dirty2 |= $composer4.changedInstance(function12) ? 2048 : 1024;
        } else {
            function12 = function1;
        }
        int i9 = i & 16;
        if (i9 != 0) {
            $dirty2 |= 24576;
            i2 = overflow;
        } else if (($changed & 24576) == 0) {
            i2 = overflow;
            $dirty2 |= $composer4.changed(i2) ? 16384 : 8192;
        } else {
            i2 = overflow;
        }
        int i10 = i & 32;
        if (i10 != 0) {
            $dirty2 |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            $dirty2 |= $composer4.changed(softWrap) ? 131072 : 65536;
        }
        int i11 = i & 64;
        if (i11 != 0) {
            $dirty2 |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty2 |= $composer4.changed(maxLines) ? 1048576 : 524288;
        }
        int i12 = i & 128;
        if (i12 != 0) {
            $dirty2 |= 12582912;
            i3 = i12;
        } else if (($changed & 12582912) == 0) {
            i3 = i12;
            $dirty2 |= $composer4.changed(minLines) ? 8388608 : 4194304;
        } else {
            i3 = i12;
        }
        int i13 = i & 256;
        if (i13 != 0) {
            $dirty2 |= 100663296;
            i4 = i13;
        } else if (($changed & 100663296) == 0) {
            i4 = i13;
            $dirty2 |= $composer4.changedInstance(map) ? 67108864 : 33554432;
        } else {
            i4 = i13;
        }
        int i14 = i & 512;
        if (i14 != 0) {
            $dirty2 |= 805306368;
            i5 = i14;
        } else if (($changed & 805306368) == 0) {
            i5 = i14;
            $dirty2 |= $composer4.changedInstance(color) ? PropertyOptions.DELETE_EXISTING : 268435456;
        } else {
            i5 = i14;
        }
        int overflow5 = i & 1024;
        if (overflow5 != 0) {
            $dirty12 |= 6;
        } else if (($changed1 & 6) == 0) {
            $dirty12 |= ($changed1 & 8) == 0 ? $composer4.changed(autoSize) : $composer4.changedInstance(autoSize) ? 4 : 2;
        }
        if ($composer4.shouldExecute((($dirty2 & 306783379) == 306783378 && ($dirty12 & 3) == 2) ? false : true, $dirty2 & 1)) {
            if (i6 != 0) {
                modifier3 = Modifier.Companion;
            } else {
                modifier3 = obj;
            }
            if (i7 == 0) {
                style3 = obj2;
            } else {
                style3 = TextStyle.Companion.getDefault();
            }
            if (i8 == 0) {
                onTextLayout2 = function12;
            } else {
                onTextLayout2 = null;
            }
            if (i9 == 0) {
                overflow3 = i2;
            } else {
                overflow3 = TextOverflow.Companion.m6808getClipgIe3tQ8();
            }
            if (i10 == 0) {
                softWrap3 = softWrap;
            } else {
                softWrap3 = true;
            }
            if (i11 == 0) {
                maxLines2 = maxLines;
            } else {
                maxLines2 = Integer.MAX_VALUE;
            }
            if (i3 == 0) {
                softWrap4 = softWrap3;
                minLines4 = minLines;
            } else {
                softWrap4 = softWrap3;
                minLines4 = 1;
            }
            if (i4 == 0) {
                inlineContent2 = map;
            } else {
                inlineContent2 = MapsKt.emptyMap();
            }
            if (i5 == 0) {
                color3 = color;
            } else {
                color3 = null;
            }
            if (overflow5 == 0) {
                autoSize3 = autoSize;
            } else {
                autoSize3 = null;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1343466571, $dirty2, $dirty12, "androidx.compose.foundation.text.BasicText (BasicText.kt:194)");
            }
            HeightInLinesModifierKt.validateMinMaxLines(minLines4, maxLines2);
            Modifier modifier4 = modifier3;
            ComposerKt.sourceInformationMarkerStart($composer4, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
            Object consume = $composer4.consume(SelectionRegistrarKt.getLocalSelectionRegistrar());
            ComposerKt.sourceInformationMarkerEnd($composer4);
            final SelectionRegistrar selectionRegistrar = (SelectionRegistrar) consume;
            if (selectionRegistrar == null) {
                overflow4 = overflow3;
                style4 = style3;
                onTextLayout3 = onTextLayout2;
                $dirty = $dirty2;
                $dirty1 = $dirty12;
                $composer4.startReplaceGroup(-1583679630);
                $composer4.endReplaceGroup();
                selectionController = null;
            } else {
                $composer4.startReplaceGroup(-1584170794);
                ComposerKt.sourceInformation($composer4, "199@10217L7,201@10371L77,201@10288L160,204@10461L180");
                overflow4 = overflow3;
                ComposerKt.sourceInformationMarkerStart($composer4, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                Object consume2 = $composer4.consume(TextSelectionColorsKt.getLocalTextSelectionColors());
                ComposerKt.sourceInformationMarkerEnd($composer4);
                style4 = style3;
                long backgroundSelectionColor = ((TextSelectionColors) consume2).m1781getBackgroundColor0d7_KjU();
                Object[] objArr = {selectionRegistrar};
                Saver<Long, Long> selectionIdSaver = selectionIdSaver(selectionRegistrar);
                onTextLayout3 = onTextLayout2;
                ComposerKt.sourceInformationMarkerStart($composer4, -328190207, "CC(remember):BasicText.kt#9igjgp");
                boolean invalid$iv2 = $composer4.changedInstance(selectionRegistrar);
                Object value$iv2 = $composer4.rememberedValue();
                if (invalid$iv2) {
                    $composer3 = $composer4;
                } else {
                    $composer3 = $composer4;
                    if (value$iv2 != Composer.Companion.getEmpty()) {
                        ComposerKt.sourceInformationMarkerEnd($composer3);
                        Composer $composer5 = $composer3;
                        $composer4 = $composer5;
                        long selectableId = ((Number) RememberSaveableKt.m3846rememberSaveable(objArr, selectionIdSaver, (String) null, (Function0<? extends Object>) value$iv2, $composer5, 0, 4)).longValue();
                        ComposerKt.sourceInformationMarkerStart($composer4, -328187224, "CC(remember):BasicText.kt#9igjgp");
                        $dirty = $dirty2;
                        $dirty1 = $dirty12;
                        invalid$iv = $composer4.changed(selectableId) | $composer4.changed(selectionRegistrar) | $composer4.changed(backgroundSelectionColor);
                        Object it$iv = $composer4.rememberedValue();
                        if (!invalid$iv && it$iv != Composer.Companion.getEmpty()) {
                            ComposerKt.sourceInformationMarkerEnd($composer4);
                            $composer4.endReplaceGroup();
                            selectionController = (SelectionController) it$iv;
                        }
                        Object value$iv3 = new SelectionController(selectableId, selectionRegistrar, backgroundSelectionColor, null, 8, null);
                        $composer4.updateRememberedValue(value$iv3);
                        it$iv = value$iv3;
                        ComposerKt.sourceInformationMarkerEnd($composer4);
                        $composer4.endReplaceGroup();
                        selectionController = (SelectionController) it$iv;
                    }
                }
                value$iv2 = (Function0) new Function0<Long>() { // from class: androidx.compose.foundation.text.BasicTextKt$BasicText$selectionController$selectableId$2$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(0);
                    }

                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // kotlin.jvm.functions.Function0
                    public final Long invoke() {
                        return Long.valueOf(SelectionRegistrar.this.nextSelectableId());
                    }
                };
                $composer4.updateRememberedValue(value$iv2);
                ComposerKt.sourceInformationMarkerEnd($composer3);
                Composer $composer52 = $composer3;
                $composer4 = $composer52;
                long selectableId2 = ((Number) RememberSaveableKt.m3846rememberSaveable(objArr, selectionIdSaver, (String) null, (Function0<? extends Object>) value$iv2, $composer52, 0, 4)).longValue();
                ComposerKt.sourceInformationMarkerStart($composer4, -328187224, "CC(remember):BasicText.kt#9igjgp");
                $dirty = $dirty2;
                $dirty1 = $dirty12;
                invalid$iv = $composer4.changed(selectableId2) | $composer4.changed(selectionRegistrar) | $composer4.changed(backgroundSelectionColor);
                Object it$iv2 = $composer4.rememberedValue();
                if (!invalid$iv) {
                    ComposerKt.sourceInformationMarkerEnd($composer4);
                    $composer4.endReplaceGroup();
                    selectionController = (SelectionController) it$iv2;
                }
                Object value$iv32 = new SelectionController(selectableId2, selectionRegistrar, backgroundSelectionColor, null, 8, null);
                $composer4.updateRememberedValue(value$iv32);
                it$iv2 = value$iv32;
                ComposerKt.sourceInformationMarkerEnd($composer4);
                $composer4.endReplaceGroup();
                selectionController = (SelectionController) it$iv2;
            }
            int $dirty3 = $dirty;
            Function1 onTextLayout5 = onTextLayout3;
            boolean hasInlineContent = AnnotatedStringResolveInlineContentKt.hasInlineContent(text);
            boolean hasLinks = TextAnnotatedStringNodeKt.hasLinks(text);
            if (hasInlineContent || hasLinks) {
                annotatedString = text;
                Composer $composer6 = $composer4;
                maxLines3 = maxLines2;
                softWrap5 = softWrap4;
                int $dirty13 = $dirty1;
                SelectionController selectionController2 = selectionController;
                $composer6.startReplaceGroup(-1582650709);
                ComposerKt.sourceInformation($composer6, "237@11821L39,250@12319L7,253@12442L292,239@11870L907");
                ComposerKt.sourceInformationMarkerStart($composer6, -328143845, "CC(remember):BasicText.kt#9igjgp");
                boolean invalid$iv3 = ($dirty3 & 14) == 4;
                Object it$iv3 = $composer6.rememberedValue();
                if (invalid$iv3 || it$iv3 == Composer.Companion.getEmpty()) {
                    value$iv = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(annotatedString, null, 2, null);
                    $composer6.updateRememberedValue(value$iv);
                    it$iv3 = value$iv;
                }
                final MutableState displayedText$delegate = (MutableState) it$iv3;
                ComposerKt.sourceInformationMarkerEnd($composer6);
                AnnotatedString BasicText_CL7eQgs$lambda$5 = BasicText_CL7eQgs$lambda$5(displayedText$delegate);
                ComposerKt.sourceInformationMarkerStart($composer6, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                Object consume3 = $composer6.consume(CompositionLocalsKt.getLocalFontFamilyResolver());
                ComposerKt.sourceInformationMarkerEnd($composer6);
                FontFamily.Resolver resolver = (FontFamily.Resolver) consume3;
                ComposerKt.sourceInformationMarkerStart($composer6, -328123720, "CC(remember):BasicText.kt#9igjgp");
                boolean invalid$iv4 = $composer6.changed(displayedText$delegate);
                Object it$iv4 = $composer6.rememberedValue();
                if (invalid$iv4 || it$iv4 == Composer.Companion.getEmpty()) {
                    Object value$iv4 = (Function1) new Function1<TextAnnotatedStringNode.TextSubstitutionValue, Unit>() { // from class: androidx.compose.foundation.text.BasicTextKt$BasicText$2$1
                        /* JADX INFO: Access modifiers changed from: package-private */
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        {
                            super(1);
                        }

                        @Override // kotlin.jvm.functions.Function1
                        public /* bridge */ /* synthetic */ Unit invoke(TextAnnotatedStringNode.TextSubstitutionValue textSubstitutionValue) {
                            invoke2(textSubstitutionValue);
                            return Unit.INSTANCE;
                        }

                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                        public final void invoke2(TextAnnotatedStringNode.TextSubstitutionValue substitutionValue) {
                            AnnotatedString original;
                            MutableState<AnnotatedString> mutableState = displayedText$delegate;
                            if (substitutionValue.isShowingSubstitution()) {
                                original = substitutionValue.getSubstitution();
                            } else {
                                original = substitutionValue.getOriginal();
                            }
                            mutableState.setValue(original);
                        }
                    };
                    $composer6.updateRememberedValue(value$iv4);
                    it$iv4 = value$iv4;
                }
                ComposerKt.sourceInformationMarkerEnd($composer6);
                $composer2 = $composer6;
                m1304LayoutWithLinksAndInlineContent11Od_4g(modifier4, BasicText_CL7eQgs$lambda$5, onTextLayout5, hasInlineContent, inlineContent2, style4, overflow4, softWrap5, maxLines3, minLines4, resolver, selectionController2, color3, (Function1) it$iv4, autoSize3, $composer2, (($dirty3 >> 3) & 14) | (($dirty3 >> 3) & 896) | (($dirty3 >> 12) & 57344) | (($dirty3 << 9) & 458752) | (($dirty3 << 6) & 3670016) | (($dirty3 << 6) & 29360128) | (($dirty3 << 6) & 234881024) | (($dirty3 << 6) & 1879048192), (($dirty3 >> 21) & 896) | (($dirty13 << 12) & 57344), 0);
                onTextLayout4 = onTextLayout5;
                modifier4 = modifier4;
                $composer2.endReplaceGroup();
            } else {
                $composer4.startReplaceGroup(-1583500636);
                ComposerKt.sourceInformation($composer4, "224@11307L7,214@10891L757");
                ComposerKt.sourceInformationMarkerStart($composer4, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                Object consume4 = $composer4.consume(CompositionLocalsKt.getLocalFontFamilyResolver());
                ComposerKt.sourceInformationMarkerEnd($composer4);
                softWrap5 = softWrap4;
                annotatedString = text;
                Composer $composer7 = $composer4;
                maxLines3 = maxLines2;
                Modifier modifier$iv = m1306textModifierCL7eQgs(modifier4, annotatedString, style4, onTextLayout5, overflow4, softWrap5, maxLines3, minLines4, (FontFamily.Resolver) consume4, null, null, selectionController, color3, null, autoSize3);
                MeasurePolicy measurePolicy$iv = EmptyMeasurePolicy.INSTANCE;
                ComposerKt.sourceInformationMarkerStart($composer7, 544976794, "CC(Layout)P(1)121@4798L23,124@4949L333:Layout.kt#80mrfh");
                int compositeKeyHash$iv = ComposablesKt.getCurrentCompositeKeyHash($composer7, 0);
                Modifier materialized$iv = ComposedModifierKt.materializeModifier($composer7, modifier$iv);
                CompositionLocalMap localMap$iv = $composer7.getCurrentCompositionLocalMap();
                Function0 factory$iv$iv = ComposeUiNode.Companion.getConstructor();
                ComposerKt.sourceInformationMarkerStart($composer7, 1405779621, "CC(ReusableComposeNode):Composables.kt#9igjgp");
                if (!($composer7.getApplier() instanceof Applier)) {
                    ComposablesKt.invalidApplier();
                }
                $composer7.startReusableNode();
                if ($composer7.getInserting()) {
                    $composer7.createNode(factory$iv$iv);
                } else {
                    $composer7.useNode();
                }
                Composer $this$Layout_u24lambda_u241$iv = Updater.m3731constructorimpl($composer7);
                Updater.m3738setimpl($this$Layout_u24lambda_u241$iv, measurePolicy$iv, ComposeUiNode.Companion.getSetMeasurePolicy());
                Updater.m3738setimpl($this$Layout_u24lambda_u241$iv, localMap$iv, ComposeUiNode.Companion.getSetResolvedCompositionLocals());
                Updater.m3738setimpl($this$Layout_u24lambda_u241$iv, materialized$iv, ComposeUiNode.Companion.getSetModifier());
                Function2 block$iv$iv = ComposeUiNode.Companion.getSetCompositeKeyHash();
                if (!$this$Layout_u24lambda_u241$iv.getInserting() && Intrinsics.areEqual($this$Layout_u24lambda_u241$iv.rememberedValue(), Integer.valueOf(compositeKeyHash$iv))) {
                    $composer7.endNode();
                    ComposerKt.sourceInformationMarkerEnd($composer7);
                    ComposerKt.sourceInformationMarkerEnd($composer7);
                    $composer7.endReplaceGroup();
                    onTextLayout4 = onTextLayout5;
                    $composer2 = $composer7;
                }
                $this$Layout_u24lambda_u241$iv.updateRememberedValue(Integer.valueOf(compositeKeyHash$iv));
                $this$Layout_u24lambda_u241$iv.apply(Integer.valueOf(compositeKeyHash$iv), block$iv$iv);
                $composer7.endNode();
                ComposerKt.sourceInformationMarkerEnd($composer7);
                ComposerKt.sourceInformationMarkerEnd($composer7);
                $composer7.endReplaceGroup();
                onTextLayout4 = onTextLayout5;
                $composer2 = $composer7;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            onTextLayout = onTextLayout4;
            minLines3 = minLines4;
            color2 = color3;
            autoSize2 = autoSize3;
            modifier2 = modifier4;
            inlineContent = inlineContent2;
            style2 = style4;
            overflow2 = overflow4;
            minLines2 = maxLines3;
            softWrap2 = softWrap5;
        } else {
            annotatedString = text;
            $composer2 = $composer4;
            $composer2.skipToGroupEnd();
            softWrap2 = softWrap;
            minLines2 = maxLines;
            inlineContent = map;
            autoSize2 = autoSize;
            overflow2 = i2;
            modifier2 = obj;
            style2 = obj2;
            onTextLayout = function12;
            minLines3 = minLines;
            color2 = color;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.BasicTextKt$BasicText$3
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

                public final void invoke(Composer composer, int i15) {
                    BasicTextKt.m1299BasicTextCL7eQgs(AnnotatedString.this, modifier2, style2, onTextLayout, overflow2, softWrap2, minLines2, minLines3, inlineContent, color2, autoSize2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }

    private static final AnnotatedString BasicText_CL7eQgs$lambda$5(MutableState<AnnotatedString> mutableState) {
        MutableState<AnnotatedString> $this$getValue$iv = mutableState;
        return $this$getValue$iv.getValue();
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Maintained for binary compatibility")
    /* renamed from: BasicText-VhcvRP8 */
    public static final /* synthetic */ void m1303BasicTextVhcvRP8(final String text, Modifier modifier, TextStyle style, Function1 onTextLayout, int overflow, boolean softWrap, int maxLines, int minLines, ColorProducer color, Composer $composer, final int $changed, final int i) {
        String str;
        Object modifier2;
        Object obj;
        Object onTextLayout2;
        int i2;
        int i3;
        Composer $composer2;
        final int overflow2;
        final int maxLines2;
        int minLines2;
        final ColorProducer color2;
        final TextStyle style2;
        final boolean softWrap2;
        Modifier modifier3;
        int i4;
        TextStyle style3;
        Function1 onTextLayout3;
        int overflow3;
        int overflow4;
        boolean softWrap3;
        int i5;
        int maxLines3;
        int maxLines4;
        int minLines3;
        ColorProducer color3;
        Composer $composer3 = $composer.startRestartGroup(-1186827822);
        ComposerKt.sourceInformation($composer3, "C(BasicText)P(8,3,7,4,5:c#ui.text.style.TextOverflow,6,1,2)302@14843L93:BasicText.kt#423gt5");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
            str = text;
        } else if (($changed & 6) == 0) {
            str = text;
            $dirty |= $composer3.changed(str) ? 4 : 2;
        } else {
            str = text;
        }
        int i6 = i & 2;
        if (i6 != 0) {
            $dirty |= 48;
            modifier2 = modifier;
        } else if (($changed & 48) == 0) {
            modifier2 = modifier;
            $dirty |= $composer3.changed(modifier2) ? 32 : 16;
        } else {
            modifier2 = modifier;
        }
        int i7 = i & 4;
        if (i7 != 0) {
            $dirty |= 384;
            obj = style;
        } else if (($changed & 384) == 0) {
            obj = style;
            $dirty |= $composer3.changed(obj) ? 256 : 128;
        } else {
            obj = style;
        }
        int i8 = i & 8;
        if (i8 != 0) {
            $dirty |= 3072;
            onTextLayout2 = onTextLayout;
        } else if (($changed & 3072) == 0) {
            onTextLayout2 = onTextLayout;
            $dirty |= $composer3.changedInstance(onTextLayout2) ? 2048 : 1024;
        } else {
            onTextLayout2 = onTextLayout;
        }
        int i9 = i & 16;
        if (i9 != 0) {
            $dirty |= 24576;
        } else if (($changed & 24576) == 0) {
            $dirty |= $composer3.changed(overflow) ? 16384 : 8192;
        }
        int i10 = i & 32;
        if (i10 != 0) {
            $dirty |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
        } else if ((196608 & $changed) == 0) {
            $dirty |= $composer3.changed(softWrap) ? 131072 : 65536;
        }
        int i11 = i & 64;
        if (i11 != 0) {
            $dirty |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty |= $composer3.changed(maxLines) ? 1048576 : 524288;
        }
        int i12 = i & 128;
        if (i12 != 0) {
            $dirty |= 12582912;
            i2 = i12;
        } else if (($changed & 12582912) == 0) {
            i2 = i12;
            $dirty |= $composer3.changed(minLines) ? 8388608 : 4194304;
        } else {
            i2 = i12;
        }
        int i13 = i & 256;
        if (i13 != 0) {
            $dirty |= 100663296;
            i3 = i13;
        } else if (($changed & 100663296) == 0) {
            i3 = i13;
            $dirty |= $composer3.changedInstance(color) ? 67108864 : 33554432;
        } else {
            i3 = i13;
        }
        if ($composer3.shouldExecute(($dirty & 38347923) != 38347922, $dirty & 1)) {
            if (i6 != 0) {
                modifier3 = Modifier.Companion;
            } else {
                modifier3 = modifier2;
            }
            if (i7 == 0) {
                i4 = i10;
                style3 = obj;
            } else {
                style3 = TextStyle.Companion.getDefault();
                i4 = i10;
            }
            if (i8 == 0) {
                onTextLayout3 = onTextLayout2;
            } else {
                onTextLayout3 = null;
            }
            if (i9 == 0) {
                overflow3 = i11;
                overflow4 = overflow;
            } else {
                overflow4 = TextOverflow.Companion.m6808getClipgIe3tQ8();
                overflow3 = i11;
            }
            if (i4 == 0) {
                softWrap3 = softWrap;
                i5 = -1186827822;
            } else {
                softWrap3 = true;
                i5 = -1186827822;
            }
            if (overflow3 == 0) {
                maxLines3 = i2;
                maxLines4 = maxLines;
            } else {
                int i14 = i2;
                maxLines4 = Integer.MAX_VALUE;
                maxLines3 = i14;
            }
            if (maxLines3 == 0) {
                minLines3 = i3;
                minLines2 = minLines;
            } else {
                int i15 = i3;
                minLines2 = 1;
                minLines3 = i15;
            }
            if (minLines3 == 0) {
                color3 = color;
            } else {
                color3 = null;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i5, $dirty, -1, "androidx.compose.foundation.text.BasicText (BasicText.kt:301)");
            }
            $composer2 = $composer3;
            m1301BasicTextRWo7tUw(str, modifier3, style3, onTextLayout3, overflow4, softWrap3, maxLines4, minLines2, color3, (TextAutoSize) null, $composer2, ($dirty & 14) | ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (458752 & $dirty) | (3670016 & $dirty) | (29360128 & $dirty) | (234881024 & $dirty), 512);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier3;
            style2 = style3;
            onTextLayout2 = onTextLayout3;
            overflow2 = overflow4;
            softWrap2 = softWrap3;
            maxLines2 = maxLines4;
            color2 = color3;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            overflow2 = overflow;
            maxLines2 = maxLines;
            minLines2 = minLines;
            color2 = color;
            style2 = obj;
            softWrap2 = softWrap;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            final Modifier modifier4 = modifier2;
            final Function1 onTextLayout4 = onTextLayout2;
            final int minLines4 = minLines2;
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.BasicTextKt$BasicText$4
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

                public final void invoke(Composer composer, int i16) {
                    BasicTextKt.m1303BasicTextVhcvRP8(text, modifier4, style2, onTextLayout4, overflow2, softWrap2, maxLines2, minLines4, color2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Maintained for binary compatibility")
    /* renamed from: BasicText-RWo7tUw */
    public static final /* synthetic */ void m1300BasicTextRWo7tUw(final AnnotatedString text, Modifier modifier, TextStyle style, Function1 onTextLayout, int overflow, boolean softWrap, int maxLines, int minLines, Map inlineContent, ColorProducer color, Composer $composer, final int $changed, final int i) {
        AnnotatedString annotatedString;
        Object modifier2;
        Object obj;
        Object onTextLayout2;
        int i2;
        int i3;
        int i4;
        int i5;
        Composer $composer2;
        final int maxLines2;
        int minLines2;
        final Map inlineContent2;
        final TextStyle style2;
        final int overflow2;
        final boolean softWrap2;
        final ColorProducer color2;
        int i6;
        Modifier modifier3;
        TextStyle style3;
        int i7;
        Function1 onTextLayout3;
        int overflow3;
        int i8;
        int i9;
        boolean softWrap3;
        int maxLines3;
        int maxLines4;
        int minLines3;
        Map inlineContent3;
        ColorProducer color3;
        Composer $composer3 = $composer.startRestartGroup(-1064305212);
        ComposerKt.sourceInformation($composer3, "C(BasicText)P(9,4,8,5,6:c#ui.text.style.TextOverflow,7,2,3,1)344@17259L194:BasicText.kt#423gt5");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
            annotatedString = text;
        } else if (($changed & 6) == 0) {
            annotatedString = text;
            $dirty |= $composer3.changed(annotatedString) ? 4 : 2;
        } else {
            annotatedString = text;
        }
        int i10 = i & 2;
        if (i10 != 0) {
            $dirty |= 48;
            modifier2 = modifier;
        } else if (($changed & 48) == 0) {
            modifier2 = modifier;
            $dirty |= $composer3.changed(modifier2) ? 32 : 16;
        } else {
            modifier2 = modifier;
        }
        int i11 = i & 4;
        if (i11 != 0) {
            $dirty |= 384;
            obj = style;
        } else if (($changed & 384) == 0) {
            obj = style;
            $dirty |= $composer3.changed(obj) ? 256 : 128;
        } else {
            obj = style;
        }
        int i12 = i & 8;
        if (i12 != 0) {
            $dirty |= 3072;
            onTextLayout2 = onTextLayout;
        } else if (($changed & 3072) == 0) {
            onTextLayout2 = onTextLayout;
            $dirty |= $composer3.changedInstance(onTextLayout2) ? 2048 : 1024;
        } else {
            onTextLayout2 = onTextLayout;
        }
        int i13 = i & 16;
        if (i13 != 0) {
            $dirty |= 24576;
            i2 = overflow;
        } else if (($changed & 24576) == 0) {
            i2 = overflow;
            $dirty |= $composer3.changed(i2) ? 16384 : 8192;
        } else {
            i2 = overflow;
        }
        int i14 = i & 32;
        if (i14 != 0) {
            $dirty |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
        } else if ((196608 & $changed) == 0) {
            $dirty |= $composer3.changed(softWrap) ? 131072 : 65536;
        }
        int i15 = i & 64;
        if (i15 != 0) {
            $dirty |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty |= $composer3.changed(maxLines) ? 1048576 : 524288;
        }
        int i16 = i & 128;
        if (i16 != 0) {
            $dirty |= 12582912;
            i3 = i16;
        } else if (($changed & 12582912) == 0) {
            i3 = i16;
            $dirty |= $composer3.changed(minLines) ? 8388608 : 4194304;
        } else {
            i3 = i16;
        }
        int i17 = i & 256;
        if (i17 != 0) {
            $dirty |= 100663296;
            i4 = i17;
        } else if (($changed & 100663296) == 0) {
            i4 = i17;
            $dirty |= $composer3.changedInstance(inlineContent) ? 67108864 : 33554432;
        } else {
            i4 = i17;
        }
        int i18 = i & 512;
        if (i18 != 0) {
            $dirty |= 805306368;
            i5 = i18;
        } else if (($changed & 805306368) == 0) {
            i5 = i18;
            $dirty |= $composer3.changedInstance(color) ? PropertyOptions.DELETE_EXISTING : 268435456;
        } else {
            i5 = i18;
        }
        if ($composer3.shouldExecute(($dirty & 306783379) != 306783378, $dirty & 1)) {
            if (i10 != 0) {
                modifier3 = Modifier.Companion;
                i6 = i14;
            } else {
                i6 = i14;
                modifier3 = modifier2;
            }
            if (i11 == 0) {
                style3 = obj;
            } else {
                style3 = TextStyle.Companion.getDefault();
            }
            if (i12 == 0) {
                i7 = i15;
                onTextLayout3 = onTextLayout2;
            } else {
                onTextLayout3 = null;
                i7 = i15;
            }
            if (i13 == 0) {
                overflow3 = i2;
                i8 = -1064305212;
            } else {
                overflow3 = TextOverflow.Companion.m6808getClipgIe3tQ8();
                i8 = -1064305212;
            }
            if (i6 == 0) {
                i9 = i3;
                softWrap3 = softWrap;
            } else {
                int i19 = i3;
                softWrap3 = true;
                i9 = i19;
            }
            if (i7 == 0) {
                maxLines3 = i4;
                maxLines4 = maxLines;
            } else {
                int i20 = i4;
                maxLines4 = Integer.MAX_VALUE;
                maxLines3 = i20;
            }
            if (i9 == 0) {
                minLines3 = i5;
                minLines2 = minLines;
            } else {
                int i21 = i5;
                minLines2 = 1;
                minLines3 = i21;
            }
            if (maxLines3 == 0) {
                inlineContent3 = inlineContent;
            } else {
                inlineContent3 = MapsKt.emptyMap();
            }
            if (minLines3 == 0) {
                color3 = color;
            } else {
                color3 = null;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i8, $dirty, -1, "androidx.compose.foundation.text.BasicText (BasicText.kt:343)");
            }
            $composer2 = $composer3;
            m1299BasicTextCL7eQgs(annotatedString, modifier3, style3, onTextLayout3, overflow3, softWrap3, maxLines4, minLines2, inlineContent3, color3, null, $composer2, ($dirty & 14) | ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (458752 & $dirty) | (3670016 & $dirty) | (29360128 & $dirty) | (234881024 & $dirty) | (1879048192 & $dirty), 0, 1024);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier3;
            style2 = style3;
            onTextLayout2 = onTextLayout3;
            overflow2 = overflow3;
            softWrap2 = softWrap3;
            maxLines2 = maxLines4;
            inlineContent2 = inlineContent3;
            color2 = color3;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            maxLines2 = maxLines;
            minLines2 = minLines;
            inlineContent2 = inlineContent;
            style2 = obj;
            overflow2 = i2;
            softWrap2 = softWrap;
            color2 = color;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            final Modifier modifier4 = modifier2;
            final Function1 onTextLayout4 = onTextLayout2;
            final int minLines4 = minLines2;
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.BasicTextKt$BasicText$5
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

                public final void invoke(Composer composer, int i22) {
                    BasicTextKt.m1300BasicTextRWo7tUw(AnnotatedString.this, modifier4, style2, onTextLayout4, overflow2, softWrap2, maxLines2, minLines4, inlineContent2, color2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Maintained for binary compatibility")
    /* renamed from: BasicText-BpD7jsM */
    public static final /* synthetic */ void m1298BasicTextBpD7jsM(final String text, Modifier modifier, TextStyle style, Function1 onTextLayout, int overflow, boolean softWrap, int maxLines, Composer $composer, final int $changed, final int i) {
        String str;
        Object obj;
        Object obj2;
        boolean softWrap2;
        Composer $composer2;
        final int overflow2;
        final int maxLines2;
        Modifier modifier2;
        final TextStyle style2;
        final Function1 onTextLayout2;
        final boolean softWrap3;
        int i2;
        TextStyle style3;
        Function1 onTextLayout3;
        int overflow3;
        int overflow4;
        int maxLines3;
        Composer $composer3 = $composer.startRestartGroup(1022429478);
        ComposerKt.sourceInformation($composer3, "C(BasicText)P(6,1,5,2,3:c#ui.text.style.TextOverflow,4)369@17839L234:BasicText.kt#423gt5");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
            str = text;
        } else if (($changed & 6) == 0) {
            str = text;
            $dirty |= $composer3.changed(str) ? 4 : 2;
        } else {
            str = text;
        }
        int i3 = i & 2;
        if (i3 != 0) {
            $dirty |= 48;
            obj = modifier;
        } else if (($changed & 48) == 0) {
            obj = modifier;
            $dirty |= $composer3.changed(obj) ? 32 : 16;
        } else {
            obj = modifier;
        }
        int i4 = i & 4;
        if (i4 != 0) {
            $dirty |= 384;
            obj2 = style;
        } else if (($changed & 384) == 0) {
            obj2 = style;
            $dirty |= $composer3.changed(obj2) ? 256 : 128;
        } else {
            obj2 = style;
        }
        int i5 = i & 8;
        if (i5 != 0) {
            $dirty |= 3072;
        } else if (($changed & 3072) == 0) {
            $dirty |= $composer3.changedInstance(onTextLayout) ? 2048 : 1024;
        }
        int i6 = i & 16;
        if (i6 != 0) {
            $dirty |= 24576;
        } else if (($changed & 24576) == 0) {
            $dirty |= $composer3.changed(overflow) ? 16384 : 8192;
        }
        int i7 = i & 32;
        if (i7 != 0) {
            $dirty |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            softWrap2 = softWrap;
        } else if ((196608 & $changed) == 0) {
            softWrap2 = softWrap;
            $dirty |= $composer3.changed(softWrap2) ? 131072 : 65536;
        } else {
            softWrap2 = softWrap;
        }
        int i8 = i & 64;
        if (i8 != 0) {
            $dirty |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty |= $composer3.changed(maxLines) ? 1048576 : 524288;
        }
        if ($composer3.shouldExecute(($dirty & 599187) != 599186, $dirty & 1)) {
            if (i3 != 0) {
                modifier2 = Modifier.Companion;
            } else {
                modifier2 = obj;
            }
            if (i4 == 0) {
                i2 = i6;
                style3 = obj2;
            } else {
                style3 = TextStyle.Companion.getDefault();
                i2 = i6;
            }
            if (i5 == 0) {
                onTextLayout3 = onTextLayout;
            } else {
                onTextLayout3 = null;
            }
            if (i2 == 0) {
                overflow3 = i7;
                overflow4 = overflow;
            } else {
                overflow4 = TextOverflow.Companion.m6808getClipgIe3tQ8();
                overflow3 = i7;
            }
            if (overflow3 != 0) {
                softWrap2 = true;
            }
            if (i8 == 0) {
                maxLines3 = maxLines;
            } else {
                maxLines3 = Integer.MAX_VALUE;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1022429478, $dirty, -1, "androidx.compose.foundation.text.BasicText (BasicText.kt:368)");
            }
            $composer2 = $composer3;
            m1301BasicTextRWo7tUw(str, modifier2, style3, onTextLayout3, overflow4, softWrap2, maxLines3, 1, (ColorProducer) null, (TextAutoSize) null, $composer2, ($dirty & 14) | 12582912 | ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (458752 & $dirty) | (3670016 & $dirty), (int) ViewUtils.EDGE_TO_EDGE_FLAGS);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            style2 = style3;
            onTextLayout2 = onTextLayout3;
            overflow2 = overflow4;
            maxLines2 = maxLines3;
            softWrap3 = softWrap2;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            overflow2 = overflow;
            maxLines2 = maxLines;
            modifier2 = obj;
            style2 = obj2;
            onTextLayout2 = onTextLayout;
            softWrap3 = softWrap2;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            final Modifier modifier3 = modifier2;
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.BasicTextKt$BasicText$6
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

                public final void invoke(Composer composer, int i9) {
                    BasicTextKt.m1298BasicTextBpD7jsM(text, modifier3, style2, onTextLayout2, overflow2, softWrap3, maxLines2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Maintained for binary compatibility")
    /* renamed from: BasicText-4YKlhWE */
    public static final /* synthetic */ void m1296BasicText4YKlhWE(final AnnotatedString text, Modifier modifier, TextStyle style, Function1 onTextLayout, int overflow, boolean softWrap, int maxLines, Map inlineContent, Composer $composer, final int $changed, final int i) {
        AnnotatedString annotatedString;
        Object obj;
        Object obj2;
        Object obj3;
        int i2;
        Composer $composer2;
        final int overflow2;
        final int maxLines2;
        Modifier modifier2;
        final TextStyle style2;
        final Function1 onTextLayout2;
        final boolean softWrap2;
        final Map inlineContent2;
        int i3;
        TextStyle style3;
        int i4;
        Function1 onTextLayout3;
        int overflow3;
        int i5;
        boolean softWrap3;
        int maxLines3;
        int i6;
        Map inlineContent3;
        Composer $composer3 = $composer.startRestartGroup(-648605928);
        ComposerKt.sourceInformation($composer3, "C(BasicText)P(7,2,6,3,4:c#ui.text.style.TextOverflow,5,1)393@18530L273:BasicText.kt#423gt5");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
            annotatedString = text;
        } else if (($changed & 6) == 0) {
            annotatedString = text;
            $dirty |= $composer3.changed(annotatedString) ? 4 : 2;
        } else {
            annotatedString = text;
        }
        int i7 = i & 2;
        if (i7 != 0) {
            $dirty |= 48;
            obj = modifier;
        } else if (($changed & 48) == 0) {
            obj = modifier;
            $dirty |= $composer3.changed(obj) ? 32 : 16;
        } else {
            obj = modifier;
        }
        int i8 = i & 4;
        if (i8 != 0) {
            $dirty |= 384;
            obj2 = style;
        } else if (($changed & 384) == 0) {
            obj2 = style;
            $dirty |= $composer3.changed(obj2) ? 256 : 128;
        } else {
            obj2 = style;
        }
        int i9 = i & 8;
        if (i9 != 0) {
            $dirty |= 3072;
            obj3 = onTextLayout;
        } else if (($changed & 3072) == 0) {
            obj3 = onTextLayout;
            $dirty |= $composer3.changedInstance(obj3) ? 2048 : 1024;
        } else {
            obj3 = onTextLayout;
        }
        int i10 = i & 16;
        if (i10 != 0) {
            $dirty |= 24576;
        } else if (($changed & 24576) == 0) {
            $dirty |= $composer3.changed(overflow) ? 16384 : 8192;
        }
        int i11 = i & 32;
        if (i11 != 0) {
            $dirty |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
        } else if ((196608 & $changed) == 0) {
            $dirty |= $composer3.changed(softWrap) ? 131072 : 65536;
        }
        int i12 = i & 64;
        if (i12 != 0) {
            $dirty |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty |= $composer3.changed(maxLines) ? 1048576 : 524288;
        }
        int i13 = i & 128;
        if (i13 != 0) {
            $dirty |= 12582912;
            i2 = i13;
        } else if (($changed & 12582912) == 0) {
            i2 = i13;
            $dirty |= $composer3.changedInstance(inlineContent) ? 8388608 : 4194304;
        } else {
            i2 = i13;
        }
        if ($composer3.shouldExecute(($dirty & 4793491) != 4793490, $dirty & 1)) {
            if (i7 != 0) {
                modifier2 = Modifier.Companion;
                i3 = i10;
            } else {
                i3 = i10;
                modifier2 = obj;
            }
            if (i8 == 0) {
                style3 = obj2;
            } else {
                style3 = TextStyle.Companion.getDefault();
            }
            if (i9 == 0) {
                i4 = i11;
                onTextLayout3 = obj3;
            } else {
                onTextLayout3 = null;
                i4 = i11;
            }
            if (i3 == 0) {
                overflow3 = overflow;
            } else {
                overflow3 = TextOverflow.Companion.m6808getClipgIe3tQ8();
            }
            if (i4 == 0) {
                i5 = i12;
                softWrap3 = softWrap;
            } else {
                softWrap3 = true;
                i5 = i12;
            }
            if (i5 == 0) {
                maxLines3 = maxLines;
                i6 = -648605928;
            } else {
                maxLines3 = Integer.MAX_VALUE;
                i6 = -648605928;
            }
            if (i2 == 0) {
                inlineContent3 = inlineContent;
            } else {
                inlineContent3 = MapsKt.emptyMap();
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i6, $dirty, -1, "androidx.compose.foundation.text.BasicText (BasicText.kt:392)");
            }
            $composer2 = $composer3;
            m1299BasicTextCL7eQgs(annotatedString, modifier2, style3, onTextLayout3, overflow3, softWrap3, maxLines3, 1, inlineContent3, null, null, $composer2, ($dirty & 14) | 12582912 | ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (458752 & $dirty) | (3670016 & $dirty) | (($dirty << 3) & 234881024), 0, 1536);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            style2 = style3;
            onTextLayout2 = onTextLayout3;
            overflow2 = overflow3;
            softWrap2 = softWrap3;
            maxLines2 = maxLines3;
            inlineContent2 = inlineContent3;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            overflow2 = overflow;
            maxLines2 = maxLines;
            modifier2 = obj;
            style2 = obj2;
            onTextLayout2 = obj3;
            softWrap2 = softWrap;
            inlineContent2 = inlineContent;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            final Modifier modifier3 = modifier2;
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.BasicTextKt$BasicText$7
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

                public final void invoke(Composer composer, int i14) {
                    BasicTextKt.m1296BasicText4YKlhWE(AnnotatedString.this, modifier3, style2, onTextLayout2, overflow2, softWrap2, maxLines2, inlineContent2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Maintained for binary compat")
    /* renamed from: BasicText-4YKlhWE */
    public static final /* synthetic */ void m1297BasicText4YKlhWE(final String text, Modifier modifier, TextStyle style, Function1 onTextLayout, int overflow, boolean softWrap, int maxLines, int minLines, Composer $composer, final int $changed, final int i) {
        String str;
        Object obj;
        Object obj2;
        Object obj3;
        int i2;
        Composer $composer2;
        final int overflow2;
        final int maxLines2;
        Modifier modifier2;
        final TextStyle style2;
        final Function1 onTextLayout2;
        final boolean softWrap2;
        final int minLines2;
        int i3;
        TextStyle style3;
        int i4;
        Function1 onTextLayout3;
        int overflow3;
        int i5;
        boolean softWrap3;
        int maxLines3;
        int i6;
        int minLines3;
        Composer $composer3 = $composer.startRestartGroup(1542716361);
        ComposerKt.sourceInformation($composer3, "C(BasicText)P(7,2,6,3,4:c#ui.text.style.TextOverflow,5)417@19201L86:BasicText.kt#423gt5");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
            str = text;
        } else if (($changed & 6) == 0) {
            str = text;
            $dirty |= $composer3.changed(str) ? 4 : 2;
        } else {
            str = text;
        }
        int i7 = i & 2;
        if (i7 != 0) {
            $dirty |= 48;
            obj = modifier;
        } else if (($changed & 48) == 0) {
            obj = modifier;
            $dirty |= $composer3.changed(obj) ? 32 : 16;
        } else {
            obj = modifier;
        }
        int i8 = i & 4;
        if (i8 != 0) {
            $dirty |= 384;
            obj2 = style;
        } else if (($changed & 384) == 0) {
            obj2 = style;
            $dirty |= $composer3.changed(obj2) ? 256 : 128;
        } else {
            obj2 = style;
        }
        int i9 = i & 8;
        if (i9 != 0) {
            $dirty |= 3072;
            obj3 = onTextLayout;
        } else if (($changed & 3072) == 0) {
            obj3 = onTextLayout;
            $dirty |= $composer3.changedInstance(obj3) ? 2048 : 1024;
        } else {
            obj3 = onTextLayout;
        }
        int i10 = i & 16;
        if (i10 != 0) {
            $dirty |= 24576;
        } else if (($changed & 24576) == 0) {
            $dirty |= $composer3.changed(overflow) ? 16384 : 8192;
        }
        int i11 = i & 32;
        if (i11 != 0) {
            $dirty |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
        } else if ((196608 & $changed) == 0) {
            $dirty |= $composer3.changed(softWrap) ? 131072 : 65536;
        }
        int i12 = i & 64;
        if (i12 != 0) {
            $dirty |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty |= $composer3.changed(maxLines) ? 1048576 : 524288;
        }
        int i13 = i & 128;
        if (i13 != 0) {
            $dirty |= 12582912;
            i2 = i13;
        } else if (($changed & 12582912) == 0) {
            i2 = i13;
            $dirty |= $composer3.changed(minLines) ? 8388608 : 4194304;
        } else {
            i2 = i13;
        }
        if ($composer3.shouldExecute(($dirty & 4793491) != 4793490, $dirty & 1)) {
            if (i7 != 0) {
                modifier2 = Modifier.Companion;
                i3 = i10;
            } else {
                i3 = i10;
                modifier2 = obj;
            }
            if (i8 == 0) {
                style3 = obj2;
            } else {
                style3 = TextStyle.Companion.getDefault();
            }
            if (i9 == 0) {
                i4 = i11;
                onTextLayout3 = obj3;
            } else {
                onTextLayout3 = null;
                i4 = i11;
            }
            if (i3 == 0) {
                overflow3 = overflow;
            } else {
                overflow3 = TextOverflow.Companion.m6808getClipgIe3tQ8();
            }
            if (i4 == 0) {
                i5 = i12;
                softWrap3 = softWrap;
            } else {
                softWrap3 = true;
                i5 = i12;
            }
            if (i5 == 0) {
                maxLines3 = maxLines;
                i6 = 1542716361;
            } else {
                maxLines3 = Integer.MAX_VALUE;
                i6 = 1542716361;
            }
            if (i2 == 0) {
                minLines3 = minLines;
            } else {
                minLines3 = 1;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i6, $dirty, -1, "androidx.compose.foundation.text.BasicText (BasicText.kt:417)");
            }
            $composer2 = $composer3;
            m1301BasicTextRWo7tUw(str, modifier2, style3, onTextLayout3, overflow3, softWrap3, maxLines3, minLines3, (ColorProducer) null, (TextAutoSize) null, $composer2, ($dirty & 14) | ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (458752 & $dirty) | (3670016 & $dirty) | (29360128 & $dirty), (int) ViewUtils.EDGE_TO_EDGE_FLAGS);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            style2 = style3;
            onTextLayout2 = onTextLayout3;
            overflow2 = overflow3;
            softWrap2 = softWrap3;
            maxLines2 = maxLines3;
            minLines2 = minLines3;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            overflow2 = overflow;
            maxLines2 = maxLines;
            modifier2 = obj;
            style2 = obj2;
            onTextLayout2 = obj3;
            softWrap2 = softWrap;
            minLines2 = minLines;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            final Modifier modifier3 = modifier2;
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.BasicTextKt$BasicText$8
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

                public final void invoke(Composer composer, int i14) {
                    BasicTextKt.m1297BasicText4YKlhWE(text, modifier3, style2, onTextLayout2, overflow2, softWrap2, maxLines2, minLines2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Maintained for binary compat")
    /* renamed from: BasicText-VhcvRP8 */
    public static final /* synthetic */ void m1302BasicTextVhcvRP8(final AnnotatedString text, Modifier modifier, TextStyle style, Function1 onTextLayout, int overflow, boolean softWrap, int maxLines, int minLines, Map inlineContent, Composer $composer, final int $changed, final int i) {
        AnnotatedString annotatedString;
        Object modifier2;
        Object obj;
        Object onTextLayout2;
        int i2;
        int i3;
        Composer $composer2;
        final int overflow2;
        final int maxLines2;
        int minLines2;
        final Map inlineContent2;
        final TextStyle style2;
        final boolean softWrap2;
        int i4;
        TextStyle style3;
        int overflow3;
        int overflow4;
        boolean softWrap3;
        int i5;
        int maxLines3;
        int maxLines4;
        int minLines3;
        Composer $composer3 = $composer.startRestartGroup(851408699);
        ComposerKt.sourceInformation($composer3, "C(BasicText)P(8,3,7,4,5:c#ui.text.style.TextOverflow,6,1,2)432@19757L280:BasicText.kt#423gt5");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
            annotatedString = text;
        } else if (($changed & 6) == 0) {
            annotatedString = text;
            $dirty |= $composer3.changed(annotatedString) ? 4 : 2;
        } else {
            annotatedString = text;
        }
        int i6 = i & 2;
        if (i6 != 0) {
            $dirty |= 48;
            modifier2 = modifier;
        } else if (($changed & 48) == 0) {
            modifier2 = modifier;
            $dirty |= $composer3.changed(modifier2) ? 32 : 16;
        } else {
            modifier2 = modifier;
        }
        int i7 = i & 4;
        if (i7 != 0) {
            $dirty |= 384;
            obj = style;
        } else if (($changed & 384) == 0) {
            obj = style;
            $dirty |= $composer3.changed(obj) ? 256 : 128;
        } else {
            obj = style;
        }
        int i8 = i & 8;
        if (i8 != 0) {
            $dirty |= 3072;
            onTextLayout2 = onTextLayout;
        } else if (($changed & 3072) == 0) {
            onTextLayout2 = onTextLayout;
            $dirty |= $composer3.changedInstance(onTextLayout2) ? 2048 : 1024;
        } else {
            onTextLayout2 = onTextLayout;
        }
        int i9 = i & 16;
        if (i9 != 0) {
            $dirty |= 24576;
        } else if (($changed & 24576) == 0) {
            $dirty |= $composer3.changed(overflow) ? 16384 : 8192;
        }
        int i10 = i & 32;
        if (i10 != 0) {
            $dirty |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
        } else if ((196608 & $changed) == 0) {
            $dirty |= $composer3.changed(softWrap) ? 131072 : 65536;
        }
        int i11 = i & 64;
        if (i11 != 0) {
            $dirty |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty |= $composer3.changed(maxLines) ? 1048576 : 524288;
        }
        int i12 = i & 128;
        if (i12 != 0) {
            $dirty |= 12582912;
            i2 = i12;
        } else if (($changed & 12582912) == 0) {
            i2 = i12;
            $dirty |= $composer3.changed(minLines) ? 8388608 : 4194304;
        } else {
            i2 = i12;
        }
        int i13 = i & 256;
        if (i13 != 0) {
            $dirty |= 100663296;
            i3 = i13;
        } else if (($changed & 100663296) == 0) {
            i3 = i13;
            $dirty |= $composer3.changedInstance(inlineContent) ? 67108864 : 33554432;
        } else {
            i3 = i13;
        }
        if ($composer3.shouldExecute(($dirty & 38347923) != 38347922, $dirty & 1)) {
            Modifier modifier3 = i6 != 0 ? Modifier.Companion : modifier2;
            if (i7 != 0) {
                style3 = TextStyle.Companion.getDefault();
                i4 = i10;
            } else {
                i4 = i10;
                style3 = obj;
            }
            Function1 onTextLayout3 = i8 != 0 ? null : onTextLayout2;
            if (i9 != 0) {
                overflow4 = TextOverflow.Companion.m6808getClipgIe3tQ8();
                overflow3 = i11;
            } else {
                overflow3 = i11;
                overflow4 = overflow;
            }
            if (i4 != 0) {
                softWrap3 = true;
                i5 = 851408699;
            } else {
                softWrap3 = softWrap;
                i5 = 851408699;
            }
            if (overflow3 != 0) {
                int i14 = i2;
                maxLines4 = Integer.MAX_VALUE;
                maxLines3 = i14;
            } else {
                maxLines3 = i2;
                maxLines4 = maxLines;
            }
            if (maxLines3 != 0) {
                int i15 = i3;
                minLines2 = 1;
                minLines3 = i15;
            } else {
                minLines3 = i3;
                minLines2 = minLines;
            }
            Map inlineContent3 = minLines3 != 0 ? MapsKt.emptyMap() : inlineContent;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i5, $dirty, -1, "androidx.compose.foundation.text.BasicText (BasicText.kt:432)");
            }
            $composer2 = $composer3;
            m1299BasicTextCL7eQgs(annotatedString, modifier3, style3, onTextLayout3, overflow4, softWrap3, maxLines4, minLines2, inlineContent3, null, null, $composer2, ($dirty & 14) | ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (458752 & $dirty) | (3670016 & $dirty) | (29360128 & $dirty) | (234881024 & $dirty), 0, 1536);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier3;
            style2 = style3;
            onTextLayout2 = onTextLayout3;
            overflow2 = overflow4;
            softWrap2 = softWrap3;
            maxLines2 = maxLines4;
            inlineContent2 = inlineContent3;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            overflow2 = overflow;
            maxLines2 = maxLines;
            minLines2 = minLines;
            inlineContent2 = inlineContent;
            style2 = obj;
            softWrap2 = softWrap;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            final Modifier modifier4 = modifier2;
            final Function1 onTextLayout4 = onTextLayout2;
            final int minLines4 = minLines2;
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.BasicTextKt$BasicText$9
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

                public final void invoke(Composer composer, int i16) {
                    BasicTextKt.m1302BasicTextVhcvRP8(AnnotatedString.this, modifier4, style2, onTextLayout4, overflow2, softWrap2, maxLines2, minLines4, inlineContent2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    private static final Saver<Long, Long> selectionIdSaver(final SelectionRegistrar selectionRegistrar) {
        return SaverKt.Saver(new Function2<SaverScope, Long, Long>() { // from class: androidx.compose.foundation.text.BasicTextKt$selectionIdSaver$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(2);
            }

            @Override // kotlin.jvm.functions.Function2
            public /* bridge */ /* synthetic */ Long invoke(SaverScope saverScope, Long l) {
                return invoke(saverScope, l.longValue());
            }

            public final Long invoke(SaverScope $this$Saver, long it) {
                if (SelectionRegistrarKt.hasSelection(SelectionRegistrar.this, it)) {
                    return Long.valueOf(it);
                }
                return null;
            }
        }, new Function1<Long, Long>() { // from class: androidx.compose.foundation.text.BasicTextKt$selectionIdSaver$2
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Long invoke(Long l) {
                return invoke(l.longValue());
            }

            public final Long invoke(long it) {
                return Long.valueOf(it);
            }
        });
    }

    public static final List<Pair<Placeable, Function0<IntOffset>>> measureWithTextRangeMeasureConstraints(List<? extends Measurable> list, Function0<Boolean> function0) {
        if (function0.invoke().booleanValue()) {
            TextRangeLayoutMeasureScope textRangeLayoutMeasureScope = new TextRangeLayoutMeasureScope();
            List $this$fastMapIndexedNotNull$iv = list;
            boolean z = false;
            ArrayList target$iv = new ArrayList($this$fastMapIndexedNotNull$iv.size());
            List $this$fastForEachIndexed$iv$iv = $this$fastMapIndexedNotNull$iv;
            int index$iv$iv = 0;
            int size = $this$fastForEachIndexed$iv$iv.size();
            while (index$iv$iv < size) {
                Object item$iv$iv = $this$fastForEachIndexed$iv$iv.get(index$iv$iv);
                Measurable measurable = (Measurable) item$iv$iv;
                Object parentData = measurable.getParentData();
                Intrinsics.checkNotNull(parentData, "null cannot be cast to non-null type androidx.compose.foundation.text.TextRangeLayoutModifier");
                TextRangeScopeMeasurePolicy rangeMeasurePolicy = ((TextRangeLayoutModifier) parentData).getMeasurePolicy();
                TextRangeLayoutMeasureResult rangeMeasureResult = rangeMeasurePolicy.measure(textRangeLayoutMeasureScope);
                TextRangeLayoutMeasureScope textRangeLayoutMeasureScope2 = textRangeLayoutMeasureScope;
                Constraints.Companion companion = Constraints.Companion;
                List $this$fastMapIndexedNotNull$iv2 = $this$fastMapIndexedNotNull$iv;
                int width = rangeMeasureResult.getWidth();
                boolean z2 = z;
                int $i$f$fastMapIndexedNotNull = rangeMeasureResult.getWidth();
                ArrayList target$iv2 = target$iv;
                Placeable placeable = measurable.mo5637measureBRTryo0(companion.m6835fitPrioritizingWidthZbe2FdA(width, $i$f$fastMapIndexedNotNull, rangeMeasureResult.getHeight(), rangeMeasureResult.getHeight()));
                target$iv2.add(new Pair(placeable, rangeMeasureResult.getPlace()));
                index$iv$iv++;
                textRangeLayoutMeasureScope = textRangeLayoutMeasureScope2;
                $this$fastMapIndexedNotNull$iv = $this$fastMapIndexedNotNull$iv2;
                z = z2;
                target$iv = target$iv2;
                $this$fastForEachIndexed$iv$iv = $this$fastForEachIndexed$iv$iv;
            }
            return target$iv;
        }
        return null;
    }

    /* renamed from: textModifier-CL7eQgs */
    private static final Modifier m1306textModifierCL7eQgs(Modifier $this$textModifier_u2dCL7eQgs, AnnotatedString text, TextStyle style, Function1<? super TextLayoutResult, Unit> function1, int overflow, boolean softWrap, int maxLines, int minLines, FontFamily.Resolver fontFamilyResolver, List<AnnotatedString.Range<Placeholder>> list, Function1<? super List<Rect>, Unit> function12, SelectionController selectionController, ColorProducer color, Function1<? super TextAnnotatedStringNode.TextSubstitutionValue, Unit> function13, TextAutoSize autoSize) {
        if (selectionController == null) {
            TextAnnotatedStringElement staticTextModifier = new TextAnnotatedStringElement(text, style, fontFamilyResolver, function1, overflow, softWrap, maxLines, minLines, list, function12, null, color, autoSize, function13, null);
            return $this$textModifier_u2dCL7eQgs.then(Modifier.Companion).then(staticTextModifier);
        }
        SelectableTextAnnotatedStringElement selectableTextModifier = new SelectableTextAnnotatedStringElement(text, style, fontFamilyResolver, function1, overflow, softWrap, maxLines, minLines, list, function12, selectionController, color, autoSize, null);
        return $this$textModifier_u2dCL7eQgs.then(selectionController.getModifier()).then(selectableTextModifier);
    }

    /* JADX WARN: Code restructure failed: missing block: B:505:0x025a, code lost:
        if (r13 != androidx.compose.runtime.Composer.Companion.getEmpty()) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:533:0x030c, code lost:
        if (r13 != androidx.compose.runtime.Composer.Companion.getEmpty()) goto L168;
     */
    /* JADX WARN: Code restructure failed: missing block: B:569:0x042c, code lost:
        if (r1 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L100;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:616:0x05f8  */
    /* JADX WARN: Removed duplicated region for block: B:617:0x0602  */
    /* JADX WARN: Removed duplicated region for block: B:619:0x0618  */
    /* JADX WARN: Removed duplicated region for block: B:620:0x0624  */
    /* JADX WARN: Removed duplicated region for block: B:623:0x0658  */
    /* JADX WARN: Type inference failed for: r13v37 */
    /* JADX WARN: Type inference failed for: r1v49 */
    /* renamed from: LayoutWithLinksAndInlineContent-11Od_4g */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void m1304LayoutWithLinksAndInlineContent11Od_4g(final androidx.compose.ui.Modifier r29, final androidx.compose.ui.text.AnnotatedString r30, final kotlin.jvm.functions.Function1<? super androidx.compose.ui.text.TextLayoutResult, kotlin.Unit> r31, final boolean r32, java.util.Map<java.lang.String, androidx.compose.foundation.text.InlineTextContent> r33, final androidx.compose.ui.text.TextStyle r34, final int r35, final boolean r36, final int r37, final int r38, final androidx.compose.ui.text.font.FontFamily.Resolver r39, final androidx.compose.foundation.text.modifiers.SelectionController r40, final androidx.compose.ui.graphics.ColorProducer r41, final kotlin.jvm.functions.Function1<? super androidx.compose.foundation.text.modifiers.TextAnnotatedStringNode.TextSubstitutionValue, kotlin.Unit> r42, final androidx.compose.foundation.text.TextAutoSize r43, androidx.compose.runtime.Composer r44, final int r45, final int r46, final int r47) {
        /*
            Method dump skipped, instructions count: 1699
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.BasicTextKt.m1304LayoutWithLinksAndInlineContent11Od_4g(androidx.compose.ui.Modifier, androidx.compose.ui.text.AnnotatedString, kotlin.jvm.functions.Function1, boolean, java.util.Map, androidx.compose.ui.text.TextStyle, int, boolean, int, int, androidx.compose.ui.text.font.FontFamily$Resolver, androidx.compose.foundation.text.modifiers.SelectionController, androidx.compose.ui.graphics.ColorProducer, kotlin.jvm.functions.Function1, androidx.compose.foundation.text.TextAutoSize, androidx.compose.runtime.Composer, int, int, int):void");
    }
}
