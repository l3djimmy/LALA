package androidx.compose.runtime.collection;

import androidx.autofill.HintConstants;
import androidx.exifinterface.media.ExifInterface;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.NoSuchElementException;
import java.util.RandomAccess;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMutableList;
import kotlin.jvm.internal.markers.KMutableListIterator;
import kotlin.ranges.IntRange;
import kotlin.ranges.RangesKt;
/* compiled from: MutableVector.kt */
@Metadata(d1 = {"\u0000\u0080\u0001\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010!\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0010\u001e\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b/\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0001\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0007\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00060\u0002j\u0002`\u0003:\u0003tuvB\u001f\b\u0001\u0012\u000e\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00018\u00000\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bJ\u0013\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00028\u0000¢\u0006\u0002\u0010\u001aJ\u001b\u0010\u0017\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u00072\u0006\u0010\u0019\u001a\u00028\u0000¢\u0006\u0002\u0010\u001dJ\u0017\u0010\u001e\u001a\u00020\u00182\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0000H\u0086\bJ\u0019\u0010\u001e\u001a\u00020\u00182\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0005¢\u0006\u0002\u0010 J\u001c\u0010\u001e\u001a\u00020\u00182\u0006\u0010\u001c\u001a\u00020\u00072\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0000J\u001c\u0010\u001e\u001a\u00020\u00182\u0006\u0010\u001c\u001a\u00020\u00072\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000!J\u001c\u0010\u001e\u001a\u00020\u00182\u0006\u0010\u001c\u001a\u00020\u00072\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000\"J\u0014\u0010\u001e\u001a\u00020\u00182\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000!J\u0017\u0010\u001e\u001a\u00020\u00182\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000\"H\u0086\bJ(\u0010#\u001a\u00020\u00182\u0012\u0010$\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00180%H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J\f\u0010&\u001a\b\u0012\u0004\u0012\u00028\u00000\u0014J\u0006\u0010'\u001a\u00020\u001bJ\u0016\u0010(\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00028\u0000H\u0086\u0002¢\u0006\u0002\u0010\u001aJ\u0014\u0010)\u001a\u00020\u00182\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0000J\u0014\u0010)\u001a\u00020\u00182\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000!J\u0014\u0010)\u001a\u00020\u00182\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000\"J\u0014\u0010*\u001a\u00020\u00182\f\u0010+\u001a\b\u0012\u0004\u0012\u00028\u00000\u0000J\u0011\u0010,\u001a\u00020\u001b2\u0006\u0010-\u001a\u00020\u0007H\u0086\bJ\u000b\u0010.\u001a\u00028\u0000¢\u0006\u0002\u0010/J-\u0010.\u001a\u00028\u00002\u0012\u0010$\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00180%H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u00100J\u0010\u00101\u001a\u0004\u0018\u00018\u0000H\u0086\b¢\u0006\u0002\u0010/J/\u00101\u001a\u0004\u0018\u00018\u00002\u0012\u0010$\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00180%H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u00100JP\u00102\u001a\u0002H3\"\u0004\b\u0001\u001032\u0006\u00104\u001a\u0002H32'\u00105\u001a#\u0012\u0013\u0012\u0011H3¢\u0006\f\b7\u0012\b\b8\u0012\u0004\b\b(9\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u0002H306H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0002¢\u0006\u0002\u0010:Je\u0010;\u001a\u0002H3\"\u0004\b\u0001\u001032\u0006\u00104\u001a\u0002H32<\u00105\u001a8\u0012\u0013\u0012\u00110\u0007¢\u0006\f\b7\u0012\b\b8\u0012\u0004\b\b(\u001c\u0012\u0013\u0012\u0011H3¢\u0006\f\b7\u0012\b\b8\u0012\u0004\b\b(9\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u0002H30<H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0002¢\u0006\u0002\u0010=JP\u0010>\u001a\u0002H3\"\u0004\b\u0001\u001032\u0006\u00104\u001a\u0002H32'\u00105\u001a#\u0012\u0004\u0012\u00028\u0000\u0012\u0013\u0012\u0011H3¢\u0006\f\b7\u0012\b\b8\u0012\u0004\b\b(9\u0012\u0004\u0012\u0002H306H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0002¢\u0006\u0002\u0010:Je\u0010?\u001a\u0002H3\"\u0004\b\u0001\u001032\u0006\u00104\u001a\u0002H32<\u00105\u001a8\u0012\u0013\u0012\u00110\u0007¢\u0006\f\b7\u0012\b\b8\u0012\u0004\b\b(\u001c\u0012\u0004\u0012\u00028\u0000\u0012\u0013\u0012\u0011H3¢\u0006\f\b7\u0012\b\b8\u0012\u0004\b\b(9\u0012\u0004\u0012\u0002H30<H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0002¢\u0006\u0002\u0010=J(\u0010@\u001a\u00020\u001b2\u0012\u0010A\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u001b0%H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J.\u0010B\u001a\u00020\u001b2\u0018\u0010A\u001a\u0014\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u001b06H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J(\u0010C\u001a\u00020\u001b2\u0012\u0010A\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u001b0%H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J.\u0010D\u001a\u00020\u001b2\u0018\u0010A\u001a\u0014\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u001b06H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J\u0016\u0010E\u001a\u00028\u00002\u0006\u0010\u001c\u001a\u00020\u0007H\u0086\n¢\u0006\u0002\u0010FJ\u0015\u0010G\u001a\n\u0012\u0006\u0012\u0004\u0018\u00018\u00000\u0005H\u0001¢\u0006\u0002\u0010HJ\u0013\u0010I\u001a\u00020\u00072\u0006\u0010\u0019\u001a\u00028\u0000¢\u0006\u0002\u0010JJ(\u0010K\u001a\u00020\u00072\u0012\u0010$\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00180%H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J(\u0010L\u001a\u00020\u00072\u0012\u0010$\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00180%H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J\t\u0010M\u001a\u00020\u0018H\u0086\bJ\t\u0010N\u001a\u00020\u0018H\u0086\bJ\u000b\u0010O\u001a\u00028\u0000¢\u0006\u0002\u0010/J-\u0010O\u001a\u00028\u00002\u0012\u0010$\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00180%H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u00100J\u0013\u0010P\u001a\u00020\u00072\u0006\u0010\u0019\u001a\u00028\u0000¢\u0006\u0002\u0010JJ\u0010\u0010Q\u001a\u0004\u0018\u00018\u0000H\u0086\b¢\u0006\u0002\u0010/J/\u0010Q\u001a\u0004\u0018\u00018\u00002\u0012\u0010$\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00180%H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u00100J;\u0010R\u001a\b\u0012\u0004\u0012\u0002H30\u0005\"\u0006\b\u0001\u00103\u0018\u00012\u0012\u0010S\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u0002H30%H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u0010TJP\u0010U\u001a\b\u0012\u0004\u0012\u0002H30\u0005\"\u0006\b\u0001\u00103\u0018\u00012'\u0010S\u001a#\u0012\u0013\u0012\u00110\u0007¢\u0006\f\b7\u0012\b\b8\u0012\u0004\b\b(\u001c\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u0002H306H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u0010VJM\u0010W\u001a\b\u0012\u0004\u0012\u0002H30\u0000\"\u0006\b\u0001\u00103\u0018\u00012)\u0010S\u001a%\u0012\u0013\u0012\u00110\u0007¢\u0006\f\b7\u0012\b\b8\u0012\u0004\b\b(\u001c\u0012\u0004\u0012\u00028\u0000\u0012\u0006\u0012\u0004\u0018\u0001H306H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J8\u0010X\u001a\b\u0012\u0004\u0012\u0002H30\u0000\"\u0006\b\u0001\u00103\u0018\u00012\u0014\u0010S\u001a\u0010\u0012\u0004\u0012\u00028\u0000\u0012\u0006\u0012\u0004\u0018\u0001H30%H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J\u0016\u0010Y\u001a\u00020\u001b2\u0006\u0010\u0019\u001a\u00028\u0000H\u0086\n¢\u0006\u0002\u0010ZJ\u0016\u0010[\u001a\u00020\u001b2\u0006\u0010\u0019\u001a\u00028\u0000H\u0086\n¢\u0006\u0002\u0010ZJ\u0013\u0010\\\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00028\u0000¢\u0006\u0002\u0010\u001aJ\u0014\u0010]\u001a\u00020\u00182\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0000J\u0014\u0010]\u001a\u00020\u00182\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000!J\u0014\u0010]\u001a\u00020\u00182\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000\"J\u0013\u0010^\u001a\u00028\u00002\u0006\u0010\u001c\u001a\u00020\u0007¢\u0006\u0002\u0010FJ\u001d\u0010_\u001a\u00020\u001b2\u0012\u0010$\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00180%H\u0086\bJ\u0016\u0010`\u001a\u00020\u001b2\u0006\u0010a\u001a\u00020\u00072\u0006\u0010b\u001a\u00020\u0007J\u0010\u0010c\u001a\u00020\u001b2\u0006\u0010-\u001a\u00020\u0007H\u0001J\u0014\u0010d\u001a\u00020\u00182\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000!J(\u0010e\u001a\u00020\u00182\u0012\u0010$\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00180%H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J\u001e\u0010f\u001a\u00028\u00002\u0006\u0010\u001c\u001a\u00020\u00072\u0006\u0010\u0019\u001a\u00028\u0000H\u0086\u0002¢\u0006\u0002\u0010gJ\u0010\u0010h\u001a\u00020\u001b2\u0006\u0010i\u001a\u00020\u0007H\u0001J\u001e\u0010j\u001a\u00020\u001b2\u0016\u0010k\u001a\u0012\u0012\u0004\u0012\u00028\u00000lj\b\u0012\u0004\u0012\u00028\u0000`mJ(\u0010n\u001a\u00020\u00072\u0012\u0010o\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00070%H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J\t\u0010p\u001a\u00020qH\u0081\bJ\u0010\u0010p\u001a\u00020q2\u0006\u0010r\u001a\u00020sH\u0001R\"\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00018\u00000\u00058\u0000@\u0000X\u0081\u000e¢\u0006\n\n\u0002\u0010\u000b\u0012\u0004\b\t\u0010\nR\u0012\u0010\f\u001a\u00020\r8Æ\u0002¢\u0006\u0006\u001a\u0004\b\u000e\u0010\u000fR\u0012\u0010\u0010\u001a\u00020\u00078Æ\u0002¢\u0006\u0006\u001a\u0004\b\u0011\u0010\u0012R\u0016\u0010\u0013\u001a\n\u0012\u0004\u0012\u00028\u0000\u0018\u00010\u0014X\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0015\u001a\u00020\u0007@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0012¨\u0006w"}, d2 = {"Landroidx/compose/runtime/collection/MutableVector;", ExifInterface.GPS_DIRECTION_TRUE, "Ljava/util/RandomAccess;", "Lkotlin/collections/RandomAccess;", "content", "", "size", "", "([Ljava/lang/Object;I)V", "getContent$annotations", "()V", "[Ljava/lang/Object;", "indices", "Lkotlin/ranges/IntRange;", "getIndices", "()Lkotlin/ranges/IntRange;", "lastIndex", "getLastIndex", "()I", "list", "", "<set-?>", "getSize", "add", "", "element", "(Ljava/lang/Object;)Z", "", "index", "(ILjava/lang/Object;)V", "addAll", "elements", "([Ljava/lang/Object;)Z", "", "", "any", "predicate", "Lkotlin/Function1;", "asMutableList", "clear", "contains", "containsAll", "contentEquals", "other", "ensureCapacity", "capacity", "first", "()Ljava/lang/Object;", "(Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "firstOrNull", "fold", "R", "initial", "operation", "Lkotlin/Function2;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "acc", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;", "foldIndexed", "Lkotlin/Function3;", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function3;)Ljava/lang/Object;", "foldRight", "foldRightIndexed", "forEach", "block", "forEachIndexed", "forEachReversed", "forEachReversedIndexed", "get", "(I)Ljava/lang/Object;", "getContent", "()[Ljava/lang/Object;", "indexOf", "(Ljava/lang/Object;)I", "indexOfFirst", "indexOfLast", "isEmpty", "isNotEmpty", "last", "lastIndexOf", "lastOrNull", "map", "transform", "(Lkotlin/jvm/functions/Function1;)[Ljava/lang/Object;", "mapIndexed", "(Lkotlin/jvm/functions/Function2;)[Ljava/lang/Object;", "mapIndexedNotNull", "mapNotNull", "minusAssign", "(Ljava/lang/Object;)V", "plusAssign", "remove", "removeAll", "removeAt", "removeIf", "removeRange", "start", "end", "resizeStorage", "retainAll", "reversedAny", "set", "(ILjava/lang/Object;)Ljava/lang/Object;", "setSize", "newSize", "sortWith", "comparator", "Ljava/util/Comparator;", "Lkotlin/Comparator;", "sumBy", "selector", "throwNoSuchElementException", "", "message", "", "MutableVectorList", "SubList", "VectorListIterator", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class MutableVector<T> implements RandomAccess {
    public static final int $stable = 8;
    public T[] content;
    private List<T> list;
    private int size;

    public static /* synthetic */ void getContent$annotations() {
    }

    public MutableVector(T[] tArr, int size) {
        this.content = tArr;
        this.size = size;
    }

    public final int getSize() {
        return this.size;
    }

    public final int getLastIndex() {
        return getSize() - 1;
    }

    public final IntRange getIndices() {
        return RangesKt.until(0, getSize());
    }

    public final T[] getContent() {
        return this.content;
    }

    public final boolean add(T t) {
        int capacity$iv = this.size + 1;
        if (this.content.length < capacity$iv) {
            resizeStorage(capacity$iv);
        }
        this.content[this.size] = t;
        this.size++;
        return true;
    }

    public final void add(int index, T t) {
        int capacity$iv = this.size + 1;
        if (this.content.length < capacity$iv) {
            resizeStorage(capacity$iv);
        }
        Object[] content = this.content;
        if (index != this.size) {
            int destinationOffset$iv = index + 1;
            int endIndex$iv = this.size;
            System.arraycopy(content, index, content, destinationOffset$iv, endIndex$iv - index);
        }
        content[index] = t;
        this.size++;
    }

    public final boolean addAll(int index, List<? extends T> list) {
        if (list.isEmpty()) {
            return false;
        }
        int elementsSize = list.size();
        int capacity$iv = this.size + elementsSize;
        if (this.content.length < capacity$iv) {
            resizeStorage(capacity$iv);
        }
        Object[] content = this.content;
        if (index != this.size) {
            int destinationOffset$iv = index + elementsSize;
            int endIndex$iv = this.size;
            System.arraycopy(content, index, content, destinationOffset$iv, endIndex$iv - index);
        }
        int size = list.size();
        for (int i = 0; i < size; i++) {
            content[index + i] = list.get(i);
        }
        int i2 = this.size;
        this.size = i2 + elementsSize;
        return true;
    }

    public final boolean addAll(int index, MutableVector<T> mutableVector) {
        int elementsSize = mutableVector.size;
        if (elementsSize == 0) {
            return false;
        }
        int capacity$iv = this.size + elementsSize;
        if (this.content.length < capacity$iv) {
            resizeStorage(capacity$iv);
        }
        Object[] content = this.content;
        if (index != this.size) {
            int destinationOffset$iv = index + elementsSize;
            int endIndex$iv = this.size;
            System.arraycopy(content, index, content, destinationOffset$iv, endIndex$iv - index);
        }
        Object[] $this$fastCopyInto$iv = mutableVector.content;
        System.arraycopy($this$fastCopyInto$iv, 0, content, index, elementsSize - 0);
        int startIndex$iv = this.size;
        this.size = startIndex$iv + elementsSize;
        return true;
    }

    public final boolean addAll(List<? extends T> list) {
        return addAll(getSize(), (List) list);
    }

    public final boolean addAll(MutableVector<T> mutableVector) {
        return addAll(getSize(), mutableVector);
    }

    public final boolean addAll(T[] tArr) {
        int elementsSize = tArr.length;
        if (elementsSize == 0) {
            return false;
        }
        int capacity$iv = this.size + elementsSize;
        if (this.content.length < capacity$iv) {
            resizeStorage(capacity$iv);
        }
        Object[] destination$iv = this.content;
        int destinationOffset$iv = this.size;
        System.arraycopy(tArr, 0, destination$iv, destinationOffset$iv, elementsSize - 0);
        this.size += elementsSize;
        return true;
    }

    public final boolean addAll(int index, Collection<? extends T> collection) {
        if (collection.isEmpty()) {
            return false;
        }
        int elementsSize = collection.size();
        int capacity$iv = this.size + elementsSize;
        if (this.content.length < capacity$iv) {
            resizeStorage(capacity$iv);
        }
        Object[] content = (T[]) this.content;
        if (index != this.size) {
            int destinationOffset$iv = index + elementsSize;
            int endIndex$iv = this.size;
            System.arraycopy(content, index, content, destinationOffset$iv, endIndex$iv - index);
        }
        Collection<? extends T> $this$forEachIndexed$iv = collection;
        int i = 0;
        for (Object item$iv : $this$forEachIndexed$iv) {
            int index$iv = i + 1;
            if (i < 0) {
                CollectionsKt.throwIndexOverflow();
            }
            content[index + i] = item$iv;
            i = index$iv;
        }
        this.size += elementsSize;
        return true;
    }

    public final boolean addAll(Collection<? extends T> collection) {
        return addAll(this.size, collection);
    }

    public final boolean any(Function1<? super T, Boolean> function1) {
        Object[] content = (T[]) this.content;
        int size = getSize();
        for (int i = 0; i < size; i++) {
            if (function1.invoke((Object) content[i]).booleanValue()) {
                return true;
            }
        }
        return false;
    }

    public final boolean reversedAny(Function1<? super T, Boolean> function1) {
        Object[] content = (T[]) this.content;
        for (int i = getSize() - 1; i >= 0; i--) {
            if (function1.invoke((Object) content[i]).booleanValue()) {
                return true;
            }
        }
        return false;
    }

    public final List<T> asMutableList() {
        List<T> list = this.list;
        if (list == null) {
            MutableVectorList it = new MutableVectorList(this);
            this.list = it;
            return it;
        }
        return list;
    }

    public final void clear() {
        Object[] content = this.content;
        int i = this.size;
        for (int i2 = 0; i2 < i; i2++) {
            content[i2] = null;
        }
        this.size = 0;
    }

    public final boolean contains(T t) {
        int size = getSize() - 1;
        if (0 <= size) {
            for (int i = 0; !Intrinsics.areEqual(this.content[i], t); i++) {
                if (i == size) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }

    public final boolean containsAll(List<? extends T> list) {
        int size = list.size();
        for (int i = 0; i < size; i++) {
            if (!contains(list.get(i))) {
                return false;
            }
        }
        return true;
    }

    public final boolean containsAll(Collection<? extends T> collection) {
        Collection<? extends T> $this$forEach$iv = collection;
        for (T t : $this$forEach$iv) {
            if (!contains(t)) {
                return false;
            }
        }
        return true;
    }

    public final boolean containsAll(MutableVector<T> mutableVector) {
        IntRange until = RangesKt.until(0, mutableVector.getSize());
        int i = until.getFirst();
        int last = until.getLast();
        if (i <= last) {
            while (contains(mutableVector.content[i])) {
                if (i == last) {
                    return true;
                }
                i++;
            }
            return false;
        }
        return true;
    }

    public final boolean contentEquals(MutableVector<T> mutableVector) {
        if (mutableVector.size != this.size) {
            return false;
        }
        int size = getSize() - 1;
        if (0 <= size) {
            for (int i = 0; Intrinsics.areEqual(mutableVector.content[i], this.content[i]); i++) {
                if (i != size) {
                }
            }
            return false;
        }
        return true;
    }

    public final void ensureCapacity(int capacity) {
        if (this.content.length < capacity) {
            resizeStorage(capacity);
        }
    }

    public final void resizeStorage(int capacity) {
        Object[] oldContent = this.content;
        int oldSize = oldContent.length;
        int newSize = Math.max(capacity, oldSize * 2);
        T[] tArr = (T[]) new Object[newSize];
        System.arraycopy(oldContent, 0, tArr, 0, oldSize - 0);
        this.content = tArr;
    }

    public final T first() {
        if (getSize() == 0) {
            throwNoSuchElementException("MutableVector is empty.");
            throw new KotlinNothingValueException();
        }
        return this.content[0];
    }

    /* JADX WARN: Type inference failed for: r4v0, types: [T, java.lang.Object] */
    public final T first(Function1<? super T, Boolean> function1) {
        Object[] content = (T[]) this.content;
        int size = getSize();
        for (int i = 0; i < size; i++) {
            ?? r4 = (Object) content[i];
            if (function1.invoke(r4).booleanValue()) {
                return r4;
            }
        }
        throwNoSuchElementException("MutableVector contains no element matching the predicate.");
        throw new KotlinNothingValueException();
    }

    public final Void throwNoSuchElementException() {
        throwNoSuchElementException("MutableVector is empty.");
        throw new KotlinNothingValueException();
    }

    public final Void throwNoSuchElementException(String message) {
        throw new NoSuchElementException(message);
    }

    public final T firstOrNull() {
        if (getSize() == 0) {
            return null;
        }
        return this.content[0];
    }

    /* JADX WARN: Type inference failed for: r4v0, types: [T, java.lang.Object] */
    public final T firstOrNull(Function1<? super T, Boolean> function1) {
        Object[] content = (T[]) this.content;
        int size = getSize();
        for (int i = 0; i < size; i++) {
            ?? r4 = (Object) content[i];
            if (function1.invoke(r4).booleanValue()) {
                return r4;
            }
        }
        return null;
    }

    public final <R> R fold(R r, Function2<? super R, ? super T, ? extends R> function2) {
        Object acc = r;
        Object[] content = (T[]) this.content;
        int size = getSize();
        for (int i = 0; i < size; i++) {
            acc = (R) function2.invoke(acc, (Object) content[i]);
        }
        return (R) acc;
    }

    public final <R> R foldIndexed(R r, Function3<? super Integer, ? super R, ? super T, ? extends R> function3) {
        Object acc = r;
        Object[] content = (T[]) this.content;
        int size = getSize();
        for (int i = 0; i < size; i++) {
            acc = (R) function3.invoke(Integer.valueOf(i), acc, (Object) content[i]);
        }
        return (R) acc;
    }

    public final <R> R foldRight(R r, Function2<? super T, ? super R, ? extends R> function2) {
        R r2 = r;
        int i = getSize() - 1;
        Object[] content = (T[]) this.content;
        if (i >= content.length) {
            return r2;
        }
        while (i >= 0) {
            R acc = r2;
            r2 = (R) function2.invoke((Object) content[i], acc);
            i--;
        }
        return r2;
    }

    public final <R> R foldRightIndexed(R r, Function3<? super Integer, ? super T, ? super R, ? extends R> function3) {
        R r2 = r;
        int i = getSize() - 1;
        Object[] content = (T[]) this.content;
        if (i >= content.length) {
            return r2;
        }
        while (i >= 0) {
            R acc = r2;
            r2 = (R) function3.invoke(Integer.valueOf(i), (Object) content[i], acc);
            i--;
        }
        return r2;
    }

    public final void forEach(Function1<? super T, Unit> function1) {
        Object[] content = (T[]) this.content;
        int size = getSize();
        for (int i = 0; i < size; i++) {
            function1.invoke((Object) content[i]);
        }
    }

    public final void forEachIndexed(Function2<? super Integer, ? super T, Unit> function2) {
        Object[] content = (T[]) this.content;
        int size = getSize();
        for (int i = 0; i < size; i++) {
            function2.invoke(Integer.valueOf(i), (Object) content[i]);
        }
    }

    public final void forEachReversed(Function1<? super T, Unit> function1) {
        int i = getSize() - 1;
        Object[] content = (T[]) this.content;
        if (i >= content.length) {
            return;
        }
        while (i >= 0) {
            function1.invoke((Object) content[i]);
            i--;
        }
    }

    public final void forEachReversedIndexed(Function2<? super Integer, ? super T, Unit> function2) {
        int i = getSize() - 1;
        Object[] content = (T[]) this.content;
        if (i >= content.length) {
            return;
        }
        while (i >= 0) {
            function2.invoke(Integer.valueOf(i), (Object) content[i]);
            i--;
        }
    }

    public final T get(int index) {
        return this.content[index];
    }

    public final int indexOf(T t) {
        Object[] content = this.content;
        int size = this.size;
        for (int i = 0; i < size; i++) {
            if (Intrinsics.areEqual(t, content[i])) {
                return i;
            }
        }
        return -1;
    }

    public final int indexOfFirst(Function1<? super T, Boolean> function1) {
        Object[] content = (T[]) this.content;
        int size = getSize();
        for (int i = 0; i < size; i++) {
            if (function1.invoke((Object) content[i]).booleanValue()) {
                return i;
            }
        }
        return -1;
    }

    public final int indexOfLast(Function1<? super T, Boolean> function1) {
        int i = getSize() - 1;
        Object[] content = (T[]) this.content;
        if (i < content.length) {
            while (i >= 0) {
                if (function1.invoke((Object) content[i]).booleanValue()) {
                    return i;
                }
                i--;
            }
            return -1;
        }
        return -1;
    }

    public final boolean isEmpty() {
        return getSize() == 0;
    }

    public final boolean isNotEmpty() {
        return getSize() != 0;
    }

    public final T last() {
        if (getSize() == 0) {
            throwNoSuchElementException("MutableVector is empty.");
            throw new KotlinNothingValueException();
        }
        int index$iv = getSize() - 1;
        return this.content[index$iv];
    }

    /* JADX WARN: Type inference failed for: r3v2, types: [T, java.lang.Object] */
    public final T last(Function1<? super T, Boolean> function1) {
        Object[] content = (T[]) this.content;
        for (int i = getSize() - 1; i >= 0; i--) {
            ?? r3 = (Object) content[i];
            if (function1.invoke(r3).booleanValue()) {
                return r3;
            }
        }
        throwNoSuchElementException("MutableVector contains no element matching the predicate.");
        throw new KotlinNothingValueException();
    }

    public final int lastIndexOf(T t) {
        Object[] content = this.content;
        for (int i = this.size - 1; i >= 0; i--) {
            if (Intrinsics.areEqual(t, content[i])) {
                return i;
            }
        }
        return -1;
    }

    public final T lastOrNull() {
        if (getSize() == 0) {
            return null;
        }
        int index$iv = getSize() - 1;
        return this.content[index$iv];
    }

    /* JADX WARN: Type inference failed for: r3v1, types: [T, java.lang.Object] */
    public final T lastOrNull(Function1<? super T, Boolean> function1) {
        Object[] content = (T[]) this.content;
        for (int i = getSize() - 1; i >= 0; i--) {
            ?? r3 = (Object) content[i];
            if (function1.invoke(r3).booleanValue()) {
                return r3;
            }
        }
        return null;
    }

    public final /* synthetic */ <R> R[] map(Function1<? super T, ? extends R> function1) {
        int size = getSize();
        Intrinsics.reifiedOperationMarker(0, "R");
        R[] rArr = (R[]) new Object[size];
        for (int i = 0; i < size; i++) {
            rArr[i] = function1.invoke(this.content[i]);
        }
        return rArr;
    }

    public final /* synthetic */ <R> R[] mapIndexed(Function2<? super Integer, ? super T, ? extends R> function2) {
        int size = getSize();
        Intrinsics.reifiedOperationMarker(0, "R");
        R[] rArr = (R[]) new Object[size];
        for (int i = 0; i < size; i++) {
            rArr[i] = function2.invoke(Integer.valueOf(i), this.content[i]);
        }
        return rArr;
    }

    public final /* synthetic */ <R> MutableVector<R> mapIndexedNotNull(Function2<? super Integer, ? super T, ? extends R> function2) {
        int size = getSize();
        Intrinsics.reifiedOperationMarker(0, "R?");
        Object[] arr = new Object[size];
        int targetSize = 0;
        Object[] content = (T[]) this.content;
        for (int i = 0; i < size; i++) {
            Object target = function2.invoke(Integer.valueOf(i), (Object) content[i]);
            if (target != null) {
                arr[targetSize] = target;
                targetSize++;
            }
        }
        return new MutableVector<>(arr, targetSize);
    }

    public final /* synthetic */ <R> MutableVector<R> mapNotNull(Function1<? super T, ? extends R> function1) {
        int size = getSize();
        Intrinsics.reifiedOperationMarker(0, "R?");
        Object[] arr = new Object[size];
        int targetSize = 0;
        Object[] content = (T[]) this.content;
        for (int i = 0; i < size; i++) {
            Object target = function1.invoke((Object) content[i]);
            if (target != null) {
                arr[targetSize] = target;
                targetSize++;
            }
        }
        return new MutableVector<>(arr, targetSize);
    }

    public final void plusAssign(T t) {
        add(t);
    }

    public final void minusAssign(T t) {
        remove(t);
    }

    public final boolean remove(T t) {
        int index = indexOf(t);
        if (index >= 0) {
            removeAt(index);
            return true;
        }
        return false;
    }

    public final boolean removeAll(List<? extends T> list) {
        int initialSize = this.size;
        int size = list.size();
        for (int i = 0; i < size; i++) {
            remove(list.get(i));
        }
        int i2 = this.size;
        return initialSize != i2;
    }

    public final boolean removeAll(MutableVector<T> mutableVector) {
        int initialSize = this.size;
        int i = 0;
        int size = mutableVector.getSize() - 1;
        if (0 <= size) {
            while (true) {
                remove(mutableVector.content[i]);
                if (i == size) {
                    break;
                }
                i++;
            }
        }
        int i2 = this.size;
        return initialSize != i2;
    }

    public final boolean removeAll(Collection<? extends T> collection) {
        if (collection.isEmpty()) {
            return false;
        }
        int initialSize = this.size;
        Collection<? extends T> $this$forEach$iv = collection;
        for (T t : $this$forEach$iv) {
            remove(t);
        }
        return initialSize != this.size;
    }

    public final T removeAt(int index) {
        T[] tArr = this.content;
        T t = tArr[index];
        if (index != getSize() - 1) {
            int startIndex$iv = index + 1;
            int endIndex$iv = this.size;
            System.arraycopy(tArr, startIndex$iv, tArr, index, endIndex$iv - startIndex$iv);
        }
        this.size--;
        tArr[this.size] = null;
        return t;
    }

    public final void removeRange(int start, int end) {
        if (end > start) {
            if (end < this.size) {
                Object[] $this$fastCopyInto$iv = this.content;
                Object[] destination$iv = this.content;
                int endIndex$iv = this.size;
                System.arraycopy($this$fastCopyInto$iv, end, destination$iv, start, endIndex$iv - end);
            }
            int newSize = this.size - (end - start);
            int i = newSize;
            int size = getSize() - 1;
            if (i <= size) {
                while (true) {
                    this.content[i] = null;
                    if (i == size) {
                        break;
                    }
                    i++;
                }
            }
            this.size = newSize;
        }
    }

    public final void setSize(int newSize) {
        this.size = newSize;
    }

    public final void removeIf(Function1<? super T, Boolean> function1) {
        int gap = 0;
        int size = getSize();
        int i = 0;
        while (true) {
            T[] tArr = this.content;
            if (i < size) {
                if (function1.invoke((Object) tArr[i]).booleanValue()) {
                    gap++;
                } else if (gap > 0) {
                    this.content[i - gap] = this.content[i];
                }
                i++;
            } else {
                ArraysKt.fill(tArr, (Object) null, size - gap, size);
                setSize(size - gap);
                return;
            }
        }
    }

    public final boolean retainAll(Collection<? extends T> collection) {
        int initialSize = this.size;
        for (int i = getSize() - 1; -1 < i; i--) {
            Object item = this.content[i];
            if (!collection.contains(item)) {
                removeAt(i);
            }
        }
        return initialSize != this.size;
    }

    public final T set(int index, T t) {
        T[] tArr = this.content;
        T t2 = tArr[index];
        tArr[index] = t;
        return t2;
    }

    public final void sortWith(Comparator<T> comparator) {
        ArraysKt.sortWith(this.content, comparator, 0, this.size);
    }

    public final int sumBy(Function1<? super T, Integer> function1) {
        int sum = 0;
        Object[] content = (T[]) this.content;
        for (int i = 0; i < getSize(); i++) {
            sum += function1.invoke((Object) content[i]).intValue();
        }
        return sum;
    }

    /* compiled from: MutableVector.kt */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010+\n\u0000\n\u0002\u0010!\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\t\b\u0002\u0018\u0000*\u0004\b\u0001\u0010\u00012\b\u0012\u0004\u0012\u0002H\u00010\u0002B\u001b\u0012\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00010\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007J\u0015\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u000bJ\t\u0010\f\u001a\u00020\rH\u0096\u0002J\b\u0010\u000e\u001a\u00020\rH\u0016J\u000e\u0010\u000f\u001a\u00028\u0001H\u0096\u0002¢\u0006\u0002\u0010\u0010J\b\u0010\u0011\u001a\u00020\u0006H\u0016J\r\u0010\u0012\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u0010J\b\u0010\u0013\u001a\u00020\u0006H\u0016J\b\u0010\u0014\u001a\u00020\tH\u0016J\u0015\u0010\u0015\u001a\u00020\t2\u0006\u0010\n\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u000bR\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00010\u0004X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0016"}, d2 = {"Landroidx/compose/runtime/collection/MutableVector$VectorListIterator;", ExifInterface.GPS_DIRECTION_TRUE, "", "list", "", "index", "", "(Ljava/util/List;I)V", "add", "", "element", "(Ljava/lang/Object;)V", "hasNext", "", "hasPrevious", "next", "()Ljava/lang/Object;", "nextIndex", "previous", "previousIndex", "remove", "set", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    private static final class VectorListIterator<T> implements ListIterator<T>, KMutableListIterator {
        private int index;
        private final List<T> list;

        public VectorListIterator(List<T> list, int index) {
            this.list = list;
            this.index = index;
        }

        @Override // java.util.ListIterator, java.util.Iterator
        public boolean hasNext() {
            return this.index < this.list.size();
        }

        @Override // java.util.ListIterator, java.util.Iterator
        public T next() {
            List<T> list = this.list;
            int i = this.index;
            this.index = i + 1;
            return list.get(i);
        }

        @Override // java.util.ListIterator, java.util.Iterator
        public void remove() {
            this.index--;
            this.list.remove(this.index);
        }

        @Override // java.util.ListIterator
        public boolean hasPrevious() {
            return this.index > 0;
        }

        @Override // java.util.ListIterator
        public int nextIndex() {
            return this.index;
        }

        @Override // java.util.ListIterator
        public T previous() {
            this.index--;
            return this.list.get(this.index);
        }

        @Override // java.util.ListIterator
        public int previousIndex() {
            return this.index - 1;
        }

        @Override // java.util.ListIterator
        public void add(T t) {
            this.list.add(this.index, t);
            this.index++;
        }

        @Override // java.util.ListIterator
        public void set(T t) {
            this.list.set(this.index, t);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: MutableVector.kt */
    @Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\u001e\n\u0002\b\t\n\u0002\u0010)\n\u0002\b\u0002\n\u0002\u0010+\n\u0002\b\n\b\u0002\u0018\u0000*\u0004\b\u0001\u0010\u00012\b\u0012\u0004\u0012\u0002H\u00010\u0002B\u0013\u0012\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00010\u0004¢\u0006\u0002\u0010\u0005J\u0015\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\rJ\u001d\u0010\n\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00072\u0006\u0010\f\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u0010J\u001e\u0010\u0011\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u00072\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00028\u00010\u0013H\u0016J\u0016\u0010\u0011\u001a\u00020\u000b2\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00028\u00010\u0013H\u0016J\b\u0010\u0014\u001a\u00020\u000eH\u0016J\u0016\u0010\u0015\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00028\u0001H\u0096\u0002¢\u0006\u0002\u0010\rJ\u0016\u0010\u0016\u001a\u00020\u000b2\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00028\u00010\u0013H\u0016J\u0016\u0010\u0017\u001a\u00028\u00012\u0006\u0010\u000f\u001a\u00020\u0007H\u0096\u0002¢\u0006\u0002\u0010\u0018J\u0015\u0010\u0019\u001a\u00020\u00072\u0006\u0010\f\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u001aJ\b\u0010\u001b\u001a\u00020\u000bH\u0016J\u000f\u0010\u001c\u001a\b\u0012\u0004\u0012\u00028\u00010\u001dH\u0096\u0002J\u0015\u0010\u001e\u001a\u00020\u00072\u0006\u0010\f\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u001aJ\u000e\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00010 H\u0016J\u0016\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00010 2\u0006\u0010\u000f\u001a\u00020\u0007H\u0016J\u0015\u0010!\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\rJ\u0016\u0010\"\u001a\u00020\u000b2\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00028\u00010\u0013H\u0016J\u0015\u0010#\u001a\u00028\u00012\u0006\u0010\u000f\u001a\u00020\u0007H\u0016¢\u0006\u0002\u0010\u0018J\u0016\u0010$\u001a\u00020\u000b2\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00028\u00010\u0013H\u0016J\u001e\u0010%\u001a\u00028\u00012\u0006\u0010\u000f\u001a\u00020\u00072\u0006\u0010\f\u001a\u00028\u0001H\u0096\u0002¢\u0006\u0002\u0010&J\u001e\u0010'\u001a\b\u0012\u0004\u0012\u00028\u00010\u00022\u0006\u0010(\u001a\u00020\u00072\u0006\u0010)\u001a\u00020\u0007H\u0016R\u0014\u0010\u0006\u001a\u00020\u00078VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\b\u0010\tR\u0014\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00010\u0004X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006*"}, d2 = {"Landroidx/compose/runtime/collection/MutableVector$MutableVectorList;", ExifInterface.GPS_DIRECTION_TRUE, "", "vector", "Landroidx/compose/runtime/collection/MutableVector;", "(Landroidx/compose/runtime/collection/MutableVector;)V", "size", "", "getSize", "()I", "add", "", "element", "(Ljava/lang/Object;)Z", "", "index", "(ILjava/lang/Object;)V", "addAll", "elements", "", "clear", "contains", "containsAll", "get", "(I)Ljava/lang/Object;", "indexOf", "(Ljava/lang/Object;)I", "isEmpty", "iterator", "", "lastIndexOf", "listIterator", "", "remove", "removeAll", "removeAt", "retainAll", "set", "(ILjava/lang/Object;)Ljava/lang/Object;", "subList", "fromIndex", "toIndex", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class MutableVectorList<T> implements List<T>, KMutableList {
        private final MutableVector<T> vector;

        @Override // java.util.List, java.util.Collection
        public Object[] toArray() {
            return CollectionToArray.toArray(this);
        }

        @Override // java.util.List, java.util.Collection
        public <T> T[] toArray(T[] tArr) {
            return (T[]) CollectionToArray.toArray(this, tArr);
        }

        public MutableVectorList(MutableVector<T> mutableVector) {
            this.vector = mutableVector;
        }

        @Override // java.util.List
        public final /* bridge */ T remove(int index) {
            return removeAt(index);
        }

        @Override // java.util.List, java.util.Collection
        public final /* bridge */ int size() {
            return getSize();
        }

        public int getSize() {
            return this.vector.getSize();
        }

        @Override // java.util.List, java.util.Collection
        public boolean contains(Object element) {
            return this.vector.contains(element);
        }

        @Override // java.util.List, java.util.Collection
        public boolean containsAll(Collection<? extends Object> collection) {
            return this.vector.containsAll(collection);
        }

        @Override // java.util.List
        public T get(int index) {
            MutableVectorKt.checkIndex(this, index);
            MutableVector this_$iv = this.vector;
            return this_$iv.content[index];
        }

        @Override // java.util.List
        public int indexOf(Object element) {
            return this.vector.indexOf(element);
        }

        @Override // java.util.List, java.util.Collection
        public boolean isEmpty() {
            MutableVector this_$iv = this.vector;
            return this_$iv.getSize() == 0;
        }

        @Override // java.util.List, java.util.Collection, java.lang.Iterable
        public Iterator<T> iterator() {
            return new VectorListIterator(this, 0);
        }

        @Override // java.util.List
        public int lastIndexOf(Object element) {
            return this.vector.lastIndexOf(element);
        }

        @Override // java.util.List, java.util.Collection
        public boolean add(T t) {
            return this.vector.add(t);
        }

        @Override // java.util.List
        public void add(int index, T t) {
            this.vector.add(index, t);
        }

        @Override // java.util.List
        public boolean addAll(int index, Collection<? extends T> collection) {
            return this.vector.addAll(index, collection);
        }

        @Override // java.util.List, java.util.Collection
        public boolean addAll(Collection<? extends T> collection) {
            return this.vector.addAll(collection);
        }

        @Override // java.util.List, java.util.Collection
        public void clear() {
            this.vector.clear();
        }

        @Override // java.util.List
        public ListIterator<T> listIterator() {
            return new VectorListIterator(this, 0);
        }

        @Override // java.util.List
        public ListIterator<T> listIterator(int index) {
            return new VectorListIterator(this, index);
        }

        @Override // java.util.List, java.util.Collection
        public boolean remove(Object element) {
            return this.vector.remove(element);
        }

        @Override // java.util.List, java.util.Collection
        public boolean removeAll(Collection<? extends Object> collection) {
            return this.vector.removeAll(collection);
        }

        public T removeAt(int index) {
            MutableVectorKt.checkIndex(this, index);
            return this.vector.removeAt(index);
        }

        @Override // java.util.List, java.util.Collection
        public boolean retainAll(Collection<? extends Object> collection) {
            return this.vector.retainAll(collection);
        }

        @Override // java.util.List
        public T set(int index, T t) {
            MutableVectorKt.checkIndex(this, index);
            return this.vector.set(index, t);
        }

        @Override // java.util.List
        public List<T> subList(int fromIndex, int toIndex) {
            MutableVectorKt.checkSubIndex(this, fromIndex, toIndex);
            return new SubList(this, fromIndex, toIndex);
        }
    }

    /* compiled from: MutableVector.kt */
    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\u001e\n\u0002\b\t\n\u0002\u0010)\n\u0002\b\u0002\n\u0002\u0010+\n\u0002\b\n\b\u0002\u0018\u0000*\u0004\b\u0001\u0010\u00012\b\u0012\u0004\u0012\u0002H\u00010\u0002B#\u0012\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00010\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0002\u0010\u0007J\u0015\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u000eJ\u001d\u0010\u000b\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00052\u0006\u0010\r\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u0011J\u001e\u0010\u0012\u001a\u00020\f2\u0006\u0010\u0010\u001a\u00020\u00052\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00028\u00010\u0014H\u0016J\u0016\u0010\u0012\u001a\u00020\f2\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00028\u00010\u0014H\u0016J\b\u0010\u0015\u001a\u00020\u000fH\u0016J\u0016\u0010\u0016\u001a\u00020\f2\u0006\u0010\r\u001a\u00028\u0001H\u0096\u0002¢\u0006\u0002\u0010\u000eJ\u0016\u0010\u0017\u001a\u00020\f2\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00028\u00010\u0014H\u0016J\u0016\u0010\u0018\u001a\u00028\u00012\u0006\u0010\u0010\u001a\u00020\u0005H\u0096\u0002¢\u0006\u0002\u0010\u0019J\u0015\u0010\u001a\u001a\u00020\u00052\u0006\u0010\r\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u001bJ\b\u0010\u001c\u001a\u00020\fH\u0016J\u000f\u0010\u001d\u001a\b\u0012\u0004\u0012\u00028\u00010\u001eH\u0096\u0002J\u0015\u0010\u001f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u001bJ\u000e\u0010 \u001a\b\u0012\u0004\u0012\u00028\u00010!H\u0016J\u0016\u0010 \u001a\b\u0012\u0004\u0012\u00028\u00010!2\u0006\u0010\u0010\u001a\u00020\u0005H\u0016J\u0015\u0010\"\u001a\u00020\f2\u0006\u0010\r\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u000eJ\u0016\u0010#\u001a\u00020\f2\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00028\u00010\u0014H\u0016J\u0015\u0010$\u001a\u00028\u00012\u0006\u0010\u0010\u001a\u00020\u0005H\u0016¢\u0006\u0002\u0010\u0019J\u0016\u0010%\u001a\u00020\f2\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00028\u00010\u0014H\u0016J\u001e\u0010&\u001a\u00028\u00012\u0006\u0010\u0010\u001a\u00020\u00052\u0006\u0010\r\u001a\u00028\u0001H\u0096\u0002¢\u0006\u0002\u0010'J\u001e\u0010(\u001a\b\u0012\u0004\u0012\u00028\u00010\u00022\u0006\u0010)\u001a\u00020\u00052\u0006\u0010*\u001a\u00020\u0005H\u0016R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00010\u0002X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\b\u001a\u00020\u00058VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\t\u0010\nR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006+"}, d2 = {"Landroidx/compose/runtime/collection/MutableVector$SubList;", ExifInterface.GPS_DIRECTION_TRUE, "", "list", "start", "", "end", "(Ljava/util/List;II)V", "size", "getSize", "()I", "add", "", "element", "(Ljava/lang/Object;)Z", "", "index", "(ILjava/lang/Object;)V", "addAll", "elements", "", "clear", "contains", "containsAll", "get", "(I)Ljava/lang/Object;", "indexOf", "(Ljava/lang/Object;)I", "isEmpty", "iterator", "", "lastIndexOf", "listIterator", "", "remove", "removeAll", "removeAt", "retainAll", "set", "(ILjava/lang/Object;)Ljava/lang/Object;", "subList", "fromIndex", "toIndex", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    private static final class SubList<T> implements List<T>, KMutableList {
        private int end;
        private final List<T> list;
        private final int start;

        @Override // java.util.List, java.util.Collection
        public Object[] toArray() {
            return CollectionToArray.toArray(this);
        }

        @Override // java.util.List, java.util.Collection
        public <T> T[] toArray(T[] tArr) {
            return (T[]) CollectionToArray.toArray(this, tArr);
        }

        public SubList(List<T> list, int start, int end) {
            this.list = list;
            this.start = start;
            this.end = end;
        }

        @Override // java.util.List
        public final /* bridge */ T remove(int index) {
            return removeAt(index);
        }

        @Override // java.util.List, java.util.Collection
        public final /* bridge */ int size() {
            return getSize();
        }

        public int getSize() {
            return this.end - this.start;
        }

        @Override // java.util.List, java.util.Collection
        public boolean contains(Object element) {
            int i = this.end;
            for (int i2 = this.start; i2 < i; i2++) {
                if (Intrinsics.areEqual(this.list.get(i2), element)) {
                    return true;
                }
            }
            return false;
        }

        @Override // java.util.List, java.util.Collection
        public boolean containsAll(Collection<? extends Object> collection) {
            Collection<? extends Object> $this$forEach$iv = collection;
            for (Object element$iv : $this$forEach$iv) {
                if (!contains(element$iv)) {
                    return false;
                }
            }
            return true;
        }

        @Override // java.util.List
        public T get(int index) {
            MutableVectorKt.checkIndex(this, index);
            return this.list.get(this.start + index);
        }

        @Override // java.util.List
        public int indexOf(Object element) {
            int i = this.end;
            for (int i2 = this.start; i2 < i; i2++) {
                if (Intrinsics.areEqual(this.list.get(i2), element)) {
                    return i2 - this.start;
                }
            }
            return -1;
        }

        @Override // java.util.List, java.util.Collection
        public boolean isEmpty() {
            return this.end == this.start;
        }

        @Override // java.util.List, java.util.Collection, java.lang.Iterable
        public Iterator<T> iterator() {
            return new VectorListIterator(this, 0);
        }

        @Override // java.util.List
        public int lastIndexOf(Object element) {
            int i = this.end - 1;
            int i2 = this.start;
            if (i2 <= i) {
                while (!Intrinsics.areEqual(this.list.get(i), element)) {
                    if (i == i2) {
                        return -1;
                    }
                    i--;
                }
                return i - this.start;
            }
            return -1;
        }

        @Override // java.util.List, java.util.Collection
        public boolean add(T t) {
            List<T> list = this.list;
            int i = this.end;
            this.end = i + 1;
            list.add(i, t);
            return true;
        }

        @Override // java.util.List
        public void add(int index, T t) {
            this.list.add(this.start + index, t);
            this.end++;
        }

        @Override // java.util.List
        public boolean addAll(int index, Collection<? extends T> collection) {
            this.list.addAll(this.start + index, collection);
            int size = collection.size();
            this.end += size;
            return size > 0;
        }

        @Override // java.util.List, java.util.Collection
        public boolean addAll(Collection<? extends T> collection) {
            this.list.addAll(this.end, collection);
            int size = collection.size();
            this.end += size;
            return size > 0;
        }

        @Override // java.util.List, java.util.Collection
        public void clear() {
            int i = this.end - 1;
            int i2 = this.start;
            if (i2 <= i) {
                while (true) {
                    this.list.remove(i);
                    if (i == i2) {
                        break;
                    }
                    i--;
                }
            }
            this.end = this.start;
        }

        @Override // java.util.List
        public ListIterator<T> listIterator() {
            return new VectorListIterator(this, 0);
        }

        @Override // java.util.List
        public ListIterator<T> listIterator(int index) {
            return new VectorListIterator(this, index);
        }

        @Override // java.util.List, java.util.Collection
        public boolean remove(Object element) {
            int i = this.end;
            for (int i2 = this.start; i2 < i; i2++) {
                if (Intrinsics.areEqual(this.list.get(i2), element)) {
                    this.list.remove(i2);
                    this.end--;
                    return true;
                }
            }
            return false;
        }

        @Override // java.util.List, java.util.Collection
        public boolean removeAll(Collection<? extends Object> collection) {
            int originalEnd = this.end;
            Collection<? extends Object> $this$forEach$iv = collection;
            for (Object element$iv : $this$forEach$iv) {
                remove(element$iv);
            }
            return originalEnd != this.end;
        }

        public T removeAt(int index) {
            MutableVectorKt.checkIndex(this, index);
            this.end--;
            return this.list.remove(this.start + index);
        }

        @Override // java.util.List, java.util.Collection
        public boolean retainAll(Collection<? extends Object> collection) {
            int originalEnd = this.end;
            int i = this.end - 1;
            int i2 = this.start;
            if (i2 <= i) {
                while (true) {
                    Object item = this.list.get(i);
                    if (!collection.contains(item)) {
                        this.list.remove(i);
                        this.end--;
                    }
                    if (i == i2) {
                        break;
                    }
                    i--;
                }
            }
            return originalEnd != this.end;
        }

        @Override // java.util.List
        public T set(int index, T t) {
            MutableVectorKt.checkIndex(this, index);
            return this.list.set(this.start + index, t);
        }

        @Override // java.util.List
        public List<T> subList(int fromIndex, int toIndex) {
            MutableVectorKt.checkSubIndex(this, fromIndex, toIndex);
            return new SubList(this, fromIndex, toIndex);
        }
    }
}
