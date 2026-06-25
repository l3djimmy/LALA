package androidx.compose.runtime;

import androidx.autofill.HintConstants;
import androidx.collection.MutableObjectList;
import androidx.collection.MutableScatterMap;
import androidx.collection.MutableScatterSet;
import androidx.collection.ObjectList;
import androidx.collection.ObjectListKt;
import androidx.collection.ScatterMap;
import androidx.collection.ScatterMapKt;
import androidx.collection.ScatterSet;
import androidx.collection.ScatterSetKt;
import androidx.compose.runtime.Recomposer;
import androidx.compose.runtime.collection.MultiValueMap;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.runtime.collection.ScatterSetWrapperKt;
import androidx.compose.runtime.external.kotlinx.collections.immutable.ExtensionsKt;
import androidx.compose.runtime.external.kotlinx.collections.immutable.PersistentSet;
import androidx.compose.runtime.internal.SnapshotThreadLocal;
import androidx.compose.runtime.internal.Utils_androidKt;
import androidx.compose.runtime.snapshots.MutableSnapshot;
import androidx.compose.runtime.snapshots.Snapshot;
import androidx.compose.runtime.snapshots.SnapshotApplyResult;
import androidx.compose.runtime.tooling.CompositionData;
import androidx.compose.runtime.tooling.CompositionObserverHandle;
import androidx.compose.runtime.tooling.CompositionRegistrationObserver;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.exifinterface.media.ExifInterface;
import androidx.navigation.compose.ComposeNavigator;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.ReplaceWith;
import kotlin.Result;
import kotlin.TuplesKt;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugProbesKt;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.Sequence;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.CancellableContinuation;
import kotlinx.coroutines.CancellableContinuationImpl;
import kotlinx.coroutines.CompletableJob;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.ExceptionsKt;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.JobKt;
import kotlinx.coroutines.flow.Flow;
import kotlinx.coroutines.flow.FlowKt;
import kotlinx.coroutines.flow.MutableStateFlow;
import kotlinx.coroutines.flow.StateFlow;
import kotlinx.coroutines.flow.StateFlowKt;
/* compiled from: Recomposer.kt */
@Metadata(d1 = {"\u0000Ð\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0010\u0003\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010#\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0017\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\r\b\u0007\u0018\u0000 Ú\u00012\u00020\u0001:\nÚ\u0001Û\u0001Ü\u0001Ý\u0001Þ\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0015\u0010p\u001a\u00020q2\u0006\u0010r\u001a\u00020_H\u0001¢\u0006\u0002\bsJ\u0010\u0010t\u001a\u00020o2\u0006\u0010\u001e\u001a\u00020\u0007H\u0002J\u0010\u0010u\u001a\u00020o2\u0006\u0010v\u001a\u00020wH\u0002J\u0006\u0010x\u001a\u00020yJ\u000e\u0010z\u001a\u00020oH\u0086@¢\u0006\u0002\u0010{J\u000e\u0010|\u001a\u00020oH\u0082@¢\u0006\u0002\u0010{J\u0006\u0010}\u001a\u00020oJ\b\u0010~\u001a\u00020oH\u0002J\u0006\u0010\u007f\u001a\u00020oJ0\u0010\u0080\u0001\u001a\u00020o2\u0006\u0010\u001e\u001a\u00020\u00072\u0014\u0010\u0081\u0001\u001a\u000f\u0012\u0004\u0012\u00020o0\u0082\u0001¢\u0006\u0003\b\u0083\u0001H\u0010¢\u0006\u0006\b\u0084\u0001\u0010\u0085\u0001JA\u0010\u0086\u0001\u001a\t\u0012\u0004\u0012\u00020X0\u0087\u00012\u0006\u0010\u001e\u001a\u00020\u00072\b\u0010\u0088\u0001\u001a\u00030\u0089\u00012\u0014\u0010\u0081\u0001\u001a\u000f\u0012\u0004\u0012\u00020o0\u0082\u0001¢\u0006\u0003\b\u0083\u0001H\u0010¢\u0006\u0006\b\u008a\u0001\u0010\u008b\u0001JB\u0010\u008c\u0001\u001a\u0003H\u008d\u0001\"\u0005\b\u0000\u0010\u008d\u00012\u0006\u0010\u001e\u001a\u00020\u00072\u000f\u0010\u008e\u0001\u001a\n\u0012\u0004\u0012\u00020Q\u0018\u00010W2\u000f\u0010\u008f\u0001\u001a\n\u0012\u0005\u0012\u0003H\u008d\u00010\u0082\u0001H\u0082\b¢\u0006\u0003\u0010\u0090\u0001J\u0018\u0010\u0091\u0001\u001a\u00020o2\u0007\u0010\u0092\u0001\u001a\u00020IH\u0010¢\u0006\u0003\b\u0093\u0001J\u0011\u0010\u0094\u0001\u001a\n\u0012\u0004\u0012\u00020o\u0018\u00010nH\u0002J\t\u0010\u0095\u0001\u001a\u00020oH\u0002J\u0018\u0010\u0096\u0001\u001a\u00020o2\u0007\u0010\u0092\u0001\u001a\u00020IH\u0010¢\u0006\u0003\b\u0097\u0001J\u0017\u0010\u0098\u0001\u001a\u00020o2\u0006\u0010\u001e\u001a\u00020\u0007H\u0010¢\u0006\u0003\b\u0099\u0001J\u0018\u0010\u009a\u0001\u001a\u00020o2\u0007\u0010\u009b\u0001\u001a\u00020XH\u0010¢\u0006\u0003\b\u009c\u0001J\u000f\u0010\u009d\u0001\u001a\u00020oH\u0086@¢\u0006\u0002\u0010{J/\u0010\u009e\u0001\u001a\u00020o2\u0007\u0010\u0092\u0001\u001a\u00020I2\u0007\u0010\u009f\u0001\u001a\u00020T2\f\u0010 \u0001\u001a\u0007\u0012\u0002\b\u00030¡\u0001H\u0010¢\u0006\u0003\b¢\u0001J\u001a\u0010£\u0001\u001a\u0004\u0018\u00010T2\u0007\u0010\u0092\u0001\u001a\u00020IH\u0010¢\u0006\u0003\b¤\u0001J\u0007\u0010¥\u0001\u001a\u00020oJ\u0011\u0010¦\u0001\u001a\u00020o2\u0006\u0010\u001e\u001a\u00020\u0007H\u0002J/\u0010§\u0001\u001a\b\u0012\u0004\u0012\u00020\u00070\t2\r\u0010¨\u0001\u001a\b\u0012\u0004\u0012\u00020I0\t2\u000f\u0010\u008e\u0001\u001a\n\u0012\u0004\u0012\u00020Q\u0018\u00010WH\u0002J$\u0010©\u0001\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u001e\u001a\u00020\u00072\u000f\u0010\u008e\u0001\u001a\n\u0012\u0004\u0012\u00020Q\u0018\u00010WH\u0002J*\u0010ª\u0001\u001a\u00020o2\u0007\u0010«\u0001\u001a\u00020\u00152\u000b\b\u0002\u0010¬\u0001\u001a\u0004\u0018\u00010\u00072\t\b\u0002\u0010\u00ad\u0001\u001a\u00020\u0017H\u0002J\u001e\u0010®\u0001\u001a\u000f\u0012\u0004\u0012\u00020Q\u0012\u0004\u0012\u00020o0¯\u00012\u0006\u0010\u001e\u001a\u00020\u0007H\u0002J8\u0010°\u0001\u001a\t\u0012\u0004\u0012\u00020X0\u0087\u00012\u0006\u0010\u001e\u001a\u00020\u00072\b\u0010\u0088\u0001\u001a\u00030\u0089\u00012\u000e\u0010±\u0001\u001a\t\u0012\u0004\u0012\u00020X0\u0087\u0001H\u0010¢\u0006\u0003\b²\u0001JW\u0010³\u0001\u001a\u00020o2E\u0010\u008f\u0001\u001a@\b\u0001\u0012\u0005\u0012\u00030µ\u0001\u0012\u0017\u0012\u00150¶\u0001¢\u0006\u000f\b·\u0001\u0012\n\b¸\u0001\u0012\u0005\b\b(¹\u0001\u0012\u000b\u0012\t\u0012\u0004\u0012\u00020o0º\u0001\u0012\u0006\u0012\u0004\u0018\u00010Q0´\u0001¢\u0006\u0003\b»\u0001H\u0082@¢\u0006\u0003\u0010¼\u0001J\t\u0010½\u0001\u001a\u00020\u0017H\u0002J \u0010½\u0001\u001a\u00020o2\u0014\u0010¾\u0001\u001a\u000f\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020o0¯\u0001H\u0082\bJ\u0011\u0010¿\u0001\u001a\u00020o2\u0006\u0010\u001e\u001a\u00020\u0007H\u0002J\u001f\u0010À\u0001\u001a\u00020o2\u000e\u0010Á\u0001\u001a\t\u0012\u0005\u0012\u00030Â\u00010&H\u0010¢\u0006\u0003\bÃ\u0001J\u0017\u0010Ä\u0001\u001a\u00020o2\u0006\u0010\u001e\u001a\u00020\u0007H\u0010¢\u0006\u0003\bÅ\u0001J\u0012\u0010Æ\u0001\u001a\u00020o2\u0007\u0010Ç\u0001\u001a\u00020cH\u0002J\u0011\u0010È\u0001\u001a\u00020o2\u0006\u0010\u001e\u001a\u00020\u0007H\u0002J\u0018\u0010É\u0001\u001a\u00020o2\u0007\u0010\u009b\u0001\u001a\u00020XH\u0010¢\u0006\u0003\bÊ\u0001J\u0017\u0010Ë\u0001\u001a\u00020o2\u0006\u0010\u001e\u001a\u00020\u0007H\u0010¢\u0006\u0003\bÌ\u0001J\u000b\u0010Í\u0001\u001a\u0004\u0018\u000105H\u0002J\u0007\u0010Î\u0001\u001a\u00020oJ\t\u0010Ï\u0001\u001a\u00020oH\u0002J$\u0010Ð\u0001\u001a\u00020o2\b\u0010¹\u0001\u001a\u00030¶\u00012\b\u0010Ñ\u0001\u001a\u00030Ò\u0001H\u0082@¢\u0006\u0003\u0010Ó\u0001J\u000f\u0010Ô\u0001\u001a\u00020oH\u0086@¢\u0006\u0002\u0010{J\u0018\u0010Õ\u0001\u001a\u00020o2\u0006\u0010Y\u001a\u00020\u0003H\u0087@¢\u0006\u0003\u0010Ö\u0001J\u0017\u0010×\u0001\u001a\u00020o2\u0006\u0010\u001e\u001a\u00020\u0007H\u0010¢\u0006\u0003\bØ\u0001J/\u0010Ù\u0001\u001a\u000f\u0012\u0004\u0012\u00020Q\u0012\u0004\u0012\u00020o0¯\u00012\u0006\u0010\u001e\u001a\u00020\u00072\u000f\u0010\u008e\u0001\u001a\n\u0012\u0004\u0012\u00020Q\u0018\u00010WH\u0002R\u0014\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010\b\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\n\u001a\b\u0012\u0004\u0012\u00020\f0\u000bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u001e\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u0010@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u0016\u001a\u00020\u00178PX\u0090\u0004¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u0019R\u0014\u0010\u001a\u001a\u00020\u00178PX\u0090\u0004¢\u0006\u0006\u001a\u0004\b\u001b\u0010\u0019R\u0014\u0010\u001c\u001a\u00020\u00178PX\u0090\u0004¢\u0006\u0006\u001a\u0004\b\u001d\u0010\u0019R\u0016\u0010\u001e\u001a\u0004\u0018\u00010\u001f8PX\u0090\u0004¢\u0006\u0006\u001a\u0004\b \u0010!R\u0014\u0010\"\u001a\b\u0012\u0004\u0012\u00020\u00070#X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010$\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010%\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010&X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010'\u001a\u00020(8PX\u0090\u0004¢\u0006\u0006\u001a\u0004\b)\u0010*R\u000e\u0010+\u001a\u00020(X\u0082\u000e¢\u0006\u0002\n\u0000R\u0017\u0010,\u001a\b\u0012\u0004\u0012\u00020\f0-8F¢\u0006\u0006\u001a\u0004\b.\u0010/R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b0\u00101R\u000e\u00102\u001a\u000203X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u00104\u001a\u0004\u0018\u000105X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u00106\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u00107\u001a\u00020\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u00108\u001a\u00020\u00178BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b9\u0010\u0019R\u0014\u0010:\u001a\u00020\u00178BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b;\u0010\u0019R\u0014\u0010<\u001a\u00020\u00178BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b=\u0010\u0019R\u0014\u0010>\u001a\u00020\u00178BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b?\u0010\u0019R\u0011\u0010@\u001a\u00020\u00178F¢\u0006\u0006\u001a\u0004\bA\u0010\u0019R\u0014\u0010B\u001a\u00020\u00178BX\u0082\u0004¢\u0006\u0006\u001a\u0004\bC\u0010\u0019R\u000e\u0010D\u001a\u00020\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010E\u001a\b\u0012\u0004\u0012\u00020\u00070\t8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\bF\u0010GR\u0014\u0010H\u001a\b\u0012\u0004\u0012\u00020I0\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\"\u0010J\u001a\u000e\u0012\u0004\u0012\u00020I\u0012\u0004\u0012\u00020I0KX\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010LR\u000e\u0010M\u001a\u00020NX\u0082\u0004¢\u0006\u0002\n\u0000R*\u0010O\u001a\u0016\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010Q0P\u0012\u0004\u0012\u00020I0KX\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010LR\u001a\u0010R\u001a\u000e\u0012\u0004\u0012\u00020I\u0012\u0004\u0012\u00020T0SX\u0082\u0004¢\u0006\u0002\n\u0000R\u001c\u0010U\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020X\u0018\u00010W0VX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010Y\u001a\u00020\u00038PX\u0090\u0004¢\u0006\u0006\u001a\u0004\bZ\u00101R\u0012\u0010[\u001a\u00060\\R\u00020\u0000X\u0082\u0004¢\u0006\u0002\n\u0000R \u0010]\u001a\n\u0012\u0004\u0012\u00020_\u0018\u00010^8\u0002@\u0002X\u0083\u000e¢\u0006\b\n\u0000\u0012\u0004\b`\u0010aR\u0010\u0010b\u001a\u0004\u0018\u00010cX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010d\u001a\u00020\u00178BX\u0082\u0004¢\u0006\u0006\u001a\u0004\be\u0010\u0019R\u0014\u0010f\u001a\b\u0012\u0004\u0012\u00020Q0WX\u0082\u000e¢\u0006\u0002\n\u0000R \u0010g\u001a\b\u0012\u0004\u0012\u00020\f0h8FX\u0087\u0004¢\u0006\f\u0012\u0004\bi\u0010a\u001a\u0004\bj\u0010kR\u000e\u0010l\u001a\u00020QX\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010m\u001a\n\u0012\u0004\u0012\u00020o\u0018\u00010nX\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006ß\u0001"}, d2 = {"Landroidx/compose/runtime/Recomposer;", "Landroidx/compose/runtime/CompositionContext;", "effectCoroutineContext", "Lkotlin/coroutines/CoroutineContext;", "(Lkotlin/coroutines/CoroutineContext;)V", "_knownCompositions", "", "Landroidx/compose/runtime/ControlledComposition;", "_knownCompositionsCache", "", "_state", "Lkotlinx/coroutines/flow/MutableStateFlow;", "Landroidx/compose/runtime/Recomposer$State;", "broadcastFrameClock", "Landroidx/compose/runtime/BroadcastFrameClock;", "<set-?>", "", "changeCount", "getChangeCount", "()J", "closeCause", "", "collectingCallByInformation", "", "getCollectingCallByInformation$runtime_release", "()Z", "collectingParameterInformation", "getCollectingParameterInformation$runtime_release", "collectingSourceInformation", "getCollectingSourceInformation$runtime_release", "composition", "Landroidx/compose/runtime/Composition;", "getComposition$runtime_release", "()Landroidx/compose/runtime/Composition;", "compositionInvalidations", "Landroidx/compose/runtime/collection/MutableVector;", "compositionsAwaitingApply", "compositionsRemoved", "", "compoundHashKey", "", "getCompoundHashKey$runtime_release", "()I", "concurrentCompositionsOutstanding", "currentState", "Lkotlinx/coroutines/flow/StateFlow;", "getCurrentState", "()Lkotlinx/coroutines/flow/StateFlow;", "getEffectCoroutineContext", "()Lkotlin/coroutines/CoroutineContext;", "effectJob", "Lkotlinx/coroutines/CompletableJob;", "errorState", "Landroidx/compose/runtime/Recomposer$RecomposerErrorState;", "failedCompositions", "frameClockPaused", "hasBroadcastFrameClockAwaiters", "getHasBroadcastFrameClockAwaiters", "hasBroadcastFrameClockAwaitersLocked", "getHasBroadcastFrameClockAwaitersLocked", "hasConcurrentFrameWorkLocked", "getHasConcurrentFrameWorkLocked", "hasFrameWorkLocked", "getHasFrameWorkLocked", "hasPendingWork", "getHasPendingWork", "hasSchedulingWork", "getHasSchedulingWork", "isClosed", "knownCompositions", "getKnownCompositions", "()Ljava/util/List;", "movableContentAwaitingInsert", "Landroidx/compose/runtime/MovableContentStateReference;", "movableContentNestedExtractionsPending", "Landroidx/compose/runtime/collection/MultiValueMap;", "Landroidx/collection/MutableScatterMap;", "movableContentNestedStatesAvailable", "Landroidx/compose/runtime/NestedContentMap;", "movableContentRemoved", "Landroidx/compose/runtime/MovableContent;", "", "movableContentStatesAvailable", "Landroidx/collection/MutableScatterMap;", "Landroidx/compose/runtime/MovableContentState;", "pausedScopes", "Landroidx/compose/runtime/internal/SnapshotThreadLocal;", "Landroidx/collection/MutableScatterSet;", "Landroidx/compose/runtime/RecomposeScopeImpl;", "recomposeCoroutineContext", "getRecomposeCoroutineContext$runtime_release", "recomposerInfo", "Landroidx/compose/runtime/Recomposer$RecomposerInfoImpl;", "registrationObservers", "Landroidx/collection/MutableObjectList;", "Landroidx/compose/runtime/tooling/CompositionRegistrationObserver;", "getRegistrationObservers$annotations", "()V", "runnerJob", "Lkotlinx/coroutines/Job;", "shouldKeepRecomposing", "getShouldKeepRecomposing", "snapshotInvalidations", "state", "Lkotlinx/coroutines/flow/Flow;", "getState$annotations", "getState", "()Lkotlinx/coroutines/flow/Flow;", "stateLock", "workContinuation", "Lkotlinx/coroutines/CancellableContinuation;", "", "addCompositionRegistrationObserver", "Landroidx/compose/runtime/tooling/CompositionObserverHandle;", "observer", "addCompositionRegistrationObserver$runtime_release", "addKnownCompositionLocked", "applyAndCheck", "snapshot", "Landroidx/compose/runtime/snapshots/MutableSnapshot;", "asRecomposerInfo", "Landroidx/compose/runtime/RecomposerInfo;", "awaitIdle", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "awaitWorkAvailable", "cancel", "clearKnownCompositionsLocked", "close", "composeInitial", "content", "Lkotlin/Function0;", "Landroidx/compose/runtime/Composable;", "composeInitial$runtime_release", "(Landroidx/compose/runtime/ControlledComposition;Lkotlin/jvm/functions/Function2;)V", "composeInitialPaused", "Landroidx/collection/ScatterSet;", "shouldPause", "Landroidx/compose/runtime/ShouldPauseCallback;", "composeInitialPaused$runtime_release", "(Landroidx/compose/runtime/ControlledComposition;Landroidx/compose/runtime/ShouldPauseCallback;Lkotlin/jvm/functions/Function2;)Landroidx/collection/ScatterSet;", "composing", ExifInterface.GPS_DIRECTION_TRUE, "modifiedValues", "block", "(Landroidx/compose/runtime/ControlledComposition;Landroidx/collection/MutableScatterSet;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "deletedMovableContent", TypedValues.Custom.S_REFERENCE, "deletedMovableContent$runtime_release", "deriveStateLocked", "discardUnusedMovableContentState", "insertMovableContent", "insertMovableContent$runtime_release", "invalidate", "invalidate$runtime_release", "invalidateScope", "scope", "invalidateScope$runtime_release", "join", "movableContentStateReleased", "data", "applier", "Landroidx/compose/runtime/Applier;", "movableContentStateReleased$runtime_release", "movableContentStateResolve", "movableContentStateResolve$runtime_release", "pauseCompositionFrameClock", "performInitialMovableContentInserts", "performInsertValues", "references", "performRecompose", "processCompositionError", "e", "failedInitialComposition", "recoverable", "readObserverOf", "Lkotlin/Function1;", "recomposePaused", "invalidScopes", "recomposePaused$runtime_release", "recompositionRunner", "Lkotlin/Function3;", "Lkotlinx/coroutines/CoroutineScope;", "Landroidx/compose/runtime/MonotonicFrameClock;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "parentFrameClock", "Lkotlin/coroutines/Continuation;", "Lkotlin/ExtensionFunctionType;", "(Lkotlin/jvm/functions/Function3;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "recordComposerModifications", "onEachInvalidComposition", "recordFailedCompositionLocked", "recordInspectionTable", "table", "Landroidx/compose/runtime/tooling/CompositionData;", "recordInspectionTable$runtime_release", "registerComposition", "registerComposition$runtime_release", "registerRunnerJob", "callingJob", "removeKnownCompositionLocked", "reportPausedScope", "reportPausedScope$runtime_release", "reportRemovedComposition", "reportRemovedComposition$runtime_release", "resetErrorState", "resumeCompositionFrameClock", "retryFailedCompositions", "runFrameLoop", "frameSignal", "Landroidx/compose/runtime/ProduceFrameSignal;", "(Landroidx/compose/runtime/MonotonicFrameClock;Landroidx/compose/runtime/ProduceFrameSignal;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "runRecomposeAndApplyChanges", "runRecomposeConcurrentlyAndApplyChanges", "(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "unregisterComposition", "unregisterComposition$runtime_release", "writeObserverOf", "Companion", "HotReloadable", "RecomposerErrorState", "RecomposerInfoImpl", "State", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class Recomposer extends CompositionContext {
    private List<? extends ControlledComposition> _knownCompositionsCache;
    private long changeCount;
    private Throwable closeCause;
    private Set<ControlledComposition> compositionsRemoved;
    private int concurrentCompositionsOutstanding;
    private final CoroutineContext effectCoroutineContext;
    private final CompletableJob effectJob;
    private RecomposerErrorState errorState;
    private List<ControlledComposition> failedCompositions;
    private boolean frameClockPaused;
    private boolean isClosed;
    private final RecomposerInfoImpl recomposerInfo;
    private MutableObjectList<CompositionRegistrationObserver> registrationObservers;
    private Job runnerJob;
    private CancellableContinuation<? super Unit> workContinuation;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;
    private static final MutableStateFlow<PersistentSet<RecomposerInfoImpl>> _runningRecomposers = StateFlowKt.MutableStateFlow(ExtensionsKt.persistentSetOf());
    private static final AtomicReference<Boolean> _hotReloadEnabled = new AtomicReference<>(false);
    private final BroadcastFrameClock broadcastFrameClock = new BroadcastFrameClock(new Function0<Unit>() { // from class: androidx.compose.runtime.Recomposer$broadcastFrameClock$1
        /* JADX INFO: Access modifiers changed from: package-private */
        {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public /* bridge */ /* synthetic */ Unit invoke() {
            invoke2();
            return Unit.INSTANCE;
        }

        /* renamed from: invoke  reason: avoid collision after fix types in other method */
        public final void invoke2() {
            CancellableContinuation deriveStateLocked;
            MutableStateFlow mutableStateFlow;
            Throwable th;
            Object lock$iv = Recomposer.this.stateLock;
            Recomposer recomposer = Recomposer.this;
            synchronized (lock$iv) {
                deriveStateLocked = recomposer.deriveStateLocked();
                mutableStateFlow = recomposer._state;
                if (((Recomposer.State) mutableStateFlow.getValue()).compareTo(Recomposer.State.ShuttingDown) <= 0) {
                    th = recomposer.closeCause;
                    throw ExceptionsKt.CancellationException("Recomposer shutdown; frame clock awaiter will never resume", th);
                }
            }
            if (deriveStateLocked != null) {
                Result.Companion companion = Result.Companion;
                deriveStateLocked.resumeWith(Result.m7341constructorimpl(Unit.INSTANCE));
            }
        }
    });
    private final Object stateLock = new Object();
    private final List<ControlledComposition> _knownCompositions = new ArrayList();
    private MutableScatterSet<Object> snapshotInvalidations = new MutableScatterSet<>(0, 1, null);
    private final MutableVector<ControlledComposition> compositionInvalidations = new MutableVector<>(new ControlledComposition[16], 0);
    private final List<ControlledComposition> compositionsAwaitingApply = new ArrayList();
    private final List<MovableContentStateReference> movableContentAwaitingInsert = new ArrayList();
    private final MutableScatterMap<Object, Object> movableContentRemoved = MultiValueMap.m3810constructorimpl$default(null, 1, null);
    private final NestedContentMap movableContentNestedStatesAvailable = new NestedContentMap();
    private final MutableScatterMap<MovableContentStateReference, MovableContentState> movableContentStatesAvailable = ScatterMapKt.mutableScatterMapOf();
    private final MutableScatterMap<Object, Object> movableContentNestedExtractionsPending = MultiValueMap.m3810constructorimpl$default(null, 1, null);
    private final MutableStateFlow<State> _state = StateFlowKt.MutableStateFlow(State.Inactive);
    private final SnapshotThreadLocal<MutableScatterSet<RecomposeScopeImpl>> pausedScopes = new SnapshotThreadLocal<>();

    /* compiled from: Recomposer.kt */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\b\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\b¨\u0006\t"}, d2 = {"Landroidx/compose/runtime/Recomposer$State;", "", "(Ljava/lang/String;I)V", "ShutDown", "ShuttingDown", "Inactive", "InactivePendingWork", "Idle", "PendingWork", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public enum State {
        ShutDown,
        ShuttingDown,
        Inactive,
        InactivePendingWork,
        Idle,
        PendingWork;
        
        private static final /* synthetic */ EnumEntries $ENTRIES = EnumEntriesKt.enumEntries($VALUES);

        public static EnumEntries<State> getEntries() {
            return $ENTRIES;
        }
    }

    private static /* synthetic */ void getRegistrationObservers$annotations() {
    }

    @Deprecated(message = "Replaced by currentState as a StateFlow", replaceWith = @ReplaceWith(expression = "currentState", imports = {}))
    public static /* synthetic */ void getState$annotations() {
    }

    public Recomposer(CoroutineContext effectCoroutineContext) {
        CompletableJob $this$effectJob_u24lambda_u241 = JobKt.Job((Job) effectCoroutineContext.get(Job.Key));
        $this$effectJob_u24lambda_u241.invokeOnCompletion(new Function1<Throwable, Unit>() { // from class: androidx.compose.runtime.Recomposer$effectJob$1$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Throwable th) {
                invoke2(th);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(final Throwable throwable) {
                Job runnerJob;
                MutableStateFlow mutableStateFlow;
                MutableStateFlow mutableStateFlow2;
                boolean z;
                CancellableContinuation cancellableContinuation;
                Object obj;
                CancellationException cancellation = ExceptionsKt.CancellationException("Recomposer effect job completed", throwable);
                Object continuationToResume = null;
                Object lock$iv = Recomposer.this.stateLock;
                final Recomposer recomposer = Recomposer.this;
                synchronized (lock$iv) {
                    runnerJob = recomposer.runnerJob;
                    if (runnerJob != null) {
                        mutableStateFlow2 = recomposer._state;
                        mutableStateFlow2.setValue(Recomposer.State.ShuttingDown);
                        z = recomposer.isClosed;
                        if (z) {
                            cancellableContinuation = recomposer.workContinuation;
                            if (cancellableContinuation != null) {
                                obj = recomposer.workContinuation;
                                continuationToResume = obj;
                            }
                        } else {
                            runnerJob.cancel(cancellation);
                        }
                        recomposer.workContinuation = null;
                        runnerJob.invokeOnCompletion(new Function1<Throwable, Unit>() { // from class: androidx.compose.runtime.Recomposer$effectJob$1$1$1$1
                            /* JADX INFO: Access modifiers changed from: package-private */
                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            {
                                super(1);
                            }

                            @Override // kotlin.jvm.functions.Function1
                            public /* bridge */ /* synthetic */ Unit invoke(Throwable th) {
                                invoke2(th);
                                return Unit.INSTANCE;
                            }

                            /* renamed from: invoke  reason: avoid collision after fix types in other method */
                            public final void invoke2(Throwable runnerJobCause) {
                                MutableStateFlow mutableStateFlow3;
                                Object lock$iv2 = Recomposer.this.stateLock;
                                Recomposer recomposer2 = Recomposer.this;
                                Throwable $this$invoke_u24lambda_u243_u24lambda_u242 = throwable;
                                synchronized (lock$iv2) {
                                    if ($this$invoke_u24lambda_u243_u24lambda_u242 == null) {
                                        $this$invoke_u24lambda_u243_u24lambda_u242 = null;
                                    } else if (runnerJobCause != null) {
                                        Throwable it = runnerJobCause instanceof CancellationException ? null : runnerJobCause;
                                        if (it != null) {
                                            kotlin.ExceptionsKt.addSuppressed($this$invoke_u24lambda_u243_u24lambda_u242, it);
                                        }
                                    }
                                    recomposer2.closeCause = $this$invoke_u24lambda_u243_u24lambda_u242;
                                    mutableStateFlow3 = recomposer2._state;
                                    mutableStateFlow3.setValue(Recomposer.State.ShutDown);
                                    Unit unit = Unit.INSTANCE;
                                }
                            }
                        });
                    } else {
                        recomposer.closeCause = cancellation;
                        mutableStateFlow = recomposer._state;
                        mutableStateFlow.setValue(Recomposer.State.ShutDown);
                        Unit unit = Unit.INSTANCE;
                    }
                }
                if (continuationToResume != null) {
                    Result.Companion companion = Result.Companion;
                    ((Continuation) continuationToResume).resumeWith(Result.m7341constructorimpl(Unit.INSTANCE));
                }
            }
        });
        this.effectJob = $this$effectJob_u24lambda_u241;
        this.effectCoroutineContext = effectCoroutineContext.plus(this.broadcastFrameClock).plus(this.effectJob);
        this.recomposerInfo = new RecomposerInfoImpl();
    }

    public final long getChangeCount() {
        return this.changeCount;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final List<ControlledComposition> getKnownCompositions() {
        List list = this._knownCompositionsCache;
        if (list == null) {
            Recomposer $this$_get_knownCompositions__u24lambda_u240 = this;
            List compositions = $this$_get_knownCompositions__u24lambda_u240._knownCompositions;
            List newCache = compositions.isEmpty() ? CollectionsKt.emptyList() : new ArrayList(compositions);
            $this$_get_knownCompositions__u24lambda_u240._knownCompositionsCache = newCache;
            return newCache;
        }
        return list;
    }

    @Override // androidx.compose.runtime.CompositionContext
    public CoroutineContext getEffectCoroutineContext() {
        return this.effectCoroutineContext;
    }

    @Override // androidx.compose.runtime.CompositionContext
    public CoroutineContext getRecomposeCoroutineContext$runtime_release() {
        return EmptyCoroutineContext.INSTANCE;
    }

    private final boolean getHasBroadcastFrameClockAwaitersLocked() {
        return !this.frameClockPaused && this.broadcastFrameClock.getHasAwaiters();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean getHasBroadcastFrameClockAwaiters() {
        boolean hasBroadcastFrameClockAwaitersLocked;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            hasBroadcastFrameClockAwaitersLocked = getHasBroadcastFrameClockAwaitersLocked();
        }
        return hasBroadcastFrameClockAwaitersLocked;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final CancellableContinuation<Unit> deriveStateLocked() {
        State newState;
        if (this._state.getValue().compareTo(State.ShuttingDown) <= 0) {
            clearKnownCompositionsLocked();
            this.snapshotInvalidations = new MutableScatterSet<>(0, 1, null);
            this.compositionInvalidations.clear();
            this.compositionsAwaitingApply.clear();
            this.movableContentAwaitingInsert.clear();
            this.failedCompositions = null;
            CancellableContinuation<? super Unit> cancellableContinuation = this.workContinuation;
            if (cancellableContinuation != null) {
                CancellableContinuation.DefaultImpls.cancel$default(cancellableContinuation, null, 1, null);
            }
            this.workContinuation = null;
            this.errorState = null;
            return null;
        }
        if (this.errorState != null) {
            newState = State.Inactive;
        } else if (this.runnerJob == null) {
            this.snapshotInvalidations = new MutableScatterSet<>(0, 1, null);
            this.compositionInvalidations.clear();
            newState = getHasBroadcastFrameClockAwaitersLocked() ? State.InactivePendingWork : State.Inactive;
        } else {
            MutableVector this_$iv = this.compositionInvalidations;
            if ((this_$iv.getSize() != 0) || this.snapshotInvalidations.isNotEmpty() || !this.compositionsAwaitingApply.isEmpty() || !this.movableContentAwaitingInsert.isEmpty() || this.concurrentCompositionsOutstanding > 0 || getHasBroadcastFrameClockAwaitersLocked()) {
                newState = State.PendingWork;
            } else {
                newState = State.Idle;
            }
        }
        this._state.setValue(newState);
        if (newState == State.PendingWork) {
            CancellableContinuation cancellableContinuation2 = this.workContinuation;
            this.workContinuation = null;
            return cancellableContinuation2;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean getShouldKeepRecomposing() {
        boolean z;
        Sequence $this$any$iv;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            z = this.isClosed;
        }
        if (z) {
            Sequence $this$any$iv2 = this.effectJob.getChildren();
            Iterator<Job> it = $this$any$iv2.iterator();
            while (true) {
                if (!it.hasNext()) {
                    $this$any$iv = null;
                    break;
                }
                Object element$iv = it.next();
                Job it2 = (Job) element$iv;
                if (it2.isActive()) {
                    $this$any$iv = 1;
                    break;
                }
            }
            return $this$any$iv != null;
        }
        return true;
    }

    public final Flow<State> getState() {
        return getCurrentState();
    }

    public final StateFlow<State> getCurrentState() {
        return this._state;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: Recomposer.kt */
    @Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\b\u0082\u0004\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u000e\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0017J\b\u0010\u0018\u001a\u0004\u0018\u00010\u0019J\u0006\u0010\u001a\u001a\u00020\u0015J\f\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u001d0\u001cR\u0014\u0010\u0003\u001a\u00020\u00048VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0005\u0010\u0006R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b8F¢\u0006\u0006\u001a\u0004\b\t\u0010\nR\u0014\u0010\u000b\u001a\u00020\f8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\r\u0010\u000eR\u001a\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00110\u00108VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u001e"}, d2 = {"Landroidx/compose/runtime/Recomposer$RecomposerInfoImpl;", "Landroidx/compose/runtime/RecomposerInfo;", "(Landroidx/compose/runtime/Recomposer;)V", "changeCount", "", "getChangeCount", "()J", "currentError", "Landroidx/compose/runtime/RecomposerErrorInfo;", "getCurrentError", "()Landroidx/compose/runtime/RecomposerErrorInfo;", "hasPendingWork", "", "getHasPendingWork", "()Z", "state", "Lkotlinx/coroutines/flow/Flow;", "Landroidx/compose/runtime/Recomposer$State;", "getState", "()Lkotlinx/coroutines/flow/Flow;", "invalidateGroupsWithKey", "", "key", "", "resetErrorState", "Landroidx/compose/runtime/Recomposer$RecomposerErrorState;", "retryFailedCompositions", "saveStateAndDisposeForHotReload", "", "Landroidx/compose/runtime/Recomposer$HotReloadable;", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public final class RecomposerInfoImpl implements RecomposerInfo {
        public RecomposerInfoImpl() {
        }

        @Override // androidx.compose.runtime.RecomposerInfo
        public Flow<State> getState() {
            return Recomposer.this.getCurrentState();
        }

        @Override // androidx.compose.runtime.RecomposerInfo
        public boolean getHasPendingWork() {
            return Recomposer.this.getHasPendingWork();
        }

        @Override // androidx.compose.runtime.RecomposerInfo
        public long getChangeCount() {
            return Recomposer.this.getChangeCount();
        }

        public final RecomposerErrorInfo getCurrentError() {
            RecomposerErrorState recomposerErrorState;
            Object lock$iv = Recomposer.this.stateLock;
            Recomposer recomposer = Recomposer.this;
            synchronized (lock$iv) {
                recomposerErrorState = recomposer.errorState;
            }
            return recomposerErrorState;
        }

        public final void invalidateGroupsWithKey(int key) {
            List compositions;
            Object lock$iv = Recomposer.this.stateLock;
            Recomposer recomposer = Recomposer.this;
            synchronized (lock$iv) {
                compositions = recomposer.getKnownCompositions();
            }
            List target$iv = new ArrayList(compositions.size());
            int size = compositions.size();
            for (int index$iv$iv = 0; index$iv$iv < size; index$iv$iv++) {
                Object item$iv$iv = compositions.get(index$iv$iv);
                ControlledComposition it = (ControlledComposition) item$iv$iv;
                CompositionImpl compositionImpl = it instanceof CompositionImpl ? (CompositionImpl) it : null;
                if (compositionImpl != null) {
                    target$iv.add(compositionImpl);
                }
            }
            List $this$fastForEach$iv = target$iv;
            int size2 = $this$fastForEach$iv.size();
            for (int index$iv = 0; index$iv < size2; index$iv++) {
                Object item$iv = $this$fastForEach$iv.get(index$iv);
                ((CompositionImpl) item$iv).invalidateGroupsWithKey(key);
            }
        }

        public final List<HotReloadable> saveStateAndDisposeForHotReload() {
            List compositions;
            Object lock$iv = Recomposer.this.stateLock;
            Recomposer recomposer = Recomposer.this;
            synchronized (lock$iv) {
                compositions = recomposer.getKnownCompositions();
            }
            List target$iv = new ArrayList(compositions.size());
            int size = compositions.size();
            for (int index$iv$iv = 0; index$iv$iv < size; index$iv$iv++) {
                Object item$iv$iv = compositions.get(index$iv$iv);
                ControlledComposition it = (ControlledComposition) item$iv$iv;
                CompositionImpl compositionImpl = it instanceof CompositionImpl ? (CompositionImpl) it : null;
                if (compositionImpl != null) {
                    target$iv.add(compositionImpl);
                }
            }
            List $this$fastMap$iv = target$iv;
            List target$iv2 = new ArrayList($this$fastMap$iv.size());
            int size2 = $this$fastMap$iv.size();
            for (int index$iv$iv2 = 0; index$iv$iv2 < size2; index$iv$iv2++) {
                Object item$iv$iv2 = $this$fastMap$iv.get(index$iv$iv2);
                HotReloadable $this$saveStateAndDisposeForHotReload_u24lambda_u247_u24lambda_u246 = new HotReloadable((CompositionImpl) item$iv$iv2);
                $this$saveStateAndDisposeForHotReload_u24lambda_u247_u24lambda_u246.clearContent();
                target$iv2.add($this$saveStateAndDisposeForHotReload_u24lambda_u247_u24lambda_u246);
            }
            return target$iv2;
        }

        public final RecomposerErrorState resetErrorState() {
            return Recomposer.this.resetErrorState();
        }

        public final void retryFailedCompositions() {
            Recomposer.this.retryFailedCompositions();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: Recomposer.kt */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0002\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0006\u0010\n\u001a\u00020\u0007J\u0006\u0010\u000b\u001a\u00020\u0007J\u0006\u0010\f\u001a\u00020\u0007R\u001b\u0010\u0005\u001a\r\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\u0002\b\bX\u0082\u000e¢\u0006\u0004\n\u0002\u0010\tR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\r"}, d2 = {"Landroidx/compose/runtime/Recomposer$HotReloadable;", "", "composition", "Landroidx/compose/runtime/CompositionImpl;", "(Landroidx/compose/runtime/CompositionImpl;)V", ComposeNavigator.NAME, "Lkotlin/Function0;", "", "Landroidx/compose/runtime/Composable;", "Lkotlin/jvm/functions/Function2;", "clearContent", "recompose", "resetContent", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class HotReloadable {
        private Function2<? super Composer, ? super Integer, Unit> composable;
        private final CompositionImpl composition;

        public HotReloadable(CompositionImpl composition) {
            this.composition = composition;
            this.composable = this.composition.getComposable();
        }

        public final void clearContent() {
            if (this.composition.isRoot()) {
                this.composition.setContent(ComposableSingletons$RecomposerKt.INSTANCE.m3669getLambda1$runtime_release());
            }
        }

        public final void resetContent() {
            this.composition.setComposable(this.composable);
        }

        public final void recompose() {
            if (this.composition.isRoot()) {
                this.composition.setContent(this.composable);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: Recomposer.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0003\n\u0002\b\u0006\b\u0002\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\u000b"}, d2 = {"Landroidx/compose/runtime/Recomposer$RecomposerErrorState;", "Landroidx/compose/runtime/RecomposerErrorInfo;", "recoverable", "", "cause", "", "(ZLjava/lang/Throwable;)V", "getCause", "()Ljava/lang/Throwable;", "getRecoverable", "()Z", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class RecomposerErrorState implements RecomposerErrorInfo {
        private final Throwable cause;
        private final boolean recoverable;

        public RecomposerErrorState(boolean recoverable, Throwable cause) {
            this.recoverable = recoverable;
            this.cause = cause;
        }

        @Override // androidx.compose.runtime.RecomposerErrorInfo
        public boolean getRecoverable() {
            return this.recoverable;
        }

        @Override // androidx.compose.runtime.RecomposerErrorInfo
        public Throwable getCause() {
            return this.cause;
        }
    }

    public final RecomposerInfo asRecomposerInfo() {
        return this.recomposerInfo;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean recordComposerModifications() {
        List compositions;
        boolean hasFrameWorkLocked;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            if (this.snapshotInvalidations.isEmpty()) {
                return getHasFrameWorkLocked();
            }
            Set changes = ScatterSetWrapperKt.wrapIntoSet(this.snapshotInvalidations);
            this.snapshotInvalidations = new MutableScatterSet<>(0, 1, null);
            Object lock$iv2 = this.stateLock;
            synchronized (lock$iv2) {
                compositions = getKnownCompositions();
            }
            try {
                Recomposer $this$recordComposerModifications_u24lambda_u2410 = this;
                int size = compositions.size();
                for (int index$iv = 0; index$iv < size; index$iv++) {
                    Object item$iv = compositions.get(index$iv);
                    ControlledComposition composition = (ControlledComposition) item$iv;
                    composition.recordModificationsOf(changes);
                    if ($this$recordComposerModifications_u24lambda_u2410._state.getValue().compareTo(State.ShuttingDown) <= 0) {
                        break;
                    }
                }
                Object lock$iv3 = this.stateLock;
                synchronized (lock$iv3) {
                    this.snapshotInvalidations = new MutableScatterSet<>(0, 1, null);
                    Unit unit = Unit.INSTANCE;
                }
                Object lock$iv4 = this.stateLock;
                synchronized (lock$iv4) {
                    if (deriveStateLocked() != null) {
                        throw new IllegalStateException("called outside of runRecomposeAndApplyChanges".toString());
                    }
                    hasFrameWorkLocked = getHasFrameWorkLocked();
                }
                return hasFrameWorkLocked;
            } catch (Throwable th) {
                synchronized (this.stateLock) {
                    this.snapshotInvalidations.addAll(changes);
                    throw th;
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private final void recordComposerModifications(Function1<? super ControlledComposition, Unit> function1) {
        MutableScatterSet it;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            it = this.snapshotInvalidations;
            if (it.isNotEmpty()) {
                this.snapshotInvalidations = new MutableScatterSet(0, 1, null);
            }
        }
        Set changes = ScatterSetWrapperKt.wrapIntoSet(it);
        if (!changes.isEmpty()) {
            List $this$fastForEach$iv = getKnownCompositions();
            int size = $this$fastForEach$iv.size();
            for (int index$iv = 0; index$iv < size; index$iv++) {
                Object item$iv = $this$fastForEach$iv.get(index$iv);
                ControlledComposition composition = (ControlledComposition) item$iv;
                composition.recordModificationsOf(changes);
            }
        }
        MutableVector this_$iv = this.compositionInvalidations;
        Object[] content$iv = this_$iv.content;
        int size$iv = this_$iv.getSize();
        for (int i$iv = 0; i$iv < size$iv; i$iv++) {
            function1.invoke(content$iv[i$iv]);
        }
        this.compositionInvalidations.clear();
        Object lock$iv2 = this.stateLock;
        synchronized (lock$iv2) {
            if (deriveStateLocked() != null) {
                throw new IllegalStateException("called outside of runRecomposeAndApplyChanges".toString());
            }
            Unit unit = Unit.INSTANCE;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void registerRunnerJob(Job callingJob) {
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            Throwable it = this.closeCause;
            if (it != null) {
                throw it;
            }
            if (this._state.getValue().compareTo(State.ShuttingDown) <= 0) {
                throw new IllegalStateException("Recomposer shut down".toString());
            }
            if (this.runnerJob != null) {
                throw new IllegalStateException("Recomposer already running".toString());
            }
            this.runnerJob = callingJob;
            deriveStateLocked();
        }
    }

    public final Object runRecomposeAndApplyChanges(Continuation<? super Unit> continuation) {
        Object recompositionRunner = recompositionRunner(new Recomposer$runRecomposeAndApplyChanges$2(this, null), continuation);
        return recompositionRunner == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? recompositionRunner : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void processCompositionError$default(Recomposer recomposer, Throwable th, ControlledComposition controlledComposition, boolean z, int i, Object obj) {
        if ((i & 2) != 0) {
            controlledComposition = null;
        }
        if ((i & 4) != 0) {
            z = false;
        }
        recomposer.processCompositionError(th, controlledComposition, z);
    }

    private final void processCompositionError(Throwable e, ControlledComposition failedInitialComposition, boolean recoverable) {
        if (_hotReloadEnabled.get().booleanValue() && !(e instanceof ComposeRuntimeError)) {
            Object lock$iv = this.stateLock;
            synchronized (lock$iv) {
                Utils_androidKt.logError("Error was captured in composition while live edit was enabled.", e);
                this.compositionsAwaitingApply.clear();
                this.compositionInvalidations.clear();
                this.snapshotInvalidations = new MutableScatterSet<>(0, 1, null);
                this.movableContentAwaitingInsert.clear();
                MultiValueMap.m3808clearimpl(this.movableContentRemoved);
                this.movableContentStatesAvailable.clear();
                this.errorState = new RecomposerErrorState(recoverable, e);
                if (failedInitialComposition != null) {
                    recordFailedCompositionLocked(failedInitialComposition);
                }
                deriveStateLocked();
            }
            return;
        }
        Object lock$iv2 = this.stateLock;
        synchronized (lock$iv2) {
            RecomposerErrorState errorState = this.errorState;
            if (errorState == null) {
                this.errorState = new RecomposerErrorState(false, e);
                Unit unit = Unit.INSTANCE;
            } else {
                throw errorState.getCause();
            }
        }
        throw e;
    }

    private final void clearKnownCompositionsLocked() {
        ObjectList objectList = this.registrationObservers;
        if (objectList != null) {
            ObjectList this_$iv = objectList;
            Object[] content$iv = this_$iv.content;
            int i = this_$iv._size;
            for (int i$iv = 0; i$iv < i; i$iv++) {
                CompositionRegistrationObserver observer = (CompositionRegistrationObserver) content$iv[i$iv];
                Iterable $this$forEach$iv = getKnownCompositions();
                for (Object element$iv : $this$forEach$iv) {
                    ControlledComposition composition = (ControlledComposition) element$iv;
                    observer.onCompositionUnregistered(this, composition);
                }
            }
        }
        this._knownCompositions.clear();
        this._knownCompositionsCache = CollectionsKt.emptyList();
    }

    private final void removeKnownCompositionLocked(ControlledComposition composition) {
        if (this._knownCompositions.remove(composition)) {
            this._knownCompositionsCache = null;
            ObjectList objectList = this.registrationObservers;
            if (objectList == null) {
                return;
            }
            ObjectList this_$iv = objectList;
            Object[] content$iv = this_$iv.content;
            int i = this_$iv._size;
            for (int i$iv = 0; i$iv < i; i$iv++) {
                CompositionRegistrationObserver it = (CompositionRegistrationObserver) content$iv[i$iv];
                it.onCompositionUnregistered(this, composition);
            }
        }
    }

    private final void addKnownCompositionLocked(ControlledComposition composition) {
        this._knownCompositions.add(composition);
        this._knownCompositionsCache = null;
        ObjectList objectList = this.registrationObservers;
        if (objectList == null) {
            return;
        }
        ObjectList this_$iv = objectList;
        Object[] content$iv = this_$iv.content;
        int i = this_$iv._size;
        for (int i$iv = 0; i$iv < i; i$iv++) {
            CompositionRegistrationObserver it = (CompositionRegistrationObserver) content$iv[i$iv];
            it.onCompositionRegistered(this, composition);
        }
    }

    public final CompositionObserverHandle addCompositionRegistrationObserver$runtime_release(final CompositionRegistrationObserver observer) {
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            MutableObjectList it = this.registrationObservers;
            if (it == null) {
                it = new MutableObjectList(0, 1, null);
                this.registrationObservers = it;
            }
            MutableObjectList this_$iv = it;
            this_$iv.add(observer);
            List $this$fastForEach$iv = this._knownCompositions;
            int size = $this$fastForEach$iv.size();
            for (int index$iv = 0; index$iv < size; index$iv++) {
                Object item$iv = $this$fastForEach$iv.get(index$iv);
                ControlledComposition composition = (ControlledComposition) item$iv;
                observer.onCompositionRegistered(this, composition);
            }
            Unit unit = Unit.INSTANCE;
        }
        return new CompositionObserverHandle() { // from class: androidx.compose.runtime.Recomposer$addCompositionRegistrationObserver$2
            @Override // androidx.compose.runtime.tooling.CompositionObserverHandle
            public void dispose() {
                MutableObjectList mutableObjectList;
                Object lock$iv2 = Recomposer.this.stateLock;
                Recomposer recomposer = Recomposer.this;
                CompositionRegistrationObserver compositionRegistrationObserver = observer;
                synchronized (lock$iv2) {
                    mutableObjectList = recomposer.registrationObservers;
                    if (mutableObjectList != null) {
                        Boolean.valueOf(mutableObjectList.remove(compositionRegistrationObserver));
                    }
                }
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final RecomposerErrorState resetErrorState() {
        RecomposerErrorState error;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            error = this.errorState;
            if (error != null) {
                this.errorState = null;
                deriveStateLocked();
            }
        }
        return error;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void retryFailedCompositions() {
        List compositionsToRetry;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            compositionsToRetry = this.failedCompositions;
            this.failedCompositions = null;
        }
        if (compositionsToRetry == null) {
            return;
        }
        while (!compositionsToRetry.isEmpty()) {
            try {
                ControlledComposition composition = (ControlledComposition) CollectionsKt.removeLast(compositionsToRetry);
                if (composition instanceof CompositionImpl) {
                    composition.invalidateAll();
                    composition.setContent(((CompositionImpl) composition).getComposable());
                    if (this.errorState != null) {
                        break;
                    }
                }
            } catch (Throwable th) {
                if (!compositionsToRetry.isEmpty()) {
                    synchronized (this.stateLock) {
                        int size = compositionsToRetry.size();
                        for (int index$iv = 0; index$iv < size; index$iv++) {
                            Object item$iv = compositionsToRetry.get(index$iv);
                            ControlledComposition it = (ControlledComposition) item$iv;
                            recordFailedCompositionLocked(it);
                        }
                        Unit unit = Unit.INSTANCE;
                    }
                }
                throw th;
            }
        }
        if (compositionsToRetry.isEmpty()) {
            return;
        }
        Object lock$iv2 = this.stateLock;
        synchronized (lock$iv2) {
            int size2 = compositionsToRetry.size();
            for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
                Object item$iv2 = compositionsToRetry.get(index$iv2);
                ControlledComposition it2 = (ControlledComposition) item$iv2;
                recordFailedCompositionLocked(it2);
            }
            Unit unit2 = Unit.INSTANCE;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void recordFailedCompositionLocked(ControlledComposition composition) {
        List it = this.failedCompositions;
        if (it == null) {
            it = new ArrayList();
            this.failedCompositions = it;
        }
        if (!it.contains(composition)) {
            it.add(composition);
        }
        removeKnownCompositionLocked(composition);
    }

    public final Object runRecomposeConcurrentlyAndApplyChanges(CoroutineContext recomposeCoroutineContext, Continuation<? super Unit> continuation) {
        Object recompositionRunner = recompositionRunner(new Recomposer$runRecomposeConcurrentlyAndApplyChanges$2(recomposeCoroutineContext, this, null), continuation);
        return recompositionRunner == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? recompositionRunner : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002c  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x008b A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:18:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x00ac A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x00ad  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x00ad -> B:15:0x0075). Please submit an issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object runFrameLoop(androidx.compose.runtime.MonotonicFrameClock r10, androidx.compose.runtime.ProduceFrameSignal r11, kotlin.coroutines.Continuation<? super kotlin.Unit> r12) {
        /*
            r9 = this;
            boolean r0 = r12 instanceof androidx.compose.runtime.Recomposer$runFrameLoop$1
            if (r0 == 0) goto L14
            r0 = r12
            androidx.compose.runtime.Recomposer$runFrameLoop$1 r0 = (androidx.compose.runtime.Recomposer$runFrameLoop$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.runtime.Recomposer$runFrameLoop$1 r0 = new androidx.compose.runtime.Recomposer$runFrameLoop$1
            r0.<init>(r9, r12)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L63;
                case 1: goto L4b;
                case 2: goto L2c;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r10 = new java.lang.IllegalStateException
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            r10.<init>(r11)
            throw r10
        L2c:
            java.lang.Object r10 = r0.L$4
            java.util.List r10 = (java.util.List) r10
            java.lang.Object r11 = r0.L$3
            java.util.List r11 = (java.util.List) r11
            java.lang.Object r3 = r0.L$2
            androidx.compose.runtime.ProduceFrameSignal r3 = (androidx.compose.runtime.ProduceFrameSignal) r3
            java.lang.Object r4 = r0.L$1
            androidx.compose.runtime.MonotonicFrameClock r4 = (androidx.compose.runtime.MonotonicFrameClock) r4
            java.lang.Object r5 = r0.L$0
            androidx.compose.runtime.Recomposer r5 = (androidx.compose.runtime.Recomposer) r5
            kotlin.ResultKt.throwOnFailure(r1)
            r8 = r5
            r5 = r10
            r10 = r4
            r4 = r11
            r11 = r3
            r3 = r8
            goto Lb3
        L4b:
            java.lang.Object r10 = r0.L$4
            java.util.List r10 = (java.util.List) r10
            java.lang.Object r11 = r0.L$3
            java.util.List r11 = (java.util.List) r11
            java.lang.Object r3 = r0.L$2
            androidx.compose.runtime.ProduceFrameSignal r3 = (androidx.compose.runtime.ProduceFrameSignal) r3
            java.lang.Object r4 = r0.L$1
            androidx.compose.runtime.MonotonicFrameClock r4 = (androidx.compose.runtime.MonotonicFrameClock) r4
            java.lang.Object r5 = r0.L$0
            androidx.compose.runtime.Recomposer r5 = (androidx.compose.runtime.Recomposer) r5
            kotlin.ResultKt.throwOnFailure(r1)
            goto L92
        L63:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r9
            java.util.ArrayList r4 = new java.util.ArrayList
            r4.<init>()
            java.util.List r4 = (java.util.List) r4
            java.util.ArrayList r5 = new java.util.ArrayList
            r5.<init>()
            java.util.List r5 = (java.util.List) r5
        L75:
            java.lang.Object r6 = r3.stateLock
            r0.L$0 = r3
            r0.L$1 = r10
            r0.L$2 = r11
            r0.L$3 = r4
            r0.L$4 = r5
            r7 = 1
            r0.label = r7
            java.lang.Object r6 = r11.awaitFrameRequest(r6, r0)
            if (r6 != r2) goto L8c
            return r2
        L8c:
            r8 = r4
            r4 = r10
            r10 = r5
            r5 = r3
            r3 = r11
            r11 = r8
        L92:
            androidx.compose.runtime.Recomposer$runFrameLoop$2 r6 = new androidx.compose.runtime.Recomposer$runFrameLoop$2
            r6.<init>()
            kotlin.jvm.functions.Function1 r6 = (kotlin.jvm.functions.Function1) r6
            r0.L$0 = r5
            r0.L$1 = r4
            r0.L$2 = r3
            r0.L$3 = r11
            r0.L$4 = r10
            r7 = 2
            r0.label = r7
            java.lang.Object r6 = r4.withFrameNanos(r6, r0)
            if (r6 != r2) goto Lad
            return r2
        Lad:
            r8 = r5
            r5 = r10
            r10 = r4
            r4 = r11
            r11 = r3
            r3 = r8
        Lb3:
            goto L75
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.runtime.Recomposer.runFrameLoop(androidx.compose.runtime.MonotonicFrameClock, androidx.compose.runtime.ProduceFrameSignal, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean getHasSchedulingWork() {
        boolean z;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            z = true;
            if (!this.snapshotInvalidations.isNotEmpty()) {
                MutableVector this_$iv = this.compositionInvalidations;
                MutableVector this_$iv2 = this_$iv.getSize() != 0 ? 1 : null;
                if (this_$iv2 == null) {
                    if (!getHasBroadcastFrameClockAwaitersLocked()) {
                        z = false;
                    }
                }
            }
        }
        return z;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object awaitWorkAvailable(Continuation<? super Unit> continuation) {
        CancellableContinuation cancellableContinuation;
        if (getHasSchedulingWork()) {
            return Unit.INSTANCE;
        }
        CancellableContinuationImpl cancellable$iv = new CancellableContinuationImpl(IntrinsicsKt.intercepted(continuation), 1);
        cancellable$iv.initCancellability();
        CancellableContinuationImpl co = cancellable$iv;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            if (!getHasSchedulingWork()) {
                this.workContinuation = co;
                cancellableContinuation = null;
            } else {
                cancellableContinuation = co;
            }
        }
        if (cancellableContinuation != null) {
            Result.Companion companion = Result.Companion;
            cancellableContinuation.resumeWith(Result.m7341constructorimpl(Unit.INSTANCE));
        }
        Object result = cancellable$iv.getResult();
        if (result == IntrinsicsKt.getCOROUTINE_SUSPENDED()) {
            DebugProbesKt.probeCoroutineSuspended(continuation);
        }
        return result == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? result : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object recompositionRunner(Function3<? super CoroutineScope, ? super MonotonicFrameClock, ? super Continuation<? super Unit>, ? extends Object> function3, Continuation<? super Unit> continuation) {
        MonotonicFrameClock parentFrameClock = MonotonicFrameClockKt.getMonotonicFrameClock(continuation.getContext());
        Object withContext = BuildersKt.withContext(this.broadcastFrameClock, new Recomposer$recompositionRunner$2(this, function3, parentFrameClock, null), continuation);
        return withContext == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? withContext : Unit.INSTANCE;
    }

    public final void cancel() {
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            if (this._state.getValue().compareTo(State.Idle) >= 0) {
                this._state.setValue(State.ShuttingDown);
            }
            Unit unit = Unit.INSTANCE;
        }
        Job.DefaultImpls.cancel$default((Job) ((Job) this.effectJob), (CancellationException) null, 1, (Object) null);
    }

    public final void close() {
        if (this.effectJob.complete()) {
            Object lock$iv = this.stateLock;
            synchronized (lock$iv) {
                this.isClosed = true;
                Unit unit = Unit.INSTANCE;
            }
        }
    }

    public final Object join(Continuation<? super Unit> continuation) {
        Object first = FlowKt.first(getCurrentState(), new Recomposer$join$2(null), continuation);
        return first == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? first : Unit.INSTANCE;
    }

    @Override // androidx.compose.runtime.CompositionContext
    public void composeInitial$runtime_release(ControlledComposition composition, Function2<? super Composer, ? super Integer, Unit> function2) {
        boolean composerWasComposing = composition.isComposing();
        try {
            MutableSnapshot snapshot$iv = Snapshot.Companion.takeMutableSnapshot(readObserverOf(composition), writeObserverOf(composition, null));
            MutableSnapshot this_$iv$iv = snapshot$iv;
            Snapshot previous$iv$iv = this_$iv$iv.makeCurrent();
            composition.composeContent(function2);
            Unit unit = Unit.INSTANCE;
            this_$iv$iv.restoreCurrent(previous$iv$iv);
            applyAndCheck(snapshot$iv);
            if (!composerWasComposing) {
                Snapshot.Companion.notifyObjectsInitialized();
            }
            Object lock$iv = this.stateLock;
            synchronized (lock$iv) {
                if (this._state.getValue().compareTo(State.ShuttingDown) > 0 && !getKnownCompositions().contains(composition)) {
                    addKnownCompositionLocked(composition);
                }
                Unit unit2 = Unit.INSTANCE;
            }
            try {
                performInitialMovableContentInserts(composition);
                try {
                    composition.applyChanges();
                    composition.applyLateChanges();
                    if (!composerWasComposing) {
                        Snapshot.Companion.notifyObjectsInitialized();
                    }
                } catch (Throwable e) {
                    processCompositionError$default(this, e, null, false, 6, null);
                }
            } catch (Throwable e2) {
                processCompositionError(e2, composition, true);
            }
        } catch (Throwable e3) {
            processCompositionError(e3, composition, true);
        }
    }

    @Override // androidx.compose.runtime.CompositionContext
    public ScatterSet<RecomposeScopeImpl> composeInitialPaused$runtime_release(ControlledComposition composition, ShouldPauseCallback shouldPause, Function2<? super Composer, ? super Integer, Unit> function2) {
        try {
            ShouldPauseCallback previous$iv = composition.getAndSetShouldPauseCallback(shouldPause);
            composeInitial$runtime_release(composition, function2);
            MutableScatterSet<RecomposeScopeImpl> mutableScatterSet = this.pausedScopes.get();
            MutableScatterSet<RecomposeScopeImpl> emptyScatterSet = mutableScatterSet != null ? mutableScatterSet : ScatterSetKt.emptyScatterSet();
            composition.getAndSetShouldPauseCallback(previous$iv);
            return emptyScatterSet;
        } finally {
            this.pausedScopes.set(null);
        }
    }

    @Override // androidx.compose.runtime.CompositionContext
    public ScatterSet<RecomposeScopeImpl> recomposePaused$runtime_release(ControlledComposition composition, ShouldPauseCallback shouldPause, ScatterSet<RecomposeScopeImpl> scatterSet) {
        try {
            recordComposerModifications();
            composition.recordModificationsOf(ScatterSetWrapperKt.wrapIntoSet(scatterSet));
            ShouldPauseCallback previous$iv = composition.getAndSetShouldPauseCallback(shouldPause);
            ControlledComposition needsApply = performRecompose(composition, null);
            if (needsApply != null) {
                performInitialMovableContentInserts(composition);
                needsApply.applyChanges();
                needsApply.applyLateChanges();
            }
            MutableScatterSet<RecomposeScopeImpl> mutableScatterSet = this.pausedScopes.get();
            MutableScatterSet<RecomposeScopeImpl> emptyScatterSet = mutableScatterSet != null ? mutableScatterSet : ScatterSetKt.emptyScatterSet();
            composition.getAndSetShouldPauseCallback(previous$iv);
            return emptyScatterSet;
        } finally {
            this.pausedScopes.set(null);
        }
    }

    @Override // androidx.compose.runtime.CompositionContext
    public void reportPausedScope$runtime_release(RecomposeScopeImpl scope) {
        MutableScatterSet scopes = this.pausedScopes.get();
        if (scopes == null) {
            Recomposer $this$reportPausedScope_u24lambda_u2444 = this;
            MutableScatterSet newScopes = ScatterSetKt.mutableScatterSetOf();
            $this$reportPausedScope_u24lambda_u2444.pausedScopes.set(newScopes);
            scopes = newScopes;
        }
        scopes.add(scope);
    }

    private final void performInitialMovableContentInserts(ControlledComposition composition) {
        boolean z;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            boolean z2 = false;
            List $this$fastAny$iv = this.movableContentAwaitingInsert;
            int index$iv$iv = 0;
            int size = $this$fastAny$iv.size();
            while (true) {
                if (index$iv$iv < size) {
                    Object item$iv$iv = $this$fastAny$iv.get(index$iv$iv);
                    MovableContentStateReference it = (MovableContentStateReference) item$iv$iv;
                    boolean z3 = z2;
                    if (Intrinsics.areEqual(it.getComposition$runtime_release(), composition)) {
                        z = true;
                        break;
                    } else {
                        index$iv$iv++;
                        z2 = z3;
                    }
                } else {
                    z = false;
                    break;
                }
            }
            if (z) {
                Unit unit = Unit.INSTANCE;
                List toInsert = new ArrayList();
                performInitialMovableContentInserts$fillToInsert(toInsert, this, composition);
                while (!toInsert.isEmpty()) {
                    performInsertValues(toInsert, null);
                    performInitialMovableContentInserts$fillToInsert(toInsert, this, composition);
                }
            }
        }
    }

    private static final void performInitialMovableContentInserts$fillToInsert(List<MovableContentStateReference> list, Recomposer this$0, ControlledComposition $composition) {
        list.clear();
        Object lock$iv = this$0.stateLock;
        synchronized (lock$iv) {
            Iterator iterator = this$0.movableContentAwaitingInsert.iterator();
            while (iterator.hasNext()) {
                MovableContentStateReference value = iterator.next();
                if (Intrinsics.areEqual(value.getComposition$runtime_release(), $composition)) {
                    list.add(value);
                    iterator.remove();
                }
            }
            Unit unit = Unit.INSTANCE;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final ControlledComposition performRecompose(final ControlledComposition composition, final MutableScatterSet<Object> mutableScatterSet) {
        if (!composition.isComposing() && !composition.isDisposed()) {
            Set<ControlledComposition> set = this.compositionsRemoved;
            boolean z = true;
            if (!(set != null && set.contains(composition))) {
                MutableSnapshot snapshot$iv = Snapshot.Companion.takeMutableSnapshot(readObserverOf(composition), writeObserverOf(composition, mutableScatterSet));
                try {
                    MutableSnapshot this_$iv$iv = snapshot$iv;
                    Snapshot previous$iv$iv = this_$iv$iv.makeCurrent();
                    if (mutableScatterSet == null || !mutableScatterSet.isNotEmpty()) {
                        z = false;
                    }
                    if (z) {
                        composition.prepareCompose(new Function0<Unit>() { // from class: androidx.compose.runtime.Recomposer$performRecompose$1$1
                            /* JADX INFO: Access modifiers changed from: package-private */
                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            {
                                super(0);
                            }

                            @Override // kotlin.jvm.functions.Function0
                            public /* bridge */ /* synthetic */ Unit invoke() {
                                invoke2();
                                return Unit.INSTANCE;
                            }

                            /* renamed from: invoke  reason: avoid collision after fix types in other method */
                            public final void invoke2() {
                                int i;
                                ScatterSet this_$iv = mutableScatterSet;
                                ControlledComposition controlledComposition = composition;
                                Object[] elements$iv = this_$iv.elements;
                                long[] m$iv$iv = this_$iv.metadata;
                                int lastIndex$iv$iv = m$iv$iv.length - 2;
                                int i$iv$iv = 0;
                                if (0 > lastIndex$iv$iv) {
                                    return;
                                }
                                while (true) {
                                    long slot$iv$iv = m$iv$iv[i$iv$iv];
                                    ScatterSet this_$iv2 = this_$iv;
                                    if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) != -9187201950435737472L) {
                                        int i2 = 8;
                                        int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                                        int j$iv$iv = 0;
                                        while (j$iv$iv < bitCount$iv$iv) {
                                            long value$iv$iv$iv = 255 & slot$iv$iv;
                                            if (!(value$iv$iv$iv < 128)) {
                                                i = i2;
                                            } else {
                                                int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                                                i = i2;
                                                Object it = elements$iv[index$iv$iv];
                                                controlledComposition.recordWriteOf(it);
                                            }
                                            slot$iv$iv >>= i;
                                            j$iv$iv++;
                                            i2 = i;
                                        }
                                        if (bitCount$iv$iv != i2) {
                                            return;
                                        }
                                    }
                                    if (i$iv$iv == lastIndex$iv$iv) {
                                        return;
                                    }
                                    i$iv$iv++;
                                    this_$iv = this_$iv2;
                                }
                            }
                        });
                    }
                    boolean recompose = composition.recompose();
                    this_$iv$iv.restoreCurrent(previous$iv$iv);
                    if (recompose) {
                        return composition;
                    }
                    return null;
                } finally {
                    applyAndCheck(snapshot$iv);
                }
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:166:0x0183 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0185 A[Catch: all -> 0x0390, LOOP:3: B:34:0x0149->B:45:0x0185, LOOP_END, TryCatch #0 {all -> 0x0390, blocks: (B:26:0x00d5, B:28:0x0100, B:30:0x010a, B:31:0x0120, B:33:0x0132, B:35:0x014b, B:37:0x0163, B:48:0x0197, B:49:0x01b0, B:51:0x01b6, B:53:0x01c6, B:59:0x0208, B:56:0x01e0, B:60:0x0212, B:45:0x0185), top: B:145:0x00d5 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.List<androidx.compose.runtime.ControlledComposition> performInsertValues(java.util.List<androidx.compose.runtime.MovableContentStateReference> r34, androidx.collection.MutableScatterSet<java.lang.Object> r35) {
        /*
            Method dump skipped, instructions count: 960
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.runtime.Recomposer.performInsertValues(java.util.List, androidx.collection.MutableScatterSet):java.util.List");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void discardUnusedMovableContentState() {
        MutableObjectList unusedValues;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            boolean z = false;
            if (MultiValueMap.m3818isNotEmptyimpl(this.movableContentRemoved)) {
                ObjectList references = MultiValueMap.m3823valuesimpl(this.movableContentRemoved);
                MultiValueMap.m3808clearimpl(this.movableContentRemoved);
                this.movableContentNestedStatesAvailable.clear();
                MultiValueMap.m3808clearimpl(this.movableContentNestedExtractionsPending);
                MutableObjectList target$iv = new MutableObjectList(references.getSize());
                Object[] content$iv$iv = references.content;
                int i$iv$iv = 0;
                int i = references._size;
                while (i$iv$iv < i) {
                    Object it$iv = content$iv$iv[i$iv$iv];
                    MovableContentStateReference it = (MovableContentStateReference) it$iv;
                    target$iv.add(TuplesKt.to(it, this.movableContentStatesAvailable.get(it)));
                    i$iv$iv++;
                    z = z;
                }
                unusedValues = target$iv;
                this.movableContentStatesAvailable.clear();
            } else {
                unusedValues = ObjectListKt.emptyObjectList();
            }
        }
        ObjectList this_$iv = unusedValues;
        Object[] content$iv = this_$iv.content;
        int i2 = this_$iv._size;
        for (int i$iv = 0; i$iv < i2; i$iv++) {
            Pair pair = (Pair) content$iv[i$iv];
            MovableContentStateReference reference = (MovableContentStateReference) pair.component1();
            MovableContentState state = (MovableContentState) pair.component2();
            if (state != null) {
                reference.getComposition$runtime_release().disposeUnusedMovableContent(state);
            }
        }
    }

    private final Function1<Object, Unit> readObserverOf(final ControlledComposition composition) {
        return new Function1<Object, Unit>() { // from class: androidx.compose.runtime.Recomposer$readObserverOf$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Object p1) {
                invoke2(p1);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(Object value) {
                ControlledComposition.this.recordReadOf(value);
            }
        };
    }

    private final Function1<Object, Unit> writeObserverOf(final ControlledComposition composition, final MutableScatterSet<Object> mutableScatterSet) {
        return new Function1<Object, Unit>() { // from class: androidx.compose.runtime.Recomposer$writeObserverOf$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Object p1) {
                invoke2(p1);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(Object value) {
                ControlledComposition.this.recordWriteOf(value);
                MutableScatterSet<Object> mutableScatterSet2 = mutableScatterSet;
                if (mutableScatterSet2 != null) {
                    mutableScatterSet2.add(value);
                }
            }
        };
    }

    private final <T> T composing(ControlledComposition composition, MutableScatterSet<Object> mutableScatterSet, Function0<? extends T> function0) {
        MutableSnapshot snapshot = Snapshot.Companion.takeMutableSnapshot(readObserverOf(composition), writeObserverOf(composition, mutableScatterSet));
        try {
            MutableSnapshot this_$iv = snapshot;
            Snapshot previous$iv = this_$iv.makeCurrent();
            T invoke = function0.invoke();
            this_$iv.restoreCurrent(previous$iv);
            return invoke;
        } finally {
            applyAndCheck(snapshot);
        }
    }

    private final void applyAndCheck(MutableSnapshot snapshot) {
        try {
            SnapshotApplyResult applyResult = snapshot.apply();
            if (applyResult instanceof SnapshotApplyResult.Failure) {
                throw new IllegalStateException("Unsupported concurrent change during composition. A state object was modified by composition as well as being modified outside composition.".toString());
            }
        } finally {
            snapshot.dispose();
        }
    }

    public final boolean getHasPendingWork() {
        boolean z;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            z = true;
            if (!this.snapshotInvalidations.isNotEmpty()) {
                MutableVector this_$iv = this.compositionInvalidations;
                MutableVector this_$iv2 = this_$iv.getSize() != 0 ? 1 : null;
                if (this_$iv2 == null && this.concurrentCompositionsOutstanding <= 0 && this.compositionsAwaitingApply.isEmpty()) {
                    if (!getHasBroadcastFrameClockAwaitersLocked()) {
                        z = false;
                    }
                }
            }
        }
        return z;
    }

    private final boolean getHasFrameWorkLocked() {
        MutableVector this_$iv = this.compositionInvalidations;
        MutableVector this_$iv2 = this_$iv.getSize() != 0 ? 1 : null;
        return this_$iv2 != null || getHasBroadcastFrameClockAwaitersLocked();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean getHasConcurrentFrameWorkLocked() {
        return !this.compositionsAwaitingApply.isEmpty() || getHasBroadcastFrameClockAwaitersLocked();
    }

    public final Object awaitIdle(Continuation<? super Unit> continuation) {
        Object collect = FlowKt.collect(FlowKt.takeWhile(getCurrentState(), new Recomposer$awaitIdle$2(null)), continuation);
        return collect == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? collect : Unit.INSTANCE;
    }

    public final void pauseCompositionFrameClock() {
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            this.frameClockPaused = true;
            Unit unit = Unit.INSTANCE;
        }
    }

    public final void resumeCompositionFrameClock() {
        CancellableContinuation<Unit> cancellableContinuation;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            if (this.frameClockPaused) {
                this.frameClockPaused = false;
                cancellableContinuation = deriveStateLocked();
            } else {
                cancellableContinuation = null;
            }
        }
        if (cancellableContinuation != null) {
            Result.Companion companion = Result.Companion;
            cancellableContinuation.resumeWith(Result.m7341constructorimpl(Unit.INSTANCE));
        }
    }

    @Override // androidx.compose.runtime.CompositionContext
    public int getCompoundHashKey$runtime_release() {
        return 1000;
    }

    @Override // androidx.compose.runtime.CompositionContext
    public boolean getCollectingCallByInformation$runtime_release() {
        return _hotReloadEnabled.get().booleanValue();
    }

    @Override // androidx.compose.runtime.CompositionContext
    public boolean getCollectingParameterInformation$runtime_release() {
        return false;
    }

    @Override // androidx.compose.runtime.CompositionContext
    public boolean getCollectingSourceInformation$runtime_release() {
        return false;
    }

    @Override // androidx.compose.runtime.CompositionContext
    public void recordInspectionTable$runtime_release(Set<CompositionData> set) {
    }

    @Override // androidx.compose.runtime.CompositionContext
    public void registerComposition$runtime_release(ControlledComposition composition) {
    }

    @Override // androidx.compose.runtime.CompositionContext
    public void unregisterComposition$runtime_release(ControlledComposition composition) {
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            removeKnownCompositionLocked(composition);
            MutableVector this_$iv = this.compositionInvalidations;
            this_$iv.remove(composition);
            this.compositionsAwaitingApply.remove(composition);
            Unit unit = Unit.INSTANCE;
        }
    }

    @Override // androidx.compose.runtime.CompositionContext
    public void invalidate$runtime_release(ControlledComposition composition) {
        CancellableContinuation<Unit> cancellableContinuation;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            if (!this.compositionInvalidations.contains(composition)) {
                MutableVector this_$iv = this.compositionInvalidations;
                this_$iv.add(composition);
                cancellableContinuation = deriveStateLocked();
            } else {
                cancellableContinuation = null;
            }
        }
        if (cancellableContinuation != null) {
            Result.Companion companion = Result.Companion;
            cancellableContinuation.resumeWith(Result.m7341constructorimpl(Unit.INSTANCE));
        }
    }

    @Override // androidx.compose.runtime.CompositionContext
    public void invalidateScope$runtime_release(RecomposeScopeImpl scope) {
        CancellableContinuation<Unit> deriveStateLocked;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            this.snapshotInvalidations.add(scope);
            deriveStateLocked = deriveStateLocked();
        }
        if (deriveStateLocked != null) {
            Result.Companion companion = Result.Companion;
            deriveStateLocked.resumeWith(Result.m7341constructorimpl(Unit.INSTANCE));
        }
    }

    @Override // androidx.compose.runtime.CompositionContext
    public void insertMovableContent$runtime_release(MovableContentStateReference reference) {
        CancellableContinuation<Unit> deriveStateLocked;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            this.movableContentAwaitingInsert.add(reference);
            deriveStateLocked = deriveStateLocked();
        }
        if (deriveStateLocked != null) {
            Result.Companion companion = Result.Companion;
            deriveStateLocked.resumeWith(Result.m7341constructorimpl(Unit.INSTANCE));
        }
    }

    @Override // androidx.compose.runtime.CompositionContext
    public void deletedMovableContent$runtime_release(MovableContentStateReference reference) {
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            MultiValueMap.m3806addimpl(this.movableContentRemoved, reference.getContent$runtime_release(), reference);
            if (reference.getNestedReferences$runtime_release() != null) {
                deletedMovableContent$lambda$73$recordNestedStatesOf(this, reference, reference);
            }
            Unit unit = Unit.INSTANCE;
        }
    }

    private static final void deletedMovableContent$lambda$73$recordNestedStatesOf(Recomposer this$0, MovableContentStateReference container, MovableContentStateReference reference) {
        List $this$fastForEach$iv = reference.getNestedReferences$runtime_release();
        if ($this$fastForEach$iv == null) {
            return;
        }
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            MovableContentStateReference nestedReference = (MovableContentStateReference) item$iv;
            this$0.movableContentNestedStatesAvailable.add(nestedReference.getContent$runtime_release(), new NestedMovableContent(nestedReference, container));
            deletedMovableContent$lambda$73$recordNestedStatesOf(this$0, container, nestedReference);
        }
    }

    @Override // androidx.compose.runtime.CompositionContext
    public void movableContentStateReleased$runtime_release(MovableContentStateReference reference, MovableContentState data, Applier<?> applier) {
        Object lock$iv;
        int i;
        int j$iv$iv;
        Recomposer recomposer = this;
        Object lock$iv2 = recomposer.stateLock;
        boolean z = false;
        synchronized (lock$iv2) {
            try {
                recomposer.movableContentStatesAvailable.set(reference, data);
                ObjectList extractions = MultiValueMap.m3815getimpl(recomposer.movableContentNestedExtractionsPending, reference);
                if (extractions.isNotEmpty()) {
                    try {
                        ScatterMap states = data.extractNestedStates$runtime_release(applier, extractions);
                        Object[] k$iv = states.keys;
                        Object[] v$iv = states.values;
                        long[] m$iv$iv = states.metadata;
                        int lastIndex$iv$iv = m$iv$iv.length - 2;
                        int i$iv$iv = 0;
                        if (0 <= lastIndex$iv$iv) {
                            while (true) {
                                long slot$iv$iv = m$iv$iv[i$iv$iv];
                                lock$iv = lock$iv2;
                                boolean z2 = z;
                                ObjectList extractions2 = extractions;
                                long $this$maskEmptyOrDeleted$iv$iv$iv = ((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L);
                                if ($this$maskEmptyOrDeleted$iv$iv$iv != -9187201950435737472L) {
                                    int i2 = 8;
                                    int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                                    int j$iv$iv2 = 0;
                                    while (j$iv$iv2 < bitCount$iv$iv) {
                                        long value$iv$iv$iv = slot$iv$iv & 255;
                                        if (value$iv$iv$iv < 128) {
                                            int index$iv$iv = (i$iv$iv << 3) + j$iv$iv2;
                                            try {
                                                Object obj = k$iv[index$iv$iv];
                                                MovableContentState state = (MovableContentState) v$iv[index$iv$iv];
                                                i = i2;
                                                j$iv$iv = j$iv$iv2;
                                                recomposer.movableContentStatesAvailable.set((MovableContentStateReference) obj, state);
                                            } catch (Throwable th) {
                                                th = th;
                                                throw th;
                                            }
                                        } else {
                                            i = i2;
                                            j$iv$iv = j$iv$iv2;
                                        }
                                        slot$iv$iv >>= i;
                                        j$iv$iv2 = j$iv$iv + 1;
                                        recomposer = this;
                                        i2 = i;
                                    }
                                    if (bitCount$iv$iv != i2) {
                                        break;
                                    }
                                }
                                if (i$iv$iv == lastIndex$iv$iv) {
                                    break;
                                }
                                i$iv$iv++;
                                recomposer = this;
                                z = z2;
                                extractions = extractions2;
                                lock$iv2 = lock$iv;
                            }
                        } else {
                            lock$iv = lock$iv2;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        lock$iv = lock$iv2;
                        throw th;
                    }
                } else {
                    lock$iv = lock$iv2;
                }
                Unit unit = Unit.INSTANCE;
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    @Override // androidx.compose.runtime.CompositionContext
    public void reportRemovedComposition$runtime_release(ControlledComposition composition) {
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            Set it = this.compositionsRemoved;
            if (it == null) {
                it = new LinkedHashSet();
                this.compositionsRemoved = it;
            }
            it.add(composition);
        }
    }

    @Override // androidx.compose.runtime.CompositionContext
    public MovableContentState movableContentStateResolve$runtime_release(MovableContentStateReference reference) {
        MovableContentState remove;
        Object lock$iv = this.stateLock;
        synchronized (lock$iv) {
            remove = this.movableContentStatesAvailable.remove(reference);
        }
        return remove;
    }

    @Override // androidx.compose.runtime.CompositionContext
    public Composition getComposition$runtime_release() {
        return null;
    }

    /* compiled from: Recomposer.kt */
    @Metadata(d1 = {"\u0000Z\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0006\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u000b\b\u0087\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0014\u0010\u0013\u001a\u00020\u00142\n\u0010\u0015\u001a\u00060\u000bR\u00020\fH\u0002J\r\u0010\u0016\u001a\u00020\u0014H\u0000¢\u0006\u0002\b\u0017J\u0013\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00100\u000fH\u0000¢\u0006\u0002\b\u0019J\u0013\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u001c0\u001bH\u0000¢\u0006\u0002\b\u001dJ\u0015\u0010\u001e\u001a\u00020\u00142\u0006\u0010\u001f\u001a\u00020 H\u0000¢\u0006\u0002\b!J\u0015\u0010\"\u001a\u00020\u00142\u0006\u0010#\u001a\u00020\u0001H\u0000¢\u0006\u0002\b$J\u0014\u0010%\u001a\u00020\u00142\n\u0010\u0015\u001a\u00060\u000bR\u00020\fH\u0002J\r\u0010&\u001a\u00020\u0001H\u0000¢\u0006\u0002\b'J\u0015\u0010(\u001a\u00020\u00142\u0006\u0010)\u001a\u00020\u0005H\u0000¢\u0006\u0002\b*R.\u0010\u0003\u001a\"\u0012\f\u0012\n \u0006*\u0004\u0018\u00010\u00050\u00050\u0004j\u0010\u0012\f\u0012\n \u0006*\u0004\u0018\u00010\u00050\u0005`\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u001e\u0010\b\u001a\u0012\u0012\u000e\u0012\f\u0012\b\u0012\u00060\u000bR\u00020\f0\n0\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u001d\u0010\r\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00100\u000f0\u000e8F¢\u0006\u0006\u001a\u0004\b\u0011\u0010\u0012¨\u0006+"}, d2 = {"Landroidx/compose/runtime/Recomposer$Companion;", "", "()V", "_hotReloadEnabled", "Ljava/util/concurrent/atomic/AtomicReference;", "", "kotlin.jvm.PlatformType", "Landroidx/compose/runtime/internal/AtomicReference;", "_runningRecomposers", "Lkotlinx/coroutines/flow/MutableStateFlow;", "Landroidx/compose/runtime/external/kotlinx/collections/immutable/PersistentSet;", "Landroidx/compose/runtime/Recomposer$RecomposerInfoImpl;", "Landroidx/compose/runtime/Recomposer;", "runningRecomposers", "Lkotlinx/coroutines/flow/StateFlow;", "", "Landroidx/compose/runtime/RecomposerInfo;", "getRunningRecomposers", "()Lkotlinx/coroutines/flow/StateFlow;", "addRunning", "", "info", "clearErrors", "clearErrors$runtime_release", "currentRunningRecomposers", "currentRunningRecomposers$runtime_release", "getCurrentErrors", "", "Landroidx/compose/runtime/RecomposerErrorInfo;", "getCurrentErrors$runtime_release", "invalidateGroupsWithKey", "key", "", "invalidateGroupsWithKey$runtime_release", "loadStateAndComposeForHotReload", "token", "loadStateAndComposeForHotReload$runtime_release", "removeRunning", "saveStateAndDisposeForHotReload", "saveStateAndDisposeForHotReload$runtime_release", "setHotReloadEnabled", "value", "setHotReloadEnabled$runtime_release", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final StateFlow<Set<RecomposerInfo>> getRunningRecomposers() {
            return Recomposer._runningRecomposers;
        }

        public final Set<RecomposerInfo> currentRunningRecomposers$runtime_release() {
            return (Set) Recomposer._runningRecomposers.getValue();
        }

        public final void setHotReloadEnabled$runtime_release(boolean value) {
            Recomposer._hotReloadEnabled.set(Boolean.valueOf(value));
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final void addRunning(RecomposerInfoImpl info) {
            PersistentSet old;
            PersistentSet add;
            do {
                old = (PersistentSet) Recomposer._runningRecomposers.getValue();
                add = old.add((PersistentSet) info);
                if (old == add) {
                    return;
                }
            } while (!Recomposer._runningRecomposers.compareAndSet(old, add));
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final void removeRunning(RecomposerInfoImpl info) {
            PersistentSet old;
            PersistentSet remove;
            do {
                old = (PersistentSet) Recomposer._runningRecomposers.getValue();
                remove = old.remove((PersistentSet) info);
                if (old == remove) {
                    return;
                }
            } while (!Recomposer._runningRecomposers.compareAndSet(old, remove));
        }

        public final Object saveStateAndDisposeForHotReload$runtime_release() {
            Recomposer._hotReloadEnabled.set(true);
            Iterable $this$flatMap$iv = (Iterable) Recomposer._runningRecomposers.getValue();
            Collection destination$iv$iv = new ArrayList();
            for (Object element$iv$iv : $this$flatMap$iv) {
                RecomposerInfoImpl it = (RecomposerInfoImpl) element$iv$iv;
                Iterable list$iv$iv = it.saveStateAndDisposeForHotReload();
                CollectionsKt.addAll(destination$iv$iv, list$iv$iv);
            }
            return (List) destination$iv$iv;
        }

        public final void loadStateAndComposeForHotReload$runtime_release(Object token) {
            Recomposer._hotReloadEnabled.set(true);
            Iterable $this$forEach$iv = (Iterable) Recomposer._runningRecomposers.getValue();
            for (Object element$iv : $this$forEach$iv) {
                RecomposerInfoImpl it = (RecomposerInfoImpl) element$iv;
                it.resetErrorState();
            }
            Intrinsics.checkNotNull(token, "null cannot be cast to non-null type kotlin.collections.List<androidx.compose.runtime.Recomposer.HotReloadable>");
            List holders = (List) token;
            int size = holders.size();
            for (int index$iv = 0; index$iv < size; index$iv++) {
                Object item$iv = holders.get(index$iv);
                HotReloadable it2 = (HotReloadable) item$iv;
                it2.resetContent();
            }
            int size2 = holders.size();
            for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
                Object item$iv2 = holders.get(index$iv2);
                HotReloadable it3 = (HotReloadable) item$iv2;
                it3.recompose();
            }
            Iterable $this$forEach$iv2 = (Iterable) Recomposer._runningRecomposers.getValue();
            for (Object element$iv2 : $this$forEach$iv2) {
                RecomposerInfoImpl it4 = (RecomposerInfoImpl) element$iv2;
                it4.retryFailedCompositions();
            }
        }

        public final void invalidateGroupsWithKey$runtime_release(int key) {
            Recomposer._hotReloadEnabled.set(true);
            Iterable $this$forEach$iv = (Iterable) Recomposer._runningRecomposers.getValue();
            for (Object element$iv : $this$forEach$iv) {
                RecomposerInfoImpl it = (RecomposerInfoImpl) element$iv;
                RecomposerErrorInfo currentError = it.getCurrentError();
                boolean z = false;
                if (currentError != null && !currentError.getRecoverable()) {
                    z = true;
                }
                if (!z) {
                    it.resetErrorState();
                    it.invalidateGroupsWithKey(key);
                    it.retryFailedCompositions();
                }
            }
        }

        public final List<RecomposerErrorInfo> getCurrentErrors$runtime_release() {
            Iterable $this$mapNotNull$iv = (Iterable) Recomposer._runningRecomposers.getValue();
            Collection destination$iv$iv = new ArrayList();
            for (Object element$iv$iv$iv : $this$mapNotNull$iv) {
                RecomposerInfoImpl it = (RecomposerInfoImpl) element$iv$iv$iv;
                RecomposerErrorInfo currentError = it.getCurrentError();
                if (currentError != null) {
                    destination$iv$iv.add(currentError);
                }
            }
            return (List) destination$iv$iv;
        }

        public final void clearErrors$runtime_release() {
            Iterable $this$mapNotNull$iv = (Iterable) Recomposer._runningRecomposers.getValue();
            Collection destination$iv$iv = new ArrayList();
            for (Object element$iv$iv$iv : $this$mapNotNull$iv) {
                RecomposerInfoImpl it = (RecomposerInfoImpl) element$iv$iv$iv;
                RecomposerErrorState resetErrorState = it.resetErrorState();
                if (resetErrorState != null) {
                    destination$iv$iv.add(resetErrorState);
                }
            }
            ArrayList arrayList = (List) destination$iv$iv;
        }
    }
}
