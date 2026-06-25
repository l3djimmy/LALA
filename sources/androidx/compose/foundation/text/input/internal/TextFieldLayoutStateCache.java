package androidx.compose.foundation.text.input.internal;

import androidx.compose.foundation.internal.InlineClassHelperKt;
import androidx.compose.foundation.text.KeyboardOptions;
import androidx.compose.foundation.text.input.TextFieldCharSequence;
import androidx.compose.foundation.text.input.internal.TextFieldLayoutStateCache;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotMutationPolicy;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.snapshots.Snapshot;
import androidx.compose.runtime.snapshots.SnapshotKt;
import androidx.compose.runtime.snapshots.StateObject;
import androidx.compose.runtime.snapshots.StateRecord;
import androidx.compose.ui.graphics.Shadow;
import androidx.compose.ui.graphics.drawscope.DrawStyle;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.PlatformTextStyle;
import androidx.compose.ui.text.TextLayoutInput;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextMeasurer;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontSynthesis;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.input.KeyboardType;
import androidx.compose.ui.text.intl.Locale;
import androidx.compose.ui.text.intl.LocaleList;
import androidx.compose.ui.text.style.BaselineShift;
import androidx.compose.ui.text.style.LineHeightStyle;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.text.style.TextGeometricTransform;
import androidx.compose.ui.text.style.TextIndent;
import androidx.compose.ui.text.style.TextMotion;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.ConstraintsKt;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.LayoutDirection;
import java.util.List;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;
/* compiled from: TextFieldLayoutStateCache.kt */
@Metadata(d1 = {"\u0000\u008c\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0000\u0018\u00002\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u00012\u00020\u0003:\u0003DEFB\u0005¢\u0006\u0002\u0010\u0004J \u0010 \u001a\u00020\u00022\u0006\u0010!\u001a\u00020\"2\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000b\u001a\u00020\nH\u0002J\u0018\u0010#\u001a\u00020\u00022\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000b\u001a\u00020\nH\u0002J0\u0010$\u001a\u00020\u00022\u0006\u0010%\u001a\u00020&2\u0006\u0010'\u001a\u00020(2\u0006\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020,ø\u0001\u0000¢\u0006\u0004\b-\u0010.J \u0010/\u001a\u00020\u00062\u0006\u00100\u001a\u00020\u00062\u0006\u00101\u001a\u00020\u00062\u0006\u00102\u001a\u00020\u0006H\u0016J\u0010\u00103\u001a\u00020\u001c2\u0006\u0010\u000b\u001a\u00020\nH\u0002J\u0010\u00104\u001a\u0002052\u0006\u0010\u001d\u001a\u00020\u0006H\u0016J\"\u00106\u001a\u0002052\u0017\u00107\u001a\u0013\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020508¢\u0006\u0002\b9H\u0082\bJ.\u0010:\u001a\u0002052\u0006\u0010;\u001a\u00020<2\u0006\u0010=\u001a\u00020>2\u0006\u0010?\u001a\u00020@2\u0006\u0010A\u001a\u00020@2\u0006\u0010B\u001a\u00020CR\u0014\u0010\u0005\u001a\u00020\u00068VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR/\u0010\u000b\u001a\u0004\u0018\u00010\n2\b\u0010\t\u001a\u0004\u0018\u00010\n8B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\b\u0010\u0010\u0011\u001a\u0004\b\f\u0010\r\"\u0004\b\u000e\u0010\u000fR/\u0010\u0013\u001a\u0004\u0018\u00010\u00122\b\u0010\t\u001a\u0004\u0018\u00010\u00128B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\b\u0018\u0010\u0011\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017R\u000e\u0010\u0019\u001a\u00020\u001aX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u001b\u001a\u0004\u0018\u00010\u001cX\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\u001d\u001a\u0004\u0018\u00010\u00028VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u001e\u0010\u001f\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006G"}, d2 = {"Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache;", "Landroidx/compose/runtime/State;", "Landroidx/compose/ui/text/TextLayoutResult;", "Landroidx/compose/runtime/snapshots/StateObject;", "()V", "firstStateRecord", "Landroidx/compose/runtime/snapshots/StateRecord;", "getFirstStateRecord", "()Landroidx/compose/runtime/snapshots/StateRecord;", "<set-?>", "Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache$MeasureInputs;", "measureInputs", "getMeasureInputs", "()Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache$MeasureInputs;", "setMeasureInputs", "(Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache$MeasureInputs;)V", "measureInputs$delegate", "Landroidx/compose/runtime/MutableState;", "Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache$NonMeasureInputs;", "nonMeasureInputs", "getNonMeasureInputs", "()Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache$NonMeasureInputs;", "setNonMeasureInputs", "(Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache$NonMeasureInputs;)V", "nonMeasureInputs$delegate", "record", "Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache$CacheRecord;", "textMeasurer", "Landroidx/compose/ui/text/TextMeasurer;", "value", "getValue", "()Landroidx/compose/ui/text/TextLayoutResult;", "computeLayout", "visualText", "Landroidx/compose/foundation/text/input/TextFieldCharSequence;", "getOrComputeLayout", "layoutWithNewMeasureInputs", "density", "Landroidx/compose/ui/unit/Density;", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "fontFamilyResolver", "Landroidx/compose/ui/text/font/FontFamily$Resolver;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "layoutWithNewMeasureInputs--hBUhpc", "(Landroidx/compose/ui/unit/Density;Landroidx/compose/ui/unit/LayoutDirection;Landroidx/compose/ui/text/font/FontFamily$Resolver;J)Landroidx/compose/ui/text/TextLayoutResult;", "mergeRecords", "previous", "current", "applied", "obtainTextMeasurer", "prependStateRecord", "", "updateCacheIfWritable", "block", "Lkotlin/Function1;", "Lkotlin/ExtensionFunctionType;", "updateNonMeasureInputs", "textFieldState", "Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;", "textStyle", "Landroidx/compose/ui/text/TextStyle;", "singleLine", "", "softWrap", "keyboardOptions", "Landroidx/compose/foundation/text/KeyboardOptions;", "CacheRecord", "MeasureInputs", "NonMeasureInputs", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextFieldLayoutStateCache implements State<TextLayoutResult>, StateObject {
    public static final int $stable = 0;
    private TextMeasurer textMeasurer;
    private final MutableState nonMeasureInputs$delegate = SnapshotStateKt.mutableStateOf(null, NonMeasureInputs.Companion.getMutationPolicy());
    private final MutableState measureInputs$delegate = SnapshotStateKt.mutableStateOf(null, MeasureInputs.Companion.getMutationPolicy());
    private CacheRecord record = new CacheRecord();

    private final NonMeasureInputs getNonMeasureInputs() {
        State $this$getValue$iv = this.nonMeasureInputs$delegate;
        return (NonMeasureInputs) $this$getValue$iv.getValue();
    }

    private final void setNonMeasureInputs(NonMeasureInputs nonMeasureInputs) {
        MutableState $this$setValue$iv = this.nonMeasureInputs$delegate;
        $this$setValue$iv.setValue(nonMeasureInputs);
    }

    private final MeasureInputs getMeasureInputs() {
        State $this$getValue$iv = this.measureInputs$delegate;
        return (MeasureInputs) $this$getValue$iv.getValue();
    }

    private final void setMeasureInputs(MeasureInputs measureInputs) {
        MutableState $this$setValue$iv = this.measureInputs$delegate;
        $this$setValue$iv.setValue(measureInputs);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.compose.runtime.State
    public TextLayoutResult getValue() {
        MeasureInputs measureInputs;
        NonMeasureInputs nonMeasureInputs = getNonMeasureInputs();
        if (nonMeasureInputs == null || (measureInputs = getMeasureInputs()) == null) {
            return null;
        }
        return getOrComputeLayout(nonMeasureInputs, measureInputs);
    }

    public final void updateNonMeasureInputs(TransformedTextFieldState textFieldState, TextStyle textStyle, boolean singleLine, boolean softWrap, KeyboardOptions keyboardOptions) {
        setNonMeasureInputs(new NonMeasureInputs(textFieldState, textStyle, singleLine, softWrap, KeyboardType.m6558equalsimpl0(keyboardOptions.m1335getKeyboardTypePjHm6EE(), KeyboardType.Companion.m6578getPhonePjHm6EE())));
    }

    /* renamed from: layoutWithNewMeasureInputs--hBUhpc  reason: not valid java name */
    public final TextLayoutResult m1558layoutWithNewMeasureInputshBUhpc(Density density, LayoutDirection layoutDirection, FontFamily.Resolver fontFamilyResolver, long constraints) {
        MeasureInputs measureInputs = new MeasureInputs(density, layoutDirection, fontFamilyResolver, constraints, null);
        setMeasureInputs(measureInputs);
        NonMeasureInputs nonMeasureInputs = getNonMeasureInputs();
        if (nonMeasureInputs != null) {
            return getOrComputeLayout(nonMeasureInputs, measureInputs);
        }
        InlineClassHelperKt.throwIllegalStateExceptionForNullCheck("Called layoutWithNewMeasureInputs before updateNonMeasureInputs");
        throw new KotlinNothingValueException();
    }

    private final TextLayoutResult getOrComputeLayout(NonMeasureInputs nonMeasureInputs, MeasureInputs measureInputs) {
        boolean isLayoutAffectingSame;
        TextFieldCharSequence visualText = nonMeasureInputs.getTextFieldState().getVisualText();
        StateRecord $this$withCurrent$iv = this.record;
        CacheRecord cachedRecord = (CacheRecord) SnapshotKt.current($this$withCurrent$iv);
        TextLayoutResult cachedResult = cachedRecord.getLayoutResult();
        if (cachedResult != null) {
            CharSequence visualText2 = cachedRecord.getVisualText();
            if ((visualText2 != null && StringsKt.contentEquals(visualText2, visualText)) && Intrinsics.areEqual(cachedRecord.getComposingAnnotations(), visualText.getComposingAnnotations()) && Intrinsics.areEqual(cachedRecord.m1559getCompositionMzsxiRA(), visualText.m1455getCompositionMzsxiRA()) && cachedRecord.getSingleLine() == nonMeasureInputs.getSingleLine() && cachedRecord.getSoftWrap() == nonMeasureInputs.getSoftWrap() && cachedRecord.getLayoutDirection() == measureInputs.getLayoutDirection()) {
                if (cachedRecord.getDensityValue() == measureInputs.getDensity().getDensity()) {
                    if ((cachedRecord.getFontScale() == measureInputs.getDensity().getFontScale()) && Constraints.m6819equalsimpl0(cachedRecord.m1560getConstraintsmsEJaDk(), measureInputs.m1563getConstraintsmsEJaDk()) && Intrinsics.areEqual(cachedRecord.getFontFamilyResolver(), measureInputs.getFontFamilyResolver()) && !cachedResult.getMultiParagraph().getIntrinsics().getHasStaleResolvedFonts()) {
                        TextStyle textStyle = cachedRecord.getTextStyle();
                        if (textStyle != null) {
                            isLayoutAffectingSame = textStyle.hasSameLayoutAffectingAttributes(nonMeasureInputs.getTextStyle());
                        } else {
                            isLayoutAffectingSame = false;
                        }
                        TextStyle textStyle2 = cachedRecord.getTextStyle();
                        boolean isDrawAffectingSame = textStyle2 != null ? textStyle2.hasSameDrawAffectingAttributes(nonMeasureInputs.getTextStyle()) : false;
                        if (isLayoutAffectingSame && isDrawAffectingSame) {
                            return cachedResult;
                        }
                        if (isLayoutAffectingSame) {
                            return TextLayoutResult.m6307copyO0kMr_c$default(cachedResult, new TextLayoutInput(cachedResult.getLayoutInput().getText(), nonMeasureInputs.getTextStyle(), cachedResult.getLayoutInput().getPlaceholders(), cachedResult.getLayoutInput().getMaxLines(), cachedResult.getLayoutInput().getSoftWrap(), cachedResult.getLayoutInput().m6306getOverflowgIe3tQ8(), cachedResult.getLayoutInput().getDensity(), cachedResult.getLayoutInput().getLayoutDirection(), cachedResult.getLayoutInput().getFontFamilyResolver(), cachedResult.getLayoutInput().m6305getConstraintsmsEJaDk(), (DefaultConstructorMarker) null), 0L, 2, null);
                        }
                    }
                }
            }
        }
        TextLayoutResult newResult = computeLayout(visualText, nonMeasureInputs, measureInputs);
        if (Intrinsics.areEqual(newResult, cachedResult)) {
            return newResult;
        }
        Snapshot snapshot$iv = Snapshot.Companion.getCurrent();
        if (snapshot$iv.getReadOnly()) {
            return newResult;
        }
        StateRecord $this$writable$iv$iv = this.record;
        Object lock$iv$iv$iv$iv = SnapshotKt.getLock();
        synchronized (lock$iv$iv$iv$iv) {
            try {
                CacheRecord $this$getOrComputeLayout_u24lambda_u243_u24lambda_u242_u24lambda_u241 = (CacheRecord) SnapshotKt.writableRecord($this$writable$iv$iv, this, snapshot$iv);
                $this$getOrComputeLayout_u24lambda_u243_u24lambda_u242_u24lambda_u241.setVisualText(visualText);
                $this$getOrComputeLayout_u24lambda_u243_u24lambda_u242_u24lambda_u241.setComposingAnnotations(visualText.getComposingAnnotations());
                $this$getOrComputeLayout_u24lambda_u243_u24lambda_u242_u24lambda_u241.m1561setCompositionOEnZFl4(visualText.m1455getCompositionMzsxiRA());
                $this$getOrComputeLayout_u24lambda_u243_u24lambda_u242_u24lambda_u241.setSingleLine(nonMeasureInputs.getSingleLine());
                $this$getOrComputeLayout_u24lambda_u243_u24lambda_u242_u24lambda_u241.setSoftWrap(nonMeasureInputs.getSoftWrap());
                $this$getOrComputeLayout_u24lambda_u243_u24lambda_u242_u24lambda_u241.setTextStyle(nonMeasureInputs.getTextStyle());
                $this$getOrComputeLayout_u24lambda_u243_u24lambda_u242_u24lambda_u241.setLayoutDirection(measureInputs.getLayoutDirection());
                $this$getOrComputeLayout_u24lambda_u243_u24lambda_u242_u24lambda_u241.setDensityValue(measureInputs.getDensityValue());
                $this$getOrComputeLayout_u24lambda_u243_u24lambda_u242_u24lambda_u241.setFontScale(measureInputs.getFontScale());
                try {
                    $this$getOrComputeLayout_u24lambda_u243_u24lambda_u242_u24lambda_u241.m1562setConstraintsBRTryo0(measureInputs.m1563getConstraintsmsEJaDk());
                    $this$getOrComputeLayout_u24lambda_u243_u24lambda_u242_u24lambda_u241.setFontFamilyResolver(measureInputs.getFontFamilyResolver());
                    $this$getOrComputeLayout_u24lambda_u243_u24lambda_u242_u24lambda_u241.setLayoutResult(newResult);
                    Unit unit = Unit.INSTANCE;
                    SnapshotKt.notifyWrite(snapshot$iv, this);
                    return newResult;
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }
    }

    private final void updateCacheIfWritable(Function1<? super CacheRecord, Unit> function1) {
        Snapshot snapshot = Snapshot.Companion.getCurrent();
        if (!snapshot.getReadOnly()) {
            StateRecord $this$writable$iv = this.record;
            Object lock$iv$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv$iv) {
                function1.invoke(SnapshotKt.writableRecord($this$writable$iv, this, snapshot));
            }
            SnapshotKt.notifyWrite(snapshot, this);
        }
    }

    private final TextMeasurer obtainTextMeasurer(MeasureInputs measureInputs) {
        TextMeasurer textMeasurer = this.textMeasurer;
        if (textMeasurer != null) {
            return textMeasurer;
        }
        TextMeasurer it = new TextMeasurer(measureInputs.getFontFamilyResolver(), measureInputs.getDensity(), measureInputs.getLayoutDirection(), 1);
        this.textMeasurer = it;
        return it;
    }

    private final TextLayoutResult computeLayout(TextFieldCharSequence visualText, NonMeasureInputs nonMeasureInputs, MeasureInputs measureInputs) {
        TextStyle finalTextStyle;
        Locale currentLocale;
        TextMeasurer textMeasurer = obtainTextMeasurer(measureInputs);
        if (nonMeasureInputs.isKeyboardTypePhone()) {
            TextStyle textStyle = nonMeasureInputs.getTextStyle();
            LocaleList it = textStyle.getLocaleList();
            if (it == null || (currentLocale = it.get(0)) == null) {
                currentLocale = Locale.Companion.getCurrent();
            }
            int textDirection = TextFieldLayoutStateCache_androidKt.resolveTextDirectionForKeyboardTypePhone(currentLocale.getPlatformLocale());
            TextStyle textStyle2 = nonMeasureInputs.getTextStyle().merge(new TextStyle(0L, 0L, (FontWeight) null, (FontStyle) null, (FontSynthesis) null, (FontFamily) null, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (DrawStyle) null, 0, textDirection, 0L, (TextIndent) null, (PlatformTextStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, 16711679, (DefaultConstructorMarker) null));
            finalTextStyle = textStyle2;
        } else {
            finalTextStyle = nonMeasureInputs.getTextStyle();
        }
        String textFieldCharSequence = visualText.toString();
        List<AnnotatedString.Range<AnnotatedString.Annotation>> composingAnnotations = visualText.getComposingAnnotations();
        if (composingAnnotations == null) {
            composingAnnotations = CollectionsKt.emptyList();
        }
        return TextMeasurer.m6313measurexDpz5zY$default(textMeasurer, new AnnotatedString(textFieldCharSequence, composingAnnotations), finalTextStyle, 0, nonMeasureInputs.getSoftWrap(), nonMeasureInputs.getSingleLine() ? 1 : Integer.MAX_VALUE, null, measureInputs.m1563getConstraintsmsEJaDk(), measureInputs.getLayoutDirection(), measureInputs.getDensity(), measureInputs.getFontFamilyResolver(), false, 1060, null);
    }

    @Override // androidx.compose.runtime.snapshots.StateObject
    public StateRecord getFirstStateRecord() {
        return this.record;
    }

    @Override // androidx.compose.runtime.snapshots.StateObject
    public void prependStateRecord(StateRecord value) {
        Intrinsics.checkNotNull(value, "null cannot be cast to non-null type androidx.compose.foundation.text.input.internal.TextFieldLayoutStateCache.CacheRecord");
        this.record = (CacheRecord) value;
    }

    @Override // androidx.compose.runtime.snapshots.StateObject
    public StateRecord mergeRecords(StateRecord previous, StateRecord current, StateRecord applied) {
        return applied;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: TextFieldLayoutStateCache.kt */
    @Metadata(d1 = {"\u0000v\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0007\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\r\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0002\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0010\u0010I\u001a\u00020J2\u0006\u0010K\u001a\u00020\u0001H\u0016J\b\u0010L\u001a\u00020\u0001H\u0016J\b\u0010M\u001a\u00020NH\u0016R,\u0010\u0003\u001a\u0014\u0012\u000e\u0012\f\u0012\u0004\u0012\u00020\u00060\u0005j\u0002`\u0007\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\b\u0010\t\"\u0004\b\n\u0010\u000bR\"\u0010\f\u001a\u0004\u0018\u00010\rX\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u000e\n\u0000\u001a\u0004\b\u000e\u0010\u000f\"\u0004\b\u0010\u0010\u0011R\"\u0010\u0012\u001a\u00020\u0013X\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\u0018\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017R\u001a\u0010\u0019\u001a\u00020\u001aX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001b\u0010\u001c\"\u0004\b\u001d\u0010\u001eR\u001c\u0010\u001f\u001a\u0004\u0018\u00010 X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b!\u0010\"\"\u0004\b#\u0010$R\u001a\u0010%\u001a\u00020\u001aX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b&\u0010\u001c\"\u0004\b'\u0010\u001eR\u001c\u0010(\u001a\u0004\u0018\u00010)X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b*\u0010+\"\u0004\b,\u0010-R\u001c\u0010.\u001a\u0004\u0018\u00010/X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b0\u00101\"\u0004\b2\u00103R\u001a\u00104\u001a\u000205X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b6\u00107\"\u0004\b8\u00109R\u001a\u0010:\u001a\u000205X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b;\u00107\"\u0004\b<\u00109R\u001c\u0010=\u001a\u0004\u0018\u00010>X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b?\u0010@\"\u0004\bA\u0010BR\u001c\u0010C\u001a\u0004\u0018\u00010DX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bE\u0010F\"\u0004\bG\u0010H\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006O"}, d2 = {"Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache$CacheRecord;", "Landroidx/compose/runtime/snapshots/StateRecord;", "()V", "composingAnnotations", "", "Landroidx/compose/ui/text/AnnotatedString$Range;", "Landroidx/compose/ui/text/AnnotatedString$Annotation;", "Landroidx/compose/foundation/text/input/PlacedAnnotation;", "getComposingAnnotations", "()Ljava/util/List;", "setComposingAnnotations", "(Ljava/util/List;)V", "composition", "Landroidx/compose/ui/text/TextRange;", "getComposition-MzsxiRA", "()Landroidx/compose/ui/text/TextRange;", "setComposition-OEnZFl4", "(Landroidx/compose/ui/text/TextRange;)V", "constraints", "Landroidx/compose/ui/unit/Constraints;", "getConstraints-msEJaDk", "()J", "setConstraints-BRTryo0", "(J)V", "J", "densityValue", "", "getDensityValue", "()F", "setDensityValue", "(F)V", "fontFamilyResolver", "Landroidx/compose/ui/text/font/FontFamily$Resolver;", "getFontFamilyResolver", "()Landroidx/compose/ui/text/font/FontFamily$Resolver;", "setFontFamilyResolver", "(Landroidx/compose/ui/text/font/FontFamily$Resolver;)V", "fontScale", "getFontScale", "setFontScale", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "getLayoutDirection", "()Landroidx/compose/ui/unit/LayoutDirection;", "setLayoutDirection", "(Landroidx/compose/ui/unit/LayoutDirection;)V", "layoutResult", "Landroidx/compose/ui/text/TextLayoutResult;", "getLayoutResult", "()Landroidx/compose/ui/text/TextLayoutResult;", "setLayoutResult", "(Landroidx/compose/ui/text/TextLayoutResult;)V", "singleLine", "", "getSingleLine", "()Z", "setSingleLine", "(Z)V", "softWrap", "getSoftWrap", "setSoftWrap", "textStyle", "Landroidx/compose/ui/text/TextStyle;", "getTextStyle", "()Landroidx/compose/ui/text/TextStyle;", "setTextStyle", "(Landroidx/compose/ui/text/TextStyle;)V", "visualText", "", "getVisualText", "()Ljava/lang/CharSequence;", "setVisualText", "(Ljava/lang/CharSequence;)V", "assign", "", "value", "create", "toString", "", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class CacheRecord extends StateRecord {
        private List<AnnotatedString.Range<AnnotatedString.Annotation>> composingAnnotations;
        private TextRange composition;
        private FontFamily.Resolver fontFamilyResolver;
        private LayoutDirection layoutDirection;
        private TextLayoutResult layoutResult;
        private boolean singleLine;
        private boolean softWrap;
        private TextStyle textStyle;
        private CharSequence visualText;
        private float densityValue = Float.NaN;
        private float fontScale = Float.NaN;
        private long constraints = ConstraintsKt.Constraints$default(0, 0, 0, 0, 15, null);

        public final CharSequence getVisualText() {
            return this.visualText;
        }

        public final void setVisualText(CharSequence charSequence) {
            this.visualText = charSequence;
        }

        public final List<AnnotatedString.Range<AnnotatedString.Annotation>> getComposingAnnotations() {
            return this.composingAnnotations;
        }

        public final void setComposingAnnotations(List<AnnotatedString.Range<AnnotatedString.Annotation>> list) {
            this.composingAnnotations = list;
        }

        /* renamed from: getComposition-MzsxiRA  reason: not valid java name */
        public final TextRange m1559getCompositionMzsxiRA() {
            return this.composition;
        }

        /* renamed from: setComposition-OEnZFl4  reason: not valid java name */
        public final void m1561setCompositionOEnZFl4(TextRange textRange) {
            this.composition = textRange;
        }

        public final TextStyle getTextStyle() {
            return this.textStyle;
        }

        public final void setTextStyle(TextStyle textStyle) {
            this.textStyle = textStyle;
        }

        public final boolean getSingleLine() {
            return this.singleLine;
        }

        public final void setSingleLine(boolean z) {
            this.singleLine = z;
        }

        public final boolean getSoftWrap() {
            return this.softWrap;
        }

        public final void setSoftWrap(boolean z) {
            this.softWrap = z;
        }

        public final float getDensityValue() {
            return this.densityValue;
        }

        public final void setDensityValue(float f) {
            this.densityValue = f;
        }

        public final float getFontScale() {
            return this.fontScale;
        }

        public final void setFontScale(float f) {
            this.fontScale = f;
        }

        public final LayoutDirection getLayoutDirection() {
            return this.layoutDirection;
        }

        public final void setLayoutDirection(LayoutDirection layoutDirection) {
            this.layoutDirection = layoutDirection;
        }

        public final FontFamily.Resolver getFontFamilyResolver() {
            return this.fontFamilyResolver;
        }

        public final void setFontFamilyResolver(FontFamily.Resolver resolver) {
            this.fontFamilyResolver = resolver;
        }

        /* renamed from: getConstraints-msEJaDk  reason: not valid java name */
        public final long m1560getConstraintsmsEJaDk() {
            return this.constraints;
        }

        /* renamed from: setConstraints-BRTryo0  reason: not valid java name */
        public final void m1562setConstraintsBRTryo0(long j) {
            this.constraints = j;
        }

        public final TextLayoutResult getLayoutResult() {
            return this.layoutResult;
        }

        public final void setLayoutResult(TextLayoutResult textLayoutResult) {
            this.layoutResult = textLayoutResult;
        }

        @Override // androidx.compose.runtime.snapshots.StateRecord
        public StateRecord create() {
            return new CacheRecord();
        }

        @Override // androidx.compose.runtime.snapshots.StateRecord
        public void assign(StateRecord value) {
            Intrinsics.checkNotNull(value, "null cannot be cast to non-null type androidx.compose.foundation.text.input.internal.TextFieldLayoutStateCache.CacheRecord");
            CacheRecord cacheRecord = (CacheRecord) value;
            this.visualText = ((CacheRecord) value).visualText;
            this.composingAnnotations = ((CacheRecord) value).composingAnnotations;
            this.composition = ((CacheRecord) value).composition;
            this.textStyle = ((CacheRecord) value).textStyle;
            this.singleLine = ((CacheRecord) value).singleLine;
            this.softWrap = ((CacheRecord) value).softWrap;
            this.densityValue = ((CacheRecord) value).densityValue;
            this.fontScale = ((CacheRecord) value).fontScale;
            this.layoutDirection = ((CacheRecord) value).layoutDirection;
            this.fontFamilyResolver = ((CacheRecord) value).fontFamilyResolver;
            this.constraints = ((CacheRecord) value).constraints;
            this.layoutResult = ((CacheRecord) value).layoutResult;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("CacheRecord(visualText=").append((Object) this.visualText).append(", composingAnnotations=").append(this.composingAnnotations).append(", composition=").append(this.composition).append(", textStyle=").append(this.textStyle).append(", singleLine=").append(this.singleLine).append(", softWrap=").append(this.softWrap).append(", densityValue=").append(this.densityValue).append(", fontScale=").append(this.fontScale).append(", layoutDirection=").append(this.layoutDirection).append(", fontFamilyResolver=").append(this.fontFamilyResolver).append(", constraints=").append((Object) Constraints.m6831toStringimpl(this.constraints)).append(", layoutResult=");
            sb.append(this.layoutResult).append(')');
            return sb.toString();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: TextFieldLayoutStateCache.kt */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0002\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\u0006\u0010\t\u001a\u00020\u0007¢\u0006\u0002\u0010\nJ\b\u0010\u0012\u001a\u00020\u0013H\u0016R\u0011\u0010\t\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0011\u0010\b\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u0015"}, d2 = {"Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache$NonMeasureInputs;", "", "textFieldState", "Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;", "textStyle", "Landroidx/compose/ui/text/TextStyle;", "singleLine", "", "softWrap", "isKeyboardTypePhone", "(Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;Landroidx/compose/ui/text/TextStyle;ZZZ)V", "()Z", "getSingleLine", "getSoftWrap", "getTextFieldState", "()Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;", "getTextStyle", "()Landroidx/compose/ui/text/TextStyle;", "toString", "", "Companion", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class NonMeasureInputs {
        public static final Companion Companion = new Companion(null);
        private static final SnapshotMutationPolicy<NonMeasureInputs> mutationPolicy = new SnapshotMutationPolicy<NonMeasureInputs>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldLayoutStateCache$NonMeasureInputs$Companion$mutationPolicy$1
            @Override // androidx.compose.runtime.SnapshotMutationPolicy
            public boolean equivalent(TextFieldLayoutStateCache.NonMeasureInputs a, TextFieldLayoutStateCache.NonMeasureInputs b) {
                if (a == null || b == null) {
                    return !((a == null) ^ (b == null));
                }
                return a.getTextFieldState() == b.getTextFieldState() && Intrinsics.areEqual(a.getTextStyle(), b.getTextStyle()) && a.getSingleLine() == b.getSingleLine() && a.getSoftWrap() == b.getSoftWrap() && a.isKeyboardTypePhone() == b.isKeyboardTypePhone();
            }
        };
        private final boolean isKeyboardTypePhone;
        private final boolean singleLine;
        private final boolean softWrap;
        private final TransformedTextFieldState textFieldState;
        private final TextStyle textStyle;

        public NonMeasureInputs(TransformedTextFieldState textFieldState, TextStyle textStyle, boolean singleLine, boolean softWrap, boolean isKeyboardTypePhone) {
            this.textFieldState = textFieldState;
            this.textStyle = textStyle;
            this.singleLine = singleLine;
            this.softWrap = softWrap;
            this.isKeyboardTypePhone = isKeyboardTypePhone;
        }

        public final TransformedTextFieldState getTextFieldState() {
            return this.textFieldState;
        }

        public final TextStyle getTextStyle() {
            return this.textStyle;
        }

        public final boolean getSingleLine() {
            return this.singleLine;
        }

        public final boolean getSoftWrap() {
            return this.softWrap;
        }

        public final boolean isKeyboardTypePhone() {
            return this.isKeyboardTypePhone;
        }

        public String toString() {
            return "NonMeasureInputs(textFieldState=" + this.textFieldState + ", textStyle=" + this.textStyle + ", singleLine=" + this.singleLine + ", softWrap=" + this.softWrap + ", isKeyboardTypePhone=" + this.isKeyboardTypePhone + ')';
        }

        /* compiled from: TextFieldLayoutStateCache.kt */
        @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0019\u0010\u0003\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache$NonMeasureInputs$Companion;", "", "()V", "mutationPolicy", "Landroidx/compose/runtime/SnapshotMutationPolicy;", "Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache$NonMeasureInputs;", "getMutationPolicy", "()Landroidx/compose/runtime/SnapshotMutationPolicy;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
        /* loaded from: classes.dex */
        public static final class Companion {
            public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
                this();
            }

            private Companion() {
            }

            public final SnapshotMutationPolicy<NonMeasureInputs> getMutationPolicy() {
                return NonMeasureInputs.mutationPolicy;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: TextFieldLayoutStateCache.kt */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u0007\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0002\u0018\u0000 \u001c2\u00020\u0001:\u0001\u001cB%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0002\u0010\nJ\b\u0010\u001a\u001a\u00020\u001bH\u0016R\u0019\u0010\b\u001a\u00020\tø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0010\u001a\u00020\u0011¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\u0016\u001a\u00020\u0011¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0013R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u001d"}, d2 = {"Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache$MeasureInputs;", "", "density", "Landroidx/compose/ui/unit/Density;", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "fontFamilyResolver", "Landroidx/compose/ui/text/font/FontFamily$Resolver;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "(Landroidx/compose/ui/unit/Density;Landroidx/compose/ui/unit/LayoutDirection;Landroidx/compose/ui/text/font/FontFamily$Resolver;JLkotlin/jvm/internal/DefaultConstructorMarker;)V", "getConstraints-msEJaDk", "()J", "J", "getDensity", "()Landroidx/compose/ui/unit/Density;", "densityValue", "", "getDensityValue", "()F", "getFontFamilyResolver", "()Landroidx/compose/ui/text/font/FontFamily$Resolver;", "fontScale", "getFontScale", "getLayoutDirection", "()Landroidx/compose/ui/unit/LayoutDirection;", "toString", "", "Companion", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class MeasureInputs {
        public static final Companion Companion = new Companion(null);
        private static final SnapshotMutationPolicy<MeasureInputs> mutationPolicy = new SnapshotMutationPolicy<MeasureInputs>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldLayoutStateCache$MeasureInputs$Companion$mutationPolicy$1
            @Override // androidx.compose.runtime.SnapshotMutationPolicy
            public boolean equivalent(TextFieldLayoutStateCache.MeasureInputs a, TextFieldLayoutStateCache.MeasureInputs b) {
                if (a == null || b == null) {
                    return !((a == null) ^ (b == null));
                }
                if (a.getDensityValue() == b.getDensityValue()) {
                    if ((a.getFontScale() == b.getFontScale()) && a.getLayoutDirection() == b.getLayoutDirection() && Intrinsics.areEqual(a.getFontFamilyResolver(), b.getFontFamilyResolver()) && Constraints.m6819equalsimpl0(a.m1563getConstraintsmsEJaDk(), b.m1563getConstraintsmsEJaDk())) {
                        return true;
                    }
                }
                return false;
            }
        };
        private final long constraints;
        private final Density density;
        private final float densityValue;
        private final FontFamily.Resolver fontFamilyResolver;
        private final float fontScale;
        private final LayoutDirection layoutDirection;

        public /* synthetic */ MeasureInputs(Density density, LayoutDirection layoutDirection, FontFamily.Resolver resolver, long j, DefaultConstructorMarker defaultConstructorMarker) {
            this(density, layoutDirection, resolver, j);
        }

        private MeasureInputs(Density density, LayoutDirection layoutDirection, FontFamily.Resolver fontFamilyResolver, long constraints) {
            this.density = density;
            this.layoutDirection = layoutDirection;
            this.fontFamilyResolver = fontFamilyResolver;
            this.constraints = constraints;
            this.densityValue = this.density.getDensity();
            this.fontScale = this.density.getFontScale();
        }

        public final Density getDensity() {
            return this.density;
        }

        public final LayoutDirection getLayoutDirection() {
            return this.layoutDirection;
        }

        public final FontFamily.Resolver getFontFamilyResolver() {
            return this.fontFamilyResolver;
        }

        /* renamed from: getConstraints-msEJaDk  reason: not valid java name */
        public final long m1563getConstraintsmsEJaDk() {
            return this.constraints;
        }

        public final float getDensityValue() {
            return this.densityValue;
        }

        public final float getFontScale() {
            return this.fontScale;
        }

        public String toString() {
            return "MeasureInputs(density=" + this.density + ", densityValue=" + this.densityValue + ", fontScale=" + this.fontScale + ", layoutDirection=" + this.layoutDirection + ", fontFamilyResolver=" + this.fontFamilyResolver + ", constraints=" + ((Object) Constraints.m6831toStringimpl(this.constraints)) + ')';
        }

        /* compiled from: TextFieldLayoutStateCache.kt */
        @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0019\u0010\u0003\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache$MeasureInputs$Companion;", "", "()V", "mutationPolicy", "Landroidx/compose/runtime/SnapshotMutationPolicy;", "Landroidx/compose/foundation/text/input/internal/TextFieldLayoutStateCache$MeasureInputs;", "getMutationPolicy", "()Landroidx/compose/runtime/SnapshotMutationPolicy;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
        /* loaded from: classes.dex */
        public static final class Companion {
            public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
                this();
            }

            private Companion() {
            }

            public final SnapshotMutationPolicy<MeasureInputs> getMutationPolicy() {
                return MeasureInputs.mutationPolicy;
            }
        }
    }
}
