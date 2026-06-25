package androidx.compose.runtime;

import androidx.collection.MutableScatterMap;
import androidx.collection.MutableScatterSet;
import androidx.collection.ScatterSetKt;
import androidx.compose.runtime.collection.MultiValueMap;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.exifinterface.media.ExifInterface;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.TuplesKt;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Composer.kt */
@Metadata(d1 = {"\u0000¼\u0001\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0001\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010!\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0000\u001a\u0010\u0010<\u001a\u00020=2\u0006\u0010>\u001a\u00020?H\u0000\u001a\u0010\u0010@\u001a\u00020A2\u0006\u0010>\u001a\u00020?H\u0000\u001a\u0011\u0010B\u001a\u00020=2\u0006\u0010C\u001a\u00020\u0001H\u0080\b\u001a\u001f\u0010B\u001a\u00020=2\u0006\u0010C\u001a\u00020\u00012\f\u0010D\u001a\b\u0012\u0004\u0012\u00020?0EH\u0080\b\u001a.\u0010F\u001a\u00020G2\u0006\u0010H\u001a\u00020I2\u0006\u0010(\u001a\u00020J2\u0006\u0010K\u001a\u0002032\f\u0010L\u001a\b\u0012\u0002\b\u0003\u0018\u00010MH\u0000\u001a(\u0010N\u001a\u0004\u0018\u00010\u00062\b\u0010C\u001a\u0004\u0018\u00010\u00062\b\u0010O\u001a\u0004\u0018\u00010\u00062\b\u0010P\u001a\u0004\u0018\u00010\u0006H\u0002\u001a\b\u0010Q\u001a\u00020\u0001H\u0007\u001a5\u0010R\u001a\u000e\u0012\u0004\u0012\u0002HT\u0012\u0004\u0012\u0002HU0S\"\b\b\u0000\u0010T*\u00020\u0006\"\b\b\u0001\u0010U*\u00020\u00062\u0006\u0010V\u001a\u00020\fH\u0002¢\u0006\u0002\u0010W\u001a\u0011\u0010X\u001a\u00020=2\u0006\u0010C\u001a\u00020\u0001H\u0080\b\u001a*\u0010X\u001a\u00020=2\u0006\u0010C\u001a\u00020\u00012\f\u0010D\u001a\b\u0012\u0004\u0012\u00020?0EH\u0080\b\u0082\u0002\b\n\u0006\b\u0000\u001a\u0002\u0010\u0001\u001a\u0018\u0010Y\u001a\u00020=2\u0006\u0010Z\u001a\u00020[2\u0006\u0010Y\u001a\u00020?H\u0007\u001a\u0010\u0010\\\u001a\u00020=2\u0006\u0010Z\u001a\u00020[H\u0007\u001a \u0010]\u001a\u00020=2\u0006\u0010Z\u001a\u00020[2\u0006\u0010^\u001a\u00020\f2\u0006\u0010Y\u001a\u00020?H\u0007\u001a\b\u0010_\u001a\u00020=H\u0007\u001a(\u0010`\u001a\u00020=2\u0006\u0010^\u001a\u00020\f2\u0006\u0010a\u001a\u00020\f2\u0006\u0010b\u001a\u00020\f2\u0006\u0010c\u001a\u00020?H\u0007\u001a\u0018\u0010`\u001a\u00020=2\u0006\u0010^\u001a\u00020\f2\u0006\u0010c\u001a\u00020?H\u0007\u001a\f\u0010d\u001a\u00020\u0001*\u00020\fH\u0002\u001a\f\u0010e\u001a\u00020\f*\u00020\u0001H\u0002\u001a3\u0010f\u001a\u0002Hg\"\u0004\b\u0000\u0010g*\u00020[2\u0006\u0010h\u001a\u00020\u00012\u0011\u0010i\u001a\r\u0012\u0004\u0012\u0002Hg0E¢\u0006\u0002\bjH\u0087\b¢\u0006\u0002\u0010k\u001a\u001c\u0010l\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060m*\u00020n2\u0006\u0010o\u001a\u00020pH\u0002\u001a\u0014\u0010q\u001a\u00020=*\u0002032\u0006\u0010r\u001a\u00020sH\u0000\u001a\u001c\u0010t\u001a\u00020\f*\u0002012\u0006\u0010u\u001a\u00020\f2\u0006\u0010v\u001a\u00020\fH\u0002\u001a(\u0010w\u001a\b\u0012\u0004\u0012\u00020\u00040x*\b\u0012\u0004\u0012\u00020\u00040x2\u0006\u0010y\u001a\u00020\f2\u0006\u0010z\u001a\u00020\fH\u0002\u001a\u001a\u0010{\u001a\u00020\f*\b\u0012\u0004\u0012\u00020\u00040x2\u0006\u0010|\u001a\u00020\fH\u0002\u001a\u001a\u0010}\u001a\u00020\f*\b\u0012\u0004\u0012\u00020\u00040x2\u0006\u0010|\u001a\u00020\fH\u0002\u001a$\u0010~\u001a\u0004\u0018\u00010\u0004*\b\u0012\u0004\u0012\u00020\u00040x2\u0006\u0010y\u001a\u00020\f2\u0006\u0010z\u001a\u00020\fH\u0002\u001a/\u0010\u007f\u001a\u00020=*\b\u0012\u0004\u0012\u00020\u00040x2\u0006\u0010|\u001a\u00020\f2\b\u0010\u0080\u0001\u001a\u00030\u0081\u00012\t\u0010\u0082\u0001\u001a\u0004\u0018\u00010\u0006H\u0002\u001a(\u0010\u0083\u0001\u001a\u00020\f*\u0002012\u0007\u0010\u0084\u0001\u001a\u00020\f2\u0007\u0010\u0085\u0001\u001a\u00020\f2\u0007\u0010\u0086\u0001\u001a\u00020\fH\u0002\u001a\u0015\u0010\u0087\u0001\u001a\u00020=*\u0002032\u0006\u0010r\u001a\u00020sH\u0000\u001a \u0010\u0088\u0001\u001a\u00020=*\u0002032\u0006\u0010u\u001a\u00020\f2\t\u0010\u0089\u0001\u001a\u0004\u0018\u00010\u0006H\u0002\u001a\u001d\u0010\u008a\u0001\u001a\u0004\u0018\u00010\u0004*\b\u0012\u0004\u0012\u00020\u00040x2\u0006\u0010|\u001a\u00020\fH\u0002\u001a#\u0010\u008b\u0001\u001a\u00020=*\b\u0012\u0004\u0012\u00020\u00040x2\u0006\u0010y\u001a\u00020\f2\u0006\u0010z\u001a\u00020\fH\u0002\u001a<\u0010\u008c\u0001\u001a\u00020=\"\u0005\b\u0000\u0010\u008d\u0001*\u0002032\b\u0010o\u001a\u0004\u0018\u00010p2\u001b\u0010\u008e\u0001\u001a\u0016\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u00020\f\u0012\u0005\u0012\u0003H\u008d\u00010\u008f\u0001H\u0080\b\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0080T¢\u0006\u0002\n\u0000\"\u0014\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001c\u0010\u0005\u001a\u00020\u00068\u0000X\u0081\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0007\u0010\b\u001a\u0004\b\t\u0010\n\"\u0016\u0010\u000b\u001a\u00020\f8\u0000X\u0081T¢\u0006\b\n\u0000\u0012\u0004\b\r\u0010\b\"\u0016\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e¢\u0006\b\n\u0000\u0012\u0004\b\u0010\u0010\b\"\u000e\u0010\u0011\u001a\u00020\fX\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0012\u001a\u00020\fX\u0082T¢\u0006\u0002\n\u0000\"\u001c\u0010\u0013\u001a\u00020\u00068\u0000X\u0081\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0014\u0010\b\u001a\u0004\b\u0015\u0010\n\"\u0016\u0010\u0016\u001a\u00020\f8\u0000X\u0081T¢\u0006\b\n\u0000\u0012\u0004\b\u0017\u0010\b\"\u000e\u0010\u0018\u001a\u00020\fX\u0082T¢\u0006\u0002\n\u0000\"\u001c\u0010\u0019\u001a\u00020\u00068\u0000X\u0081\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u001a\u0010\b\u001a\u0004\b\u001b\u0010\n\"\u0016\u0010\u001c\u001a\u00020\f8\u0000X\u0081T¢\u0006\b\n\u0000\u0012\u0004\b\u001d\u0010\b\"\u001c\u0010\u001e\u001a\u00020\u00068\u0000X\u0081\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u001f\u0010\b\u001a\u0004\b \u0010\n\"\u0016\u0010!\u001a\u00020\f8\u0000X\u0081T¢\u0006\b\n\u0000\u0012\u0004\b\"\u0010\b\"\u001c\u0010#\u001a\u00020\u00068\u0000X\u0081\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b$\u0010\b\u001a\u0004\b%\u0010\n\"\u0016\u0010&\u001a\u00020\f8\u0000X\u0081T¢\u0006\b\n\u0000\u0012\u0004\b'\u0010\b\"\u001c\u0010(\u001a\u00020\u00068\u0000X\u0081\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b)\u0010\b\u001a\u0004\b*\u0010\n\"\u0016\u0010+\u001a\u00020\f8\u0000X\u0081T¢\u0006\b\n\u0000\u0012\u0004\b,\u0010\b\"\u0016\u0010-\u001a\u00020\f8\u0000X\u0081T¢\u0006\b\n\u0000\u0012\u0004\b.\u0010\b\"\u000e\u0010/\u001a\u00020\fX\u0082T¢\u0006\u0002\n\u0000\"\u0018\u00100\u001a\u00020\u0001*\u0002018@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b0\u00102\"\u0018\u00100\u001a\u00020\u0001*\u0002038@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b0\u00104\"\u0018\u00105\u001a\u00020\u0006*\u0002068BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b7\u00108\"\u0018\u00109\u001a\u00020\f*\u0002038BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b:\u0010;¨\u0006\u0090\u0001"}, d2 = {"EnableDebugRuntimeChecks", "", "InvalidationLocationAscending", "Ljava/util/Comparator;", "Landroidx/compose/runtime/Invalidation;", "compositionLocalMap", "", "getCompositionLocalMap$annotations", "()V", "getCompositionLocalMap", "()Ljava/lang/Object;", "compositionLocalMapKey", "", "getCompositionLocalMapKey$annotations", "compositionTracer", "Landroidx/compose/runtime/CompositionTracer;", "getCompositionTracer$annotations", "defaultsKey", "invalidGroupLocation", "invocation", "getInvocation$annotations", "getInvocation", "invocationKey", "getInvocationKey$annotations", "nodeKey", "provider", "getProvider$annotations", "getProvider", "providerKey", "getProviderKey$annotations", "providerMaps", "getProviderMaps$annotations", "getProviderMaps", "providerMapsKey", "getProviderMapsKey$annotations", "providerValues", "getProviderValues$annotations", "getProviderValues", "providerValuesKey", "getProviderValuesKey$annotations", TypedValues.Custom.S_REFERENCE, "getReference$annotations", "getReference", "referenceKey", "getReferenceKey$annotations", "reuseKey", "getReuseKey$annotations", "rootKey", "isAfterFirstChild", "Landroidx/compose/runtime/SlotReader;", "(Landroidx/compose/runtime/SlotReader;)Z", "Landroidx/compose/runtime/SlotWriter;", "(Landroidx/compose/runtime/SlotWriter;)Z", "joinedKey", "Landroidx/compose/runtime/KeyInfo;", "getJoinedKey", "(Landroidx/compose/runtime/KeyInfo;)Ljava/lang/Object;", "nextGroup", "getNextGroup", "(Landroidx/compose/runtime/SlotWriter;)I", "composeImmediateRuntimeError", "", "message", "", "composeRuntimeError", "", "debugRuntimeCheck", "value", "lazyMessage", "Lkotlin/Function0;", "extractMovableContentAtCurrent", "Landroidx/compose/runtime/MovableContentState;", "composition", "Landroidx/compose/runtime/ControlledComposition;", "Landroidx/compose/runtime/MovableContentStateReference;", "slots", "applier", "Landroidx/compose/runtime/Applier;", "getKey", "left", "right", "isTraceInProgress", "multiMap", "Landroidx/compose/runtime/collection/MultiValueMap;", "K", ExifInterface.GPS_MEASUREMENT_INTERRUPTED, "initialCapacity", "(I)Landroidx/collection/MutableScatterMap;", "runtimeCheck", "sourceInformation", "composer", "Landroidx/compose/runtime/Composer;", "sourceInformationMarkerEnd", "sourceInformationMarkerStart", "key", "traceEventEnd", "traceEventStart", "dirty1", "dirty2", "info", "asBool", "asInt", "cache", ExifInterface.GPS_DIRECTION_TRUE, "invalid", "block", "Landroidx/compose/runtime/DisallowComposableCalls;", "(Landroidx/compose/runtime/Composer;ZLkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "collectNodesFrom", "", "Landroidx/compose/runtime/SlotTable;", "anchor", "Landroidx/compose/runtime/Anchor;", "deactivateCurrentGroup", "rememberManager", "Landroidx/compose/runtime/RememberManager;", "distanceFrom", "index", "root", "filterToRange", "", "start", "end", "findInsertLocation", "location", "findLocation", "firstInRange", "insertIfMissing", "scope", "Landroidx/compose/runtime/RecomposeScopeImpl;", "instance", "nearestCommonRootOf", "a", "b", "common", "removeCurrentGroup", "removeData", "data", "removeLocation", "removeRange", "withAfterAnchorInfo", "R", "cb", "Lkotlin/Function2;", "runtime_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class ComposerKt {
    public static final boolean EnableDebugRuntimeChecks = false;
    public static final int compositionLocalMapKey = 202;
    private static CompositionTracer compositionTracer = null;
    private static final int defaultsKey = -127;
    private static final int invalidGroupLocation = -2;
    public static final int invocationKey = 200;
    private static final int nodeKey = 125;
    public static final int providerKey = 201;
    public static final int providerMapsKey = 204;
    public static final int providerValuesKey = 203;
    public static final int referenceKey = 206;
    public static final int reuseKey = 207;
    private static final int rootKey = 100;
    private static final Object invocation = new OpaqueKey("provider");
    private static final Object provider = new OpaqueKey("provider");
    private static final Object compositionLocalMap = new OpaqueKey("compositionLocalMap");
    private static final Object providerValues = new OpaqueKey("providerValues");
    private static final Object providerMaps = new OpaqueKey("providers");
    private static final Object reference = new OpaqueKey(TypedValues.Custom.S_REFERENCE);
    private static final Comparator<Invalidation> InvalidationLocationAscending = new Comparator() { // from class: androidx.compose.runtime.ComposerKt$$ExternalSyntheticLambda0
        @Override // java.util.Comparator
        public final int compare(Object obj, Object obj2) {
            int compare;
            compare = Intrinsics.compare(((Invalidation) obj).getLocation(), ((Invalidation) obj2).getLocation());
            return compare;
        }
    };

    public static /* synthetic */ void getCompositionLocalMap$annotations() {
    }

    public static /* synthetic */ void getCompositionLocalMapKey$annotations() {
    }

    private static /* synthetic */ void getCompositionTracer$annotations() {
    }

    public static /* synthetic */ void getInvocation$annotations() {
    }

    public static /* synthetic */ void getInvocationKey$annotations() {
    }

    public static /* synthetic */ void getProvider$annotations() {
    }

    public static /* synthetic */ void getProviderKey$annotations() {
    }

    public static /* synthetic */ void getProviderMaps$annotations() {
    }

    public static /* synthetic */ void getProviderMapsKey$annotations() {
    }

    public static /* synthetic */ void getProviderValues$annotations() {
    }

    public static /* synthetic */ void getProviderValuesKey$annotations() {
    }

    public static /* synthetic */ void getReference$annotations() {
    }

    public static /* synthetic */ void getReferenceKey$annotations() {
    }

    public static /* synthetic */ void getReuseKey$annotations() {
    }

    public static final int getNextGroup(SlotWriter $this$nextGroup) {
        return $this$nextGroup.getCurrentGroup() + $this$nextGroup.groupSize($this$nextGroup.getCurrentGroup());
    }

    @ComposeCompilerApi
    public static final <T> T cache(Composer $this$cache, boolean invalid, Function0<? extends T> function0) {
        T t = (T) $this$cache.rememberedValue();
        if (!invalid && t != Composer.Companion.getEmpty()) {
            return t;
        }
        T invoke = function0.invoke();
        $this$cache.updateRememberedValue(invoke);
        return invoke;
    }

    @ComposeCompilerApi
    public static final void sourceInformation(Composer composer, String sourceInformation) {
        composer.sourceInformation(sourceInformation);
    }

    @ComposeCompilerApi
    public static final void sourceInformationMarkerStart(Composer composer, int key, String sourceInformation) {
        composer.sourceInformationMarkerStart(key, sourceInformation);
    }

    @ComposeCompilerApi
    public static final boolean isTraceInProgress() {
        CompositionTracer it = compositionTracer;
        return it != null && it.isTraceInProgress();
    }

    @ComposeCompilerApi
    public static final void traceEventStart(int key, int dirty1, int dirty2, String info) {
        CompositionTracer compositionTracer2 = compositionTracer;
        if (compositionTracer2 != null) {
            compositionTracer2.traceEventStart(key, dirty1, dirty2, info);
        }
    }

    @ComposeCompilerApi
    public static final void traceEventEnd() {
        CompositionTracer compositionTracer2 = compositionTracer;
        if (compositionTracer2 != null) {
            compositionTracer2.traceEventEnd();
        }
    }

    @ComposeCompilerApi
    public static final void sourceInformationMarkerEnd(Composer composer) {
        composer.sourceInformationMarkerEnd();
    }

    public static final void removeCurrentGroup(SlotWriter $this$removeCurrentGroup, RememberManager rememberManager) {
        int group$iv;
        SlotWriter this_$iv;
        int priority;
        int group$iv2 = $this$removeCurrentGroup.getCurrentGroup();
        SlotWriter this_$iv2 = $this$removeCurrentGroup;
        int $i$f$forAllData = 0;
        int address$iv = this_$iv2.groupIndexToAddress(group$iv2);
        int start$iv = this_$iv2.dataIndex(this_$iv2.groups, address$iv);
        int end$iv = this_$iv2.dataIndex(this_$iv2.groups, this_$iv2.groupIndexToAddress(this_$iv2.getCurrentGroup() + this_$iv2.groupSize(this_$iv2.getCurrentGroup())));
        int slot$iv = start$iv;
        while (slot$iv < end$iv) {
            Object slot = this_$iv2.slots[this_$iv2.dataIndexToDataAddress(slot$iv)];
            int slotIndex = slot$iv;
            if (slot instanceof ComposeNodeLifecycleCallback) {
                int endRelativeOrder = $this$removeCurrentGroup.getSlotsSize() - slotIndex;
                rememberManager.releasing((ComposeNodeLifecycleCallback) slot, endRelativeOrder, -1, -1);
            }
            if (!(slot instanceof RememberObserverHolder)) {
                group$iv = group$iv2;
                this_$iv = this_$iv2;
                priority = $i$f$forAllData;
            } else {
                int endRelativeSlotIndex = $this$removeCurrentGroup.getSlotsSize() - slotIndex;
                Anchor anchor$iv = ((RememberObserverHolder) slot).getAfter();
                int priority$iv = -1;
                int endRelativeAfter$iv = -1;
                if (anchor$iv != null && anchor$iv.getValid()) {
                    priority$iv = $this$removeCurrentGroup.anchorIndex(anchor$iv);
                    endRelativeAfter$iv = $this$removeCurrentGroup.getSlotsSize() - $this$removeCurrentGroup.slotsEndAllIndex$runtime_release(priority$iv);
                }
                int priority2 = priority$iv;
                int endRelativeAfter = endRelativeAfter$iv;
                group$iv = group$iv2;
                this_$iv = this_$iv2;
                priority = $i$f$forAllData;
                rememberManager.forgetting((RememberObserverHolder) slot, endRelativeSlotIndex, priority2, endRelativeAfter);
            }
            if (slot instanceof RecomposeScopeImpl) {
                ((RecomposeScopeImpl) slot).release();
            }
            slot$iv++;
            $i$f$forAllData = priority;
            group$iv2 = group$iv;
            this_$iv2 = this_$iv;
        }
        $this$removeCurrentGroup.removeGroup();
    }

    public static final <R> void withAfterAnchorInfo(SlotWriter $this$withAfterAnchorInfo, Anchor anchor, Function2<? super Integer, ? super Integer, ? extends R> function2) {
        int priority = -1;
        int endRelativeAfter = -1;
        if (anchor != null && anchor.getValid()) {
            priority = $this$withAfterAnchorInfo.anchorIndex(anchor);
            endRelativeAfter = $this$withAfterAnchorInfo.getSlotsSize() - $this$withAfterAnchorInfo.slotsEndAllIndex$runtime_release(priority);
        }
        function2.invoke(Integer.valueOf(priority), Integer.valueOf(endRelativeAfter));
    }

    public static final boolean isAfterFirstChild(SlotWriter $this$isAfterFirstChild) {
        return $this$isAfterFirstChild.getCurrentGroup() > $this$isAfterFirstChild.getParent() + 1;
    }

    public static final boolean isAfterFirstChild(SlotReader $this$isAfterFirstChild) {
        return $this$isAfterFirstChild.getCurrentGroup() > $this$isAfterFirstChild.getParent() + 1;
    }

    public static final void deactivateCurrentGroup(SlotWriter $this$deactivateCurrentGroup, RememberManager rememberManager) {
        int group$iv;
        SlotWriter this_$iv;
        int $i$f$forAllData;
        int group$iv2 = $this$deactivateCurrentGroup.getCurrentGroup();
        SlotWriter this_$iv2 = $this$deactivateCurrentGroup;
        int $i$f$forAllData2 = 0;
        int address$iv = this_$iv2.groupIndexToAddress(group$iv2);
        int start$iv = this_$iv2.dataIndex(this_$iv2.groups, address$iv);
        int end$iv = this_$iv2.dataIndex(this_$iv2.groups, this_$iv2.groupIndexToAddress(this_$iv2.getCurrentGroup() + this_$iv2.groupSize(this_$iv2.getCurrentGroup())));
        int slot$iv = start$iv;
        while (slot$iv < end$iv) {
            Object data = this_$iv2.slots[this_$iv2.dataIndexToDataAddress(slot$iv)];
            int slotIndex = slot$iv;
            if (data instanceof ComposeNodeLifecycleCallback) {
                int endRelativeOrder = $this$deactivateCurrentGroup.getSlotsSize() - slotIndex;
                rememberManager.deactivating((ComposeNodeLifecycleCallback) data, endRelativeOrder, -1, -1);
                group$iv = group$iv2;
                this_$iv = this_$iv2;
                $i$f$forAllData = $i$f$forAllData2;
            } else if (data instanceof RememberObserverHolder) {
                RememberObserver wrapped = ((RememberObserverHolder) data).getWrapped();
                if (wrapped instanceof ReusableRememberObserver) {
                    group$iv = group$iv2;
                    this_$iv = this_$iv2;
                    $i$f$forAllData = $i$f$forAllData2;
                } else {
                    removeData($this$deactivateCurrentGroup, slotIndex, data);
                    int endRelativeOrder2 = $this$deactivateCurrentGroup.getSlotsSize() - slotIndex;
                    Anchor anchor$iv = ((RememberObserverHolder) data).getAfter();
                    int priority$iv = -1;
                    int endRelativeAfter$iv = -1;
                    if (anchor$iv == null || !anchor$iv.getValid()) {
                        group$iv = group$iv2;
                    } else {
                        group$iv = group$iv2;
                        int priority$iv2 = $this$deactivateCurrentGroup.anchorIndex(anchor$iv);
                        int priority$iv3 = $this$deactivateCurrentGroup.getSlotsSize();
                        endRelativeAfter$iv = priority$iv3 - $this$deactivateCurrentGroup.slotsEndAllIndex$runtime_release(priority$iv2);
                        priority$iv = priority$iv2;
                    }
                    int endRelativeAfter = endRelativeAfter$iv;
                    this_$iv = this_$iv2;
                    $i$f$forAllData = $i$f$forAllData2;
                    rememberManager.forgetting((RememberObserverHolder) data, endRelativeOrder2, priority$iv, endRelativeAfter);
                }
            } else {
                group$iv = group$iv2;
                this_$iv = this_$iv2;
                $i$f$forAllData = $i$f$forAllData2;
                if (data instanceof RecomposeScopeImpl) {
                    removeData($this$deactivateCurrentGroup, slotIndex, data);
                    ((RecomposeScopeImpl) data).release();
                }
            }
            slot$iv++;
            group$iv2 = group$iv;
            this_$iv2 = this_$iv;
            $i$f$forAllData2 = $i$f$forAllData;
        }
    }

    private static final void removeData(SlotWriter $this$removeData, int index, Object data) {
        Object result = $this$removeData.clear(index);
        boolean value$iv = data == result;
        if (value$iv) {
            return;
        }
        composeImmediateRuntimeError("Slot table is out of sync (expected " + data + ", got " + result + ')');
    }

    public static final <K, V> MutableScatterMap<Object, Object> multiMap(int initialCapacity) {
        return MultiValueMap.m3809constructorimpl(new MutableScatterMap(initialCapacity));
    }

    public static final Object getKey(Object value, Object left, Object right) {
        JoinedKey it = value instanceof JoinedKey ? (JoinedKey) value : null;
        if (it != null) {
            if (Intrinsics.areEqual(it.getLeft(), left) && Intrinsics.areEqual(it.getRight(), right)) {
                return value;
            }
            Object key = getKey(it.getLeft(), left, right);
            if (key == null) {
                key = getKey(it.getRight(), left, right);
            }
            return key;
        }
        return null;
    }

    private static final int findLocation(List<Invalidation> list, int location) {
        int low = 0;
        int high = list.size() - 1;
        while (low <= high) {
            int mid = (low + high) >>> 1;
            Invalidation midVal = list.get(mid);
            int cmp = Intrinsics.compare(midVal.getLocation(), location);
            if (cmp < 0) {
                low = mid + 1;
            } else if (cmp <= 0) {
                return mid;
            } else {
                high = mid - 1;
            }
        }
        return -(low + 1);
    }

    private static final int findInsertLocation(List<Invalidation> list, int location) {
        int it = findLocation(list, location);
        return it < 0 ? -(it + 1) : it;
    }

    public static final void insertIfMissing(List<Invalidation> list, int location, RecomposeScopeImpl scope, Object instance) {
        int index = findLocation(list, location);
        if (index < 0) {
            list.add(-(index + 1), new Invalidation(scope, location, instance instanceof DerivedState ? instance : null));
            return;
        }
        Invalidation invalidation = list.get(index);
        if (instance instanceof DerivedState) {
            Object oldInstance = invalidation.getInstances();
            if (oldInstance != null) {
                if (oldInstance instanceof MutableScatterSet) {
                    MutableScatterSet mutableScatterSet = (MutableScatterSet) oldInstance;
                    ((MutableScatterSet) oldInstance).add(instance);
                    return;
                }
                invalidation.setInstances(ScatterSetKt.mutableScatterSetOf(oldInstance, instance));
                return;
            }
            invalidation.setInstances(instance);
            return;
        }
        invalidation.setInstances(null);
    }

    public static final Invalidation firstInRange(List<Invalidation> list, int start, int end) {
        int index = findInsertLocation(list, start);
        if (index < list.size()) {
            Invalidation firstInvalidation = list.get(index);
            if (firstInvalidation.getLocation() < end) {
                return firstInvalidation;
            }
            return null;
        }
        return null;
    }

    public static final Invalidation removeLocation(List<Invalidation> list, int location) {
        int index = findLocation(list, location);
        if (index >= 0) {
            return list.remove(index);
        }
        return null;
    }

    public static final void removeRange(List<Invalidation> list, int start, int end) {
        int index = findInsertLocation(list, start);
        while (index < list.size()) {
            Invalidation validation = list.get(index);
            if (validation.getLocation() >= end) {
                return;
            }
            list.remove(index);
        }
    }

    public static final List<Invalidation> filterToRange(List<Invalidation> list, int start, int end) {
        List result = new ArrayList();
        for (int index = findInsertLocation(list, start); index < list.size(); index++) {
            Invalidation invalidation = list.get(index);
            if (invalidation.getLocation() >= end) {
                break;
            }
            result.add(invalidation);
        }
        return result;
    }

    public static final int asInt(boolean $this$asInt) {
        return $this$asInt ? 1 : 0;
    }

    public static final boolean asBool(int $this$asBool) {
        return $this$asBool != 0;
    }

    public static final List<Object> collectNodesFrom(SlotTable $this$collectNodesFrom, Anchor anchor) {
        List result = new ArrayList();
        SlotReader reader$iv = $this$collectNodesFrom.openReader();
        try {
            int index = $this$collectNodesFrom.anchorIndex(anchor);
            collectNodesFrom$lambda$10$collectFromGroup(reader$iv, result, index);
            Unit unit = Unit.INSTANCE;
            return result;
        } finally {
            reader$iv.close();
        }
    }

    private static final void collectNodesFrom$lambda$10$collectFromGroup(SlotReader $reader, List<Object> list, int group) {
        if ($reader.isNode(group)) {
            list.add($reader.node(group));
            return;
        }
        int current = group + 1;
        int end = $reader.groupSize(group) + group;
        while (current < end) {
            collectNodesFrom$lambda$10$collectFromGroup($reader, list, current);
            current += $reader.groupSize(current);
        }
    }

    private static final int distanceFrom(SlotReader $this$distanceFrom, int index, int root) {
        int count = 0;
        int current = index;
        while (current > 0 && current != root) {
            current = $this$distanceFrom.parent(current);
            count++;
        }
        return count;
    }

    public static final int nearestCommonRootOf(SlotReader $this$nearestCommonRootOf, int a, int b, int common) {
        if (a == b) {
            return a;
        }
        if (a == common || b == common) {
            return common;
        }
        if ($this$nearestCommonRootOf.parent(a) == b) {
            return b;
        }
        if ($this$nearestCommonRootOf.parent(b) == a) {
            return a;
        }
        if ($this$nearestCommonRootOf.parent(a) == $this$nearestCommonRootOf.parent(b)) {
            return $this$nearestCommonRootOf.parent(a);
        }
        int currentA = a;
        int currentB = b;
        int aDistance = distanceFrom($this$nearestCommonRootOf, a, common);
        int bDistance = distanceFrom($this$nearestCommonRootOf, b, common);
        int i = aDistance - bDistance;
        for (int i2 = 0; i2 < i; i2++) {
            currentA = $this$nearestCommonRootOf.parent(currentA);
        }
        int i3 = bDistance - aDistance;
        for (int i4 = 0; i4 < i3; i4++) {
            currentB = $this$nearestCommonRootOf.parent(currentB);
        }
        while (currentA != currentB) {
            currentA = $this$nearestCommonRootOf.parent(currentA);
            currentB = $this$nearestCommonRootOf.parent(currentB);
        }
        return currentA;
    }

    public static final Object getJoinedKey(KeyInfo $this$joinedKey) {
        return $this$joinedKey.getObjectKey() != null ? new JoinedKey(Integer.valueOf($this$joinedKey.getKey()), $this$joinedKey.getObjectKey()) : Integer.valueOf($this$joinedKey.getKey());
    }

    public static final Object getInvocation() {
        return invocation;
    }

    public static final Object getProvider() {
        return provider;
    }

    public static final Object getCompositionLocalMap() {
        return compositionLocalMap;
    }

    public static final Object getProviderValues() {
        return providerValues;
    }

    public static final Object getProviderMaps() {
        return providerMaps;
    }

    public static final Object getReference() {
        return reference;
    }

    public static final void runtimeCheck(boolean value, Function0<String> function0) {
        if (!value) {
            composeImmediateRuntimeError(function0.invoke());
        }
    }

    public static final void debugRuntimeCheck(boolean value, Function0<String> function0) {
    }

    public static final void debugRuntimeCheck(boolean value) {
    }

    public static final void runtimeCheck(boolean value) {
        if (value) {
            return;
        }
        composeImmediateRuntimeError("Check failed");
    }

    public static final Void composeRuntimeError(String message) {
        throw new ComposeRuntimeError("Compose Runtime internal error. Unexpected or incorrect use of the Compose internal runtime API (" + message + "). Please report to Google or use https://goo.gle/compose-feedback");
    }

    public static final void composeImmediateRuntimeError(String message) {
        throw new ComposeRuntimeError("Compose Runtime internal error. Unexpected or incorrect use of the Compose internal runtime API (" + message + "). Please report to Google or use https://goo.gle/compose-feedback");
    }

    /* JADX WARN: Finally extract failed */
    public static final MovableContentState extractMovableContentAtCurrent(final ControlledComposition composition, final MovableContentStateReference reference2, SlotWriter slots, Applier<?> applier) {
        int count;
        int nodeCount;
        SlotTable slotTable = new SlotTable();
        if (slots.getCollectingSourceInformation()) {
            slotTable.collectSourceInformation();
        }
        if (slots.getCollectingCalledInformation()) {
            slotTable.collectCalledByInformation();
        }
        int currentGroup = slots.getCurrentGroup();
        if (applier != null && slots.nodeCount(currentGroup) > 0) {
            int parentNodeGroup = slots.getParent();
            while (parentNodeGroup > 0 && !slots.isNode(parentNodeGroup)) {
                parentNodeGroup = slots.parent(parentNodeGroup);
            }
            if (parentNodeGroup >= 0 && slots.isNode(parentNodeGroup)) {
                Object node = slots.node(parentNodeGroup);
                int currentChild = parentNodeGroup + 1;
                int end = slots.groupSize(parentNodeGroup) + parentNodeGroup;
                int nodeIndex = 0;
                while (currentChild < end) {
                    int size = slots.groupSize(currentChild);
                    if (currentChild + size > currentGroup) {
                        break;
                    }
                    if (!slots.isNode(currentChild)) {
                        nodeCount = slots.nodeCount(currentChild);
                    } else {
                        nodeCount = 1;
                    }
                    nodeIndex += nodeCount;
                    currentChild += size;
                }
                if (!slots.isNode(currentGroup)) {
                    count = slots.nodeCount(currentGroup);
                } else {
                    count = 1;
                }
                applier.down(node);
                applier.remove(nodeIndex, count);
                applier.up();
            }
        }
        SlotWriter writer$iv = slotTable.openWriter();
        boolean normalClose$iv = false;
        try {
            writer$iv.beginInsert();
            writer$iv.startGroup(MovableContentKt.movableContentKey, reference2.getContent$runtime_release());
            SlotWriter.markGroup$default(writer$iv, 0, 1, null);
            writer$iv.update(reference2.getParameter$runtime_release());
            List anchors = slots.moveTo(reference2.getAnchor$runtime_release(), 1, writer$iv);
            writer$iv.skipGroup();
            writer$iv.endGroup();
            writer$iv.endInsert();
            writer$iv.close(true);
            MovableContentState state = new MovableContentState(slotTable);
            if (RecomposeScopeImpl.Companion.hasAnchoredRecomposeScopes$runtime_release(slotTable, anchors)) {
                RecomposeScopeOwner recomposeScopeOwner = new RecomposeScopeOwner() { // from class: androidx.compose.runtime.ComposerKt$extractMovableContentAtCurrent$movableContentRecomposeScopeOwner$1
                    @Override // androidx.compose.runtime.RecomposeScopeOwner
                    public InvalidationResult invalidate(RecomposeScopeImpl scope, Object instance) {
                        InvalidationResult result;
                        ControlledComposition controlledComposition = ControlledComposition.this;
                        RecomposeScopeOwner recomposeScopeOwner2 = controlledComposition instanceof RecomposeScopeOwner ? (RecomposeScopeOwner) controlledComposition : null;
                        if (recomposeScopeOwner2 == null || (result = recomposeScopeOwner2.invalidate(scope, instance)) == null) {
                            result = InvalidationResult.IGNORED;
                        }
                        if (result == InvalidationResult.IGNORED) {
                            MovableContentStateReference movableContentStateReference = reference2;
                            movableContentStateReference.setInvalidations$runtime_release(CollectionsKt.plus((Collection<? extends Pair>) movableContentStateReference.getInvalidations$runtime_release(), TuplesKt.to(scope, instance)));
                            return InvalidationResult.SCHEDULED;
                        }
                        return result;
                    }

                    @Override // androidx.compose.runtime.RecomposeScopeOwner
                    public void recomposeScopeReleased(RecomposeScopeImpl scope) {
                    }

                    @Override // androidx.compose.runtime.RecomposeScopeOwner
                    public void recordReadOf(Object value) {
                    }
                };
                writer$iv = slotTable.openWriter();
                normalClose$iv = false;
                try {
                    RecomposeScopeImpl.Companion.adoptAnchoredScopes$runtime_release(writer$iv, anchors, recomposeScopeOwner);
                    Unit unit = Unit.INSTANCE;
                    normalClose$iv = true;
                } catch (Throwable th) {
                    throw th;
                }
            }
            return state;
        } finally {
            writer$iv.close(normalClose$iv);
        }
    }
}
