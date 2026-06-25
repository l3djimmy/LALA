package androidx.compose.ui.semantics;

import androidx.collection.MutableScatterMap;
import androidx.collection.ScatterMap;
import androidx.collection.ScatterMapKt;
import androidx.compose.ui.platform.JvmActuals_jvmKt;
import androidx.exifinterface.media.ExifInterface;
import java.util.Iterator;
import java.util.Map;
import kotlin.Function;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;
/* compiled from: SemanticsConfiguration.kt */
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0010&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010$\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0010(\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u001a\u0012\u0016\u0012\u0014\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00030\u0002B\u0005¢\u0006\u0002\u0010\u0006J\u0015\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0000H\u0000¢\u0006\u0002\b\u0017J\u001d\u0010\u0018\u001a\u00020\b\"\u0004\b\u0000\u0010\u00192\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u0002H\u00190\u0004H\u0086\u0002J\r\u0010\u001b\u001a\u00020\bH\u0000¢\u0006\u0002\b\u001cJ\u0006\u0010\u001d\u001a\u00020\u0000J\u0013\u0010\u001e\u001a\u00020\b2\b\u0010\u001f\u001a\u0004\u0018\u00010\u0005H\u0096\u0002J\"\u0010 \u001a\u0002H\u0019\"\u0004\b\u0000\u0010\u00192\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u0002H\u00190\u0004H\u0086\u0002¢\u0006\u0002\u0010!J-\u0010\"\u001a\u0002H\u0019\"\u0004\b\u0000\u0010\u00192\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u0002H\u00190\u00042\f\u0010#\u001a\b\u0012\u0004\u0012\u0002H\u00190$¢\u0006\u0002\u0010%J1\u0010&\u001a\u0004\u0018\u0001H\u0019\"\u0004\b\u0000\u0010\u00192\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u0002H\u00190\u00042\u000e\u0010#\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001H\u00190$¢\u0006\u0002\u0010%J\b\u0010'\u001a\u00020(H\u0016J!\u0010)\u001a\u001a\u0012\u0016\u0012\u0014\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00030*H\u0096\u0002J\u0015\u0010+\u001a\u00020\u00152\u0006\u0010,\u001a\u00020\u0000H\u0000¢\u0006\u0002\b-J*\u0010.\u001a\u00020\u0015\"\u0004\b\u0000\u0010\u00192\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u0002H\u00190\u00042\u0006\u0010/\u001a\u0002H\u0019H\u0096\u0002¢\u0006\u0002\u00100J\b\u00101\u001a\u000202H\u0016R\u001a\u0010\u0007\u001a\u00020\bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0007\u0010\t\"\u0004\b\n\u0010\u000bR\u001a\u0010\f\u001a\u00020\bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\f\u0010\t\"\u0004\b\r\u0010\u000bR\"\u0010\u000e\u001a\u0016\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u0005\u0018\u00010\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R&\u0010\u0010\u001a\u0014\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0011X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u00063"}, d2 = {"Landroidx/compose/ui/semantics/SemanticsConfiguration;", "Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;", "", "", "Landroidx/compose/ui/semantics/SemanticsPropertyKey;", "", "()V", "isClearingSemantics", "", "()Z", "setClearingSemantics", "(Z)V", "isMergingSemanticsOfDescendants", "setMergingSemanticsOfDescendants", "mapWrapper", "", "props", "Landroidx/collection/MutableScatterMap;", "getProps$ui_release", "()Landroidx/collection/MutableScatterMap;", "collapsePeer", "", "peer", "collapsePeer$ui_release", "contains", ExifInterface.GPS_DIRECTION_TRUE, "key", "containsImportantForAccessibility", "containsImportantForAccessibility$ui_release", "copy", "equals", "other", "get", "(Landroidx/compose/ui/semantics/SemanticsPropertyKey;)Ljava/lang/Object;", "getOrElse", "defaultValue", "Lkotlin/Function0;", "(Landroidx/compose/ui/semantics/SemanticsPropertyKey;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "getOrElseNullable", "hashCode", "", "iterator", "", "mergeChild", "child", "mergeChild$ui_release", "set", "value", "(Landroidx/compose/ui/semantics/SemanticsPropertyKey;Ljava/lang/Object;)V", "toString", "", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SemanticsConfiguration implements SemanticsPropertyReceiver, Iterable<Map.Entry<? extends SemanticsPropertyKey<?>, ? extends Object>>, KMappedMarker {
    public static final int $stable = 8;
    private boolean isClearingSemantics;
    private boolean isMergingSemanticsOfDescendants;
    private Map<SemanticsPropertyKey<?>, ? extends Object> mapWrapper;
    private final MutableScatterMap<SemanticsPropertyKey<?>, Object> props = ScatterMapKt.mutableScatterMapOf();

    public final MutableScatterMap<SemanticsPropertyKey<?>, Object> getProps$ui_release() {
        return this.props;
    }

    public final <T> T get(SemanticsPropertyKey<T> semanticsPropertyKey) {
        ScatterMap this_$iv = this.props;
        T t = (T) this_$iv.get(semanticsPropertyKey);
        if (t != null) {
            return t;
        }
        throw new IllegalStateException("Key not present: " + semanticsPropertyKey + " - consider getOrElse or getOrNull");
    }

    public final <T> T getOrElse(SemanticsPropertyKey<T> semanticsPropertyKey, Function0<? extends T> function0) {
        ScatterMap this_$iv = this.props;
        T t = (T) this_$iv.get(semanticsPropertyKey);
        return t == null ? function0.invoke() : t;
    }

    public final <T> T getOrElseNullable(SemanticsPropertyKey<T> semanticsPropertyKey, Function0<? extends T> function0) {
        ScatterMap this_$iv = this.props;
        T t = (T) this_$iv.get(semanticsPropertyKey);
        return t == null ? function0.invoke() : t;
    }

    @Override // java.lang.Iterable
    public Iterator<Map.Entry<? extends SemanticsPropertyKey<?>, ? extends Object>> iterator() {
        Map $this$iterator_u24lambda_u241 = this.mapWrapper;
        if ($this$iterator_u24lambda_u241 == null) {
            $this$iterator_u24lambda_u241 = this.props.asMap();
            this.mapWrapper = $this$iterator_u24lambda_u241;
        }
        return $this$iterator_u24lambda_u241.entrySet().iterator();
    }

    @Override // androidx.compose.ui.semantics.SemanticsPropertyReceiver
    public <T> void set(SemanticsPropertyKey<T> semanticsPropertyKey, T t) {
        if ((t instanceof AccessibilityAction) && contains(semanticsPropertyKey)) {
            Object obj = this.props.get(semanticsPropertyKey);
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type androidx.compose.ui.semantics.AccessibilityAction<*>");
            AccessibilityAction prev = (AccessibilityAction) obj;
            MutableScatterMap<SemanticsPropertyKey<?>, Object> mutableScatterMap = this.props;
            String label = ((AccessibilityAction) t).getLabel();
            if (label == null) {
                label = prev.getLabel();
            }
            Function action = ((AccessibilityAction) t).getAction();
            if (action == null) {
                action = prev.getAction();
            }
            mutableScatterMap.set(semanticsPropertyKey, new AccessibilityAction(label, action));
            return;
        }
        this.props.set(semanticsPropertyKey, t);
    }

    public final <T> boolean contains(SemanticsPropertyKey<T> semanticsPropertyKey) {
        return this.props.containsKey(semanticsPropertyKey);
    }

    public final boolean containsImportantForAccessibility$ui_release() {
        ScatterMap this_$iv = this.props;
        Object[] k$iv$iv = this_$iv.keys;
        Object[] v$iv$iv = this_$iv.values;
        long[] m$iv$iv$iv = this_$iv.metadata;
        int lastIndex$iv$iv$iv = m$iv$iv$iv.length - 2;
        int i$iv$iv$iv = 0;
        if (0 <= lastIndex$iv$iv$iv) {
            while (true) {
                long slot$iv$iv$iv = m$iv$iv$iv[i$iv$iv$iv];
                long slot$iv$iv$iv2 = slot$iv$iv$iv;
                long $this$maskEmptyOrDeleted$iv$iv$iv$iv = ((~slot$iv$iv$iv) << 7) & slot$iv$iv$iv & (-9187201950435737472L);
                if ($this$maskEmptyOrDeleted$iv$iv$iv$iv != -9187201950435737472L) {
                    int bitCount$iv$iv$iv = 8 - ((~(i$iv$iv$iv - lastIndex$iv$iv$iv)) >>> 31);
                    for (int j$iv$iv$iv = 0; j$iv$iv$iv < bitCount$iv$iv$iv; j$iv$iv$iv++) {
                        long value$iv$iv$iv$iv = slot$iv$iv$iv2 & 255;
                        if (value$iv$iv$iv$iv < 128) {
                            int index$iv$iv$iv = (i$iv$iv$iv << 3) + j$iv$iv$iv;
                            Object key$iv = k$iv$iv[index$iv$iv$iv];
                            Object obj = v$iv$iv[index$iv$iv$iv];
                            SemanticsPropertyKey key = (SemanticsPropertyKey) key$iv;
                            if (key.isImportantForAccessibility$ui_release()) {
                                return true;
                            }
                        }
                        slot$iv$iv$iv2 >>= 8;
                    }
                    if (bitCount$iv$iv$iv != 8) {
                        break;
                    }
                }
                if (i$iv$iv$iv == lastIndex$iv$iv$iv) {
                    break;
                }
                i$iv$iv$iv++;
            }
        }
        return false;
    }

    public final boolean isMergingSemanticsOfDescendants() {
        return this.isMergingSemanticsOfDescendants;
    }

    public final void setMergingSemanticsOfDescendants(boolean z) {
        this.isMergingSemanticsOfDescendants = z;
    }

    public final boolean isClearingSemantics() {
        return this.isClearingSemantics;
    }

    public final void setClearingSemantics(boolean z) {
        this.isClearingSemantics = z;
    }

    public final void mergeChild$ui_release(SemanticsConfiguration child) {
        int $i$f$forEach;
        Object[] k$iv;
        Object[] v$iv;
        int i;
        int $i$f$forEach2;
        Object[] k$iv2;
        Object[] v$iv2;
        ScatterMap this_$iv = child.props;
        int $i$f$forEach3 = 0;
        Object[] k$iv3 = this_$iv.keys;
        Object[] v$iv3 = this_$iv.values;
        long[] m$iv$iv = this_$iv.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 > lastIndex$iv$iv) {
            return;
        }
        while (true) {
            long slot$iv$iv = m$iv$iv[i$iv$iv];
            ScatterMap this_$iv2 = this_$iv;
            if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                $i$f$forEach = $i$f$forEach3;
                k$iv = k$iv3;
                v$iv = v$iv3;
            } else {
                int i2 = 8;
                int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                int j$iv$iv = 0;
                while (j$iv$iv < bitCount$iv$iv) {
                    long value$iv$iv$iv = 255 & slot$iv$iv;
                    if (!(value$iv$iv$iv < 128)) {
                        i = i2;
                        $i$f$forEach2 = $i$f$forEach3;
                        k$iv2 = k$iv3;
                        v$iv2 = v$iv3;
                    } else {
                        int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                        Object obj = k$iv3[index$iv$iv];
                        i = i2;
                        Object nextValue = v$iv3[index$iv$iv];
                        $i$f$forEach2 = $i$f$forEach3;
                        SemanticsPropertyKey key = (SemanticsPropertyKey) obj;
                        k$iv2 = k$iv3;
                        Object existingValue = this.props.get(key);
                        v$iv2 = v$iv3;
                        Intrinsics.checkNotNull(key, "null cannot be cast to non-null type androidx.compose.ui.semantics.SemanticsPropertyKey<kotlin.Any?>");
                        Object mergeResult = key.merge(existingValue, nextValue);
                        if (mergeResult != null) {
                            this.props.set(key, mergeResult);
                        }
                    }
                    slot$iv$iv >>= i;
                    j$iv$iv++;
                    i2 = i;
                    $i$f$forEach3 = $i$f$forEach2;
                    k$iv3 = k$iv2;
                    v$iv3 = v$iv2;
                }
                $i$f$forEach = $i$f$forEach3;
                k$iv = k$iv3;
                v$iv = v$iv3;
                if (bitCount$iv$iv != i2) {
                    return;
                }
            }
            if (i$iv$iv == lastIndex$iv$iv) {
                return;
            }
            i$iv$iv++;
            this_$iv = this_$iv2;
            $i$f$forEach3 = $i$f$forEach;
            k$iv3 = k$iv;
            v$iv3 = v$iv;
        }
    }

    public final void collapsePeer$ui_release(SemanticsConfiguration peer) {
        ScatterMap this_$iv;
        Object[] k$iv;
        ScatterMap this_$iv2;
        int i;
        Object[] k$iv2;
        SemanticsConfiguration semanticsConfiguration = this;
        if (peer.isMergingSemanticsOfDescendants) {
            semanticsConfiguration.isMergingSemanticsOfDescendants = true;
        }
        if (peer.isClearingSemantics) {
            semanticsConfiguration.isClearingSemantics = true;
        }
        ScatterMap this_$iv3 = peer.props;
        int $i$f$forEach = 0;
        Object[] k$iv3 = this_$iv3.keys;
        Object[] v$iv = this_$iv3.values;
        long[] m$iv$iv = this_$iv3.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 > lastIndex$iv$iv) {
            return;
        }
        while (true) {
            long slot$iv$iv = m$iv$iv[i$iv$iv];
            int $i$f$forEach2 = $i$f$forEach;
            if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                this_$iv = this_$iv3;
                k$iv = k$iv3;
            } else {
                int i2 = 8;
                int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                int j$iv$iv = 0;
                while (j$iv$iv < bitCount$iv$iv) {
                    long value$iv$iv$iv = 255 & slot$iv$iv;
                    if (!(value$iv$iv$iv < 128)) {
                        this_$iv2 = this_$iv3;
                        i = i2;
                        k$iv2 = k$iv3;
                    } else {
                        int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                        Object obj = k$iv3[index$iv$iv];
                        i = i2;
                        Object nextValue = v$iv[index$iv$iv];
                        SemanticsPropertyKey key = (SemanticsPropertyKey) obj;
                        this_$iv2 = this_$iv3;
                        if (!semanticsConfiguration.props.contains(key)) {
                            semanticsConfiguration.props.set(key, nextValue);
                            k$iv2 = k$iv3;
                        } else if (nextValue instanceof AccessibilityAction) {
                            Object obj2 = semanticsConfiguration.props.get(key);
                            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type androidx.compose.ui.semantics.AccessibilityAction<*>");
                            AccessibilityAction value = (AccessibilityAction) obj2;
                            MutableScatterMap<SemanticsPropertyKey<?>, Object> mutableScatterMap = semanticsConfiguration.props;
                            String label = value.getLabel();
                            if (label == null) {
                                label = ((AccessibilityAction) nextValue).getLabel();
                            }
                            String str = label;
                            Function action = value.getAction();
                            if (action == null) {
                                action = ((AccessibilityAction) nextValue).getAction();
                            }
                            k$iv2 = k$iv3;
                            mutableScatterMap.set(key, new AccessibilityAction(str, action));
                        } else {
                            k$iv2 = k$iv3;
                        }
                    }
                    slot$iv$iv >>= i;
                    j$iv$iv++;
                    semanticsConfiguration = this;
                    i2 = i;
                    this_$iv3 = this_$iv2;
                    k$iv3 = k$iv2;
                }
                this_$iv = this_$iv3;
                k$iv = k$iv3;
                if (bitCount$iv$iv != i2) {
                    return;
                }
            }
            if (i$iv$iv == lastIndex$iv$iv) {
                return;
            }
            i$iv$iv++;
            semanticsConfiguration = this;
            $i$f$forEach = $i$f$forEach2;
            this_$iv3 = this_$iv;
            k$iv3 = k$iv;
        }
    }

    public final SemanticsConfiguration copy() {
        SemanticsConfiguration copy = new SemanticsConfiguration();
        copy.isMergingSemanticsOfDescendants = this.isMergingSemanticsOfDescendants;
        copy.isClearingSemantics = this.isClearingSemantics;
        copy.props.putAll(this.props);
        return copy;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof SemanticsConfiguration) && Intrinsics.areEqual(this.props, ((SemanticsConfiguration) other).props) && this.isMergingSemanticsOfDescendants == ((SemanticsConfiguration) other).isMergingSemanticsOfDescendants && this.isClearingSemantics == ((SemanticsConfiguration) other).isClearingSemantics;
    }

    public int hashCode() {
        int result = this.props.hashCode();
        return (((result * 31) + Boolean.hashCode(this.isMergingSemanticsOfDescendants)) * 31) + Boolean.hashCode(this.isClearingSemantics);
    }

    public String toString() {
        int $i$f$forEach;
        int i;
        int $i$f$forEach2;
        StringBuilder propsString = new StringBuilder();
        String str = "";
        if (this.isMergingSemanticsOfDescendants) {
            propsString.append("");
            propsString.append("mergeDescendants=true");
            str = ", ";
        }
        if (this.isClearingSemantics) {
            propsString.append(str);
            propsString.append("isClearingSemantics=true");
            str = ", ";
        }
        ScatterMap this_$iv = this.props;
        int $i$f$forEach3 = 0;
        Object[] k$iv = this_$iv.keys;
        Object[] v$iv = this_$iv.values;
        long[] m$iv$iv = this_$iv.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 <= lastIndex$iv$iv) {
            while (true) {
                long slot$iv$iv = m$iv$iv[i$iv$iv];
                String str2 = str;
                ScatterMap this_$iv2 = this_$iv;
                if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                    $i$f$forEach = $i$f$forEach3;
                    str = str2;
                } else {
                    int i2 = 8;
                    int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                    int j$iv$iv = 0;
                    long slot$iv$iv2 = slot$iv$iv;
                    String str3 = str2;
                    while (j$iv$iv < bitCount$iv$iv) {
                        long value$iv$iv$iv = slot$iv$iv2 & 255;
                        if (!(value$iv$iv$iv < 128)) {
                            i = i2;
                            $i$f$forEach2 = $i$f$forEach3;
                        } else {
                            int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                            Object obj = k$iv[index$iv$iv];
                            i = i2;
                            Object value = v$iv[index$iv$iv];
                            SemanticsPropertyKey key = (SemanticsPropertyKey) obj;
                            propsString.append(str3);
                            $i$f$forEach2 = $i$f$forEach3;
                            propsString.append(key.getName());
                            propsString.append(" : ");
                            propsString.append(value);
                            str3 = ", ";
                        }
                        slot$iv$iv2 >>= i;
                        j$iv$iv++;
                        i2 = i;
                        $i$f$forEach3 = $i$f$forEach2;
                    }
                    $i$f$forEach = $i$f$forEach3;
                    if (bitCount$iv$iv != i2) {
                        break;
                    }
                    str = str3;
                }
                if (i$iv$iv == lastIndex$iv$iv) {
                    break;
                }
                i$iv$iv++;
                this_$iv = this_$iv2;
                $i$f$forEach3 = $i$f$forEach;
            }
        }
        return JvmActuals_jvmKt.simpleIdentityToString(this, null) + "{ " + ((Object) propsString) + " }";
    }
}
