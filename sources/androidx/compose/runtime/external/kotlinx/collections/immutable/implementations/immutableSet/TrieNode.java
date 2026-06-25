package androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet;

import androidx.compose.runtime.external.kotlinx.collections.immutable.internal.CommonFunctionsKt;
import androidx.compose.runtime.external.kotlinx.collections.immutable.internal.DeltaCounter;
import androidx.compose.runtime.external.kotlinx.collections.immutable.internal.MutabilityOwnership;
import androidx.exifinterface.media.ExifInterface;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.ArraysKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: TrieNode.kt */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0011\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u001a\n\u0002\u0010\u000b\n\u0002\b\u001f\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0018\b\u0000\u0018\u0000 _*\u0004\b\u0000\u0010\u00012\u00020\u0002:\u0001_B\u001f\b\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u000e\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0006¢\u0006\u0002\u0010\u0007B'\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u000e\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0006\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0002\u0010\nJ)\u0010\u0018\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u0019\u001a\u00020\u00042\u0006\u0010\u001a\u001a\u00028\u00002\u0006\u0010\u001b\u001a\u00020\u0004¢\u0006\u0002\u0010\u001cJ#\u0010\u001d\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u001e\u001a\u00020\u00042\u0006\u0010\u001a\u001a\u00028\u0000H\u0002¢\u0006\u0002\u0010\u001fJ\b\u0010 \u001a\u00020\u0004H\u0002J\u001b\u0010!\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u001a\u001a\u00028\u0000H\u0002¢\u0006\u0002\u0010\"J\u0015\u0010#\u001a\u00020$2\u0006\u0010\u001a\u001a\u00028\u0000H\u0002¢\u0006\u0002\u0010%J\u001b\u0010&\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u001a\u001a\u00028\u0000H\u0002¢\u0006\u0002\u0010\"J\u0016\u0010'\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010(\u001a\u00020\u0004H\u0002J#\u0010)\u001a\u00020$2\u0006\u0010\u0019\u001a\u00020\u00042\u0006\u0010\u001a\u001a\u00028\u00002\u0006\u0010\u001b\u001a\u00020\u0004¢\u0006\u0002\u0010*J\u001c\u0010+\u001a\u00020$2\f\u0010,\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u001b\u001a\u00020\u0004J\u0015\u0010-\u001a\u00028\u00002\u0006\u0010.\u001a\u00020\u0004H\u0002¢\u0006\u0002\u0010/J\u0016\u00100\u001a\u00020$2\f\u0010,\u001a\b\u0012\u0004\u0012\u00028\u00000\u0000H\u0002J\u0010\u00101\u001a\u00020$2\u0006\u0010\u001e\u001a\u00020\u0004H\u0002J\u0015\u00102\u001a\u00020\u00042\u0006\u0010\u001e\u001a\u00020\u0004H\u0000¢\u0006\u0002\b3JE\u00104\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u00105\u001a\u00020\u00042\u0006\u00106\u001a\u00028\u00002\u0006\u00107\u001a\u00020\u00042\u0006\u00108\u001a\u00028\u00002\u0006\u0010\u001b\u001a\u00020\u00042\b\u00109\u001a\u0004\u0018\u00010\tH\u0002¢\u0006\u0002\u0010:J=\u0010;\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010<\u001a\u00020\u00042\u0006\u0010=\u001a\u00020\u00042\u0006\u0010>\u001a\u00028\u00002\u0006\u0010\u001b\u001a\u00020\u00042\b\u00109\u001a\u0004\u0018\u00010\tH\u0002¢\u0006\u0002\u0010?J3\u0010@\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010<\u001a\u00020\u00042\u0006\u0010=\u001a\u00020\u00042\u0006\u0010>\u001a\u00028\u00002\u0006\u0010\u001b\u001a\u00020\u0004H\u0002¢\u0006\u0002\u0010AJ5\u0010B\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u0019\u001a\u00020\u00042\u0006\u0010\u001a\u001a\u00028\u00002\u0006\u0010\u001b\u001a\u00020\u00042\n\u0010C\u001a\u0006\u0012\u0002\b\u00030D¢\u0006\u0002\u0010EJ6\u0010F\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\f\u0010,\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u001b\u001a\u00020\u00042\u0006\u0010G\u001a\u00020H2\n\u0010C\u001a\u0006\u0012\u0002\b\u00030DJ+\u0010I\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u001e\u001a\u00020\u00042\u0006\u0010\u001a\u001a\u00028\u00002\u0006\u00109\u001a\u00020\tH\u0002¢\u0006\u0002\u0010JJ'\u0010K\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u001a\u001a\u00028\u00002\n\u0010C\u001a\u0006\u0012\u0002\b\u00030DH\u0002¢\u0006\u0002\u0010LJ,\u0010M\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\f\u0010,\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010G\u001a\u00020H2\u0006\u00109\u001a\u00020\tH\u0002J'\u0010N\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u001a\u001a\u00028\u00002\n\u0010C\u001a\u0006\u0012\u0002\b\u00030DH\u0002¢\u0006\u0002\u0010LJ(\u0010O\u001a\u0004\u0018\u00010\u00022\f\u0010,\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010G\u001a\u00020H2\u0006\u00109\u001a\u00020\tH\u0002J\u001e\u0010P\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010(\u001a\u00020\u00042\u0006\u00109\u001a\u00020\tH\u0002J(\u0010Q\u001a\u0004\u0018\u00010\u00022\f\u0010,\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010G\u001a\u00020H2\u0006\u00109\u001a\u00020\tH\u0002J;\u0010R\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010<\u001a\u00020\u00042\u0006\u0010=\u001a\u00020\u00042\u0006\u0010>\u001a\u00028\u00002\u0006\u0010\u001b\u001a\u00020\u00042\u0006\u00109\u001a\u00020\tH\u0002¢\u0006\u0002\u0010?J5\u0010S\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u0019\u001a\u00020\u00042\u0006\u0010\u001a\u001a\u00028\u00002\u0006\u0010\u001b\u001a\u00020\u00042\n\u0010C\u001a\u0006\u0012\u0002\b\u00030D¢\u0006\u0002\u0010EJ2\u0010T\u001a\u0004\u0018\u00010\u00022\f\u0010,\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u001b\u001a\u00020\u00042\u0006\u0010G\u001a\u00020H2\n\u0010C\u001a\u0006\u0012\u0002\b\u00030DJ&\u0010U\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010V\u001a\u00020\u00042\u0006\u0010\u001e\u001a\u00020\u00042\u0006\u00109\u001a\u00020\tH\u0002J2\u0010W\u001a\u0004\u0018\u00010\u00022\f\u0010,\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u001b\u001a\u00020\u00042\u0006\u0010G\u001a\u00020H2\n\u0010C\u001a\u0006\u0012\u0002\b\u00030DJ,\u0010X\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010Y\u001a\u00020\u00042\f\u0010Z\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u00109\u001a\u00020\tH\u0002J\u0016\u0010[\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010.\u001a\u00020\u0004H\u0002J)\u0010\\\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u0019\u001a\u00020\u00042\u0006\u0010\u001a\u001a\u00028\u00002\u0006\u0010\u001b\u001a\u00020\u0004¢\u0006\u0002\u0010\u001cJ\u001e\u0010]\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010V\u001a\u00020\u00042\u0006\u0010\u001e\u001a\u00020\u0004H\u0002J$\u0010^\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010Y\u001a\u00020\u00042\f\u0010Z\u001a\b\u0012\u0004\u0012\u00028\u00000\u0000H\u0002R\u001a\u0010\u0003\u001a\u00020\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u000b\u0010\f\"\u0004\b\r\u0010\u000eR$\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0006X\u0086\u000e¢\u0006\u0010\n\u0002\u0010\u0013\u001a\u0004\b\u000f\u0010\u0010\"\u0004\b\u0011\u0010\u0012R\u001c\u0010\b\u001a\u0004\u0018\u00010\tX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017¨\u0006`"}, d2 = {"Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/TrieNode;", ExifInterface.LONGITUDE_EAST, "", "bitmap", "", "buffer", "", "(I[Ljava/lang/Object;)V", "ownedBy", "Landroidx/compose/runtime/external/kotlinx/collections/immutable/internal/MutabilityOwnership;", "(I[Ljava/lang/Object;Landroidx/compose/runtime/external/kotlinx/collections/immutable/internal/MutabilityOwnership;)V", "getBitmap", "()I", "setBitmap", "(I)V", "getBuffer", "()[Ljava/lang/Object;", "setBuffer", "([Ljava/lang/Object;)V", "[Ljava/lang/Object;", "getOwnedBy", "()Landroidx/compose/runtime/external/kotlinx/collections/immutable/internal/MutabilityOwnership;", "setOwnedBy", "(Landroidx/compose/runtime/external/kotlinx/collections/immutable/internal/MutabilityOwnership;)V", "add", "elementHash", "element", "shift", "(ILjava/lang/Object;I)Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/TrieNode;", "addElementAt", "positionMask", "(ILjava/lang/Object;)Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/TrieNode;", "calculateSize", "collisionAdd", "(Ljava/lang/Object;)Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/TrieNode;", "collisionContainsElement", "", "(Ljava/lang/Object;)Z", "collisionRemove", "collisionRemoveElementAtIndex", "i", "contains", "(ILjava/lang/Object;I)Z", "containsAll", "otherNode", "elementAtIndex", "index", "(I)Ljava/lang/Object;", "elementsIdentityEquals", "hasNoCellAt", "indexOfCellAt", "indexOfCellAt$runtime_release", "makeNode", "elementHash1", "element1", "elementHash2", "element2", "owner", "(ILjava/lang/Object;ILjava/lang/Object;ILandroidx/compose/runtime/external/kotlinx/collections/immutable/internal/MutabilityOwnership;)Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/TrieNode;", "makeNodeAtIndex", "elementIndex", "newElementHash", "newElement", "(IILjava/lang/Object;ILandroidx/compose/runtime/external/kotlinx/collections/immutable/internal/MutabilityOwnership;)Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/TrieNode;", "moveElementToNode", "(IILjava/lang/Object;I)Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/TrieNode;", "mutableAdd", "mutator", "Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/PersistentHashSetBuilder;", "(ILjava/lang/Object;ILandroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/PersistentHashSetBuilder;)Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/TrieNode;", "mutableAddAll", "intersectionSizeRef", "Landroidx/compose/runtime/external/kotlinx/collections/immutable/internal/DeltaCounter;", "mutableAddElementAt", "(ILjava/lang/Object;Landroidx/compose/runtime/external/kotlinx/collections/immutable/internal/MutabilityOwnership;)Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/TrieNode;", "mutableCollisionAdd", "(Ljava/lang/Object;Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/PersistentHashSetBuilder;)Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/TrieNode;", "mutableCollisionAddAll", "mutableCollisionRemove", "mutableCollisionRemoveAll", "mutableCollisionRemoveElementAtIndex", "mutableCollisionRetainAll", "mutableMoveElementToNode", "mutableRemove", "mutableRemoveAll", "mutableRemoveCellAtIndex", "cellIndex", "mutableRetainAll", "mutableUpdateNodeAtIndex", "nodeIndex", "newNode", "nodeAtIndex", "remove", "removeCellAtIndex", "updateNodeAtIndex", "Companion", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class TrieNode<E> {
    private int bitmap;
    private Object[] buffer;
    private MutabilityOwnership ownedBy;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;
    private static final TrieNode EMPTY = new TrieNode(0, new Object[0]);

    public TrieNode(int bitmap, Object[] buffer, MutabilityOwnership ownedBy) {
        this.bitmap = bitmap;
        this.buffer = buffer;
        this.ownedBy = ownedBy;
    }

    public final int getBitmap() {
        return this.bitmap;
    }

    public final void setBitmap(int i) {
        this.bitmap = i;
    }

    public final Object[] getBuffer() {
        return this.buffer;
    }

    public final void setBuffer(Object[] objArr) {
        this.buffer = objArr;
    }

    public final MutabilityOwnership getOwnedBy() {
        return this.ownedBy;
    }

    public final void setOwnedBy(MutabilityOwnership mutabilityOwnership) {
        this.ownedBy = mutabilityOwnership;
    }

    public TrieNode(int bitmap, Object[] buffer) {
        this(bitmap, buffer, null);
    }

    private final boolean hasNoCellAt(int positionMask) {
        return (this.bitmap & positionMask) == 0;
    }

    public final int indexOfCellAt$runtime_release(int positionMask) {
        return Integer.bitCount(this.bitmap & (positionMask - 1));
    }

    private final E elementAtIndex(int index) {
        return (E) this.buffer[index];
    }

    private final TrieNode<E> nodeAtIndex(int index) {
        Object obj = this.buffer[index];
        Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
        return (TrieNode) obj;
    }

    private final TrieNode<E> addElementAt(int positionMask, E e) {
        Object[] newBuffer;
        int index = indexOfCellAt$runtime_release(positionMask);
        newBuffer = TrieNodeKt.addElementAtIndex(this.buffer, index, e);
        return new TrieNode<>(this.bitmap | positionMask, newBuffer);
    }

    private final TrieNode<E> mutableAddElementAt(int positionMask, E e, MutabilityOwnership owner) {
        Object[] newBuffer;
        Object[] addElementAtIndex;
        int index = indexOfCellAt$runtime_release(positionMask);
        MutabilityOwnership mutabilityOwnership = this.ownedBy;
        Object[] objArr = this.buffer;
        if (mutabilityOwnership == owner) {
            addElementAtIndex = TrieNodeKt.addElementAtIndex(objArr, index, e);
            this.buffer = addElementAtIndex;
            this.bitmap |= positionMask;
            return this;
        }
        newBuffer = TrieNodeKt.addElementAtIndex(objArr, index, e);
        return new TrieNode<>(this.bitmap | positionMask, newBuffer, owner);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private final TrieNode<E> updateNodeAtIndex(int nodeIndex, TrieNode<E> trieNode) {
        Object cell;
        Object[] newNodeBuffer = trieNode.buffer;
        if (newNodeBuffer.length == 1 && !(newNodeBuffer[0] instanceof TrieNode)) {
            if (this.buffer.length == 1) {
                trieNode.bitmap = this.bitmap;
                return trieNode;
            }
            Object cell2 = newNodeBuffer[0];
            cell = cell2;
        } else {
            cell = trieNode;
        }
        Object[] objArr = this.buffer;
        Object[] newBuffer = Arrays.copyOf(objArr, objArr.length);
        Intrinsics.checkNotNullExpressionValue(newBuffer, "copyOf(...)");
        newBuffer[nodeIndex] = cell;
        return new TrieNode<>(this.bitmap, newBuffer);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private final TrieNode<E> mutableUpdateNodeAtIndex(int nodeIndex, TrieNode<E> trieNode, MutabilityOwnership owner) {
        Object cell;
        Object[] newNodeBuffer = trieNode.buffer;
        if (newNodeBuffer.length == 1 && !(newNodeBuffer[0] instanceof TrieNode)) {
            if (this.buffer.length == 1) {
                trieNode.bitmap = this.bitmap;
                return trieNode;
            }
            Object cell2 = newNodeBuffer[0];
            cell = cell2;
        } else {
            cell = trieNode;
        }
        MutabilityOwnership mutabilityOwnership = this.ownedBy;
        Object[] objArr = this.buffer;
        if (mutabilityOwnership == owner) {
            objArr[nodeIndex] = cell;
            return this;
        }
        Object[] newBuffer = Arrays.copyOf(objArr, objArr.length);
        Intrinsics.checkNotNullExpressionValue(newBuffer, "copyOf(...)");
        newBuffer[nodeIndex] = cell;
        return new TrieNode<>(this.bitmap, newBuffer, owner);
    }

    private final TrieNode<E> makeNodeAtIndex(int elementIndex, int newElementHash, E e, int shift, MutabilityOwnership owner) {
        E elementAtIndex = elementAtIndex(elementIndex);
        return makeNode(elementAtIndex != null ? elementAtIndex.hashCode() : 0, elementAtIndex, newElementHash, e, shift + 5, owner);
    }

    private final TrieNode<E> moveElementToNode(int elementIndex, int newElementHash, E e, int shift) {
        Object[] objArr = this.buffer;
        Object[] newBuffer = Arrays.copyOf(objArr, objArr.length);
        Intrinsics.checkNotNullExpressionValue(newBuffer, "copyOf(...)");
        newBuffer[elementIndex] = makeNodeAtIndex(elementIndex, newElementHash, e, shift, null);
        return new TrieNode<>(this.bitmap, newBuffer);
    }

    private final TrieNode<E> mutableMoveElementToNode(int elementIndex, int newElementHash, E e, int shift, MutabilityOwnership owner) {
        MutabilityOwnership mutabilityOwnership = this.ownedBy;
        Object[] objArr = this.buffer;
        if (mutabilityOwnership == owner) {
            objArr[elementIndex] = makeNodeAtIndex(elementIndex, newElementHash, e, shift, owner);
            return this;
        }
        Object[] newBuffer = Arrays.copyOf(objArr, objArr.length);
        Intrinsics.checkNotNullExpressionValue(newBuffer, "copyOf(...)");
        newBuffer[elementIndex] = makeNodeAtIndex(elementIndex, newElementHash, e, shift, owner);
        return new TrieNode<>(this.bitmap, newBuffer, owner);
    }

    private final TrieNode<E> makeNode(int elementHash1, E e, int elementHash2, E e2, int shift, MutabilityOwnership owner) {
        if (shift > 30) {
            return new TrieNode<>(0, new Object[]{e, e2}, owner);
        }
        int setBit1 = TrieNodeKt.indexSegment(elementHash1, shift);
        int setBit2 = TrieNodeKt.indexSegment(elementHash2, shift);
        if (setBit1 != setBit2) {
            Object[] nodeBuffer = setBit1 < setBit2 ? new Object[]{e, e2} : new Object[]{e2, e};
            return new TrieNode<>((1 << setBit1) | (1 << setBit2), nodeBuffer, owner);
        }
        TrieNode node = makeNode(elementHash1, e, elementHash2, e2, shift + 5, owner);
        return new TrieNode<>(1 << setBit1, new Object[]{node}, owner);
    }

    private final TrieNode<E> removeCellAtIndex(int cellIndex, int positionMask) {
        Object[] newBuffer;
        newBuffer = TrieNodeKt.removeCellAtIndex(this.buffer, cellIndex);
        return new TrieNode<>(this.bitmap ^ positionMask, newBuffer);
    }

    private final TrieNode<E> mutableRemoveCellAtIndex(int cellIndex, int positionMask, MutabilityOwnership owner) {
        Object[] newBuffer;
        Object[] removeCellAtIndex;
        MutabilityOwnership mutabilityOwnership = this.ownedBy;
        Object[] objArr = this.buffer;
        if (mutabilityOwnership == owner) {
            removeCellAtIndex = TrieNodeKt.removeCellAtIndex(objArr, cellIndex);
            this.buffer = removeCellAtIndex;
            this.bitmap ^= positionMask;
            return this;
        }
        newBuffer = TrieNodeKt.removeCellAtIndex(objArr, cellIndex);
        return new TrieNode<>(this.bitmap ^ positionMask, newBuffer, owner);
    }

    private final TrieNode<E> collisionRemoveElementAtIndex(int i) {
        Object[] newBuffer;
        newBuffer = TrieNodeKt.removeCellAtIndex(this.buffer, i);
        return new TrieNode<>(0, newBuffer);
    }

    private final TrieNode<E> mutableCollisionRemoveElementAtIndex(int i, MutabilityOwnership owner) {
        Object[] newBuffer;
        Object[] removeCellAtIndex;
        MutabilityOwnership mutabilityOwnership = this.ownedBy;
        Object[] objArr = this.buffer;
        if (mutabilityOwnership == owner) {
            removeCellAtIndex = TrieNodeKt.removeCellAtIndex(objArr, i);
            this.buffer = removeCellAtIndex;
            return this;
        }
        newBuffer = TrieNodeKt.removeCellAtIndex(objArr, i);
        return new TrieNode<>(0, newBuffer, owner);
    }

    private final boolean collisionContainsElement(E e) {
        return ArraysKt.contains((E[]) this.buffer, e);
    }

    private final TrieNode<E> collisionAdd(E e) {
        Object[] newBuffer;
        if (collisionContainsElement(e)) {
            return this;
        }
        newBuffer = TrieNodeKt.addElementAtIndex(this.buffer, 0, e);
        return new TrieNode<>(0, newBuffer);
    }

    private final TrieNode<E> mutableCollisionAdd(E e, PersistentHashSetBuilder<?> persistentHashSetBuilder) {
        Object[] newBuffer;
        Object[] addElementAtIndex;
        if (collisionContainsElement(e)) {
            return this;
        }
        persistentHashSetBuilder.setSize(persistentHashSetBuilder.size() + 1);
        MutabilityOwnership mutabilityOwnership = this.ownedBy;
        MutabilityOwnership ownership$runtime_release = persistentHashSetBuilder.getOwnership$runtime_release();
        Object[] objArr = this.buffer;
        if (mutabilityOwnership == ownership$runtime_release) {
            addElementAtIndex = TrieNodeKt.addElementAtIndex(objArr, 0, e);
            this.buffer = addElementAtIndex;
            return this;
        }
        newBuffer = TrieNodeKt.addElementAtIndex(objArr, 0, e);
        return new TrieNode<>(0, newBuffer, persistentHashSetBuilder.getOwnership$runtime_release());
    }

    private final TrieNode<E> collisionRemove(E e) {
        int index = ArraysKt.indexOf((E[]) this.buffer, e);
        if (index != -1) {
            return collisionRemoveElementAtIndex(index);
        }
        return this;
    }

    private final TrieNode<E> mutableCollisionRemove(E e, PersistentHashSetBuilder<?> persistentHashSetBuilder) {
        int index = ArraysKt.indexOf((E[]) this.buffer, e);
        if (index != -1) {
            persistentHashSetBuilder.setSize(persistentHashSetBuilder.size() - 1);
            return mutableCollisionRemoveElementAtIndex(index, persistentHashSetBuilder.getOwnership$runtime_release());
        }
        return this;
    }

    private final TrieNode<E> mutableCollisionAddAll(TrieNode<E> trieNode, DeltaCounter intersectionSizeRef, MutabilityOwnership owner) {
        Object[] newBuffer;
        Object[] objArr = this.buffer;
        if (this == trieNode) {
            intersectionSizeRef.plusAssign(objArr.length);
            return this;
        }
        Object[] tempBuffer = Arrays.copyOf(objArr, this.buffer.length + trieNode.buffer.length);
        Intrinsics.checkNotNullExpressionValue(tempBuffer, "copyOf(...)");
        Object[] $this$filterTo$iv = trieNode.buffer;
        int newArrayOffset$iv = this.buffer.length;
        int i$iv = 0;
        int j$iv = 0;
        while (true) {
            if (i$iv >= $this$filterTo$iv.length) {
                break;
            }
            CommonFunctionsKt.m3844assert(j$iv <= i$iv);
            if (!collisionContainsElement((E) $this$filterTo$iv[i$iv])) {
                tempBuffer[newArrayOffset$iv + j$iv] = $this$filterTo$iv[i$iv];
                j$iv++;
                CommonFunctionsKt.m3844assert(newArrayOffset$iv + j$iv <= tempBuffer.length);
            }
            i$iv++;
        }
        int totalSize = this.buffer.length + j$iv;
        intersectionSizeRef.plusAssign(tempBuffer.length - totalSize);
        if (totalSize == this.buffer.length) {
            return this;
        }
        if (totalSize == trieNode.buffer.length) {
            return trieNode;
        }
        if (totalSize == tempBuffer.length) {
            newBuffer = tempBuffer;
        } else {
            newBuffer = Arrays.copyOf(tempBuffer, totalSize);
            Intrinsics.checkNotNullExpressionValue(newBuffer, "copyOf(...)");
        }
        if (Intrinsics.areEqual(this.ownedBy, owner)) {
            this.buffer = newBuffer;
            return this;
        }
        return new TrieNode<>(0, newBuffer, owner);
    }

    private final Object mutableCollisionRetainAll(TrieNode<E> trieNode, DeltaCounter intersectionSizeRef, MutabilityOwnership owner) {
        if (this == trieNode) {
            intersectionSizeRef.plusAssign(this.buffer.length);
            return this;
        }
        boolean areEqual = Intrinsics.areEqual(owner, this.ownedBy);
        Object[] tempBuffer = this.buffer;
        if (!areEqual) {
            tempBuffer = new Object[Math.min(tempBuffer.length, trieNode.buffer.length)];
        }
        Object[] $this$filterTo_u24default$iv = this.buffer;
        int i$iv = 0;
        int j$iv = 0;
        while (true) {
            if (i$iv >= $this$filterTo_u24default$iv.length) {
                break;
            }
            CommonFunctionsKt.m3844assert(j$iv <= i$iv);
            if (trieNode.collisionContainsElement((E) $this$filterTo_u24default$iv[i$iv])) {
                tempBuffer[0 + j$iv] = $this$filterTo_u24default$iv[i$iv];
                j$iv++;
                CommonFunctionsKt.m3844assert(0 + j$iv <= tempBuffer.length);
            }
            i$iv++;
        }
        intersectionSizeRef.plusAssign(j$iv);
        if (j$iv == 0) {
            return EMPTY;
        }
        if (j$iv == 1) {
            return tempBuffer[0];
        }
        if (j$iv == this.buffer.length) {
            return this;
        }
        if (j$iv == trieNode.buffer.length) {
            return trieNode;
        }
        if (j$iv == tempBuffer.length) {
            return new TrieNode(0, tempBuffer, owner);
        }
        Object[] copyOf = Arrays.copyOf(tempBuffer, j$iv);
        Intrinsics.checkNotNullExpressionValue(copyOf, "copyOf(...)");
        return new TrieNode(0, copyOf, owner);
    }

    private final Object mutableCollisionRemoveAll(TrieNode<E> trieNode, DeltaCounter intersectionSizeRef, MutabilityOwnership owner) {
        if (this == trieNode) {
            intersectionSizeRef.plusAssign(this.buffer.length);
            return EMPTY;
        }
        boolean areEqual = Intrinsics.areEqual(owner, this.ownedBy);
        Object[] tempBuffer = this.buffer;
        if (!areEqual) {
            tempBuffer = new Object[tempBuffer.length];
        }
        Object[] $this$filterTo_u24default$iv = this.buffer;
        int i$iv = 0;
        int j$iv = 0;
        while (true) {
            if (i$iv >= $this$filterTo_u24default$iv.length) {
                break;
            }
            CommonFunctionsKt.m3844assert(j$iv <= i$iv);
            if (!trieNode.collisionContainsElement((E) $this$filterTo_u24default$iv[i$iv])) {
                tempBuffer[0 + j$iv] = $this$filterTo_u24default$iv[i$iv];
                j$iv++;
                CommonFunctionsKt.m3844assert(0 + j$iv <= tempBuffer.length);
            }
            i$iv++;
        }
        intersectionSizeRef.plusAssign(this.buffer.length - j$iv);
        if (j$iv == 0) {
            return EMPTY;
        }
        if (j$iv == 1) {
            return tempBuffer[0];
        }
        if (j$iv == this.buffer.length) {
            return this;
        }
        if (j$iv == tempBuffer.length) {
            return new TrieNode(0, tempBuffer, owner);
        }
        Object[] copyOf = Arrays.copyOf(tempBuffer, j$iv);
        Intrinsics.checkNotNullExpressionValue(copyOf, "copyOf(...)");
        return new TrieNode(0, copyOf, owner);
    }

    private final int calculateSize() {
        int i = this.bitmap;
        Object[] objArr = this.buffer;
        if (i == 0) {
            return objArr.length;
        }
        int result = 0;
        for (Object e : objArr) {
            result += e instanceof TrieNode ? ((TrieNode) e).calculateSize() : 1;
        }
        return result;
    }

    private final boolean elementsIdentityEquals(TrieNode<E> trieNode) {
        if (this == trieNode) {
            return true;
        }
        if (this.bitmap != trieNode.bitmap) {
            return false;
        }
        int length = this.buffer.length;
        for (int i = 0; i < length; i++) {
            if (this.buffer[i] != trieNode.buffer[i]) {
                return false;
            }
        }
        return true;
    }

    public final boolean contains(int elementHash, E e, int shift) {
        int cellPositionMask = 1 << TrieNodeKt.indexSegment(elementHash, shift);
        if (hasNoCellAt(cellPositionMask)) {
            return false;
        }
        int cellIndex = indexOfCellAt$runtime_release(cellPositionMask);
        if (this.buffer[cellIndex] instanceof TrieNode) {
            TrieNode targetNode = nodeAtIndex(cellIndex);
            if (shift == 30) {
                return targetNode.collisionContainsElement(e);
            }
            return targetNode.contains(elementHash, e, shift + 5);
        }
        return Intrinsics.areEqual(e, this.buffer[cellIndex]);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r23v3 */
    /* JADX WARN: Type inference failed for: r2v10, types: [androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode] */
    public final TrieNode<E> mutableAddAll(TrieNode<E> trieNode, int shift, DeltaCounter intersectionSizeRef, PersistentHashSetBuilder<?> persistentHashSetBuilder) {
        Object thisCell;
        Object[] objArr;
        int positionMask;
        TrieNode trieNode2 = this;
        if (trieNode2 == trieNode) {
            intersectionSizeRef.setCount(intersectionSizeRef.getCount() + trieNode2.calculateSize());
            return trieNode2;
        } else if (shift > 30) {
            return trieNode2.mutableCollisionAddAll(trieNode, intersectionSizeRef, persistentHashSetBuilder.getOwnership$runtime_release());
        } else {
            int newBitMap = trieNode2.bitmap | trieNode.bitmap;
            TrieNode mutableNode = (newBitMap == trieNode2.bitmap && Intrinsics.areEqual(trieNode2.ownedBy, persistentHashSetBuilder.getOwnership$runtime_release())) ? trieNode2 : new TrieNode(newBitMap, new Object[Integer.bitCount(newBitMap)], persistentHashSetBuilder.getOwnership$runtime_release());
            int mask$iv = newBitMap;
            int index$iv = 0;
            while (mask$iv != 0) {
                int bit$iv = Integer.lowestOneBit(mask$iv);
                int newNodeIndex = index$iv;
                int thisIndex = trieNode2.indexOfCellAt$runtime_release(bit$iv);
                int otherNodeIndex = trieNode.indexOfCellAt$runtime_release(bit$iv);
                Object[] objArr2 = mutableNode.buffer;
                if (trieNode2.hasNoCellAt(bit$iv)) {
                    thisCell = (TrieNode<E>) trieNode.buffer[otherNodeIndex];
                    objArr = objArr2;
                } else {
                    boolean hasNoCellAt = trieNode.hasNoCellAt(bit$iv);
                    Object[] objArr3 = trieNode2.buffer;
                    if (hasNoCellAt) {
                        thisCell = (TrieNode<E>) objArr3[thisIndex];
                        objArr = objArr2;
                    } else {
                        thisCell = (E) objArr3[thisIndex];
                        E e = (E) trieNode.buffer[otherNodeIndex];
                        boolean thisIsNode = thisCell instanceof TrieNode;
                        boolean otherIsNode = e instanceof TrieNode;
                        if (thisIsNode && otherIsNode) {
                            Intrinsics.checkNotNull(thisCell, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                            TrieNode trieNode3 = (TrieNode) thisCell;
                            Intrinsics.checkNotNull(e, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                            TrieNode trieNode4 = (TrieNode) e;
                            objArr = objArr2;
                            thisCell = (TrieNode<E>) ((TrieNode) thisCell).mutableAddAll((TrieNode) e, shift + 5, intersectionSizeRef, persistentHashSetBuilder);
                            trieNode2 = this;
                        } else {
                            objArr = objArr2;
                            if (thisIsNode) {
                                Intrinsics.checkNotNull(thisCell, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                                TrieNode trieNode5 = (TrieNode) thisCell;
                                int oldSize = persistentHashSetBuilder.size();
                                TrieNode trieNode6 = (TrieNode) thisCell;
                                positionMask = e != null ? e.hashCode() : 0;
                                Object thisCell2 = trieNode6.mutableAdd(positionMask, e, shift + 5, persistentHashSetBuilder);
                                if (persistentHashSetBuilder.size() == oldSize) {
                                    intersectionSizeRef.setCount(intersectionSizeRef.getCount() + 1);
                                }
                                Unit unit = Unit.INSTANCE;
                                trieNode2 = this;
                                thisCell = (TrieNode<E>) thisCell2;
                            } else if (otherIsNode) {
                                Intrinsics.checkNotNull(e, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                                TrieNode trieNode7 = (TrieNode) e;
                                int oldSize2 = persistentHashSetBuilder.size();
                                ?? r2 = (TrieNode) e;
                                positionMask = thisCell != null ? thisCell.hashCode() : 0;
                                Object thisCell3 = r2.mutableAdd(positionMask, thisCell, shift + 5, persistentHashSetBuilder);
                                if (persistentHashSetBuilder.size() == oldSize2) {
                                    intersectionSizeRef.setCount(intersectionSizeRef.getCount() + 1);
                                }
                                Unit unit2 = Unit.INSTANCE;
                                trieNode2 = this;
                                thisCell = (TrieNode<E>) thisCell3;
                            } else if (Intrinsics.areEqual(thisCell, e)) {
                                intersectionSizeRef.setCount(intersectionSizeRef.getCount() + 1);
                                Object it = Unit.INSTANCE;
                                trieNode2 = this;
                            } else {
                                int hashCode = thisCell != null ? thisCell.hashCode() : 0;
                                positionMask = e != null ? e.hashCode() : 0;
                                int i = positionMask;
                                int i2 = hashCode;
                                trieNode2 = this;
                                thisCell = (TrieNode<E>) trieNode2.makeNode(i2, thisCell, i, e, shift + 5, persistentHashSetBuilder.getOwnership$runtime_release());
                            }
                        }
                    }
                }
                objArr[newNodeIndex] = thisCell;
                index$iv++;
                mask$iv ^= bit$iv;
            }
            return trieNode2.elementsIdentityEquals(mutableNode) ? trieNode2 : trieNode.elementsIdentityEquals(mutableNode) ? trieNode : mutableNode;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final Object mutableRetainAll(TrieNode<E> trieNode, int shift, DeltaCounter intersectionSizeRef, PersistentHashSetBuilder<?> persistentHashSetBuilder) {
        TrieNode mutableNode;
        boolean z;
        int mask$iv;
        int index$iv;
        Object newValue;
        if (this == trieNode) {
            intersectionSizeRef.plusAssign(calculateSize());
            return this;
        } else if (shift > 30) {
            return mutableCollisionRetainAll(trieNode, intersectionSizeRef, persistentHashSetBuilder.getOwnership$runtime_release());
        } else {
            int newBitMap = this.bitmap & trieNode.bitmap;
            if (newBitMap == 0) {
                return EMPTY;
            }
            if (Intrinsics.areEqual(this.ownedBy, persistentHashSetBuilder.getOwnership$runtime_release()) && newBitMap == this.bitmap) {
                mutableNode = this;
            } else {
                mutableNode = new TrieNode(newBitMap, new Object[Integer.bitCount(newBitMap)], persistentHashSetBuilder.getOwnership$runtime_release());
            }
            int realBitMap = 0;
            int $this$forEachOneBit$iv = newBitMap;
            boolean z2 = false;
            int mask$iv2 = $this$forEachOneBit$iv;
            int index$iv2 = 0;
            while (mask$iv2 != 0) {
                int bit$iv = Integer.lowestOneBit(mask$iv2);
                int newNodeIndex = index$iv2;
                int thisIndex = indexOfCellAt$runtime_release(bit$iv);
                int otherNodeIndex = trieNode.indexOfCellAt$runtime_release(bit$iv);
                TrieNode<E> $this$mutableRetainAll_u24lambda_u249_u24lambda_u248 = this;
                Object thisCell = $this$mutableRetainAll_u24lambda_u249_u24lambda_u248.buffer[thisIndex];
                Object otherNodeCell = trieNode.buffer[otherNodeIndex];
                int $this$forEachOneBit$iv2 = $this$forEachOneBit$iv;
                boolean thisIsNode = thisCell instanceof TrieNode;
                boolean thisIsNode2 = otherNodeCell instanceof TrieNode;
                if (!thisIsNode || !thisIsNode2) {
                    z = z2;
                    mask$iv = mask$iv2;
                    index$iv = index$iv2;
                    if (thisIsNode) {
                        Intrinsics.checkNotNull(thisCell, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                        TrieNode trieNode2 = (TrieNode) thisCell;
                        if (((TrieNode) thisCell).contains(otherNodeCell != null ? otherNodeCell.hashCode() : 0, otherNodeCell, shift + 5)) {
                            intersectionSizeRef.plusAssign(1);
                            newValue = otherNodeCell;
                        } else {
                            newValue = EMPTY;
                        }
                    } else if (thisIsNode2) {
                        Intrinsics.checkNotNull(otherNodeCell, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                        TrieNode trieNode3 = (TrieNode) otherNodeCell;
                        if (((TrieNode) otherNodeCell).contains(thisCell != null ? thisCell.hashCode() : 0, thisCell, shift + 5)) {
                            intersectionSizeRef.plusAssign(1);
                            newValue = thisCell;
                        } else {
                            newValue = EMPTY;
                        }
                    } else if (Intrinsics.areEqual(thisCell, otherNodeCell)) {
                        intersectionSizeRef.plusAssign(1);
                        newValue = thisCell;
                    } else {
                        newValue = EMPTY;
                    }
                } else {
                    Intrinsics.checkNotNull(thisCell, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                    TrieNode trieNode4 = (TrieNode) thisCell;
                    Intrinsics.checkNotNull(otherNodeCell, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                    TrieNode trieNode5 = (TrieNode) otherNodeCell;
                    z = z2;
                    mask$iv = mask$iv2;
                    int mask$iv3 = shift + 5;
                    index$iv = index$iv2;
                    newValue = ((TrieNode) thisCell).mutableRetainAll((TrieNode) otherNodeCell, mask$iv3, intersectionSizeRef, persistentHashSetBuilder);
                }
                if (newValue != EMPTY) {
                    realBitMap |= bit$iv;
                }
                mutableNode.buffer[newNodeIndex] = newValue;
                mask$iv2 = mask$iv ^ bit$iv;
                index$iv2 = index$iv + 1;
                $this$forEachOneBit$iv = $this$forEachOneBit$iv2;
                z2 = z;
            }
            int realSize = Integer.bitCount(realBitMap);
            if (realBitMap == 0) {
                return EMPTY;
            }
            if (realBitMap == newBitMap) {
                if (mutableNode.elementsIdentityEquals(this)) {
                    return this;
                }
                return mutableNode.elementsIdentityEquals(trieNode) ? trieNode : mutableNode;
            }
            boolean z3 = true;
            if (realSize == 1 && shift != 0) {
                Object single = mutableNode.buffer[mutableNode.indexOfCellAt$runtime_release(realBitMap)];
                return single instanceof TrieNode ? new TrieNode(realBitMap, new Object[]{single}, persistentHashSetBuilder.getOwnership$runtime_release()) : single;
            }
            Object[] realBuffer = new Object[realSize];
            Object[] $this$filterTo_u24default$iv = mutableNode.buffer;
            int i$iv = 0;
            int j$iv = 0;
            while (i$iv < $this$filterTo_u24default$iv.length) {
                CommonFunctionsKt.m3844assert(j$iv <= i$iv ? z3 : false);
                Object e$iv = $this$filterTo_u24default$iv[i$iv];
                if (e$iv != Companion.getEMPTY$runtime_release()) {
                    realBuffer[0 + j$iv] = $this$filterTo_u24default$iv[i$iv];
                    j$iv++;
                    CommonFunctionsKt.m3844assert(0 + j$iv <= realBuffer.length);
                }
                i$iv++;
                z3 = true;
            }
            return new TrieNode(realBitMap, realBuffer, persistentHashSetBuilder.getOwnership$runtime_release());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final Object mutableRemoveAll(TrieNode<E> trieNode, int shift, DeltaCounter intersectionSizeRef, PersistentHashSetBuilder<?> persistentHashSetBuilder) {
        TrieNode mutableNode;
        int removalBitmap;
        int $this$forEachOneBit$iv;
        boolean z;
        Object newValue;
        TrieNode<E> trieNode2 = trieNode;
        if (this == trieNode2) {
            intersectionSizeRef.plusAssign(calculateSize());
            return EMPTY;
        } else if (shift > 30) {
            return mutableCollisionRemoveAll(trieNode2, intersectionSizeRef, persistentHashSetBuilder.getOwnership$runtime_release());
        } else {
            int removalBitmap2 = this.bitmap & trieNode2.bitmap;
            if (removalBitmap2 == 0) {
                return this;
            }
            if (Intrinsics.areEqual(this.ownedBy, persistentHashSetBuilder.getOwnership$runtime_release())) {
                mutableNode = this;
            } else {
                int i = this.bitmap;
                Object[] objArr = this.buffer;
                Object[] copyOf = Arrays.copyOf(objArr, objArr.length);
                Intrinsics.checkNotNullExpressionValue(copyOf, "copyOf(...)");
                mutableNode = new TrieNode(i, copyOf, persistentHashSetBuilder.getOwnership$runtime_release());
            }
            int realBitMap = this.bitmap;
            int $this$forEachOneBit$iv2 = removalBitmap2;
            boolean z2 = false;
            int mask$iv = $this$forEachOneBit$iv2;
            int index$iv = 0;
            while (mask$iv != 0) {
                int bit$iv = Integer.lowestOneBit(mask$iv);
                int thisIndex = indexOfCellAt$runtime_release(bit$iv);
                int otherNodeIndex = trieNode2.indexOfCellAt$runtime_release(bit$iv);
                TrieNode<E> $this$mutableRemoveAll_u24lambda_u2411_u24lambda_u2410 = this;
                Object thisCell = $this$mutableRemoveAll_u24lambda_u2411_u24lambda_u2410.buffer[thisIndex];
                Object otherNodeCell = trieNode2.buffer[otherNodeIndex];
                boolean thisIsNode = thisCell instanceof TrieNode;
                boolean thisIsNode2 = otherNodeCell instanceof TrieNode;
                if (!thisIsNode || !thisIsNode2) {
                    removalBitmap = removalBitmap2;
                    $this$forEachOneBit$iv = $this$forEachOneBit$iv2;
                    if (thisIsNode) {
                        Intrinsics.checkNotNull(thisCell, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                        TrieNode trieNode3 = (TrieNode) thisCell;
                        int oldSize = persistentHashSetBuilder.size();
                        z = z2;
                        int $i$f$forEachOneBit = shift + 5;
                        TrieNode removed = ((TrieNode) thisCell).mutableRemove(otherNodeCell != null ? otherNodeCell.hashCode() : 0, otherNodeCell, $i$f$forEachOneBit, persistentHashSetBuilder);
                        if (oldSize != persistentHashSetBuilder.size()) {
                            intersectionSizeRef.plusAssign(1);
                            if (removed.buffer.length == 1 && !(removed.buffer[0] instanceof TrieNode)) {
                                newValue = removed.buffer[0];
                            } else {
                                newValue = removed;
                            }
                        }
                        newValue = thisCell;
                    } else {
                        z = z2;
                        if (thisIsNode2) {
                            Intrinsics.checkNotNull(otherNodeCell, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                            TrieNode trieNode4 = (TrieNode) otherNodeCell;
                            if (((TrieNode) otherNodeCell).contains(thisCell != null ? thisCell.hashCode() : 0, thisCell, shift + 5)) {
                                intersectionSizeRef.plusAssign(1);
                                newValue = EMPTY;
                            }
                            newValue = thisCell;
                        } else {
                            if (Intrinsics.areEqual(thisCell, otherNodeCell)) {
                                intersectionSizeRef.plusAssign(1);
                                newValue = EMPTY;
                            }
                            newValue = thisCell;
                        }
                    }
                } else {
                    Intrinsics.checkNotNull(thisCell, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                    TrieNode trieNode5 = (TrieNode) thisCell;
                    Intrinsics.checkNotNull(otherNodeCell, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                    TrieNode trieNode6 = (TrieNode) otherNodeCell;
                    removalBitmap = removalBitmap2;
                    $this$forEachOneBit$iv = $this$forEachOneBit$iv2;
                    newValue = ((TrieNode) thisCell).mutableRemoveAll((TrieNode) otherNodeCell, shift + 5, intersectionSizeRef, persistentHashSetBuilder);
                    z = z2;
                }
                if (newValue == EMPTY) {
                    realBitMap ^= bit$iv;
                }
                mutableNode.buffer[thisIndex] = newValue;
                index$iv++;
                mask$iv ^= bit$iv;
                trieNode2 = trieNode;
                removalBitmap2 = removalBitmap;
                $this$forEachOneBit$iv2 = $this$forEachOneBit$iv;
                z2 = z;
            }
            int realSize = Integer.bitCount(realBitMap);
            if (realBitMap == 0) {
                return EMPTY;
            }
            if (realBitMap == this.bitmap) {
                if (mutableNode.elementsIdentityEquals(this)) {
                    return this;
                }
                return mutableNode;
            }
            boolean z3 = true;
            if (realSize == 1 && shift != 0) {
                Object single = mutableNode.buffer[mutableNode.indexOfCellAt$runtime_release(realBitMap)];
                return single instanceof TrieNode ? new TrieNode(realBitMap, new Object[]{single}, persistentHashSetBuilder.getOwnership$runtime_release()) : single;
            }
            Object[] realBuffer = new Object[realSize];
            Object[] $this$filterTo_u24default$iv = mutableNode.buffer;
            int i$iv = 0;
            int j$iv = 0;
            while (i$iv < $this$filterTo_u24default$iv.length) {
                CommonFunctionsKt.m3844assert(j$iv <= i$iv ? z3 : false);
                Object e$iv = $this$filterTo_u24default$iv[i$iv];
                if (e$iv != Companion.getEMPTY$runtime_release()) {
                    realBuffer[0 + j$iv] = $this$filterTo_u24default$iv[i$iv];
                    j$iv++;
                    CommonFunctionsKt.m3844assert(0 + j$iv <= realBuffer.length);
                }
                i$iv++;
                z3 = true;
            }
            return new TrieNode(realBitMap, realBuffer, persistentHashSetBuilder.getOwnership$runtime_release());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final boolean containsAll(TrieNode<E> trieNode, int shift) {
        TrieNode<E> trieNode2 = this;
        TrieNode<E> trieNode3 = trieNode;
        boolean z = true;
        if (trieNode2 == trieNode3) {
            return true;
        }
        boolean z2 = false;
        if (shift <= 30) {
            int potentialBitMap = trieNode2.bitmap & trieNode3.bitmap;
            if (potentialBitMap != trieNode3.bitmap) {
                return false;
            }
            int mask$iv = potentialBitMap;
            int index$iv = 0;
            while (mask$iv != 0) {
                int bit$iv = Integer.lowestOneBit(mask$iv);
                int thisIndex = trieNode2.indexOfCellAt$runtime_release(bit$iv);
                int otherNodeIndex = trieNode3.indexOfCellAt$runtime_release(bit$iv);
                Object thisCell = trieNode2.buffer[thisIndex];
                boolean z3 = z;
                Object otherNodeCell = trieNode3.buffer[otherNodeIndex];
                boolean z4 = z2;
                boolean thisIsNode = thisCell instanceof TrieNode;
                boolean otherIsNode = otherNodeCell instanceof TrieNode;
                if (thisIsNode && otherIsNode) {
                    Intrinsics.checkNotNull(thisCell, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                    TrieNode trieNode4 = (TrieNode) thisCell;
                    Intrinsics.checkNotNull(otherNodeCell, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                    TrieNode trieNode5 = (TrieNode) otherNodeCell;
                    if (!((TrieNode) thisCell).containsAll((TrieNode) otherNodeCell, shift + 5)) {
                        return z4;
                    }
                } else if (thisIsNode) {
                    Intrinsics.checkNotNull(thisCell, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableSet.TrieNode>");
                    TrieNode trieNode6 = (TrieNode) thisCell;
                    if (!((TrieNode) thisCell).contains(otherNodeCell != null ? otherNodeCell.hashCode() : z4, otherNodeCell, shift + 5)) {
                        return z4;
                    }
                } else if (otherIsNode || !Intrinsics.areEqual(thisCell, otherNodeCell)) {
                    return z4;
                }
                index$iv++;
                mask$iv ^= bit$iv;
                trieNode2 = this;
                trieNode3 = trieNode;
                z = z3;
                z2 = z4;
            }
            return z;
        }
        Object[] $this$all$iv = trieNode3.buffer;
        for (Object element$iv : $this$all$iv) {
            if (!ArraysKt.contains(trieNode2.buffer, element$iv)) {
                return false;
            }
        }
        return true;
    }

    public final TrieNode<E> add(int elementHash, E e, int shift) {
        TrieNode newNode;
        int cellPositionMask = 1 << TrieNodeKt.indexSegment(elementHash, shift);
        if (hasNoCellAt(cellPositionMask)) {
            return addElementAt(cellPositionMask, e);
        }
        int cellIndex = indexOfCellAt$runtime_release(cellPositionMask);
        if (!(this.buffer[cellIndex] instanceof TrieNode)) {
            return Intrinsics.areEqual(e, this.buffer[cellIndex]) ? this : moveElementToNode(cellIndex, elementHash, e, shift);
        }
        TrieNode targetNode = nodeAtIndex(cellIndex);
        if (shift == 30) {
            newNode = targetNode.collisionAdd(e);
        } else {
            newNode = targetNode.add(elementHash, e, shift + 5);
        }
        return targetNode == newNode ? this : updateNodeAtIndex(cellIndex, newNode);
    }

    public final TrieNode<E> mutableAdd(int elementHash, E e, int shift, PersistentHashSetBuilder<?> persistentHashSetBuilder) {
        TrieNode newNode;
        int cellPosition = 1 << TrieNodeKt.indexSegment(elementHash, shift);
        if (hasNoCellAt(cellPosition)) {
            persistentHashSetBuilder.setSize(persistentHashSetBuilder.size() + 1);
            return mutableAddElementAt(cellPosition, e, persistentHashSetBuilder.getOwnership$runtime_release());
        }
        int cellIndex = indexOfCellAt$runtime_release(cellPosition);
        if (this.buffer[cellIndex] instanceof TrieNode) {
            TrieNode targetNode = nodeAtIndex(cellIndex);
            if (shift == 30) {
                newNode = targetNode.mutableCollisionAdd(e, persistentHashSetBuilder);
            } else {
                newNode = targetNode.mutableAdd(elementHash, e, shift + 5, persistentHashSetBuilder);
            }
            return targetNode == newNode ? this : mutableUpdateNodeAtIndex(cellIndex, newNode, persistentHashSetBuilder.getOwnership$runtime_release());
        } else if (Intrinsics.areEqual(e, this.buffer[cellIndex])) {
            return this;
        } else {
            persistentHashSetBuilder.setSize(persistentHashSetBuilder.size() + 1);
            return mutableMoveElementToNode(cellIndex, elementHash, e, shift, persistentHashSetBuilder.getOwnership$runtime_release());
        }
    }

    public final TrieNode<E> remove(int elementHash, E e, int shift) {
        TrieNode newNode;
        int cellPositionMask = 1 << TrieNodeKt.indexSegment(elementHash, shift);
        if (hasNoCellAt(cellPositionMask)) {
            return this;
        }
        int cellIndex = indexOfCellAt$runtime_release(cellPositionMask);
        if (this.buffer[cellIndex] instanceof TrieNode) {
            TrieNode targetNode = nodeAtIndex(cellIndex);
            if (shift == 30) {
                newNode = targetNode.collisionRemove(e);
            } else {
                newNode = targetNode.remove(elementHash, e, shift + 5);
            }
            return targetNode == newNode ? this : updateNodeAtIndex(cellIndex, newNode);
        } else if (Intrinsics.areEqual(e, this.buffer[cellIndex])) {
            return removeCellAtIndex(cellIndex, cellPositionMask);
        } else {
            return this;
        }
    }

    public final TrieNode<E> mutableRemove(int elementHash, E e, int shift, PersistentHashSetBuilder<?> persistentHashSetBuilder) {
        TrieNode newNode;
        int cellPositionMask = 1 << TrieNodeKt.indexSegment(elementHash, shift);
        if (hasNoCellAt(cellPositionMask)) {
            return this;
        }
        int cellIndex = indexOfCellAt$runtime_release(cellPositionMask);
        if (this.buffer[cellIndex] instanceof TrieNode) {
            TrieNode targetNode = nodeAtIndex(cellIndex);
            if (shift == 30) {
                newNode = targetNode.mutableCollisionRemove(e, persistentHashSetBuilder);
            } else {
                newNode = targetNode.mutableRemove(elementHash, e, shift + 5, persistentHashSetBuilder);
            }
            if (this.ownedBy == persistentHashSetBuilder.getOwnership$runtime_release() || targetNode != newNode) {
                return mutableUpdateNodeAtIndex(cellIndex, newNode, persistentHashSetBuilder.getOwnership$runtime_release());
            }
            return this;
        } else if (Intrinsics.areEqual(e, this.buffer[cellIndex])) {
            persistentHashSetBuilder.setSize(persistentHashSetBuilder.size() - 1);
            return mutableRemoveCellAtIndex(cellIndex, cellPositionMask, persistentHashSetBuilder.getOwnership$runtime_release());
        } else {
            return this;
        }
    }

    /* compiled from: TrieNode.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0001\n\u0002\b\u0003\b\u0080\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u001a\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/TrieNode$Companion;", "", "()V", "EMPTY", "Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/TrieNode;", "", "getEMPTY$runtime_release", "()Landroidx/compose/runtime/external/kotlinx/collections/immutable/implementations/immutableSet/TrieNode;", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final TrieNode getEMPTY$runtime_release() {
            return TrieNode.EMPTY;
        }
    }
}
