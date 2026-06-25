package androidx.compose.runtime;

import androidx.autofill.HintConstants;
import androidx.camera.view.PreviewView$1$$ExternalSyntheticBackportWithForwarding0;
import androidx.collection.MutableScatterMap;
import androidx.collection.MutableScatterSet;
import androidx.collection.ObjectIntMap;
import androidx.collection.ScatterMap;
import androidx.collection.ScatterSet;
import androidx.compose.runtime.DerivedState;
import androidx.compose.runtime.changelist.ChangeList;
import androidx.compose.runtime.collection.ScatterSetWrapper;
import androidx.compose.runtime.collection.ScopeMap;
import androidx.compose.runtime.internal.RememberEventDispatcher;
import androidx.compose.runtime.internal.Trace;
import androidx.compose.runtime.snapshots.ReaderKind;
import androidx.compose.runtime.snapshots.StateObject;
import androidx.compose.runtime.snapshots.StateObjectImpl;
import androidx.compose.runtime.tooling.CompositionObserver;
import androidx.compose.runtime.tooling.CompositionObserverHandle;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.exifinterface.media.ExifInterface;
import androidx.navigation.compose.ComposeNavigator;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.collections.SetsKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Composition.kt */
@Metadata(d1 = {"\u0000\u0084\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010#\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001c\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0018\u0002\n\u0002\b\f\b\u0000\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u00042\u00020\u0005B%\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\n\u0010\b\u001a\u0006\u0012\u0002\b\u00030\t\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0002\u0010\fJ\b\u0010`\u001a\u00020\u001bH\u0016J\u0018\u0010a\u001a\u00020\u001b2\u0006\u0010b\u001a\u00020-2\u0006\u0010c\u001a\u00020\u0014H\u0002J\u001e\u0010a\u001a\u00020\u001b2\f\u0010d\u001a\b\u0012\u0004\u0012\u00020-0,2\u0006\u0010c\u001a\u00020\u0014H\u0002J\b\u0010e\u001a\u00020\u001bH\u0016J\u0010\u0010f\u001a\u00020\u001b2\u0006\u0010\u0017\u001a\u00020\u0018H\u0002J\b\u0010g\u001a\u00020\u001bH\u0016J\b\u0010h\u001a\u00020\u001bH\u0016J\b\u0010i\u001a\u00020\u001bH\u0002J \u0010j\u001a\u00020\u001b2\u0011\u0010k\u001a\r\u0012\u0004\u0012\u00020\u001b0\u001a¢\u0006\u0002\b\u001cH\u0016¢\u0006\u0002\u0010 J \u0010l\u001a\u00020\u001b2\u0011\u0010k\u001a\r\u0012\u0004\u0012\u00020\u001b0\u001a¢\u0006\u0002\b\u001cH\u0002¢\u0006\u0002\u0010 J\r\u0010m\u001a\u00020<H\u0000¢\u0006\u0002\bnJ\b\u0010o\u001a\u00020\u001bH\u0016J3\u0010p\u001a\u0002Hq\"\u0004\b\u0000\u0010q2\b\u0010r\u001a\u0004\u0018\u00010\u00012\u0006\u0010s\u001a\u00020<2\f\u0010t\u001a\b\u0012\u0004\u0012\u0002Hq0\u001aH\u0016¢\u0006\u0002\u0010uJ\b\u0010v\u001a\u00020\u001bH\u0016J\u0010\u0010w\u001a\u00020\u001b2\u0006\u0010x\u001a\u00020yH\u0016J\b\u0010z\u001a\u00020\u001bH\u0002J\b\u0010{\u001a\u00020\u001bH\u0002J\b\u0010|\u001a\u00020\u001bH\u0002J\u0014\u0010}\u001a\u0004\u0018\u00010Z2\b\u0010Y\u001a\u0004\u0018\u00010ZH\u0016J&\u0010~\u001a\u0004\u0018\u0001H\u007f\"\u0004\b\u0000\u0010\u007f2\u000e\u0010\u0080\u0001\u001a\t\u0012\u0004\u0012\u0002H\u007f0\u0081\u0001H\u0016¢\u0006\u0003\u0010\u0082\u0001J$\u0010\u0083\u0001\u001a\u0002H\u007f\"\u0004\b\u0000\u0010\u007f2\f\u0010t\u001a\b\u0012\u0004\u0012\u0002H\u007f0\u001aH\u0082\b¢\u0006\u0003\u0010\u0084\u0001JH\u0010\u0085\u0001\u001a\u0002H\u007f\"\u0004\b\u0000\u0010\u007f20\u0010t\u001a,\u0012!\u0012\u001f\u0012\u0004\u0012\u00020&\u0012\u0004\u0012\u00020-01¢\u0006\u000e\b\u0087\u0001\u0012\t\b\u0088\u0001\u0012\u0004\b\b(\u0017\u0012\u0004\u0012\u0002H\u007f0\u0086\u0001H\u0082\b¢\u0006\u0003\u0010\u0089\u0001J)\u0010\u008a\u0001\u001a\u00020\u001b2\u001e\u0010\u008b\u0001\u001a\u0019\u0012\u0015\u0012\u0013\u0012\u0005\u0012\u00030\u008d\u0001\u0012\u0007\u0012\u0005\u0018\u00010\u008d\u00010\u008c\u00010%H\u0016J\u001e\u0010\u008e\u0001\u001a\u00030\u008f\u00012\u0007\u0010\u0090\u0001\u001a\u00020&2\t\u0010\u0091\u0001\u001a\u0004\u0018\u00010-H\u0016J\t\u0010\u0092\u0001\u001a\u00020\u001bH\u0016J(\u0010\u0093\u0001\u001a\u00030\u008f\u00012\u0007\u0010\u0090\u0001\u001a\u00020&2\b\u0010\u0094\u0001\u001a\u00030\u0095\u00012\t\u0010\u0091\u0001\u001a\u0004\u0018\u00010-H\u0002J\u0010\u0010\u0096\u0001\u001a\u00020\u001b2\u0007\u0010\u0080\u0001\u001a\u00020<J\u0011\u0010\u0097\u0001\u001a\u00020\u001b2\u0006\u0010b\u001a\u00020-H\u0002J\u001a\u0010\u0098\u0001\u001a\u00030\u0099\u00012\b\u0010\u009a\u0001\u001a\u00030\u009b\u0001H\u0000¢\u0006\u0003\b\u009c\u0001J\f\u0010\u009a\u0001\u001a\u0005\u0018\u00010\u009b\u0001H\u0002J\u0017\u0010\u009d\u0001\u001a\u00020\u00142\f\u0010d\u001a\b\u0012\u0004\u0012\u00020-0,H\u0016J\u000f\u0010\u009e\u0001\u001a\u00020\u001bH\u0000¢\u0006\u0003\b\u009f\u0001J\u0017\u0010 \u0001\u001a\u00020\u001b2\f\u0010t\u001a\b\u0012\u0004\u0012\u00020\u001b0\u001aH\u0016J\t\u0010¡\u0001\u001a\u00020\u0014H\u0016J\u0012\u0010¢\u0001\u001a\u00020\u001b2\u0007\u0010\u0090\u0001\u001a\u00020&H\u0016J\u0017\u0010£\u0001\u001a\u00020\u001b2\f\u0010d\u001a\b\u0012\u0004\u0012\u00020-0,H\u0016J\u0011\u0010¤\u0001\u001a\u00020\u001b2\u0006\u0010b\u001a\u00020-H\u0016J\u0011\u0010¥\u0001\u001a\u00020\u001b2\u0006\u0010b\u001a\u00020-H\u0016J\u001b\u0010¦\u0001\u001a\u00020\u001b2\n\u0010x\u001a\u0006\u0012\u0002\b\u000302H\u0000¢\u0006\u0003\b§\u0001J!\u0010¨\u0001\u001a\u00020\u001b2\u0007\u0010\u0091\u0001\u001a\u00020-2\u0007\u0010\u0090\u0001\u001a\u00020&H\u0000¢\u0006\u0003\b©\u0001J!\u0010ª\u0001\u001a\u00020\u001b2\u0011\u0010k\u001a\r\u0012\u0004\u0012\u00020\u001b0\u001a¢\u0006\u0002\b\u001cH\u0016¢\u0006\u0002\u0010 J!\u0010«\u0001\u001a\u00020\u001b2\u0011\u0010k\u001a\r\u0012\u0004\u0012\u00020\u001b0\u001a¢\u0006\u0002\b\u001cH\u0016¢\u0006\u0002\u0010 J#\u0010¬\u0001\u001a\u00030\u00ad\u00012\u0011\u0010k\u001a\r\u0012\u0004\u0012\u00020\u001b0\u001a¢\u0006\u0002\b\u001cH\u0016¢\u0006\u0003\u0010®\u0001J#\u0010¯\u0001\u001a\u00030\u00ad\u00012\u0011\u0010k\u001a\r\u0012\u0004\u0012\u00020\u001b0\u001a¢\u0006\u0002\b\u001cH\u0016¢\u0006\u0003\u0010®\u0001J$\u0010°\u0001\u001a\u000e\u0012\u0004\u0012\u00020&\u0012\u0004\u0012\u00020-01H\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0006\b±\u0001\u0010²\u0001J$\u0010³\u0001\u001a\u0002H\u007f\"\u0004\b\u0000\u0010\u007f2\f\u0010t\u001a\b\u0012\u0004\u0012\u0002H\u007f0\u001aH\u0082\b¢\u0006\u0003\u0010\u0084\u0001J\u001d\u0010´\u0001\u001a\u00020\u00142\u0007\u0010\u0090\u0001\u001a\u00020&2\t\u0010\u0091\u0001\u001a\u0004\u0018\u00010-H\u0002J\u000f\u0010µ\u0001\u001a\u00020\u001bH\u0000¢\u0006\u0003\b¶\u0001J\u0011\u0010·\u0001\u001a\u00020\u001b2\u0006\u0010[\u001a\u00020\\H\u0002J\t\u0010¸\u0001\u001a\u00020\u001bH\u0016R\u0010\u0010\r\u001a\u0004\u0018\u00010\u000bX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00100\u000fX\u0082\u0004¢\u0006\b\n\u0000\u0012\u0004\b\u0011\u0010\u0012R\u0012\u0010\b\u001a\u0006\u0012\u0002\b\u00030\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0013\u001a\u00020\u00148BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0015\u0010\u0016R\u000e\u0010\u0017\u001a\u00020\u0018X\u0082\u0004¢\u0006\u0002\n\u0000R'\u0010\u0019\u001a\r\u0012\u0004\u0012\u00020\u001b0\u001a¢\u0006\u0002\b\u001cX\u0086\u000e¢\u0006\u0010\n\u0002\u0010!\u001a\u0004\b\u001d\u0010\u001e\"\u0004\b\u001f\u0010 R\u000e\u0010\"\u001a\u00020#X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010$\u001a\b\u0012\u0004\u0012\u00020&0%8AX\u0080\u0004¢\u0006\u0006\u001a\u0004\b'\u0010(R\u0014\u0010)\u001a\b\u0012\u0004\u0012\u00020&0*X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010+\u001a\b\u0012\u0004\u0012\u00020-0,8AX\u0080\u0004¢\u0006\u0006\u001a\u0004\b.\u0010/R&\u00100\u001a\u0012\u0012\u0004\u0012\u00020-\u0012\b\u0012\u0006\u0012\u0002\b\u00030201X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u00103R\u000e\u00104\u001a\u00020\u0014X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u00105\u001a\u00020\u00148VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b6\u0010\u0016R\u0014\u00107\u001a\u00020\u00148VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b8\u0010\u0016R\u0014\u00109\u001a\b\u0012\u0004\u0012\u00020&0*X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010:\u001a\u0004\u0018\u00010\u0000X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010;\u001a\u00020<X\u0082\u000e¢\u0006\u0002\n\u0000R\"\u0010=\u001a\u000e\u0012\u0004\u0012\u00020&\u0012\u0004\u0012\u00020-01X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u00103R\u0014\u0010>\u001a\u00020\u00148VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b>\u0010\u0016R\u0014\u0010?\u001a\u00020\u00148VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b?\u0010\u0016R\u0011\u0010@\u001a\u00020\u0014¢\u0006\b\n\u0000\u001a\u0004\b@\u0010\u0016R\u000e\u0010A\u001a\u00020\u0018X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010B\u001a\u00020-X\u0082\u0004¢\u0006\u0002\n\u0000R\"\u0010C\u001a\u000e\u0012\u0004\u0012\u00020-\u0012\u0004\u0012\u00020&01X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u00103R\"\u0010D\u001a\u000e\u0012\u0004\u0012\u00020-\u0012\u0004\u0012\u00020&01X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u00103R\u001a\u0010E\u001a\b\u0012\u0004\u0012\u00020-0,8AX\u0080\u0004¢\u0006\u0006\u001a\u0004\bF\u0010/R\u0014\u0010G\u001a\u00020HX\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\bI\u0010JR\u0013\u0010\u0006\u001a\u00020\u00078\u0007¢\u0006\b\n\u0000\u001a\u0004\bK\u0010LR \u0010M\u001a\u00020\u0014X\u0080\u000e¢\u0006\u0014\n\u0000\u0012\u0004\bN\u0010\u0012\u001a\u0004\bO\u0010\u0016\"\u0004\bP\u0010QR\"\u0010R\u001a\u0016\u0012\u0006\u0012\u0004\u0018\u00010-0Sj\n\u0012\u0006\u0012\u0004\u0018\u00010-`TX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010U\u001a\u0004\u0018\u00010VX\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010\n\u001a\u00020\u000b8F¢\u0006\u0006\u001a\u0004\bW\u0010XR\u0010\u0010Y\u001a\u0004\u0018\u00010ZX\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010[\u001a\u00020\\X\u0080\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b]\u0010\u0012\u001a\u0004\b^\u0010_\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006¹\u0001"}, d2 = {"Landroidx/compose/runtime/CompositionImpl;", "Landroidx/compose/runtime/ControlledComposition;", "Landroidx/compose/runtime/ReusableComposition;", "Landroidx/compose/runtime/RecomposeScopeOwner;", "Landroidx/compose/runtime/CompositionServices;", "Landroidx/compose/runtime/PausableComposition;", "parent", "Landroidx/compose/runtime/CompositionContext;", "applier", "Landroidx/compose/runtime/Applier;", "recomposeContext", "Lkotlin/coroutines/CoroutineContext;", "(Landroidx/compose/runtime/CompositionContext;Landroidx/compose/runtime/Applier;Lkotlin/coroutines/CoroutineContext;)V", "_recomposeContext", "abandonSet", "", "Landroidx/compose/runtime/RememberObserver;", "getAbandonSet$annotations", "()V", "areChildrenComposing", "", "getAreChildrenComposing", "()Z", "changes", "Landroidx/compose/runtime/changelist/ChangeList;", ComposeNavigator.NAME, "Lkotlin/Function0;", "", "Landroidx/compose/runtime/Composable;", "getComposable", "()Lkotlin/jvm/functions/Function2;", "setComposable", "(Lkotlin/jvm/functions/Function2;)V", "Lkotlin/jvm/functions/Function2;", "composer", "Landroidx/compose/runtime/ComposerImpl;", "conditionalScopes", "", "Landroidx/compose/runtime/RecomposeScopeImpl;", "getConditionalScopes$runtime_release", "()Ljava/util/List;", "conditionallyInvalidatedScopes", "Landroidx/collection/MutableScatterSet;", "derivedStateDependencies", "", "", "getDerivedStateDependencies$runtime_release", "()Ljava/util/Set;", "derivedStates", "Landroidx/compose/runtime/collection/ScopeMap;", "Landroidx/compose/runtime/DerivedState;", "Landroidx/collection/MutableScatterMap;", "disposed", "hasInvalidations", "getHasInvalidations", "hasPendingChanges", "getHasPendingChanges", "invalidatedScopes", "invalidationDelegate", "invalidationDelegateGroup", "", "invalidations", "isComposing", "isDisposed", "isRoot", "lateChanges", "lock", "observations", "observationsProcessed", "observedObjects", "getObservedObjects$runtime_release", "observerHolder", "Landroidx/compose/runtime/CompositionObserverHolder;", "getObserverHolder$runtime_release", "()Landroidx/compose/runtime/CompositionObserverHolder;", "getParent", "()Landroidx/compose/runtime/CompositionContext;", "pendingInvalidScopes", "getPendingInvalidScopes$runtime_release$annotations", "getPendingInvalidScopes$runtime_release", "setPendingInvalidScopes$runtime_release", "(Z)V", "pendingModifications", "Ljava/util/concurrent/atomic/AtomicReference;", "Landroidx/compose/runtime/internal/AtomicReference;", "pendingPausedComposition", "Landroidx/compose/runtime/PausedCompositionImpl;", "getRecomposeContext", "()Lkotlin/coroutines/CoroutineContext;", "shouldPause", "Landroidx/compose/runtime/ShouldPauseCallback;", "slotTable", "Landroidx/compose/runtime/SlotTable;", "getSlotTable$runtime_release$annotations", "getSlotTable$runtime_release", "()Landroidx/compose/runtime/SlotTable;", "abandonChanges", "addPendingInvalidationsLocked", "value", "forgetConditionalScopes", "values", "applyChanges", "applyChangesInLocked", "applyLateChanges", "changesApplied", "cleanUpDerivedStateObservations", "composeContent", "content", "composeInitial", "composerStacksSizes", "composerStacksSizes$runtime_release", "deactivate", "delegateInvalidations", "R", TypedValues.TransitionType.S_TO, "groupIndex", "block", "(Landroidx/compose/runtime/ControlledComposition;ILkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "dispose", "disposeUnusedMovableContent", "state", "Landroidx/compose/runtime/MovableContentState;", "drainPendingModificationsForCompositionLocked", "drainPendingModificationsLocked", "drainPendingModificationsOutOfBandLocked", "getAndSetShouldPauseCallback", "getCompositionService", ExifInterface.GPS_DIRECTION_TRUE, "key", "Landroidx/compose/runtime/CompositionServiceKey;", "(Landroidx/compose/runtime/CompositionServiceKey;)Ljava/lang/Object;", "guardChanges", "(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "guardInvalidationsLocked", "Lkotlin/Function1;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "(Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "insertMovableContent", "references", "Lkotlin/Pair;", "Landroidx/compose/runtime/MovableContentStateReference;", "invalidate", "Landroidx/compose/runtime/InvalidationResult;", "scope", "instance", "invalidateAll", "invalidateChecked", "anchor", "Landroidx/compose/runtime/Anchor;", "invalidateGroupsWithKey", "invalidateScopeOfLocked", "observe", "Landroidx/compose/runtime/tooling/CompositionObserverHandle;", "observer", "Landroidx/compose/runtime/tooling/CompositionObserver;", "observe$runtime_release", "observesAnyOf", "pausedCompositionFinished", "pausedCompositionFinished$runtime_release", "prepareCompose", "recompose", "recomposeScopeReleased", "recordModificationsOf", "recordReadOf", "recordWriteOf", "removeDerivedStateObservation", "removeDerivedStateObservation$runtime_release", "removeObservation", "removeObservation$runtime_release", "setContent", "setContentWithReuse", "setPausableContent", "Landroidx/compose/runtime/PausedComposition;", "(Lkotlin/jvm/functions/Function2;)Landroidx/compose/runtime/PausedComposition;", "setPausableContentWithReuse", "takeInvalidations", "takeInvalidations-afanTW4", "()Landroidx/collection/MutableScatterMap;", "trackAbandonedValues", "tryImminentInvalidation", "updateMovingInvalidations", "updateMovingInvalidations$runtime_release", "validateRecomposeScopeAnchors", "verifyConsistent", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class CompositionImpl implements ControlledComposition, ReusableComposition, RecomposeScopeOwner, CompositionServices, PausableComposition {
    public static final int $stable = 8;
    private final CoroutineContext _recomposeContext;
    private final Set<RememberObserver> abandonSet;
    private final Applier<?> applier;
    private final ChangeList changes;
    private Function2<? super Composer, ? super Integer, Unit> composable;
    private final ComposerImpl composer;
    private final MutableScatterSet<RecomposeScopeImpl> conditionallyInvalidatedScopes;
    private final MutableScatterMap<Object, Object> derivedStates;
    private boolean disposed;
    private final MutableScatterSet<RecomposeScopeImpl> invalidatedScopes;
    private CompositionImpl invalidationDelegate;
    private int invalidationDelegateGroup;
    private MutableScatterMap<Object, Object> invalidations;
    private final boolean isRoot;
    private final ChangeList lateChanges;
    private final Object lock;
    private final MutableScatterMap<Object, Object> observations;
    private final MutableScatterMap<Object, Object> observationsProcessed;
    private final CompositionObserverHolder observerHolder;
    private final CompositionContext parent;
    private boolean pendingInvalidScopes;
    private final AtomicReference<Object> pendingModifications;
    private PausedCompositionImpl pendingPausedComposition;
    private ShouldPauseCallback shouldPause;
    private final SlotTable slotTable;

    private static /* synthetic */ void getAbandonSet$annotations() {
    }

    public static /* synthetic */ void getPendingInvalidScopes$runtime_release$annotations() {
    }

    public static /* synthetic */ void getSlotTable$runtime_release$annotations() {
    }

    public CompositionImpl(CompositionContext parent, Applier<?> applier, CoroutineContext recomposeContext) {
        this.parent = parent;
        this.applier = applier;
        this.pendingModifications = new AtomicReference<>(null);
        this.lock = new Object();
        this.abandonSet = new MutableScatterSet(0, 1, null).asMutableSet();
        SlotTable it = new SlotTable();
        if (this.parent.getCollectingCallByInformation$runtime_release()) {
            it.collectCalledByInformation();
        }
        if (this.parent.getCollectingSourceInformation$runtime_release()) {
            it.collectSourceInformation();
        }
        this.slotTable = it;
        this.observations = ScopeMap.m3831constructorimpl$default(null, 1, null);
        this.invalidatedScopes = new MutableScatterSet<>(0, 1, null);
        this.conditionallyInvalidatedScopes = new MutableScatterSet<>(0, 1, null);
        this.derivedStates = ScopeMap.m3831constructorimpl$default(null, 1, null);
        this.changes = new ChangeList();
        this.lateChanges = new ChangeList();
        this.observationsProcessed = ScopeMap.m3831constructorimpl$default(null, 1, null);
        this.invalidations = ScopeMap.m3831constructorimpl$default(null, 1, null);
        this.observerHolder = new CompositionObserverHolder(null, false, 3, null);
        ComposerImpl it2 = new ComposerImpl(this.applier, this.parent, this.slotTable, this.abandonSet, this.changes, this.lateChanges, this);
        this.parent.registerComposer$runtime_release(it2);
        this.composer = it2;
        this._recomposeContext = recomposeContext;
        this.isRoot = this.parent instanceof Recomposer;
        this.composable = ComposableSingletons$CompositionKt.INSTANCE.m3667getLambda1$runtime_release();
    }

    public /* synthetic */ CompositionImpl(CompositionContext compositionContext, Applier applier, CoroutineContext coroutineContext, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(compositionContext, applier, (i & 4) != 0 ? null : coroutineContext);
    }

    public final CompositionContext getParent() {
        return this.parent;
    }

    public final SlotTable getSlotTable$runtime_release() {
        return this.slotTable;
    }

    public final Set<Object> getObservedObjects$runtime_release() {
        return this.observations.asMap().keySet();
    }

    public final Set<Object> getDerivedStateDependencies$runtime_release() {
        return this.derivedStates.asMap().keySet();
    }

    public final List<RecomposeScopeImpl> getConditionalScopes$runtime_release() {
        return CollectionsKt.toList(this.conditionallyInvalidatedScopes.asSet());
    }

    public final boolean getPendingInvalidScopes$runtime_release() {
        return this.pendingInvalidScopes;
    }

    public final void setPendingInvalidScopes$runtime_release(boolean z) {
        this.pendingInvalidScopes = z;
    }

    public final CompositionObserverHolder getObserverHolder$runtime_release() {
        return this.observerHolder;
    }

    public final CoroutineContext getRecomposeContext() {
        CoroutineContext coroutineContext = this._recomposeContext;
        return coroutineContext == null ? this.parent.getRecomposeCoroutineContext$runtime_release() : coroutineContext;
    }

    public final boolean isRoot() {
        return this.isRoot;
    }

    private final boolean getAreChildrenComposing() {
        return this.composer.getAreChildrenComposing$runtime_release();
    }

    public final Function2<Composer, Integer, Unit> getComposable() {
        return this.composable;
    }

    public final void setComposable(Function2<? super Composer, ? super Integer, Unit> function2) {
        this.composable = function2;
    }

    @Override // androidx.compose.runtime.ControlledComposition
    public boolean isComposing() {
        return this.composer.isComposing$runtime_release();
    }

    @Override // androidx.compose.runtime.Composition
    public boolean isDisposed() {
        return this.disposed;
    }

    @Override // androidx.compose.runtime.ControlledComposition
    public boolean getHasPendingChanges() {
        boolean hasPendingChanges$runtime_release;
        Object lock$iv = this.lock;
        synchronized (lock$iv) {
            hasPendingChanges$runtime_release = this.composer.getHasPendingChanges$runtime_release();
        }
        return hasPendingChanges$runtime_release;
    }

    @Override // androidx.compose.runtime.Composition
    public void setContent(Function2<? super Composer, ? super Integer, Unit> function2) {
        boolean value$iv = this.pendingPausedComposition == null;
        if (!value$iv) {
            PreconditionsKt.throwIllegalStateException("A pausable composition is in progress");
        }
        composeInitial(function2);
    }

    @Override // androidx.compose.runtime.ReusableComposition
    public void setContentWithReuse(Function2<? super Composer, ? super Integer, Unit> function2) {
        boolean value$iv = this.pendingPausedComposition == null;
        if (!value$iv) {
            PreconditionsKt.throwIllegalStateException("A pausable composition is in progress");
        }
        this.composer.startReuseFromRoot();
        composeInitial(function2);
        this.composer.endReuseFromRoot();
    }

    @Override // androidx.compose.runtime.PausableComposition
    public PausedComposition setPausableContent(Function2<? super Composer, ? super Integer, Unit> function2) {
        boolean value$iv = !this.disposed;
        if (!value$iv) {
            PreconditionsKt.throwIllegalStateException("The composition is disposed");
        }
        boolean value$iv2 = this.pendingPausedComposition == null;
        if (!value$iv2) {
            PreconditionsKt.throwIllegalStateException("A pausable composition is in progress");
        }
        PausedCompositionImpl pausedComposition = new PausedCompositionImpl(this, this.parent, this.composer, this.abandonSet, function2, false, this.applier, this.lock);
        this.pendingPausedComposition = pausedComposition;
        return pausedComposition;
    }

    @Override // androidx.compose.runtime.PausableComposition
    public PausedComposition setPausableContentWithReuse(Function2<? super Composer, ? super Integer, Unit> function2) {
        boolean value$iv = !this.disposed;
        if (!value$iv) {
            PreconditionsKt.throwIllegalStateException("The composition is disposed");
        }
        boolean value$iv2 = this.pendingPausedComposition == null;
        if (!value$iv2) {
            PreconditionsKt.throwIllegalStateException("A pausable composition is in progress");
        }
        PausedCompositionImpl pausedComposition = new PausedCompositionImpl(this, this.parent, this.composer, this.abandonSet, function2, true, this.applier, this.lock);
        this.pendingPausedComposition = pausedComposition;
        return pausedComposition;
    }

    public final void pausedCompositionFinished$runtime_release() {
        this.pendingPausedComposition = null;
    }

    private final void composeInitial(Function2<? super Composer, ? super Integer, Unit> function2) {
        boolean value$iv = !this.disposed;
        if (!value$iv) {
            PreconditionsKt.throwIllegalStateException("The composition is disposed");
        }
        this.composable = function2;
        this.parent.composeInitial$runtime_release(this, this.composable);
    }

    public final CompositionObserverHandle observe$runtime_release(final CompositionObserver observer) {
        Object lock$iv = this.lock;
        synchronized (lock$iv) {
            this.observerHolder.setObserver(observer);
            this.observerHolder.setRoot(true);
            Unit unit = Unit.INSTANCE;
        }
        return new CompositionObserverHandle() { // from class: androidx.compose.runtime.CompositionImpl$observe$2
            @Override // androidx.compose.runtime.tooling.CompositionObserverHandle
            public void dispose() {
                Object lock$iv2;
                lock$iv2 = CompositionImpl.this.lock;
                CompositionImpl compositionImpl = CompositionImpl.this;
                CompositionObserver compositionObserver = observer;
                synchronized (lock$iv2) {
                    if (Intrinsics.areEqual(compositionImpl.getObserverHolder$runtime_release().getObserver(), compositionObserver)) {
                        compositionImpl.getObserverHolder$runtime_release().setObserver(null);
                        compositionImpl.getObserverHolder$runtime_release().setRoot(false);
                    }
                    Unit unit2 = Unit.INSTANCE;
                }
            }
        };
    }

    public final void invalidateGroupsWithKey(int key) {
        boolean forceComposition;
        boolean z;
        Object lock$iv = this.lock;
        synchronized (lock$iv) {
            try {
            } catch (Throwable th) {
                th = th;
            }
            try {
                List scopesToInvalidate = this.slotTable.invalidateGroupsWithKey$runtime_release(key);
                if (scopesToInvalidate != null) {
                    int index$iv$iv = 0;
                    int size = scopesToInvalidate.size();
                    while (true) {
                        if (index$iv$iv < size) {
                            Object item$iv$iv = scopesToInvalidate.get(index$iv$iv);
                            RecomposeScopeImpl it = (RecomposeScopeImpl) item$iv$iv;
                            if (it.invalidateForResult(null) == InvalidationResult.IGNORED) {
                                z = true;
                                break;
                            }
                            index$iv$iv++;
                        } else {
                            z = false;
                            break;
                        }
                    }
                    if (!z) {
                        forceComposition = false;
                        if (!forceComposition && this.composer.forceRecomposeScopes$runtime_release()) {
                            this.parent.invalidate$runtime_release(this);
                            return;
                        }
                    }
                }
                forceComposition = true;
                if (!forceComposition) {
                }
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        }
    }

    private final void drainPendingModificationsForCompositionLocked() {
        Object obj;
        Object obj2;
        Set[] setArr;
        AtomicReference<Object> atomicReference = this.pendingModifications;
        obj = CompositionKt.PendingApplyNoModifications;
        Object toRecord = atomicReference.getAndSet(obj);
        if (toRecord != null) {
            obj2 = CompositionKt.PendingApplyNoModifications;
            if (Intrinsics.areEqual(toRecord, obj2)) {
                ComposerKt.composeRuntimeError("pending composition has not been applied");
                throw new KotlinNothingValueException();
            } else if (toRecord instanceof Set) {
                addPendingInvalidationsLocked((Set) toRecord, true);
            } else if (toRecord instanceof Object[]) {
                for (Set changed : (Set[]) toRecord) {
                    addPendingInvalidationsLocked((Set<? extends Object>) changed, true);
                }
            } else {
                ComposerKt.composeRuntimeError("corrupt pendingModifications drain: " + this.pendingModifications);
                throw new KotlinNothingValueException();
            }
        }
    }

    private final void drainPendingModificationsLocked() {
        Object obj;
        Set[] setArr;
        Object toRecord = this.pendingModifications.getAndSet(null);
        obj = CompositionKt.PendingApplyNoModifications;
        if (!Intrinsics.areEqual(toRecord, obj)) {
            if (toRecord instanceof Set) {
                addPendingInvalidationsLocked((Set) toRecord, false);
            } else if (toRecord instanceof Object[]) {
                for (Set changed : (Set[]) toRecord) {
                    addPendingInvalidationsLocked((Set<? extends Object>) changed, false);
                }
            } else if (toRecord == null) {
                ComposerKt.composeRuntimeError("calling recordModificationsOf and applyChanges concurrently is not supported");
                throw new KotlinNothingValueException();
            } else {
                ComposerKt.composeRuntimeError("corrupt pendingModifications drain: " + this.pendingModifications);
                throw new KotlinNothingValueException();
            }
        }
    }

    private final void drainPendingModificationsOutOfBandLocked() {
        Object obj;
        Set[] setArr;
        Object toRecord = this.pendingModifications.getAndSet(SetsKt.emptySet());
        obj = CompositionKt.PendingApplyNoModifications;
        boolean z = true;
        if (!Intrinsics.areEqual(toRecord, obj) && toRecord != null) {
            z = false;
        }
        if (!z) {
            if (toRecord instanceof Set) {
                addPendingInvalidationsLocked((Set) toRecord, false);
            } else if (toRecord instanceof Object[]) {
                for (Set changed : (Set[]) toRecord) {
                    addPendingInvalidationsLocked((Set<? extends Object>) changed, false);
                }
            } else {
                ComposerKt.composeRuntimeError("corrupt pendingModifications drain: " + this.pendingModifications);
                throw new KotlinNothingValueException();
            }
        }
    }

    @Override // androidx.compose.runtime.ControlledComposition
    public void composeContent(Function2<? super Composer, ? super Integer, Unit> function2) {
        CompositionObserver observer;
        CompositionImpl compositionImpl;
        try {
            Object lock$iv = this.lock;
            synchronized (lock$iv) {
                try {
                    try {
                        drainPendingModificationsForCompositionLocked();
                        MutableScatterMap invalidations$iv = m3675takeInvalidationsafanTW4();
                        try {
                            try {
                                observer = observer();
                                if (observer != null) {
                                    try {
                                        compositionImpl = this;
                                    } catch (Exception e) {
                                        e$iv = e;
                                    } catch (Throwable th) {
                                        e$iv = th;
                                    }
                                    try {
                                        Map<RecomposeScope, ? extends Set<? extends Object>> m3827asMapimpl = ScopeMap.m3827asMapimpl(invalidations$iv);
                                        try {
                                            Intrinsics.checkNotNull(m3827asMapimpl, "null cannot be cast to non-null type kotlin.collections.Map<androidx.compose.runtime.RecomposeScope, kotlin.collections.Set<kotlin.Any>>");
                                            observer.onBeginComposition(compositionImpl, m3827asMapimpl);
                                        } catch (Exception e2) {
                                            e$iv = e2;
                                            this.invalidations = invalidations$iv;
                                            throw e$iv;
                                        } catch (Throwable th2) {
                                            e$iv = th2;
                                            throw e$iv;
                                        }
                                    } catch (Exception e3) {
                                        e$iv = e3;
                                        this.invalidations = invalidations$iv;
                                        throw e$iv;
                                    } catch (Throwable th3) {
                                        e$iv = th3;
                                        throw e$iv;
                                    }
                                }
                            } catch (Exception e4) {
                                e$iv = e4;
                            }
                            try {
                                this.composer.m3672composeContentZbOJvo$runtime_release(invalidations$iv, function2, this.shouldPause);
                                if (observer != null) {
                                    observer.onEndComposition(this);
                                    Unit unit = Unit.INSTANCE;
                                }
                            } catch (Exception e5) {
                                e$iv = e5;
                                this.invalidations = invalidations$iv;
                                throw e$iv;
                            }
                        } catch (Throwable th4) {
                            e$iv = th4;
                        }
                    } catch (Throwable th5) {
                        th = th5;
                        if (0 == 0) {
                            try {
                                if (!this.abandonSet.isEmpty()) {
                                    new RememberEventDispatcher(this.abandonSet).dispatchAbandons();
                                }
                            } catch (Exception e$iv) {
                                abandonChanges();
                                throw e$iv;
                            }
                        }
                        throw th;
                    }
                } catch (Throwable th6) {
                    e$iv = th6;
                }
            }
        } catch (Throwable th7) {
            th = th7;
        }
    }

    public final void updateMovingInvalidations$runtime_release() {
        Object lock$iv = this.lock;
        synchronized (lock$iv) {
            drainPendingModificationsOutOfBandLocked();
            MutableScatterMap invalidations$iv = m3675takeInvalidationsafanTW4();
            try {
                this.composer.m3674updateComposerInvalidationsRY85e9Y(invalidations$iv);
                Unit unit = Unit.INSTANCE;
                Unit unit2 = Unit.INSTANCE;
            } catch (Exception e$iv) {
                this.invalidations = invalidations$iv;
                throw e$iv;
            }
        }
    }

    @Override // androidx.compose.runtime.Composition
    public void dispose() {
        Object lock$iv = this.lock;
        synchronized (lock$iv) {
            boolean nonEmptySlotTable = true;
            boolean value$iv = !this.composer.isComposing$runtime_release();
            if (!value$iv) {
                PreconditionsKt.throwIllegalStateException("Composition is disposed while composing. If dispose is triggered by a call in @Composable function, consider wrapping it with SideEffect block.");
            }
            boolean value$iv2 = this.disposed;
            if (!value$iv2) {
                this.disposed = true;
                this.composable = ComposableSingletons$CompositionKt.INSTANCE.m3668getLambda2$runtime_release();
                ChangeList deferredChanges = this.composer.getDeferredChanges$runtime_release();
                if (deferredChanges != null) {
                    applyChangesInLocked(deferredChanges);
                }
                if (this.slotTable.getGroupsSize() <= 0) {
                    nonEmptySlotTable = false;
                }
                if (nonEmptySlotTable || !this.abandonSet.isEmpty()) {
                    RememberEventDispatcher manager = new RememberEventDispatcher(this.abandonSet);
                    if (nonEmptySlotTable) {
                        this.applier.onBeginChanges();
                        SlotTable this_$iv = this.slotTable;
                        SlotWriter writer$iv = this_$iv.openWriter();
                        ComposerKt.removeCurrentGroup(writer$iv, manager);
                        Unit unit = Unit.INSTANCE;
                        writer$iv.close(true);
                        this.applier.clear();
                        this.applier.onEndChanges();
                        manager.dispatchRememberObservers();
                    }
                    manager.dispatchAbandons();
                }
                this.composer.dispose$runtime_release();
            }
            Unit unit2 = Unit.INSTANCE;
        }
        this.parent.unregisterComposition$runtime_release(this);
    }

    @Override // androidx.compose.runtime.Composition
    public boolean getHasInvalidations() {
        boolean z;
        Object lock$iv = this.lock;
        synchronized (lock$iv) {
            z = ScopeMap.m3836getSizeimpl(this.invalidations) > 0;
        }
        return z;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v11, types: [java.util.Set[]] */
    @Override // androidx.compose.runtime.ControlledComposition
    public void recordModificationsOf(Set<? extends Object> set) {
        Object old;
        Object obj;
        boolean areEqual;
        Object obj2;
        do {
            old = this.pendingModifications.get();
            if (old != null) {
                obj = CompositionKt.PendingApplyNoModifications;
                areEqual = Intrinsics.areEqual(old, obj);
            } else {
                areEqual = true;
            }
            if (areEqual) {
                obj2 = set;
            } else if (old instanceof Set) {
                obj2 = new Set[]{old, set};
            } else if (!(old instanceof Object[])) {
                throw new IllegalStateException(("corrupt pendingModifications: " + this.pendingModifications).toString());
            } else {
                Intrinsics.checkNotNull(old, "null cannot be cast to non-null type kotlin.Array<kotlin.collections.Set<kotlin.Any>>");
                obj2 = ArraysKt.plus((Set<? extends Object>[]) old, set);
            }
        } while (!PreviewView$1$$ExternalSyntheticBackportWithForwarding0.m(this.pendingModifications, old, obj2));
        if (old == null) {
            Object lock$iv = this.lock;
            synchronized (lock$iv) {
                drainPendingModificationsLocked();
                Unit unit = Unit.INSTANCE;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00bf  */
    @Override // androidx.compose.runtime.ControlledComposition
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean observesAnyOf(java.util.Set<? extends java.lang.Object> r25) {
        /*
            Method dump skipped, instructions count: 221
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.runtime.CompositionImpl.observesAnyOf(java.util.Set):boolean");
    }

    @Override // androidx.compose.runtime.ControlledComposition
    public void prepareCompose(Function0<Unit> function0) {
        this.composer.prepareCompose$runtime_release(function0);
    }

    private final void addPendingInvalidationsLocked(Object value, boolean forgetConditionalScopes) {
        int i;
        int j$iv$iv$iv;
        MutableScatterMap arg0$iv = this.observations;
        int i2 = 0;
        Object value$iv = arg0$iv.get(value);
        if (value$iv == null) {
            return;
        }
        if (!(value$iv instanceof MutableScatterSet)) {
            RecomposeScopeImpl scope = (RecomposeScopeImpl) value$iv;
            if (!ScopeMap.m3838removeimpl(this.observationsProcessed, value, scope) && scope.invalidateForResult(value) != InvalidationResult.IGNORED) {
                if (scope.isConditional() && !forgetConditionalScopes) {
                    this.conditionallyInvalidatedScopes.add(scope);
                    return;
                } else {
                    this.invalidatedScopes.add(scope);
                    return;
                }
            }
            return;
        }
        ScatterSet this_$iv$iv = (MutableScatterSet) value$iv;
        Object[] elements$iv$iv = this_$iv$iv.elements;
        long[] m$iv$iv$iv = this_$iv$iv.metadata;
        int lastIndex$iv$iv$iv = m$iv$iv$iv.length - 2;
        int i$iv$iv$iv = 0;
        if (0 > lastIndex$iv$iv$iv) {
            return;
        }
        while (true) {
            long slot$iv$iv$iv = m$iv$iv$iv[i$iv$iv$iv];
            MutableScatterMap arg0$iv2 = arg0$iv;
            int i3 = i2;
            Object value$iv2 = value$iv;
            ScatterSet this_$iv$iv2 = this_$iv$iv;
            long $this$maskEmptyOrDeleted$iv$iv$iv$iv = ((~slot$iv$iv$iv) << 7) & slot$iv$iv$iv & (-9187201950435737472L);
            if ($this$maskEmptyOrDeleted$iv$iv$iv$iv != -9187201950435737472L) {
                int i4 = 8;
                int bitCount$iv$iv$iv = 8 - ((~(i$iv$iv$iv - lastIndex$iv$iv$iv)) >>> 31);
                int j$iv$iv$iv2 = 0;
                while (j$iv$iv$iv2 < bitCount$iv$iv$iv) {
                    long value$iv$iv$iv$iv = slot$iv$iv$iv & 255;
                    if (!(value$iv$iv$iv$iv < 128)) {
                        i = i4;
                        j$iv$iv$iv = j$iv$iv$iv2;
                    } else {
                        int index$iv$iv$iv = (i$iv$iv$iv << 3) + j$iv$iv$iv2;
                        i = i4;
                        RecomposeScopeImpl scope2 = (RecomposeScopeImpl) elements$iv$iv[index$iv$iv$iv];
                        j$iv$iv$iv = j$iv$iv$iv2;
                        if (!ScopeMap.m3838removeimpl(this.observationsProcessed, value, scope2) && scope2.invalidateForResult(value) != InvalidationResult.IGNORED) {
                            if (scope2.isConditional() && !forgetConditionalScopes) {
                                this.conditionallyInvalidatedScopes.add(scope2);
                            } else {
                                this.invalidatedScopes.add(scope2);
                            }
                        }
                    }
                    slot$iv$iv$iv >>= i;
                    j$iv$iv$iv2 = j$iv$iv$iv + 1;
                    i4 = i;
                }
                if (bitCount$iv$iv$iv != i4) {
                    return;
                }
            }
            if (i$iv$iv$iv == lastIndex$iv$iv$iv) {
                return;
            }
            i$iv$iv$iv++;
            value$iv = value$iv2;
            this_$iv$iv = this_$iv$iv2;
            arg0$iv = arg0$iv2;
            i2 = i3;
        }
    }

    private final void addPendingInvalidationsLocked(Set<? extends Object> set, boolean forgetConditionalScopes) {
        long j;
        long j2;
        char c;
        long j3;
        Iterable $this$forEach$iv$iv;
        boolean z;
        Iterator it;
        MutableScatterSet conditionallyInvalidatedScopes;
        String str;
        int $i$f$removeIf;
        ScatterMap this_$iv$iv$iv;
        MutableScatterSet this_$iv$iv;
        String str2;
        int j$iv$iv$iv;
        int $i$f$removeIf2;
        ScatterMap this_$iv$iv$iv2;
        boolean contains;
        Object value$iv;
        int $i$f$removeIf3;
        ScatterMap this_$iv$iv$iv3;
        int $i$f$forEachIndexed;
        int i$iv$iv$iv;
        String str3;
        int j$iv$iv$iv2;
        int $i$f$removeIf4;
        ScatterMap this_$iv$iv$iv4;
        int $i$f$forEachIndexed2;
        String str4;
        boolean z2;
        Object value$iv2;
        Set $this$fastForEach$iv;
        int $i$f$fastForEach;
        ScatterSet this_$iv$iv2;
        Object[] elements$iv$iv;
        ScatterSet this_$iv$iv$iv5;
        Set $this$fastForEach$iv2;
        int $i$f$fastForEach2;
        ScatterSet this_$iv$iv3;
        Object[] elements$iv$iv2;
        ScatterSet this_$iv$iv$iv6;
        int j$iv$iv$iv3;
        Set $this$fastForEach$iv3 = set;
        int $i$f$fastForEach3 = 0;
        if ($this$fastForEach$iv3 instanceof ScatterSetWrapper) {
            ScatterSet this_$iv$iv4 = ((ScatterSetWrapper) $this$fastForEach$iv3).getSet$runtime_release();
            j = 128;
            Object[] elements$iv$iv3 = this_$iv$iv4.elements;
            ScatterSet this_$iv$iv$iv7 = this_$iv$iv4;
            j2 = 255;
            long[] m$iv$iv$iv = this_$iv$iv$iv7.metadata;
            int lastIndex$iv$iv$iv = m$iv$iv$iv.length - 2;
            c = 7;
            int i$iv$iv$iv2 = 0;
            if (0 <= lastIndex$iv$iv$iv) {
                while (true) {
                    long slot$iv$iv$iv = m$iv$iv$iv[i$iv$iv$iv2];
                    int i = 8;
                    j3 = -9187201950435737472L;
                    long $this$maskEmptyOrDeleted$iv$iv$iv$iv = ((~slot$iv$iv$iv) << 7) & slot$iv$iv$iv & (-9187201950435737472L);
                    if ($this$maskEmptyOrDeleted$iv$iv$iv$iv != -9187201950435737472L) {
                        int bitCount$iv$iv$iv = 8 - ((~(i$iv$iv$iv2 - lastIndex$iv$iv$iv)) >>> 31);
                        int j$iv$iv$iv4 = 0;
                        while (j$iv$iv$iv4 < bitCount$iv$iv$iv) {
                            long value$iv$iv$iv$iv = slot$iv$iv$iv & 255;
                            int $i$f$isFull = value$iv$iv$iv$iv < 128 ? 1 : 0;
                            if ($i$f$isFull != 0) {
                                int i2 = i;
                                Object value = elements$iv$iv3[(i$iv$iv$iv2 << 3) + j$iv$iv$iv4];
                                if (value instanceof RecomposeScopeImpl) {
                                    $this$fastForEach$iv2 = $this$fastForEach$iv3;
                                    ((RecomposeScopeImpl) value).invalidateForResult(null);
                                    $i$f$fastForEach2 = $i$f$fastForEach3;
                                    this_$iv$iv3 = this_$iv$iv4;
                                    elements$iv$iv2 = elements$iv$iv3;
                                    this_$iv$iv$iv6 = this_$iv$iv$iv7;
                                } else {
                                    $this$fastForEach$iv2 = $this$fastForEach$iv3;
                                    addPendingInvalidationsLocked(value, forgetConditionalScopes);
                                    int i3 = 0;
                                    $i$f$fastForEach2 = $i$f$fastForEach3;
                                    Object value$iv3 = this.derivedStates.get(value);
                                    if (value$iv3 == null) {
                                        this_$iv$iv3 = this_$iv$iv4;
                                        elements$iv$iv2 = elements$iv$iv3;
                                        this_$iv$iv$iv6 = this_$iv$iv$iv7;
                                    } else if (value$iv3 instanceof MutableScatterSet) {
                                        ScatterSet this_$iv$iv5 = (MutableScatterSet) value$iv3;
                                        Object[] elements$iv$iv4 = this_$iv$iv5.elements;
                                        long[] m$iv$iv$iv2 = this_$iv$iv5.metadata;
                                        int lastIndex$iv$iv$iv2 = m$iv$iv$iv2.length - 2;
                                        int i$iv$iv$iv3 = 0;
                                        if (0 <= lastIndex$iv$iv$iv2) {
                                            while (true) {
                                                long slot$iv$iv$iv2 = m$iv$iv$iv2[i$iv$iv$iv3];
                                                this_$iv$iv3 = this_$iv$iv4;
                                                int i4 = i3;
                                                elements$iv$iv2 = elements$iv$iv3;
                                                this_$iv$iv$iv6 = this_$iv$iv$iv7;
                                                long $this$maskEmptyOrDeleted$iv$iv$iv$iv2 = ((~slot$iv$iv$iv2) << 7) & slot$iv$iv$iv2 & (-9187201950435737472L);
                                                if ($this$maskEmptyOrDeleted$iv$iv$iv$iv2 != -9187201950435737472L) {
                                                    int bitCount$iv$iv$iv2 = 8 - ((~(i$iv$iv$iv3 - lastIndex$iv$iv$iv2)) >>> 31);
                                                    int j$iv$iv$iv5 = 0;
                                                    while (j$iv$iv$iv5 < bitCount$iv$iv$iv2) {
                                                        long value$iv$iv$iv$iv2 = slot$iv$iv$iv2 & 255;
                                                        if (value$iv$iv$iv$iv2 < 128) {
                                                            j$iv$iv$iv3 = j$iv$iv$iv5;
                                                            DerivedState it2 = (DerivedState) elements$iv$iv4[(i$iv$iv$iv3 << 3) + j$iv$iv$iv5];
                                                            addPendingInvalidationsLocked(it2, forgetConditionalScopes);
                                                        } else {
                                                            j$iv$iv$iv3 = j$iv$iv$iv5;
                                                        }
                                                        slot$iv$iv$iv2 >>= i2;
                                                        j$iv$iv$iv5 = j$iv$iv$iv3 + 1;
                                                    }
                                                    int j$iv$iv$iv6 = i2;
                                                    if (bitCount$iv$iv$iv2 != j$iv$iv$iv6) {
                                                        break;
                                                    }
                                                }
                                                if (i$iv$iv$iv3 != lastIndex$iv$iv$iv2) {
                                                    i$iv$iv$iv3++;
                                                    elements$iv$iv3 = elements$iv$iv2;
                                                    this_$iv$iv$iv7 = this_$iv$iv$iv6;
                                                    this_$iv$iv4 = this_$iv$iv3;
                                                    i3 = i4;
                                                    i2 = 8;
                                                }
                                            }
                                        } else {
                                            this_$iv$iv3 = this_$iv$iv4;
                                            elements$iv$iv2 = elements$iv$iv3;
                                            this_$iv$iv$iv6 = this_$iv$iv$iv7;
                                        }
                                    } else {
                                        this_$iv$iv3 = this_$iv$iv4;
                                        elements$iv$iv2 = elements$iv$iv3;
                                        this_$iv$iv$iv6 = this_$iv$iv$iv7;
                                        DerivedState it3 = (DerivedState) value$iv3;
                                        addPendingInvalidationsLocked(it3, forgetConditionalScopes);
                                    }
                                }
                            } else {
                                $this$fastForEach$iv2 = $this$fastForEach$iv3;
                                $i$f$fastForEach2 = $i$f$fastForEach3;
                                this_$iv$iv3 = this_$iv$iv4;
                                elements$iv$iv2 = elements$iv$iv3;
                                this_$iv$iv$iv6 = this_$iv$iv$iv7;
                            }
                            i = 8;
                            slot$iv$iv$iv >>= 8;
                            j$iv$iv$iv4++;
                            $this$fastForEach$iv3 = $this$fastForEach$iv2;
                            $i$f$fastForEach3 = $i$f$fastForEach2;
                            elements$iv$iv3 = elements$iv$iv2;
                            this_$iv$iv$iv7 = this_$iv$iv$iv6;
                            this_$iv$iv4 = this_$iv$iv3;
                        }
                        $this$fastForEach$iv = $this$fastForEach$iv3;
                        $i$f$fastForEach = $i$f$fastForEach3;
                        this_$iv$iv2 = this_$iv$iv4;
                        elements$iv$iv = elements$iv$iv3;
                        this_$iv$iv$iv5 = this_$iv$iv$iv7;
                        if (bitCount$iv$iv$iv != i) {
                            break;
                        }
                    } else {
                        $this$fastForEach$iv = $this$fastForEach$iv3;
                        $i$f$fastForEach = $i$f$fastForEach3;
                        this_$iv$iv2 = this_$iv$iv4;
                        elements$iv$iv = elements$iv$iv3;
                        this_$iv$iv$iv5 = this_$iv$iv$iv7;
                    }
                    if (i$iv$iv$iv2 == lastIndex$iv$iv$iv) {
                        break;
                    }
                    i$iv$iv$iv2++;
                    $this$fastForEach$iv3 = $this$fastForEach$iv;
                    $i$f$fastForEach3 = $i$f$fastForEach;
                    elements$iv$iv3 = elements$iv$iv;
                    this_$iv$iv$iv7 = this_$iv$iv$iv5;
                    this_$iv$iv4 = this_$iv$iv2;
                }
            } else {
                j3 = -9187201950435737472L;
            }
        } else {
            j = 128;
            j2 = 255;
            c = 7;
            j3 = -9187201950435737472L;
            Set $this$forEach$iv$iv2 = $this$fastForEach$iv3;
            boolean z3 = false;
            Iterator it4 = $this$forEach$iv$iv2.iterator();
            while (it4.hasNext()) {
                Object element$iv$iv = it4.next();
                Object value2 = element$iv$iv;
                int i5 = 0;
                if (value2 instanceof RecomposeScopeImpl) {
                    ((RecomposeScopeImpl) value2).invalidateForResult(null);
                    $this$forEach$iv$iv = $this$forEach$iv$iv2;
                    z = z3;
                    it = it4;
                } else {
                    addPendingInvalidationsLocked(value2, forgetConditionalScopes);
                    Object value$iv4 = this.derivedStates.get(value2);
                    if (value$iv4 == null) {
                        $this$forEach$iv$iv = $this$forEach$iv$iv2;
                        z = z3;
                        it = it4;
                    } else if (value$iv4 instanceof MutableScatterSet) {
                        ScatterSet this_$iv$iv6 = (MutableScatterSet) value$iv4;
                        Object[] elements$iv$iv5 = this_$iv$iv6.elements;
                        long[] m$iv$iv$iv3 = this_$iv$iv6.metadata;
                        $this$forEach$iv$iv = $this$forEach$iv$iv2;
                        int lastIndex$iv$iv$iv3 = m$iv$iv$iv3.length - 2;
                        z = z3;
                        int i$iv$iv$iv4 = 0;
                        if (0 <= lastIndex$iv$iv$iv3) {
                            while (true) {
                                long slot$iv$iv$iv3 = m$iv$iv$iv3[i$iv$iv$iv4];
                                it = it4;
                                Object element$iv$iv2 = element$iv$iv;
                                Object value3 = value2;
                                int i6 = i5;
                                long $this$maskEmptyOrDeleted$iv$iv$iv$iv3 = ((~slot$iv$iv$iv3) << 7) & slot$iv$iv$iv3 & (-9187201950435737472L);
                                if ($this$maskEmptyOrDeleted$iv$iv$iv$iv3 != -9187201950435737472L) {
                                    int bitCount$iv$iv$iv3 = 8 - ((~(i$iv$iv$iv4 - lastIndex$iv$iv$iv3)) >>> 31);
                                    for (int j$iv$iv$iv7 = 0; j$iv$iv$iv7 < bitCount$iv$iv$iv3; j$iv$iv$iv7++) {
                                        long value$iv$iv$iv$iv3 = slot$iv$iv$iv3 & 255;
                                        int $i$f$isFull2 = value$iv$iv$iv$iv3 < 128 ? 1 : 0;
                                        if ($i$f$isFull2 != 0) {
                                            DerivedState it5 = (DerivedState) elements$iv$iv5[(i$iv$iv$iv4 << 3) + j$iv$iv$iv7];
                                            addPendingInvalidationsLocked(it5, forgetConditionalScopes);
                                        }
                                        slot$iv$iv$iv3 >>= 8;
                                    }
                                    if (bitCount$iv$iv$iv3 != 8) {
                                        break;
                                    }
                                }
                                if (i$iv$iv$iv4 != lastIndex$iv$iv$iv3) {
                                    i$iv$iv$iv4++;
                                    it4 = it;
                                    element$iv$iv = element$iv$iv2;
                                    value2 = value3;
                                    i5 = i6;
                                }
                            }
                        } else {
                            it = it4;
                        }
                    } else {
                        $this$forEach$iv$iv = $this$forEach$iv$iv2;
                        z = z3;
                        it = it4;
                        DerivedState it6 = (DerivedState) value$iv4;
                        addPendingInvalidationsLocked(it6, forgetConditionalScopes);
                    }
                }
                $this$forEach$iv$iv2 = $this$forEach$iv$iv;
                z3 = z;
                it4 = it;
            }
        }
        MutableScatterSet conditionallyInvalidatedScopes2 = this.conditionallyInvalidatedScopes;
        MutableScatterSet invalidatedScopes = this.invalidatedScopes;
        String str5 = "null cannot be cast to non-null type androidx.collection.MutableScatterSet<Scope of androidx.compose.runtime.collection.ScopeMap>";
        String str6 = "null cannot be cast to non-null type Scope of androidx.compose.runtime.collection.ScopeMap";
        if (!forgetConditionalScopes || !conditionallyInvalidatedScopes2.isNotEmpty()) {
            if (invalidatedScopes.isNotEmpty()) {
                MutableScatterMap arg0$iv = this.observations;
                int i7 = 0;
                int $i$f$removeIf5 = 0;
                MutableScatterMap this_$iv$iv$iv8 = arg0$iv;
                long[] m$iv$iv$iv4 = this_$iv$iv$iv8.metadata;
                int lastIndex$iv$iv$iv4 = m$iv$iv$iv4.length - 2;
                int i$iv$iv$iv5 = 0;
                if (0 <= lastIndex$iv$iv$iv4) {
                    while (true) {
                        long slot$iv$iv$iv4 = m$iv$iv$iv4[i$iv$iv$iv5];
                        int i$iv$iv$iv6 = i$iv$iv$iv5;
                        MutableScatterMap arg0$iv2 = arg0$iv;
                        int i8 = i7;
                        if ((((~slot$iv$iv$iv4) << c) & slot$iv$iv$iv4 & j3) != j3) {
                            int bitCount$iv$iv$iv4 = 8 - ((~(i$iv$iv$iv6 - lastIndex$iv$iv$iv4)) >>> 31);
                            int j$iv$iv$iv8 = 0;
                            while (j$iv$iv$iv8 < bitCount$iv$iv$iv4) {
                                long value$iv$iv$iv$iv4 = slot$iv$iv$iv4 & j2;
                                int $i$f$isFull3 = value$iv$iv$iv$iv4 < j ? 1 : 0;
                                if ($i$f$isFull3 != 0) {
                                    int index$iv$iv$iv = (i$iv$iv$iv6 << 3) + j$iv$iv$iv8;
                                    Object obj = arg0$iv.keys[index$iv$iv$iv];
                                    Object value$iv5 = arg0$iv.values[index$iv$iv$iv];
                                    if (value$iv5 instanceof MutableScatterSet) {
                                        Intrinsics.checkNotNull(value$iv5, str5);
                                        MutableScatterSet this_$iv$iv7 = (MutableScatterSet) value$iv5;
                                        this_$iv$iv = conditionallyInvalidatedScopes2;
                                        Object[] elements$iv$iv6 = this_$iv$iv7.elements;
                                        str2 = str5;
                                        long[] m$iv$iv$iv5 = this_$iv$iv7.metadata;
                                        int lastIndex$iv$iv$iv5 = m$iv$iv$iv5.length - 2;
                                        int i$iv$iv$iv7 = 0;
                                        if (0 <= lastIndex$iv$iv$iv5) {
                                            while (true) {
                                                long slot$iv$iv$iv5 = m$iv$iv$iv5[i$iv$iv$iv7];
                                                j$iv$iv$iv = j$iv$iv$iv8;
                                                int index$iv$iv$iv2 = index$iv$iv$iv;
                                                $i$f$removeIf2 = $i$f$removeIf5;
                                                this_$iv$iv$iv2 = this_$iv$iv$iv8;
                                                long $this$maskEmptyOrDeleted$iv$iv$iv$iv4 = ((~slot$iv$iv$iv5) << c) & slot$iv$iv$iv5 & j3;
                                                if ($this$maskEmptyOrDeleted$iv$iv$iv$iv4 != j3) {
                                                    int bitCount$iv$iv$iv5 = 8 - ((~(i$iv$iv$iv7 - lastIndex$iv$iv$iv5)) >>> 31);
                                                    value$iv = value$iv5;
                                                    for (int j$iv$iv$iv9 = 0; j$iv$iv$iv9 < bitCount$iv$iv$iv5; j$iv$iv$iv9++) {
                                                        long value$iv$iv$iv$iv5 = slot$iv$iv$iv5 & j2;
                                                        int $i$f$isFull4 = value$iv$iv$iv$iv5 < j ? 1 : 0;
                                                        if ($i$f$isFull4 != 0) {
                                                            int index$iv$iv$iv3 = (i$iv$iv$iv7 << 3) + j$iv$iv$iv9;
                                                            RecomposeScopeImpl scope = (RecomposeScopeImpl) elements$iv$iv6[index$iv$iv$iv3];
                                                            if (invalidatedScopes.contains(scope)) {
                                                                this_$iv$iv7.removeElementAt(index$iv$iv$iv3);
                                                            }
                                                        }
                                                        slot$iv$iv$iv5 >>= 8;
                                                    }
                                                    if (bitCount$iv$iv$iv5 != 8) {
                                                        break;
                                                    }
                                                } else {
                                                    value$iv = value$iv5;
                                                }
                                                if (i$iv$iv$iv7 == lastIndex$iv$iv$iv5) {
                                                    break;
                                                }
                                                i$iv$iv$iv7++;
                                                value$iv5 = value$iv;
                                                $i$f$removeIf5 = $i$f$removeIf2;
                                                this_$iv$iv$iv8 = this_$iv$iv$iv2;
                                                j$iv$iv$iv8 = j$iv$iv$iv;
                                                index$iv$iv$iv = index$iv$iv$iv2;
                                            }
                                        } else {
                                            j$iv$iv$iv = j$iv$iv$iv8;
                                            $i$f$removeIf2 = $i$f$removeIf5;
                                            this_$iv$iv$iv2 = this_$iv$iv$iv8;
                                        }
                                        contains = this_$iv$iv7.isEmpty();
                                    } else {
                                        this_$iv$iv = conditionallyInvalidatedScopes2;
                                        str2 = str5;
                                        j$iv$iv$iv = j$iv$iv$iv8;
                                        $i$f$removeIf2 = $i$f$removeIf5;
                                        this_$iv$iv$iv2 = this_$iv$iv$iv8;
                                        Intrinsics.checkNotNull(value$iv5, "null cannot be cast to non-null type Scope of androidx.compose.runtime.collection.ScopeMap");
                                        RecomposeScopeImpl scope2 = (RecomposeScopeImpl) value$iv5;
                                        contains = invalidatedScopes.contains(scope2);
                                    }
                                    if (contains) {
                                        arg0$iv.removeValueAt(index$iv$iv$iv);
                                    }
                                } else {
                                    this_$iv$iv = conditionallyInvalidatedScopes2;
                                    str2 = str5;
                                    j$iv$iv$iv = j$iv$iv$iv8;
                                    $i$f$removeIf2 = $i$f$removeIf5;
                                    this_$iv$iv$iv2 = this_$iv$iv$iv8;
                                }
                                slot$iv$iv$iv4 >>= 8;
                                j$iv$iv$iv8 = j$iv$iv$iv + 1;
                                conditionallyInvalidatedScopes2 = this_$iv$iv;
                                str5 = str2;
                                $i$f$removeIf5 = $i$f$removeIf2;
                                this_$iv$iv$iv8 = this_$iv$iv$iv2;
                            }
                            conditionallyInvalidatedScopes = conditionallyInvalidatedScopes2;
                            str = str5;
                            $i$f$removeIf = $i$f$removeIf5;
                            this_$iv$iv$iv = this_$iv$iv$iv8;
                            if (bitCount$iv$iv$iv4 != 8) {
                                break;
                            }
                        } else {
                            conditionallyInvalidatedScopes = conditionallyInvalidatedScopes2;
                            str = str5;
                            $i$f$removeIf = $i$f$removeIf5;
                            this_$iv$iv$iv = this_$iv$iv$iv8;
                        }
                        if (i$iv$iv$iv6 == lastIndex$iv$iv$iv4) {
                            break;
                        }
                        i$iv$iv$iv5 = i$iv$iv$iv6 + 1;
                        arg0$iv = arg0$iv2;
                        i7 = i8;
                        conditionallyInvalidatedScopes2 = conditionallyInvalidatedScopes;
                        str5 = str;
                        $i$f$removeIf5 = $i$f$removeIf;
                        this_$iv$iv$iv8 = this_$iv$iv$iv;
                    }
                }
                cleanUpDerivedStateObservations();
                invalidatedScopes.clear();
                return;
            }
            return;
        }
        MutableScatterMap arg0$iv3 = this.observations;
        int i9 = 0;
        int $i$f$removeIf6 = 0;
        MutableScatterMap this_$iv$iv$iv9 = arg0$iv3;
        int $i$f$forEachIndexed3 = 0;
        long[] m$iv$iv$iv6 = this_$iv$iv$iv9.metadata;
        int lastIndex$iv$iv$iv6 = m$iv$iv$iv6.length - 2;
        int i$iv$iv$iv8 = 0;
        if (0 <= lastIndex$iv$iv$iv6) {
            while (true) {
                long slot$iv$iv$iv6 = m$iv$iv$iv6[i$iv$iv$iv8];
                String str7 = str6;
                MutableScatterMap arg0$iv4 = arg0$iv3;
                int i10 = i9;
                long $this$maskEmptyOrDeleted$iv$iv$iv$iv5 = ((~slot$iv$iv$iv6) << c) & slot$iv$iv$iv6 & j3;
                if ($this$maskEmptyOrDeleted$iv$iv$iv$iv5 != j3) {
                    int bitCount$iv$iv$iv6 = 8 - ((~(i$iv$iv$iv8 - lastIndex$iv$iv$iv6)) >>> 31);
                    i$iv$iv$iv = i$iv$iv$iv8;
                    int j$iv$iv$iv10 = 0;
                    while (j$iv$iv$iv10 < bitCount$iv$iv$iv6) {
                        long value$iv$iv$iv$iv6 = slot$iv$iv$iv6 & j2;
                        int $i$f$isFull5 = value$iv$iv$iv$iv6 < j ? 1 : 0;
                        if ($i$f$isFull5 != 0) {
                            int index$iv$iv$iv4 = (i$iv$iv$iv << 3) + j$iv$iv$iv10;
                            Object obj2 = arg0$iv3.keys[index$iv$iv$iv4];
                            Object value$iv6 = arg0$iv3.values[index$iv$iv$iv4];
                            if (value$iv6 instanceof MutableScatterSet) {
                                Intrinsics.checkNotNull(value$iv6, "null cannot be cast to non-null type androidx.collection.MutableScatterSet<Scope of androidx.compose.runtime.collection.ScopeMap>");
                                MutableScatterSet this_$iv$iv8 = (MutableScatterSet) value$iv6;
                                j$iv$iv$iv2 = j$iv$iv$iv10;
                                Object[] elements$iv$iv7 = this_$iv$iv8.elements;
                                long[] m$iv$iv$iv7 = this_$iv$iv8.metadata;
                                int lastIndex$iv$iv$iv7 = m$iv$iv$iv7.length - 2;
                                int i$iv$iv$iv9 = 0;
                                if (0 <= lastIndex$iv$iv$iv7) {
                                    while (true) {
                                        long slot$iv$iv$iv7 = m$iv$iv$iv7[i$iv$iv$iv9];
                                        $i$f$removeIf4 = $i$f$removeIf6;
                                        this_$iv$iv$iv4 = this_$iv$iv$iv9;
                                        $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                                        Object value$iv7 = value$iv6;
                                        long $this$maskEmptyOrDeleted$iv$iv$iv$iv6 = ((~slot$iv$iv$iv7) << c) & slot$iv$iv$iv7 & j3;
                                        if ($this$maskEmptyOrDeleted$iv$iv$iv$iv6 != j3) {
                                            int bitCount$iv$iv$iv7 = 8 - ((~(i$iv$iv$iv9 - lastIndex$iv$iv$iv7)) >>> 31);
                                            value$iv2 = value$iv7;
                                            for (int j$iv$iv$iv11 = 0; j$iv$iv$iv11 < bitCount$iv$iv$iv7; j$iv$iv$iv11++) {
                                                long value$iv$iv$iv$iv7 = slot$iv$iv$iv7 & j2;
                                                int $i$f$isFull6 = value$iv$iv$iv$iv7 < j ? 1 : 0;
                                                if ($i$f$isFull6 != 0) {
                                                    int index$iv$iv$iv5 = (i$iv$iv$iv9 << 3) + j$iv$iv$iv11;
                                                    RecomposeScopeImpl scope3 = (RecomposeScopeImpl) elements$iv$iv7[index$iv$iv$iv5];
                                                    if (conditionallyInvalidatedScopes2.contains(scope3) || invalidatedScopes.contains(scope3)) {
                                                        this_$iv$iv8.removeElementAt(index$iv$iv$iv5);
                                                    }
                                                }
                                                slot$iv$iv$iv7 >>= 8;
                                            }
                                            if (bitCount$iv$iv$iv7 != 8) {
                                                break;
                                            }
                                        } else {
                                            value$iv2 = value$iv7;
                                        }
                                        if (i$iv$iv$iv9 == lastIndex$iv$iv$iv7) {
                                            break;
                                        }
                                        i$iv$iv$iv9++;
                                        value$iv6 = value$iv2;
                                        $i$f$forEachIndexed3 = $i$f$forEachIndexed2;
                                        $i$f$removeIf6 = $i$f$removeIf4;
                                        this_$iv$iv$iv9 = this_$iv$iv$iv4;
                                    }
                                } else {
                                    $i$f$removeIf4 = $i$f$removeIf6;
                                    this_$iv$iv$iv4 = this_$iv$iv$iv9;
                                    $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                                }
                                z2 = this_$iv$iv8.isEmpty();
                                str4 = str7;
                            } else {
                                j$iv$iv$iv2 = j$iv$iv$iv10;
                                $i$f$removeIf4 = $i$f$removeIf6;
                                this_$iv$iv$iv4 = this_$iv$iv$iv9;
                                $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                                str4 = str7;
                                Intrinsics.checkNotNull(value$iv6, str4);
                                RecomposeScopeImpl scope4 = (RecomposeScopeImpl) value$iv6;
                                z2 = conditionallyInvalidatedScopes2.contains(scope4) || invalidatedScopes.contains(scope4);
                            }
                            if (z2) {
                                arg0$iv3.removeValueAt(index$iv$iv$iv4);
                            }
                        } else {
                            j$iv$iv$iv2 = j$iv$iv$iv10;
                            $i$f$removeIf4 = $i$f$removeIf6;
                            this_$iv$iv$iv4 = this_$iv$iv$iv9;
                            $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                            str4 = str7;
                        }
                        slot$iv$iv$iv6 >>= 8;
                        j$iv$iv$iv10 = j$iv$iv$iv2 + 1;
                        str7 = str4;
                        $i$f$forEachIndexed3 = $i$f$forEachIndexed2;
                        $i$f$removeIf6 = $i$f$removeIf4;
                        this_$iv$iv$iv9 = this_$iv$iv$iv4;
                    }
                    $i$f$removeIf3 = $i$f$removeIf6;
                    this_$iv$iv$iv3 = this_$iv$iv$iv9;
                    $i$f$forEachIndexed = $i$f$forEachIndexed3;
                    str3 = str7;
                    if (bitCount$iv$iv$iv6 != 8) {
                        break;
                    }
                } else {
                    $i$f$removeIf3 = $i$f$removeIf6;
                    this_$iv$iv$iv3 = this_$iv$iv$iv9;
                    $i$f$forEachIndexed = $i$f$forEachIndexed3;
                    i$iv$iv$iv = i$iv$iv$iv8;
                    str3 = str7;
                }
                if (i$iv$iv$iv == lastIndex$iv$iv$iv6) {
                    break;
                }
                int i11 = i$iv$iv$iv + 1;
                str6 = str3;
                i$iv$iv$iv8 = i11;
                arg0$iv3 = arg0$iv4;
                i9 = i10;
                $i$f$forEachIndexed3 = $i$f$forEachIndexed;
                $i$f$removeIf6 = $i$f$removeIf3;
                this_$iv$iv$iv9 = this_$iv$iv$iv3;
            }
        }
        conditionallyInvalidatedScopes2.clear();
        cleanUpDerivedStateObservations();
    }

    private final void cleanUpDerivedStateObservations() {
        char c;
        long j;
        MutableScatterMap arg0$iv;
        MutableScatterSet mutableScatterSet;
        int $i$f$removeIf;
        ScatterMap this_$iv$iv$iv;
        int $i$f$forEachIndexed;
        long[] m$iv$iv$iv;
        MutableScatterMap arg0$iv2;
        MutableScatterSet this_$iv$iv;
        int $i$f$removeIf2;
        ScatterMap this_$iv$iv$iv2;
        int $i$f$forEachIndexed2;
        long[] m$iv$iv$iv2;
        int j$iv$iv$iv;
        boolean z;
        int j$iv$iv$iv2;
        long[] m$iv$iv$iv3;
        MutableScatterMap arg0$iv3 = this.derivedStates;
        MutableScatterSet mutableScatterSet2 = null;
        int $i$f$removeIf3 = 0;
        MutableScatterMap this_$iv$iv$iv3 = arg0$iv3;
        int $i$f$forEachIndexed3 = 0;
        long[] m$iv$iv$iv4 = this_$iv$iv$iv3.metadata;
        int lastIndex$iv$iv$iv = m$iv$iv$iv4.length - 2;
        int i$iv$iv$iv = 0;
        int i = 8;
        if (0 <= lastIndex$iv$iv$iv) {
            while (true) {
                long slot$iv$iv$iv = m$iv$iv$iv4[i$iv$iv$iv];
                c = 7;
                j = 255;
                long $this$maskEmptyOrDeleted$iv$iv$iv$iv = ((~slot$iv$iv$iv) << 7) & slot$iv$iv$iv & (-9187201950435737472L);
                if ($this$maskEmptyOrDeleted$iv$iv$iv$iv == -9187201950435737472L) {
                    arg0$iv = arg0$iv3;
                    mutableScatterSet = mutableScatterSet2;
                    $i$f$removeIf = $i$f$removeIf3;
                    this_$iv$iv$iv = this_$iv$iv$iv3;
                    $i$f$forEachIndexed = $i$f$forEachIndexed3;
                    m$iv$iv$iv = m$iv$iv$iv4;
                } else {
                    int bitCount$iv$iv$iv = 8 - ((~(i$iv$iv$iv - lastIndex$iv$iv$iv)) >>> 31);
                    int j$iv$iv$iv3 = 0;
                    while (j$iv$iv$iv3 < bitCount$iv$iv$iv) {
                        long value$iv$iv$iv$iv = slot$iv$iv$iv & 255;
                        if (!(value$iv$iv$iv$iv < 128)) {
                            arg0$iv2 = arg0$iv3;
                            this_$iv$iv = mutableScatterSet2;
                            $i$f$removeIf2 = $i$f$removeIf3;
                            this_$iv$iv$iv2 = this_$iv$iv$iv3;
                            $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                            m$iv$iv$iv2 = m$iv$iv$iv4;
                            j$iv$iv$iv = j$iv$iv$iv3;
                        } else {
                            int index$iv$iv$iv = (i$iv$iv$iv << 3) + j$iv$iv$iv3;
                            Object obj = arg0$iv3.keys[index$iv$iv$iv];
                            Object value$iv = arg0$iv3.values[index$iv$iv$iv];
                            int i2 = i;
                            if (value$iv instanceof MutableScatterSet) {
                                Intrinsics.checkNotNull(value$iv, "null cannot be cast to non-null type androidx.collection.MutableScatterSet<Scope of androidx.compose.runtime.collection.ScopeMap>");
                                MutableScatterSet set$iv = (MutableScatterSet) value$iv;
                                arg0$iv2 = arg0$iv3;
                                this_$iv$iv = mutableScatterSet2;
                                Object[] elements$iv$iv = set$iv.elements;
                                $i$f$removeIf2 = $i$f$removeIf3;
                                long[] m$iv$iv$iv5 = set$iv.metadata;
                                int lastIndex$iv$iv$iv2 = m$iv$iv$iv5.length - 2;
                                int i$iv$iv$iv2 = 0;
                                if (0 <= lastIndex$iv$iv$iv2) {
                                    while (true) {
                                        long slot$iv$iv$iv2 = m$iv$iv$iv5[i$iv$iv$iv2];
                                        this_$iv$iv$iv2 = this_$iv$iv$iv3;
                                        $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                                        j$iv$iv$iv = j$iv$iv$iv3;
                                        int index$iv$iv$iv2 = index$iv$iv$iv;
                                        long $this$maskEmptyOrDeleted$iv$iv$iv$iv2 = ((~slot$iv$iv$iv2) << 7) & slot$iv$iv$iv2 & (-9187201950435737472L);
                                        if ($this$maskEmptyOrDeleted$iv$iv$iv$iv2 == -9187201950435737472L) {
                                            m$iv$iv$iv2 = m$iv$iv$iv4;
                                        } else {
                                            int bitCount$iv$iv$iv2 = 8 - ((~(i$iv$iv$iv2 - lastIndex$iv$iv$iv2)) >>> 31);
                                            int j$iv$iv$iv4 = 0;
                                            while (j$iv$iv$iv4 < bitCount$iv$iv$iv2) {
                                                long value$iv$iv$iv$iv2 = slot$iv$iv$iv2 & 255;
                                                if (!(value$iv$iv$iv$iv2 < 128)) {
                                                    j$iv$iv$iv2 = j$iv$iv$iv4;
                                                    m$iv$iv$iv3 = m$iv$iv$iv4;
                                                } else {
                                                    int index$iv$iv$iv3 = (i$iv$iv$iv2 << 3) + j$iv$iv$iv4;
                                                    j$iv$iv$iv2 = j$iv$iv$iv4;
                                                    DerivedState derivedState = (DerivedState) elements$iv$iv[index$iv$iv$iv3];
                                                    m$iv$iv$iv3 = m$iv$iv$iv4;
                                                    if (!ScopeMap.m3832containsimpl(this.observations, derivedState)) {
                                                        set$iv.removeElementAt(index$iv$iv$iv3);
                                                    }
                                                }
                                                slot$iv$iv$iv2 >>= i2;
                                                j$iv$iv$iv4 = j$iv$iv$iv2 + 1;
                                                m$iv$iv$iv4 = m$iv$iv$iv3;
                                            }
                                            m$iv$iv$iv2 = m$iv$iv$iv4;
                                            int j$iv$iv$iv5 = i2;
                                            if (bitCount$iv$iv$iv2 != j$iv$iv$iv5) {
                                                break;
                                            }
                                        }
                                        if (i$iv$iv$iv2 == lastIndex$iv$iv$iv2) {
                                            break;
                                        }
                                        i$iv$iv$iv2++;
                                        j$iv$iv$iv3 = j$iv$iv$iv;
                                        index$iv$iv$iv = index$iv$iv$iv2;
                                        this_$iv$iv$iv3 = this_$iv$iv$iv2;
                                        $i$f$forEachIndexed3 = $i$f$forEachIndexed2;
                                        m$iv$iv$iv4 = m$iv$iv$iv2;
                                        i2 = 8;
                                    }
                                } else {
                                    this_$iv$iv$iv2 = this_$iv$iv$iv3;
                                    $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                                    m$iv$iv$iv2 = m$iv$iv$iv4;
                                    j$iv$iv$iv = j$iv$iv$iv3;
                                }
                                z = set$iv.isEmpty();
                            } else {
                                arg0$iv2 = arg0$iv3;
                                this_$iv$iv = mutableScatterSet2;
                                $i$f$removeIf2 = $i$f$removeIf3;
                                this_$iv$iv$iv2 = this_$iv$iv$iv3;
                                $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                                m$iv$iv$iv2 = m$iv$iv$iv4;
                                j$iv$iv$iv = j$iv$iv$iv3;
                                Intrinsics.checkNotNull(value$iv, "null cannot be cast to non-null type Scope of androidx.compose.runtime.collection.ScopeMap");
                                DerivedState derivedState2 = (DerivedState) value$iv;
                                z = !ScopeMap.m3832containsimpl(this.observations, derivedState2);
                            }
                            if (z) {
                                arg0$iv3.removeValueAt(index$iv$iv$iv);
                            }
                        }
                        slot$iv$iv$iv >>= 8;
                        j$iv$iv$iv3 = j$iv$iv$iv + 1;
                        i = 8;
                        mutableScatterSet2 = this_$iv$iv;
                        arg0$iv3 = arg0$iv2;
                        $i$f$removeIf3 = $i$f$removeIf2;
                        this_$iv$iv$iv3 = this_$iv$iv$iv2;
                        $i$f$forEachIndexed3 = $i$f$forEachIndexed2;
                        m$iv$iv$iv4 = m$iv$iv$iv2;
                    }
                    arg0$iv = arg0$iv3;
                    mutableScatterSet = mutableScatterSet2;
                    $i$f$removeIf = $i$f$removeIf3;
                    this_$iv$iv$iv = this_$iv$iv$iv3;
                    $i$f$forEachIndexed = $i$f$forEachIndexed3;
                    m$iv$iv$iv = m$iv$iv$iv4;
                    int $i$f$forEachIndexed4 = i;
                    if (bitCount$iv$iv$iv != $i$f$forEachIndexed4) {
                        break;
                    }
                }
                if (i$iv$iv$iv == lastIndex$iv$iv$iv) {
                    break;
                }
                i$iv$iv$iv++;
                mutableScatterSet2 = mutableScatterSet;
                arg0$iv3 = arg0$iv;
                $i$f$removeIf3 = $i$f$removeIf;
                this_$iv$iv$iv3 = this_$iv$iv$iv;
                $i$f$forEachIndexed3 = $i$f$forEachIndexed;
                m$iv$iv$iv4 = m$iv$iv$iv;
                i = 8;
            }
        } else {
            c = 7;
            j = 255;
        }
        if (this.conditionallyInvalidatedScopes.isNotEmpty()) {
            MutableScatterSet this_$iv = this.conditionallyInvalidatedScopes;
            Object[] elements$iv = this_$iv.elements;
            MutableScatterSet this_$iv$iv2 = this_$iv;
            long[] m$iv$iv = this_$iv$iv2.metadata;
            int lastIndex$iv$iv = m$iv$iv.length - 2;
            int i$iv$iv = 0;
            if (0 > lastIndex$iv$iv) {
                return;
            }
            while (true) {
                long slot$iv$iv = m$iv$iv[i$iv$iv];
                long $this$maskEmptyOrDeleted$iv$iv$iv = ((~slot$iv$iv) << c) & slot$iv$iv & (-9187201950435737472L);
                if ($this$maskEmptyOrDeleted$iv$iv$iv != -9187201950435737472L) {
                    int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                    for (int j$iv$iv = 0; j$iv$iv < bitCount$iv$iv; j$iv$iv++) {
                        long value$iv$iv$iv = slot$iv$iv & j;
                        if (value$iv$iv$iv < 128) {
                            int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                            RecomposeScopeImpl scope = (RecomposeScopeImpl) elements$iv[index$iv$iv];
                            if (!scope.isConditional()) {
                                this_$iv.removeElementAt(index$iv$iv);
                            }
                        }
                        slot$iv$iv >>= 8;
                    }
                    if (bitCount$iv$iv != 8) {
                        return;
                    }
                }
                if (i$iv$iv == lastIndex$iv$iv) {
                    return;
                }
                i$iv$iv++;
            }
        }
    }

    @Override // androidx.compose.runtime.ControlledComposition, androidx.compose.runtime.RecomposeScopeOwner
    public void recordReadOf(Object value) {
        RecomposeScopeImpl it;
        DerivedState.Record record;
        int i;
        int i2;
        int i3;
        int j$iv$iv;
        if (!getAreChildrenComposing() && (it = this.composer.getCurrentRecomposeScope$runtime_release()) != null) {
            int i4 = 0;
            int i5 = 1;
            it.setUsed(true);
            boolean alreadyRead = it.recordRead(value);
            if (!alreadyRead) {
                if (value instanceof StateObjectImpl) {
                    ReaderKind.Companion companion = ReaderKind.Companion;
                    ((StateObjectImpl) value).m3864recordReadInh_f27i8$runtime_release(ReaderKind.m3851constructorimpl(1));
                }
                ScopeMap.m3825addimpl(this.observations, value, it);
                if (value instanceof DerivedState) {
                    DerivedState.Record record2 = ((DerivedState) value).getCurrentRecord();
                    ScopeMap.m3839removeScopeimpl(this.derivedStates, value);
                    ObjectIntMap this_$iv = record2.getDependencies();
                    Object[] k$iv = this_$iv.keys;
                    long[] m$iv$iv = this_$iv.metadata;
                    int lastIndex$iv$iv = m$iv$iv.length - 2;
                    int i$iv$iv = 0;
                    if (0 <= lastIndex$iv$iv) {
                        while (true) {
                            long slot$iv$iv = m$iv$iv[i$iv$iv];
                            int i6 = i5;
                            boolean alreadyRead2 = alreadyRead;
                            record = record2;
                            ObjectIntMap this_$iv2 = this_$iv;
                            long $this$maskEmptyOrDeleted$iv$iv$iv = ((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L);
                            if ($this$maskEmptyOrDeleted$iv$iv$iv == -9187201950435737472L) {
                                i = i4;
                            } else {
                                int i7 = 8;
                                int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                                int j$iv$iv2 = 0;
                                while (j$iv$iv2 < bitCount$iv$iv) {
                                    long value$iv$iv$iv = slot$iv$iv & 255;
                                    if ((value$iv$iv$iv < 128 ? i6 : 0) == 0) {
                                        i2 = i4;
                                        i3 = i7;
                                        j$iv$iv = j$iv$iv2;
                                    } else {
                                        int index$iv$iv = (i$iv$iv << 3) + j$iv$iv2;
                                        i3 = i7;
                                        StateObject dependency = (StateObject) k$iv[index$iv$iv];
                                        i2 = i4;
                                        if (!(dependency instanceof StateObjectImpl)) {
                                            j$iv$iv = j$iv$iv2;
                                        } else {
                                            ReaderKind.Companion companion2 = ReaderKind.Companion;
                                            j$iv$iv = j$iv$iv2;
                                            int j$iv$iv3 = ReaderKind.m3851constructorimpl(i6);
                                            ((StateObjectImpl) dependency).m3864recordReadInh_f27i8$runtime_release(j$iv$iv3);
                                        }
                                        ScopeMap.m3825addimpl(this.derivedStates, dependency, value);
                                    }
                                    slot$iv$iv >>= i3;
                                    j$iv$iv2 = j$iv$iv + 1;
                                    i7 = i3;
                                    i4 = i2;
                                }
                                i = i4;
                                if (bitCount$iv$iv != i7) {
                                    break;
                                }
                            }
                            if (i$iv$iv == lastIndex$iv$iv) {
                                break;
                            }
                            i$iv$iv++;
                            record2 = record;
                            this_$iv = this_$iv2;
                            i5 = i6;
                            alreadyRead = alreadyRead2;
                            i4 = i;
                        }
                    } else {
                        record = record2;
                    }
                    it.recordDerivedStateValue((DerivedState) value, record.getCurrentValue());
                }
            }
        }
    }

    private final void invalidateScopeOfLocked(Object value) {
        int i;
        int j$iv$iv$iv;
        MutableScatterMap arg0$iv = this.observations;
        int i2 = 0;
        Object value$iv = arg0$iv.get(value);
        if (value$iv == null) {
            return;
        }
        if (!(value$iv instanceof MutableScatterSet)) {
            RecomposeScopeImpl scope = (RecomposeScopeImpl) value$iv;
            if (scope.invalidateForResult(value) == InvalidationResult.IMMINENT) {
                ScopeMap.m3825addimpl(this.observationsProcessed, value, scope);
                return;
            }
            return;
        }
        ScatterSet this_$iv$iv = (MutableScatterSet) value$iv;
        Object[] elements$iv$iv = this_$iv$iv.elements;
        long[] m$iv$iv$iv = this_$iv$iv.metadata;
        int lastIndex$iv$iv$iv = m$iv$iv$iv.length - 2;
        int i$iv$iv$iv = 0;
        if (0 > lastIndex$iv$iv$iv) {
            return;
        }
        while (true) {
            long slot$iv$iv$iv = m$iv$iv$iv[i$iv$iv$iv];
            MutableScatterMap arg0$iv2 = arg0$iv;
            int i3 = i2;
            Object value$iv2 = value$iv;
            ScatterSet this_$iv$iv2 = this_$iv$iv;
            long $this$maskEmptyOrDeleted$iv$iv$iv$iv = ((~slot$iv$iv$iv) << 7) & slot$iv$iv$iv & (-9187201950435737472L);
            if ($this$maskEmptyOrDeleted$iv$iv$iv$iv != -9187201950435737472L) {
                int i4 = 8;
                int bitCount$iv$iv$iv = 8 - ((~(i$iv$iv$iv - lastIndex$iv$iv$iv)) >>> 31);
                int j$iv$iv$iv2 = 0;
                while (j$iv$iv$iv2 < bitCount$iv$iv$iv) {
                    long value$iv$iv$iv$iv = slot$iv$iv$iv & 255;
                    if (!(value$iv$iv$iv$iv < 128)) {
                        i = i4;
                        j$iv$iv$iv = j$iv$iv$iv2;
                    } else {
                        int index$iv$iv$iv = (i$iv$iv$iv << 3) + j$iv$iv$iv2;
                        i = i4;
                        RecomposeScopeImpl scope2 = (RecomposeScopeImpl) elements$iv$iv[index$iv$iv$iv];
                        j$iv$iv$iv = j$iv$iv$iv2;
                        if (scope2.invalidateForResult(value) == InvalidationResult.IMMINENT) {
                            ScopeMap.m3825addimpl(this.observationsProcessed, value, scope2);
                        }
                    }
                    slot$iv$iv$iv >>= i;
                    j$iv$iv$iv2 = j$iv$iv$iv + 1;
                    i4 = i;
                }
                if (bitCount$iv$iv$iv != i4) {
                    return;
                }
            }
            if (i$iv$iv$iv == lastIndex$iv$iv$iv) {
                return;
            }
            i$iv$iv$iv++;
            value$iv = value$iv2;
            this_$iv$iv = this_$iv$iv2;
            arg0$iv = arg0$iv2;
            i2 = i3;
        }
    }

    @Override // androidx.compose.runtime.ControlledComposition
    public void recordWriteOf(Object value) {
        int i;
        Object lock$iv = this.lock;
        boolean z = false;
        synchronized (lock$iv) {
            try {
                invalidateScopeOfLocked(value);
                MutableScatterMap arg0$iv = this.derivedStates;
                int i2 = 0;
                Object value$iv = arg0$iv.get(value);
                try {
                    if (value$iv != null) {
                        if (!(value$iv instanceof MutableScatterSet)) {
                            DerivedState it = (DerivedState) value$iv;
                            invalidateScopeOfLocked(it);
                        } else {
                            ScatterSet this_$iv$iv = (MutableScatterSet) value$iv;
                            Object[] elements$iv$iv = this_$iv$iv.elements;
                            long[] m$iv$iv$iv = this_$iv$iv.metadata;
                            int lastIndex$iv$iv$iv = m$iv$iv$iv.length - 2;
                            int i$iv$iv$iv = 0;
                            if (0 <= lastIndex$iv$iv$iv) {
                                while (true) {
                                    long slot$iv$iv$iv = m$iv$iv$iv[i$iv$iv$iv];
                                    boolean z2 = z;
                                    MutableScatterMap arg0$iv2 = arg0$iv;
                                    int i3 = i2;
                                    long $this$maskEmptyOrDeleted$iv$iv$iv$iv = ((~slot$iv$iv$iv) << 7) & slot$iv$iv$iv & (-9187201950435737472L);
                                    if ($this$maskEmptyOrDeleted$iv$iv$iv$iv != -9187201950435737472L) {
                                        int i4 = 8;
                                        int bitCount$iv$iv$iv = 8 - ((~(i$iv$iv$iv - lastIndex$iv$iv$iv)) >>> 31);
                                        int j$iv$iv$iv = 0;
                                        while (j$iv$iv$iv < bitCount$iv$iv$iv) {
                                            long value$iv$iv$iv$iv = slot$iv$iv$iv & 255;
                                            if (!(value$iv$iv$iv$iv < 128)) {
                                                i = i4;
                                            } else {
                                                int index$iv$iv$iv = (i$iv$iv$iv << 3) + j$iv$iv$iv;
                                                DerivedState it2 = (DerivedState) elements$iv$iv[index$iv$iv$iv];
                                                i = i4;
                                                invalidateScopeOfLocked(it2);
                                            }
                                            slot$iv$iv$iv >>= i;
                                            j$iv$iv$iv++;
                                            i4 = i;
                                        }
                                        if (bitCount$iv$iv$iv != i4) {
                                            break;
                                        }
                                    }
                                    if (i$iv$iv$iv == lastIndex$iv$iv$iv) {
                                        break;
                                    }
                                    i$iv$iv$iv++;
                                    i2 = i3;
                                    z = z2;
                                    arg0$iv = arg0$iv2;
                                }
                            }
                        }
                    }
                    Unit unit = Unit.INSTANCE;
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:67:0x009a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // androidx.compose.runtime.ControlledComposition
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean recompose() {
        /*
            r20 = this;
            r1 = r20
            java.lang.Object r2 = r1.lock
            r3 = 0
            monitor-enter(r2)
            r4 = 0
            r1.drainPendingModificationsForCompositionLocked()     // Catch: java.lang.Throwable -> Lb8
            r5 = r20
            r6 = 0
            r7 = r5
            r8 = 0
            r9 = 0
            r10 = 0
            r11 = r20
            r12 = 0
            androidx.collection.MutableScatterMap r0 = r11.m3675takeInvalidationsafanTW4()     // Catch: java.lang.Throwable -> L91
            r13 = r0
            r0 = r13
            r14 = 0
            androidx.compose.runtime.tooling.CompositionObserver r15 = r1.observer()     // Catch: java.lang.Exception -> L84 java.lang.Throwable -> L91
            if (r15 == 0) goto L50
            r16 = r3
            r3 = r1
            androidx.compose.runtime.Composition r3 = (androidx.compose.runtime.Composition) r3     // Catch: java.lang.Throwable -> L44 java.lang.Exception -> L4a
            r17 = r4
            java.util.Map r4 = androidx.compose.runtime.collection.ScopeMap.m3827asMapimpl(r0)     // Catch: java.lang.Throwable -> L3c java.lang.Exception -> L40
            r18 = r5
            java.lang.String r5 = "null cannot be cast to non-null type kotlin.collections.Map<androidx.compose.runtime.RecomposeScope, kotlin.collections.Set<kotlin.Any>>"
            kotlin.jvm.internal.Intrinsics.checkNotNull(r4, r5)     // Catch: java.lang.Exception -> L82 java.lang.Throwable -> L8f
            r15.onBeginComposition(r3, r4)     // Catch: java.lang.Exception -> L82 java.lang.Throwable -> L8f
            goto L56
        L3c:
            r0 = move-exception
            r18 = r5
            goto L98
        L40:
            r0 = move-exception
            r18 = r5
            goto L8b
        L44:
            r0 = move-exception
            r17 = r4
            r18 = r5
            goto L98
        L4a:
            r0 = move-exception
            r17 = r4
            r18 = r5
            goto L8b
        L50:
            r16 = r3
            r17 = r4
            r18 = r5
        L56:
            androidx.compose.runtime.ComposerImpl r3 = r1.composer     // Catch: java.lang.Exception -> L82 java.lang.Throwable -> L8f
            androidx.compose.runtime.ShouldPauseCallback r4 = r1.shouldPause     // Catch: java.lang.Exception -> L82 java.lang.Throwable -> L8f
            boolean r3 = r3.m3673recomposeaFTiNEg$runtime_release(r0, r4)     // Catch: java.lang.Exception -> L82 java.lang.Throwable -> L8f
            r4 = r3
            r5 = 0
            if (r4 != 0) goto L65
            r1.drainPendingModificationsLocked()     // Catch: java.lang.Exception -> L82 java.lang.Throwable -> L8f
        L65:
            if (r15 == 0) goto L70
            r19 = r0
            r0 = r1
            androidx.compose.runtime.Composition r0 = (androidx.compose.runtime.Composition) r0     // Catch: java.lang.Exception -> L82 java.lang.Throwable -> L8f
            r15.onEndComposition(r0)     // Catch: java.lang.Exception -> L82 java.lang.Throwable -> L8f
            goto L72
        L70:
            r19 = r0
        L72:
            r0 = r3
            r4 = 0
            r0 = 1
            monitor-exit(r2)
            return r3
        L82:
            r0 = move-exception
            goto L8b
        L84:
            r0 = move-exception
            r16 = r3
            r17 = r4
            r18 = r5
        L8b:
            r11.invalidations = r13     // Catch: java.lang.Throwable -> L8f
            throw r0     // Catch: java.lang.Throwable -> L8f
        L8f:
            r0 = move-exception
            goto L98
        L91:
            r0 = move-exception
            r16 = r3
            r17 = r4
            r18 = r5
        L98:
            if (r9 != 0) goto Lae
            java.util.Set<androidx.compose.runtime.RememberObserver> r3 = r7.abandonSet     // Catch: java.lang.Throwable -> Lb0 java.lang.Exception -> Lb2
            java.util.Collection r3 = (java.util.Collection) r3     // Catch: java.lang.Throwable -> Lb0 java.lang.Exception -> Lb2
            boolean r3 = r3.isEmpty()     // Catch: java.lang.Throwable -> Lb0 java.lang.Exception -> Lb2
            if (r3 != 0) goto Lae
            androidx.compose.runtime.internal.RememberEventDispatcher r3 = new androidx.compose.runtime.internal.RememberEventDispatcher     // Catch: java.lang.Throwable -> Lb0 java.lang.Exception -> Lb2
            java.util.Set<androidx.compose.runtime.RememberObserver> r4 = r7.abandonSet     // Catch: java.lang.Throwable -> Lb0 java.lang.Exception -> Lb2
            r3.<init>(r4)     // Catch: java.lang.Throwable -> Lb0 java.lang.Exception -> Lb2
            r3.dispatchAbandons()     // Catch: java.lang.Throwable -> Lb0 java.lang.Exception -> Lb2
        Lae:
            throw r0     // Catch: java.lang.Throwable -> Lb0 java.lang.Exception -> Lb2
        Lb0:
            r0 = move-exception
            goto Lbb
        Lb2:
            r0 = move-exception
            r18.abandonChanges()     // Catch: java.lang.Throwable -> Lb0
            throw r0     // Catch: java.lang.Throwable -> Lb0
        Lb8:
            r0 = move-exception
            r16 = r3
        Lbb:
            monitor-exit(r2)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.runtime.CompositionImpl.recompose():boolean");
    }

    @Override // androidx.compose.runtime.ControlledComposition
    public void insertMovableContent(List<Pair<MovableContentStateReference, MovableContentStateReference>> list) {
        boolean value$iv;
        int index$iv$iv = 0;
        int size = list.size();
        while (true) {
            if (index$iv$iv < size) {
                Pair item$iv$iv = list.get(index$iv$iv);
                Pair it = item$iv$iv;
                if (!Intrinsics.areEqual(it.getFirst().getComposition$runtime_release(), this)) {
                    value$iv = false;
                    break;
                }
                index$iv$iv++;
            } else {
                value$iv = true;
                break;
            }
        }
        if (!value$iv) {
            ComposerKt.composeImmediateRuntimeError("Check failed");
        }
        try {
            this.composer.insertMovableContentReferences(list);
            Unit unit = Unit.INSTANCE;
        } finally {
        }
    }

    /* JADX WARN: Finally extract failed */
    @Override // androidx.compose.runtime.ControlledComposition
    public void disposeUnusedMovableContent(MovableContentState state) {
        RememberEventDispatcher manager = new RememberEventDispatcher(this.abandonSet);
        SlotTable slotTable = state.getSlotTable$runtime_release();
        SlotWriter writer$iv = slotTable.openWriter();
        try {
            ComposerKt.removeCurrentGroup(writer$iv, manager);
            Unit unit = Unit.INSTANCE;
            writer$iv.close(true);
            manager.dispatchRememberObservers();
        } catch (Throwable th) {
            writer$iv.close(false);
            throw th;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x004b, code lost:
        if (r0 == null) goto L143;
     */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0047 A[Catch: all -> 0x003b, TRY_ENTER, TRY_LEAVE, TryCatch #7 {all -> 0x003b, blocks: (B:15:0x0032, B:17:0x0038, B:24:0x0047), top: B:149:0x0032 }] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x008d A[Catch: all -> 0x0274, TRY_LEAVE, TryCatch #4 {all -> 0x0274, blocks: (B:35:0x007d, B:37:0x008d, B:106:0x0249, B:107:0x024e, B:101:0x023c, B:125:0x026e, B:126:0x0273), top: B:145:0x002e }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final void applyChangesInLocked(androidx.compose.runtime.changelist.ChangeList r53) {
        /*
            Method dump skipped, instructions count: 649
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.runtime.CompositionImpl.applyChangesInLocked(androidx.compose.runtime.changelist.ChangeList):void");
    }

    @Override // androidx.compose.runtime.ControlledComposition
    public void applyChanges() {
        Object lock$iv = this.lock;
        synchronized (lock$iv) {
            applyChangesInLocked(this.changes);
            drainPendingModificationsLocked();
            Unit unit = Unit.INSTANCE;
            Unit unit2 = Unit.INSTANCE;
        }
    }

    @Override // androidx.compose.runtime.ControlledComposition
    public void applyLateChanges() {
        Object lock$iv = this.lock;
        synchronized (lock$iv) {
            if (this.lateChanges.isNotEmpty()) {
                applyChangesInLocked(this.lateChanges);
            }
            Unit unit = Unit.INSTANCE;
            Unit unit2 = Unit.INSTANCE;
        }
    }

    @Override // androidx.compose.runtime.ControlledComposition
    public void changesApplied() {
        Object lock$iv = this.lock;
        synchronized (lock$iv) {
            this.composer.changesApplied$runtime_release();
            if (!this.abandonSet.isEmpty()) {
                new RememberEventDispatcher(this.abandonSet).dispatchAbandons();
            }
            Unit unit = Unit.INSTANCE;
            Unit unit2 = Unit.INSTANCE;
        }
    }

    private final <T> T guardInvalidationsLocked(Function1<? super ScopeMap<RecomposeScopeImpl, Object>, ? extends T> function1) {
        MutableScatterMap invalidations = m3675takeInvalidationsafanTW4();
        try {
            return function1.invoke(ScopeMap.m3828boximpl(invalidations));
        } catch (Exception e) {
            this.invalidations = invalidations;
            throw e;
        }
    }

    private final <T> T guardChanges(Function0<? extends T> function0) {
        try {
            return function0.invoke();
        } catch (Throwable th) {
            if (0 == 0) {
                try {
                    if (!this.abandonSet.isEmpty()) {
                        new RememberEventDispatcher(this.abandonSet).dispatchAbandons();
                    }
                } catch (Exception e) {
                    abandonChanges();
                    throw e;
                }
            }
            throw th;
        }
    }

    @Override // androidx.compose.runtime.ControlledComposition
    public void abandonChanges() {
        this.pendingModifications.set(null);
        this.changes.clear();
        this.lateChanges.clear();
        if (!this.abandonSet.isEmpty()) {
            new RememberEventDispatcher(this.abandonSet).dispatchAbandons();
        }
    }

    @Override // androidx.compose.runtime.ControlledComposition
    public void invalidateAll() {
        Object lock$iv = this.lock;
        synchronized (lock$iv) {
            Object[] $this$forEach$iv = this.slotTable.getSlots();
            for (Object element$iv : $this$forEach$iv) {
                RecomposeScopeImpl recomposeScopeImpl = element$iv instanceof RecomposeScopeImpl ? (RecomposeScopeImpl) element$iv : null;
                if (recomposeScopeImpl != null) {
                    recomposeScopeImpl.invalidate();
                }
            }
            Unit unit = Unit.INSTANCE;
        }
    }

    @Override // androidx.compose.runtime.ControlledComposition
    public void verifyConsistent() {
        Object lock$iv = this.lock;
        synchronized (lock$iv) {
            if (!isComposing()) {
                this.composer.verifyConsistent$runtime_release();
                this.slotTable.verifyWellFormed();
                validateRecomposeScopeAnchors(this.slotTable);
            }
            Unit unit = Unit.INSTANCE;
        }
    }

    @Override // androidx.compose.runtime.ControlledComposition
    public <R> R delegateInvalidations(ControlledComposition to, int groupIndex, Function0<? extends R> function0) {
        if (to != null && !Intrinsics.areEqual(to, this) && groupIndex >= 0) {
            this.invalidationDelegate = (CompositionImpl) to;
            this.invalidationDelegateGroup = groupIndex;
            try {
                return function0.invoke();
            } finally {
                this.invalidationDelegate = null;
                this.invalidationDelegateGroup = 0;
            }
        }
        return function0.invoke();
    }

    @Override // androidx.compose.runtime.ControlledComposition
    public ShouldPauseCallback getAndSetShouldPauseCallback(ShouldPauseCallback shouldPause) {
        ShouldPauseCallback previous = this.shouldPause;
        this.shouldPause = shouldPause;
        return previous;
    }

    @Override // androidx.compose.runtime.RecomposeScopeOwner
    public InvalidationResult invalidate(RecomposeScopeImpl scope, Object instance) {
        CompositionImpl delegate;
        boolean z = true;
        if (scope.getDefaultsInScope()) {
            scope.setDefaultsInvalid(true);
        }
        Anchor anchor = scope.getAnchor();
        if (anchor == null || !anchor.getValid()) {
            return InvalidationResult.IGNORED;
        }
        if (!this.slotTable.ownsAnchor(anchor)) {
            Object lock$iv = this.lock;
            synchronized (lock$iv) {
                delegate = this.invalidationDelegate;
            }
            if (delegate == null || !delegate.tryImminentInvalidation(scope, instance)) {
                z = false;
            }
            if (z) {
                return InvalidationResult.IMMINENT;
            }
            return InvalidationResult.IGNORED;
        } else if (!scope.getCanRecompose()) {
            return InvalidationResult.IGNORED;
        } else {
            return invalidateChecked(scope, anchor, instance);
        }
    }

    @Override // androidx.compose.runtime.RecomposeScopeOwner
    public void recomposeScopeReleased(RecomposeScopeImpl scope) {
        this.pendingInvalidScopes = true;
    }

    @Override // androidx.compose.runtime.CompositionServices
    public <T> T getCompositionService(CompositionServiceKey<T> compositionServiceKey) {
        if (Intrinsics.areEqual(compositionServiceKey, CompositionKt.getCompositionImplServiceKey())) {
            return (T) this;
        }
        return null;
    }

    private final boolean tryImminentInvalidation(RecomposeScopeImpl scope, Object instance) {
        return isComposing() && this.composer.tryImminentInvalidation$runtime_release(scope, instance);
    }

    /* JADX WARN: Removed duplicated region for block: B:73:0x0140 A[Catch: all -> 0x0146, TRY_LEAVE, TryCatch #1 {all -> 0x0146, blocks: (B:36:0x0083, B:38:0x008b, B:40:0x00ac, B:42:0x00b8, B:47:0x00c8, B:73:0x0140, B:55:0x00ef, B:59:0x00fe, B:63:0x0114), top: B:94:0x0066 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final androidx.compose.runtime.InvalidationResult invalidateChecked(androidx.compose.runtime.RecomposeScopeImpl r36, androidx.compose.runtime.Anchor r37, java.lang.Object r38) {
        /*
            Method dump skipped, instructions count: 371
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.runtime.CompositionImpl.invalidateChecked(androidx.compose.runtime.RecomposeScopeImpl, androidx.compose.runtime.Anchor, java.lang.Object):androidx.compose.runtime.InvalidationResult");
    }

    public final void removeObservation$runtime_release(Object instance, RecomposeScopeImpl scope) {
        ScopeMap.m3838removeimpl(this.observations, instance, scope);
    }

    public final void removeDerivedStateObservation$runtime_release(DerivedState<?> derivedState) {
        if (!ScopeMap.m3832containsimpl(this.observations, derivedState)) {
            ScopeMap.m3839removeScopeimpl(this.derivedStates, derivedState);
        }
    }

    /* renamed from: takeInvalidations-afanTW4  reason: not valid java name */
    private final MutableScatterMap<Object, Object> m3675takeInvalidationsafanTW4() {
        MutableScatterMap invalidations = this.invalidations;
        this.invalidations = ScopeMap.m3831constructorimpl$default(null, 1, null);
        return invalidations;
    }

    private final void validateRecomposeScopeAnchors(SlotTable slotTable) {
        SlotTable slotTable2 = slotTable;
        Object[] $this$mapNotNull$iv = slotTable2.getSlots();
        Collection destination$iv$iv = new ArrayList();
        for (Object element$iv$iv$iv : $this$mapNotNull$iv) {
            RecomposeScopeImpl recomposeScopeImpl = element$iv$iv$iv instanceof RecomposeScopeImpl ? (RecomposeScopeImpl) element$iv$iv$iv : null;
            if (recomposeScopeImpl != null) {
                destination$iv$iv.add(recomposeScopeImpl);
            }
        }
        List scopes = (List) destination$iv$iv;
        int index$iv = 0;
        int size = scopes.size();
        while (index$iv < size) {
            Object item$iv = scopes.get(index$iv);
            RecomposeScopeImpl scope = (RecomposeScopeImpl) item$iv;
            Anchor anchor = scope.getAnchor();
            if (anchor != null) {
                boolean value$iv = slotTable2.slotsOf$runtime_release(anchor.toIndexFor(slotTable2)).contains(scope);
                if (!value$iv) {
                    int dataIndex = ArraysKt.indexOf((RecomposeScopeImpl[]) slotTable2.getSlots(), scope);
                    PreconditionsKt.throwIllegalStateException("Misaligned anchor " + anchor + " in scope " + scope + " encountered, scope found at " + dataIndex);
                }
            }
            index$iv++;
            slotTable2 = slotTable;
        }
    }

    private final <T> T trackAbandonedValues(Function0<? extends T> function0) {
        try {
            return function0.invoke();
        } catch (Throwable th) {
            if (0 == 0 && !this.abandonSet.isEmpty()) {
                new RememberEventDispatcher(this.abandonSet).dispatchAbandons();
            }
            throw th;
        }
    }

    private final CompositionObserver observer() {
        CompositionObserverHolder holder = this.observerHolder;
        if (holder.getRoot()) {
            return holder.getObserver();
        }
        CompositionObserverHolder parentHolder = this.parent.getObserverHolder$runtime_release();
        CompositionObserver parentObserver = parentHolder != null ? parentHolder.getObserver() : null;
        if (!Intrinsics.areEqual(parentObserver, holder.getObserver())) {
            holder.setObserver(parentObserver);
        }
        return parentObserver;
    }

    @Override // androidx.compose.runtime.ReusableComposition
    public void deactivate() {
        Object token$iv;
        Object lock$iv = this.lock;
        synchronized (lock$iv) {
            try {
                boolean nonEmptySlotTable = this.slotTable.getGroupsSize() > 0;
                try {
                    try {
                        if (!nonEmptySlotTable) {
                            try {
                                if (this.abandonSet.isEmpty()) {
                                    ScopeMap.m3829clearimpl(this.observations);
                                    ScopeMap.m3829clearimpl(this.derivedStates);
                                    ScopeMap.m3829clearimpl(this.invalidations);
                                    this.changes.clear();
                                    this.lateChanges.clear();
                                    this.composer.deactivate$runtime_release();
                                    Unit unit = Unit.INSTANCE;
                                    return;
                                }
                            } catch (Throwable th) {
                                th = th;
                                throw th;
                            }
                        }
                        RememberEventDispatcher manager = new RememberEventDispatcher(this.abandonSet);
                        if (nonEmptySlotTable) {
                            this.applier.onBeginChanges();
                            SlotTable this_$iv = this.slotTable;
                            SlotWriter writer$iv = this_$iv.openWriter();
                            try {
                                ComposerKt.deactivateCurrentGroup(writer$iv, manager);
                                Unit unit2 = Unit.INSTANCE;
                                writer$iv.close(true);
                                this.applier.onEndChanges();
                                manager.dispatchRememberObservers();
                            } catch (Throwable th2) {
                                th = th2;
                                Trace.INSTANCE.endSection(token$iv);
                                throw th;
                            }
                        }
                        manager.dispatchAbandons();
                        Unit unit3 = Unit.INSTANCE;
                        Trace.INSTANCE.endSection(token$iv);
                        ScopeMap.m3829clearimpl(this.observations);
                        ScopeMap.m3829clearimpl(this.derivedStates);
                        ScopeMap.m3829clearimpl(this.invalidations);
                        this.changes.clear();
                        this.lateChanges.clear();
                        this.composer.deactivate$runtime_release();
                        Unit unit4 = Unit.INSTANCE;
                        return;
                    } catch (Throwable th3) {
                        th = th3;
                    }
                    token$iv = Trace.INSTANCE.beginSection("Compose:deactivate");
                } catch (Throwable th4) {
                    th = th4;
                }
            } catch (Throwable th5) {
                th = th5;
            }
        }
    }

    public final int composerStacksSizes$runtime_release() {
        return this.composer.stacksSize$runtime_release();
    }
}
