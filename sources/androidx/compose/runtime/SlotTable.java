package androidx.compose.runtime;

import androidx.autofill.HintConstants;
import androidx.collection.MutableIntObjectMap;
import androidx.collection.MutableIntSet;
import androidx.compose.runtime.tooling.CompositionData;
import androidx.compose.runtime.tooling.CompositionGroup;
import androidx.compose.ui.spatial.RectListKt;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.exifinterface.media.ExifInterface;
import com.itextpdf.kernel.xmp.options.PropertyOptions;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.ArraysKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.markers.KMappedMarker;
import kotlin.text.StringsKt;
/* compiled from: SlotTable.kt */
@Metadata(d1 = {"\u0000²\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0015\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0011\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010(\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0000\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00030\u0002B\u0005¢\u0006\u0002\u0010\u0004J\u000e\u0010;\u001a\u00020\u00072\u0006\u0010<\u001a\u00020\u001cJ\u000e\u0010=\u001a\u00020\u001c2\u0006\u0010;\u001a\u00020\u0007J=\u0010>\u001a\u00020?2\u0006\u0010@\u001a\u00020A2&\u0010-\u001a\"\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020/\u0018\u00010.j\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020/\u0018\u0001`0H\u0000¢\u0006\u0002\bBJ\u008f\u0001\u0010>\u001a\u00020?2\u0006\u00109\u001a\u00020C2\u0006\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001d\u001a\u00020\u001c2\u000e\u0010'\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010$0&2\u0006\u0010+\u001a\u00020\u001c2\u0016\u0010\u0005\u001a\u0012\u0012\u0004\u0012\u00020\u00070\u0006j\b\u0012\u0004\u0012\u00020\u0007`\b2&\u0010-\u001a\"\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020/\u0018\u00010.j\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020/\u0018\u0001`02\u000e\u0010\r\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010\u000eH\u0000¢\u0006\u0004\bB\u0010DJ\u0006\u0010E\u001a\u00020?J\u0006\u0010F\u001a\u00020?J\u0006\u0010G\u001a\u00020!J\u000e\u0010H\u001a\b\u0012\u0004\u0012\u00020\u001c0IH\u0002J\u0012\u0010J\u001a\u0004\u0018\u00010\u00032\u0006\u0010K\u001a\u00020$H\u0016J\u0012\u0010L\u001a\u0004\u0018\u00010M2\u0006\u0010N\u001a\u00020\u001cH\u0002J\u0016\u0010O\u001a\u00020!2\u0006\u0010P\u001a\u00020\u001c2\u0006\u0010;\u001a\u00020\u0007J\u000e\u0010Q\u001a\b\u0012\u0004\u0012\u00020\u001c0IH\u0002J\u001d\u0010R\u001a\n\u0012\u0004\u0012\u00020M\u0018\u00010I2\u0006\u0010S\u001a\u00020\u001cH\u0000¢\u0006\u0002\bTJ\u000f\u0010U\u001a\b\u0012\u0004\u0012\u00020\u00030VH\u0096\u0002J\u000e\u0010W\u001a\b\u0012\u0004\u0012\u00020\u001c0IH\u0002J\u000e\u0010X\u001a\b\u0012\u0004\u0012\u00020\u001c0IH\u0002J\u0006\u0010Y\u001a\u00020AJ\u0006\u0010Z\u001a\u00020CJ\u000e\u0010[\u001a\u00020!2\u0006\u0010;\u001a\u00020\u0007J\u000e\u0010\\\u001a\b\u0012\u0004\u0012\u00020\u001c0IH\u0002J7\u0010]\u001a\u0002H^\"\u0004\b\u0000\u0010^2!\u0010_\u001a\u001d\u0012\u0013\u0012\u00110A¢\u0006\f\ba\u0012\b\bb\u0012\u0004\b\b(@\u0012\u0004\u0012\u0002H^0`H\u0086\b¢\u0006\u0002\u0010cJ\u0087\u0001\u0010d\u001a\u00020?2\u0006\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001d\u001a\u00020\u001c2\u000e\u0010'\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010$0&2\u0006\u0010+\u001a\u00020\u001c2\u0016\u0010\u0005\u001a\u0012\u0012\u0004\u0012\u00020\u00070\u0006j\b\u0012\u0004\u0012\u00020\u0007`\b2&\u0010-\u001a\"\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020/\u0018\u00010.j\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020/\u0018\u0001`02\u000e\u0010\r\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010\u000eH\u0000¢\u0006\u0004\be\u0010fJ\u001f\u0010g\u001a\u0004\u0018\u00010$2\u0006\u0010N\u001a\u00020\u001c2\u0006\u0010h\u001a\u00020\u001cH\u0000¢\u0006\u0002\biJ\u001d\u0010j\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010$0I2\u0006\u0010N\u001a\u00020\u001cH\u0000¢\u0006\u0002\bkJ\u0010\u0010l\u001a\u0004\u0018\u00010/2\u0006\u0010N\u001a\u00020\u001cJ\u0006\u0010m\u001a\u00020nJ\u0012\u0010o\u001a\u0004\u0018\u00010\u00072\u0006\u0010<\u001a\u00020\u001cH\u0002J\u0006\u0010p\u001a\u00020?J7\u0010q\u001a\u0002H^\"\u0004\b\u0000\u0010^2!\u0010_\u001a\u001d\u0012\u0013\u0012\u00110C¢\u0006\f\ba\u0012\b\bb\u0012\u0004\b\b(9\u0012\u0004\u0012\u0002H^0`H\u0086\b¢\u0006\u0002\u0010cJ \u0010r\u001a\u00020\u001c*\u00060sj\u0002`t2\u0006\u0010<\u001a\u00020\u001c2\u0006\u0010u\u001a\u00020\u001cH\u0002R*\u0010\u0005\u001a\u0012\u0012\u0004\u0012\u00020\u00070\u0006j\b\u0012\u0004\u0012\u00020\u0007`\bX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\t\u0010\n\"\u0004\b\u000b\u0010\fR\"\u0010\r\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010\u000eX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0010\u0010\u0011\"\u0004\b\u0012\u0010\u0013R\u001a\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00030\u00028VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0015\u0010\u0016R\u001e\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u0017\u001a\u00020\u0018@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u001e\u0010\u001d\u001a\u00020\u001c2\u0006\u0010\u0017\u001a\u00020\u001c@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001fR\u0014\u0010 \u001a\u00020!8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b \u0010\"R\u000e\u0010#\u001a\u00020$X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010%\u001a\u00020\u001cX\u0082\u000e¢\u0006\u0002\n\u0000R0\u0010'\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010$0&2\u000e\u0010\u0017\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010$0&@BX\u0086\u000e¢\u0006\n\n\u0002\u0010*\u001a\u0004\b(\u0010)R\u001e\u0010+\u001a\u00020\u001c2\u0006\u0010\u0017\u001a\u00020\u001c@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b,\u0010\u001fR:\u0010-\u001a\"\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020/\u0018\u00010.j\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020/\u0018\u0001`0X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b1\u00102\"\u0004\b3\u00104R\u001a\u00105\u001a\u00020\u001cX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b6\u0010\u001f\"\u0004\b7\u00108R\u001e\u00109\u001a\u00020!2\u0006\u0010\u0017\u001a\u00020!@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\b:\u0010\"¨\u0006v"}, d2 = {"Landroidx/compose/runtime/SlotTable;", "Landroidx/compose/runtime/tooling/CompositionData;", "", "Landroidx/compose/runtime/tooling/CompositionGroup;", "()V", "anchors", "Ljava/util/ArrayList;", "Landroidx/compose/runtime/Anchor;", "Lkotlin/collections/ArrayList;", "getAnchors$runtime_release", "()Ljava/util/ArrayList;", "setAnchors$runtime_release", "(Ljava/util/ArrayList;)V", "calledByMap", "Landroidx/collection/MutableIntObjectMap;", "Landroidx/collection/MutableIntSet;", "getCalledByMap$runtime_release", "()Landroidx/collection/MutableIntObjectMap;", "setCalledByMap$runtime_release", "(Landroidx/collection/MutableIntObjectMap;)V", "compositionGroups", "getCompositionGroups", "()Ljava/lang/Iterable;", "<set-?>", "", "groups", "getGroups", "()[I", "", "groupsSize", "getGroupsSize", "()I", "isEmpty", "", "()Z", "lock", "", "readers", "", "slots", "getSlots", "()[Ljava/lang/Object;", "[Ljava/lang/Object;", "slotsSize", "getSlotsSize", "sourceInformationMap", "Ljava/util/HashMap;", "Landroidx/compose/runtime/GroupSourceInformation;", "Lkotlin/collections/HashMap;", "getSourceInformationMap$runtime_release", "()Ljava/util/HashMap;", "setSourceInformationMap$runtime_release", "(Ljava/util/HashMap;)V", "version", "getVersion$runtime_release", "setVersion$runtime_release", "(I)V", "writer", "getWriter$runtime_release", "anchor", "index", "anchorIndex", "close", "", "reader", "Landroidx/compose/runtime/SlotReader;", "close$runtime_release", "Landroidx/compose/runtime/SlotWriter;", "(Landroidx/compose/runtime/SlotWriter;[II[Ljava/lang/Object;ILjava/util/ArrayList;Ljava/util/HashMap;Landroidx/collection/MutableIntObjectMap;)V", "collectCalledByInformation", "collectSourceInformation", "containsMark", "dataIndexes", "", "find", "identityToFind", "findEffectiveRecomposeScope", "Landroidx/compose/runtime/RecomposeScopeImpl;", "group", "groupContainsAnchor", "groupIndex", "groupSizes", "invalidateGroupsWithKey", TypedValues.AttributesType.S_TARGET, "invalidateGroupsWithKey$runtime_release", "iterator", "", "keys", "nodes", "openReader", "openWriter", "ownsAnchor", "parentIndexes", "read", ExifInterface.GPS_DIRECTION_TRUE, "block", "Lkotlin/Function1;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "(Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "setTo", "setTo$runtime_release", "([II[Ljava/lang/Object;ILjava/util/ArrayList;Ljava/util/HashMap;Landroidx/collection/MutableIntObjectMap;)V", "slot", "slotIndex", "slot$runtime_release", "slotsOf", "slotsOf$runtime_release", "sourceInformationOf", "toDebugString", "", "tryAnchor", "verifyWellFormed", "write", "emitGroup", "Ljava/lang/StringBuilder;", "Lkotlin/text/StringBuilder;", "level", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SlotTable implements CompositionData, Iterable<CompositionGroup>, KMappedMarker {
    public static final int $stable = 8;
    private MutableIntObjectMap<MutableIntSet> calledByMap;
    private int groupsSize;
    private int readers;
    private int slotsSize;
    private HashMap<Anchor, GroupSourceInformation> sourceInformationMap;
    private int version;
    private boolean writer;
    private int[] groups = new int[0];
    private Object[] slots = new Object[0];
    private final Object lock = new Object();
    private ArrayList<Anchor> anchors = new ArrayList<>();

    public final int[] getGroups() {
        return this.groups;
    }

    public final int getGroupsSize() {
        return this.groupsSize;
    }

    public final Object[] getSlots() {
        return this.slots;
    }

    public final int getSlotsSize() {
        return this.slotsSize;
    }

    public final boolean getWriter$runtime_release() {
        return this.writer;
    }

    public final int getVersion$runtime_release() {
        return this.version;
    }

    public final void setVersion$runtime_release(int i) {
        this.version = i;
    }

    public final ArrayList<Anchor> getAnchors$runtime_release() {
        return this.anchors;
    }

    public final void setAnchors$runtime_release(ArrayList<Anchor> arrayList) {
        this.anchors = arrayList;
    }

    public final HashMap<Anchor, GroupSourceInformation> getSourceInformationMap$runtime_release() {
        return this.sourceInformationMap;
    }

    public final void setSourceInformationMap$runtime_release(HashMap<Anchor, GroupSourceInformation> hashMap) {
        this.sourceInformationMap = hashMap;
    }

    public final MutableIntObjectMap<MutableIntSet> getCalledByMap$runtime_release() {
        return this.calledByMap;
    }

    public final void setCalledByMap$runtime_release(MutableIntObjectMap<MutableIntSet> mutableIntObjectMap) {
        this.calledByMap = mutableIntObjectMap;
    }

    @Override // androidx.compose.runtime.tooling.CompositionData
    public boolean isEmpty() {
        return this.groupsSize == 0;
    }

    public final <T> T read(Function1<? super SlotReader, ? extends T> function1) {
        SlotReader reader = openReader();
        try {
            return function1.invoke(reader);
        } finally {
            reader.close();
        }
    }

    public final <T> T write(Function1<? super SlotWriter, ? extends T> function1) {
        SlotWriter writer = openWriter();
        boolean normalClose = false;
        try {
            normalClose = true;
            return function1.invoke(writer);
        } finally {
            writer.close(normalClose);
        }
    }

    public final SlotReader openReader() {
        if (this.writer) {
            throw new IllegalStateException("Cannot read while a writer is pending".toString());
        }
        this.readers++;
        return new SlotReader(this);
    }

    public final SlotWriter openWriter() {
        boolean value$iv = !this.writer;
        if (!value$iv) {
            ComposerKt.composeImmediateRuntimeError("Cannot start a writer when another writer is pending");
        }
        boolean value$iv2 = this.readers <= 0;
        if (!value$iv2) {
            ComposerKt.composeImmediateRuntimeError("Cannot start a writer when a reader is pending");
        }
        this.writer = true;
        this.version++;
        return new SlotWriter(this);
    }

    public final Anchor anchor(int index) {
        boolean value$iv = true;
        boolean value$iv2 = !this.writer;
        if (!value$iv2) {
            ComposerKt.composeImmediateRuntimeError("use active SlotWriter to create an anchor location instead");
        }
        if (index < 0 || index >= this.groupsSize) {
            value$iv = false;
        }
        if (!value$iv) {
            PreconditionsKt.throwIllegalArgumentException("Parameter index is out of range");
        }
        ArrayList $this$getOrAdd$iv = this.anchors;
        int effectiveSize$iv = this.groupsSize;
        int location$iv = SlotTableKt.access$search($this$getOrAdd$iv, index, effectiveSize$iv);
        if (location$iv < 0) {
            Anchor anchor$iv = new Anchor(index);
            $this$getOrAdd$iv.add(-(location$iv + 1), anchor$iv);
            return anchor$iv;
        }
        return $this$getOrAdd$iv.get(location$iv);
    }

    private final Anchor tryAnchor(int index) {
        boolean z = true;
        boolean value$iv = !this.writer;
        if (!value$iv) {
            ComposerKt.composeImmediateRuntimeError("use active SlotWriter to crate an anchor for location instead");
        }
        if (index < 0 || index >= this.groupsSize) {
            z = false;
        }
        if (z) {
            return SlotTableKt.access$find(this.anchors, index, this.groupsSize);
        }
        return null;
    }

    public final int anchorIndex(Anchor anchor) {
        boolean value$iv = !this.writer;
        if (!value$iv) {
            ComposerKt.composeImmediateRuntimeError("Use active SlotWriter to determine anchor location instead");
        }
        boolean value$iv2 = anchor.getValid();
        if (!value$iv2) {
            PreconditionsKt.throwIllegalArgumentException("Anchor refers to a group that was removed");
        }
        return anchor.getLocation$runtime_release();
    }

    public final boolean ownsAnchor(Anchor anchor) {
        if (anchor.getValid()) {
            int it = SlotTableKt.access$search(this.anchors, anchor.getLocation$runtime_release(), this.groupsSize);
            return ((it < 0 || !Intrinsics.areEqual(this.anchors.get(it), anchor)) ? 0 : 1) != 0;
        }
        return false;
    }

    public final boolean groupContainsAnchor(int groupIndex, Anchor anchor) {
        boolean value$iv = !this.writer;
        if (!value$iv) {
            ComposerKt.composeImmediateRuntimeError("Writer is active");
        }
        boolean value$iv2 = groupIndex >= 0 && groupIndex < this.groupsSize;
        if (!value$iv2) {
            ComposerKt.composeImmediateRuntimeError("Invalid group index");
        }
        boolean value$iv3 = ownsAnchor(anchor);
        if (value$iv3) {
            int access$groupSize = SlotTableKt.access$groupSize(this.groups, groupIndex) + groupIndex;
            int location$runtime_release = anchor.getLocation$runtime_release();
            if (groupIndex <= location$runtime_release && location$runtime_release < access$groupSize) {
                return true;
            }
        }
        return false;
    }

    public final void close$runtime_release(SlotReader reader, HashMap<Anchor, GroupSourceInformation> hashMap) {
        boolean value$iv = reader.getTable$runtime_release() == this && this.readers > 0;
        if (!value$iv) {
            ComposerKt.composeImmediateRuntimeError("Unexpected reader close()");
        }
        this.readers--;
        if (hashMap != null) {
            Object lock$iv = this.lock;
            synchronized (lock$iv) {
                HashMap thisMap = this.sourceInformationMap;
                if (thisMap != null) {
                    thisMap.putAll(hashMap);
                } else {
                    this.sourceInformationMap = hashMap;
                }
                Unit unit = Unit.INSTANCE;
            }
        }
    }

    public final void close$runtime_release(SlotWriter writer, int[] groups, int groupsSize, Object[] slots, int slotsSize, ArrayList<Anchor> arrayList, HashMap<Anchor, GroupSourceInformation> hashMap, MutableIntObjectMap<MutableIntSet> mutableIntObjectMap) {
        boolean value$iv = writer.getTable$runtime_release() == this && this.writer;
        if (!value$iv) {
            PreconditionsKt.throwIllegalArgumentException("Unexpected writer close()");
        }
        this.writer = false;
        setTo$runtime_release(groups, groupsSize, slots, slotsSize, arrayList, hashMap, mutableIntObjectMap);
    }

    public final void setTo$runtime_release(int[] groups, int groupsSize, Object[] slots, int slotsSize, ArrayList<Anchor> arrayList, HashMap<Anchor, GroupSourceInformation> hashMap, MutableIntObjectMap<MutableIntSet> mutableIntObjectMap) {
        this.groups = groups;
        this.groupsSize = groupsSize;
        this.slots = slots;
        this.slotsSize = slotsSize;
        this.anchors = arrayList;
        this.sourceInformationMap = hashMap;
        this.calledByMap = mutableIntObjectMap;
    }

    public final List<RecomposeScopeImpl> invalidateGroupsWithKey$runtime_release(int target) {
        MutableIntSet set;
        MutableIntSet it;
        List anchors = new ArrayList();
        List scopes = new ArrayList();
        Ref.BooleanRef allScopesFound = new Ref.BooleanRef();
        allScopesFound.element = true;
        MutableIntSet set2 = new MutableIntSet(0, 1, null);
        set2.add(target);
        set2.add(-3);
        MutableIntObjectMap<MutableIntSet> mutableIntObjectMap = this.calledByMap;
        if (mutableIntObjectMap != null && (it = mutableIntObjectMap.get(target)) != null) {
            set2.addAll(it);
        }
        SlotReader reader$iv = openReader();
        try {
            invalidateGroupsWithKey$lambda$20$scanGroup(reader$iv, set2, anchors, allScopesFound, this, scopes);
            Unit unit = Unit.INSTANCE;
            reader$iv.close();
            SlotTable this_$iv = this;
            SlotWriter writer$iv = this_$iv.openWriter();
            try {
                writer$iv.startGroup();
                int index$iv = 0;
                int size = anchors.size();
                while (index$iv < size) {
                    Object item$iv = anchors.get(index$iv);
                    Anchor anchor = (Anchor) item$iv;
                    SlotTable this_$iv2 = this_$iv;
                    try {
                        set = set2;
                    } catch (Throwable th) {
                        th = th;
                        writer$iv.close(false);
                        throw th;
                    }
                    try {
                        if (anchor.toIndexFor(writer$iv) >= writer$iv.getCurrentGroup()) {
                            writer$iv.seek(anchor);
                            writer$iv.bashCurrentGroup();
                        }
                        index$iv++;
                        this_$iv = this_$iv2;
                        set2 = set;
                    } catch (Throwable th2) {
                        th = th2;
                        writer$iv.close(false);
                        throw th;
                    }
                }
                writer$iv.skipToGroupEnd();
                writer$iv.endGroup();
                writer$iv.close(true);
                if (allScopesFound.element) {
                    return scopes;
                }
                return null;
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (Throwable th4) {
            reader$iv.close();
            throw th4;
        }
    }

    private static final void invalidateGroupsWithKey$lambda$20$scanGroup(SlotReader $reader, MutableIntSet set, List<Anchor> list, Ref.BooleanRef allScopesFound, SlotTable this$0, List<RecomposeScopeImpl> list2) {
        RecomposeScopeImpl parentScope;
        int key = $reader.getGroupKey();
        if (set.contains(key)) {
            boolean z = true;
            if (key != -3) {
                list.add(SlotReader.anchor$default($reader, 0, 1, null));
            }
            if (allScopesFound.element) {
                RecomposeScopeImpl nearestScope = this$0.findEffectiveRecomposeScope($reader.getCurrentGroup());
                if (nearestScope != null) {
                    list2.add(nearestScope);
                    Anchor anchor = nearestScope.getAnchor();
                    if (anchor == null || anchor.getLocation$runtime_release() != $reader.getCurrentGroup()) {
                        z = false;
                    }
                    if (z && (parentScope = this$0.findEffectiveRecomposeScope($reader.getParent())) != null) {
                        list2.add(parentScope);
                    }
                } else {
                    allScopesFound.element = false;
                    list2.clear();
                }
            }
            $reader.skipGroup();
            return;
        }
        $reader.startGroup();
        while (!$reader.isGroupEnd()) {
            invalidateGroupsWithKey$lambda$20$scanGroup($reader, set, list, allScopesFound, this$0, list2);
        }
        $reader.endGroup();
    }

    public final boolean containsMark() {
        if (this.groupsSize > 0) {
            int[] $this$containsMark$iv = this.groups;
            int[] $this$containsMark$iv2 = ($this$containsMark$iv[(0 * 5) + 1] & 67108864) != 0 ? 1 : null;
            return $this$containsMark$iv2 != null;
        }
        return false;
    }

    public final GroupSourceInformation sourceInformationOf(int group) {
        Anchor anchor;
        HashMap map = this.sourceInformationMap;
        if (map == null || (anchor = tryAnchor(group)) == null) {
            return null;
        }
        return map.get(anchor);
    }

    private final RecomposeScopeImpl findEffectiveRecomposeScope(int group) {
        int current = group;
        while (current > 0) {
            Iterator<Object> it = new DataIterator(this, current).iterator();
            while (it.hasNext()) {
                Object data = it.next();
                if (data instanceof RecomposeScopeImpl) {
                    if (((RecomposeScopeImpl) data).getUsed() && current != group) {
                        return (RecomposeScopeImpl) data;
                    }
                    ((RecomposeScopeImpl) data).setForcedRecompose(true);
                }
            }
            int[] $this$parentAnchor$iv = this.groups;
            current = $this$parentAnchor$iv[(current * 5) + 2];
        }
        return null;
    }

    public final void verifyWellFormed() {
        Ref.IntRef current = new Ref.IntRef();
        if (this.groupsSize > 0) {
            while (current.element < this.groupsSize) {
                verifyWellFormed$validateGroup(current, this, -1, current.element + SlotTableKt.access$groupSize(this.groups, current.element));
            }
            boolean value$iv = current.element == this.groupsSize;
            if (!value$iv) {
                PreconditionsKt.throwIllegalStateException("Incomplete group at root " + current.element + " expected to be " + this.groupsSize);
            }
        }
        int length = this.slots.length;
        for (int index = this.slotsSize; index < length; index++) {
            boolean value$iv2 = this.slots[index] == null;
            if (!value$iv2) {
                PreconditionsKt.throwIllegalStateException("Non null value in the slot gap at index " + index);
            }
        }
        int lastLocation = -1;
        List $this$fastForEach$iv = this.anchors;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            int location = ((Anchor) item$iv).toIndexFor(this);
            boolean value$iv3 = location >= 0 && location <= this.groupsSize;
            if (!value$iv3) {
                PreconditionsKt.throwIllegalArgumentException("Invalid anchor, location out of bound");
            }
            boolean value$iv4 = lastLocation < location;
            if (!value$iv4) {
                PreconditionsKt.throwIllegalArgumentException("Anchor is out of order");
            }
            lastLocation = location;
        }
        HashMap sourceInformationMap = this.sourceInformationMap;
        if (sourceInformationMap != null) {
            for (Map.Entry<Anchor, GroupSourceInformation> entry : sourceInformationMap.entrySet()) {
                Anchor anchor = entry.getKey();
                GroupSourceInformation sourceGroup = entry.getValue();
                boolean value$iv5 = anchor.getValid();
                if (!value$iv5) {
                    PreconditionsKt.throwIllegalArgumentException("Source map contains invalid anchor");
                }
                boolean value$iv6 = ownsAnchor(anchor);
                if (!value$iv6) {
                    PreconditionsKt.throwIllegalArgumentException("Source map anchor is not owned by the slot table");
                }
                verifyWellFormed$verifySourceGroup(this, sourceGroup);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x024a  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x0276  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x0287  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x028a  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x028d  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x02ac  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x02d6  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x02d9  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x01bc  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x01d6  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01de A[LOOP:0: B:84:0x01da->B:86:0x01de, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x01fb  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x01fe  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x020b  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x023a  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0242  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0245  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static final int verifyWellFormed$validateGroup(kotlin.jvm.internal.Ref.IntRef r22, androidx.compose.runtime.SlotTable r23, int r24, int r25) {
        /*
            Method dump skipped, instructions count: 732
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.runtime.SlotTable.verifyWellFormed$validateGroup(kotlin.jvm.internal.Ref$IntRef, androidx.compose.runtime.SlotTable, int, int):int");
    }

    private static final void verifyWellFormed$verifySourceGroup(SlotTable this$0, GroupSourceInformation group) {
        List groups = group.getGroups();
        if (groups == null) {
            return;
        }
        List $this$fastForEach$iv = groups;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            if (item$iv instanceof Anchor) {
                boolean value$iv = ((Anchor) item$iv).getValid();
                if (!value$iv) {
                    PreconditionsKt.throwIllegalArgumentException("Source map contains invalid anchor");
                }
                boolean value$iv2 = this$0.ownsAnchor((Anchor) item$iv);
                if (!value$iv2) {
                    PreconditionsKt.throwIllegalArgumentException("Source map anchor is not owned by the slot table");
                }
            } else if (item$iv instanceof GroupSourceInformation) {
                verifyWellFormed$verifySourceGroup(this$0, (GroupSourceInformation) item$iv);
            }
        }
    }

    public final void collectCalledByInformation() {
        this.calledByMap = new MutableIntObjectMap<>(0, 1, null);
    }

    public final void collectSourceInformation() {
        this.sourceInformationMap = new HashMap<>();
    }

    public final String toDebugString() {
        if (this.writer) {
            return super.toString();
        }
        StringBuilder $this$toDebugString_u24lambda_u2447 = new StringBuilder();
        $this$toDebugString_u24lambda_u2447.append(super.toString());
        $this$toDebugString_u24lambda_u2447.append('\n');
        int groupsSize = this.groupsSize;
        if (groupsSize > 0) {
            int current = 0;
            while (current < groupsSize) {
                current += emitGroup($this$toDebugString_u24lambda_u2447, current, 0);
            }
        } else {
            $this$toDebugString_u24lambda_u2447.append("<EMPTY>");
        }
        String sb = $this$toDebugString_u24lambda_u2447.toString();
        Intrinsics.checkNotNullExpressionValue(sb, "toString(...)");
        return sb;
    }

    private final int emitGroup(StringBuilder $this$emitGroup, int index, int level) {
        String it;
        for (int i = 0; i < level; i++) {
            $this$emitGroup.append(' ');
        }
        $this$emitGroup.append("Group(");
        $this$emitGroup.append(index);
        $this$emitGroup.append(")");
        GroupSourceInformation sourceInformationOf = sourceInformationOf(index);
        if (sourceInformationOf != null && (it = sourceInformationOf.getSourceInformation()) != null && (StringsKt.startsWith$default(it, "C(", false, 2, (Object) null) || StringsKt.startsWith$default(it, "CC(", false, 2, (Object) null))) {
            int start = StringsKt.indexOf$default((CharSequence) it, "(", 0, false, 6, (Object) null) + 1;
            int endParen = StringsKt.indexOf$default((CharSequence) it, ')', 0, false, 6, (Object) null);
            $this$emitGroup.append(" ");
            String substring = it.substring(start, endParen);
            Intrinsics.checkNotNullExpressionValue(substring, "substring(...)");
            $this$emitGroup.append(substring);
            $this$emitGroup.append("()");
        }
        $this$emitGroup.append(" key=");
        int[] $this$key$iv = this.groups;
        $this$emitGroup.append($this$key$iv[index * 5]);
        int groupSize = SlotTableKt.access$groupSize(this.groups, index);
        $this$emitGroup.append(", nodes=");
        int[] $this$nodeCount$iv = this.groups;
        $this$emitGroup.append($this$nodeCount$iv[(index * 5) + 1] & RectListKt.Lower26Bits);
        $this$emitGroup.append(", size=");
        $this$emitGroup.append(groupSize);
        int[] $this$hasMark$iv = this.groups;
        int[] $this$hasMark$iv2 = ($this$hasMark$iv[(index * 5) + 1] & 134217728) != 0 ? 1 : null;
        if ($this$hasMark$iv2 != null) {
            $this$emitGroup.append(", mark");
        }
        int[] $this$containsMark$iv = this.groups;
        int[] $this$containsMark$iv2 = ($this$containsMark$iv[(index * 5) + 1] & 67108864) != 0 ? 1 : null;
        if ($this$containsMark$iv2 != null) {
            $this$emitGroup.append(", contains mark");
        }
        int dataStart = emitGroup$dataIndex(this, index);
        int dataEnd = emitGroup$dataIndex(this, index + 1);
        if ((dataStart >= 0 && dataStart <= dataEnd) && dataEnd <= this.slotsSize) {
            int[] $this$hasObjectKey$iv = this.groups;
            int[] $this$hasObjectKey$iv2 = ($this$hasObjectKey$iv[(index * 5) + 1] & PropertyOptions.DELETE_EXISTING) != 0 ? 1 : null;
            if ($this$hasObjectKey$iv2 != null) {
                $this$emitGroup.append(" objectKey=" + SlotTableKt.access$summarize(String.valueOf(this.slots[SlotTableKt.access$objectKeyIndex(this.groups, index)]), 10));
            }
            int[] $this$isNode$iv = this.groups;
            int[] $this$isNode$iv2 = ($this$isNode$iv[(index * 5) + 1] & 1073741824) != 0 ? 1 : null;
            if ($this$isNode$iv2 != null) {
                StringBuilder append = new StringBuilder().append(" node=");
                Object[] objArr = this.slots;
                int[] $this$nodeIndex$iv = this.groups;
                $this$emitGroup.append(append.append(SlotTableKt.access$summarize(String.valueOf(objArr[$this$nodeIndex$iv[(index * 5) + 4]]), 10)).toString());
            }
            int[] $this$hasAux$iv = this.groups;
            if (($this$hasAux$iv[(index * 5) + 1] & 268435456) != 0) {
                $this$emitGroup.append(" aux=" + SlotTableKt.access$summarize(String.valueOf(this.slots[SlotTableKt.access$auxIndex(this.groups, index)]), 10));
            }
            int slotStart = SlotTableKt.access$slotAnchor(this.groups, index);
            if (slotStart < dataEnd) {
                $this$emitGroup.append(", slots=[");
                $this$emitGroup.append(slotStart);
                $this$emitGroup.append(": ");
                for (int dataIndex = slotStart; dataIndex < dataEnd; dataIndex++) {
                    if (dataIndex != slotStart) {
                        $this$emitGroup.append(", ");
                    }
                    $this$emitGroup.append(SlotTableKt.access$summarize(String.valueOf(this.slots[dataIndex]), 10));
                }
                $this$emitGroup.append("]");
            }
        } else {
            $this$emitGroup.append(", *invalid data offsets " + dataStart + '-' + dataEnd + '*');
        }
        $this$emitGroup.append('\n');
        int current = index + 1;
        int end = index + groupSize;
        while (current < end) {
            current += emitGroup($this$emitGroup, current, level + 1);
        }
        return groupSize;
    }

    private static final int emitGroup$dataIndex(SlotTable this$0, int index) {
        if (index >= this$0.groupsSize) {
            return this$0.slotsSize;
        }
        int[] $this$dataAnchor$iv = this$0.groups;
        return $this$dataAnchor$iv[(index * 5) + 4];
    }

    private final List<Integer> keys() {
        return SlotTableKt.access$keys(this.groups, this.groupsSize * 5);
    }

    private final List<Integer> nodes() {
        return SlotTableKt.access$nodeCounts(this.groups, this.groupsSize * 5);
    }

    private final List<Integer> parentIndexes() {
        return SlotTableKt.access$parentAnchors(this.groups, this.groupsSize * 5);
    }

    private final List<Integer> dataIndexes() {
        return SlotTableKt.access$dataAnchors(this.groups, this.groupsSize * 5);
    }

    private final List<Integer> groupSizes() {
        return SlotTableKt.access$groupSizes(this.groups, this.groupsSize * 5);
    }

    public final List<Object> slotsOf$runtime_release(int group) {
        int end;
        int[] $this$dataAnchor$iv = this.groups;
        int start = $this$dataAnchor$iv[(group * 5) + 4];
        if (group + 1 >= this.groupsSize) {
            end = this.slots.length;
        } else {
            int[] $this$dataAnchor$iv2 = this.groups;
            int address$iv = group + 1;
            end = $this$dataAnchor$iv2[(address$iv * 5) + 4];
        }
        return ArraysKt.toList(this.slots).subList(start, end);
    }

    public final Object slot$runtime_release(int group, int slotIndex) {
        int end;
        int start = SlotTableKt.access$slotAnchor(this.groups, group);
        if (group + 1 >= this.groupsSize) {
            end = this.slots.length;
        } else {
            int[] $this$dataAnchor$iv = this.groups;
            int address$iv = group + 1;
            end = $this$dataAnchor$iv[(address$iv * 5) + 4];
        }
        int len = end - start;
        boolean z = false;
        if (slotIndex >= 0 && slotIndex < len) {
            z = true;
        }
        return z ? this.slots[start + slotIndex] : Composer.Companion.getEmpty();
    }

    @Override // androidx.compose.runtime.tooling.CompositionData
    public Iterable<CompositionGroup> getCompositionGroups() {
        return this;
    }

    @Override // java.lang.Iterable
    public Iterator<CompositionGroup> iterator() {
        return new GroupIterator(this, 0, this.groupsSize);
    }

    @Override // androidx.compose.runtime.tooling.CompositionData
    public CompositionGroup find(Object identityToFind) {
        return new SlotTableGroup(this, 0, 0, 4, null).find(identityToFind);
    }
}
