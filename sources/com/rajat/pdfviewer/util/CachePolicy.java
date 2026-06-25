package com.rajat.pdfviewer.util;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: CachePolicy.kt */
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0018\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0081\b\u0018\u0000  2\u00020\u0001:\u0001 B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\u0006\u0010\b\u001a\u00020\u0003\u0012\u0006\u0010\t\u001a\u00020\u0003¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0019\u001a\u00020\u0003HÆ\u0003JE\u0010\u001a\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u00032\b\b\u0002\u0010\b\u001a\u00020\u00032\b\b\u0002\u0010\t\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u001b\u001a\u00020\u00032\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u0006HÖ\u0001J\t\u0010\u001e\u001a\u00020\u001fHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\rR\u0011\u0010\b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\rR\u0011\u0010\t\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\r¨\u0006!"}, d2 = {"Lcom/rajat/pdfviewer/util/CachePolicy;", "", "reuseRemoteFile", "", "persistRemoteFile", "maxRetainedDocuments", "", "useMemoryBitmapCache", "useDiskBitmapCache", "enablePrefetch", "<init>", "(ZZIZZZ)V", "getReuseRemoteFile", "()Z", "getPersistRemoteFile", "getMaxRetainedDocuments", "()I", "getUseMemoryBitmapCache", "getUseDiskBitmapCache", "getEnablePrefetch", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", "other", "hashCode", "toString", "", "Companion", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class CachePolicy {
    public static final int $stable = 0;
    public static final Companion Companion = new Companion(null);
    private final boolean enablePrefetch;
    private final int maxRetainedDocuments;
    private final boolean persistRemoteFile;
    private final boolean reuseRemoteFile;
    private final boolean useDiskBitmapCache;
    private final boolean useMemoryBitmapCache;

    public static /* synthetic */ CachePolicy copy$default(CachePolicy cachePolicy, boolean z, boolean z2, int i, boolean z3, boolean z4, boolean z5, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            z = cachePolicy.reuseRemoteFile;
        }
        if ((i2 & 2) != 0) {
            z2 = cachePolicy.persistRemoteFile;
        }
        if ((i2 & 4) != 0) {
            i = cachePolicy.maxRetainedDocuments;
        }
        if ((i2 & 8) != 0) {
            z3 = cachePolicy.useMemoryBitmapCache;
        }
        if ((i2 & 16) != 0) {
            z4 = cachePolicy.useDiskBitmapCache;
        }
        if ((i2 & 32) != 0) {
            z5 = cachePolicy.enablePrefetch;
        }
        boolean z6 = z4;
        boolean z7 = z5;
        return cachePolicy.copy(z, z2, i, z3, z6, z7);
    }

    public final boolean component1() {
        return this.reuseRemoteFile;
    }

    public final boolean component2() {
        return this.persistRemoteFile;
    }

    public final int component3() {
        return this.maxRetainedDocuments;
    }

    public final boolean component4() {
        return this.useMemoryBitmapCache;
    }

    public final boolean component5() {
        return this.useDiskBitmapCache;
    }

    public final boolean component6() {
        return this.enablePrefetch;
    }

    public final CachePolicy copy(boolean z, boolean z2, int i, boolean z3, boolean z4, boolean z5) {
        return new CachePolicy(z, z2, i, z3, z4, z5);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof CachePolicy) {
            CachePolicy cachePolicy = (CachePolicy) obj;
            return this.reuseRemoteFile == cachePolicy.reuseRemoteFile && this.persistRemoteFile == cachePolicy.persistRemoteFile && this.maxRetainedDocuments == cachePolicy.maxRetainedDocuments && this.useMemoryBitmapCache == cachePolicy.useMemoryBitmapCache && this.useDiskBitmapCache == cachePolicy.useDiskBitmapCache && this.enablePrefetch == cachePolicy.enablePrefetch;
        }
        return false;
    }

    public int hashCode() {
        return (((((((((Boolean.hashCode(this.reuseRemoteFile) * 31) + Boolean.hashCode(this.persistRemoteFile)) * 31) + Integer.hashCode(this.maxRetainedDocuments)) * 31) + Boolean.hashCode(this.useMemoryBitmapCache)) * 31) + Boolean.hashCode(this.useDiskBitmapCache)) * 31) + Boolean.hashCode(this.enablePrefetch);
    }

    public String toString() {
        return "CachePolicy(reuseRemoteFile=" + this.reuseRemoteFile + ", persistRemoteFile=" + this.persistRemoteFile + ", maxRetainedDocuments=" + this.maxRetainedDocuments + ", useMemoryBitmapCache=" + this.useMemoryBitmapCache + ", useDiskBitmapCache=" + this.useDiskBitmapCache + ", enablePrefetch=" + this.enablePrefetch + ')';
    }

    public CachePolicy(boolean reuseRemoteFile, boolean persistRemoteFile, int maxRetainedDocuments, boolean useMemoryBitmapCache, boolean useDiskBitmapCache, boolean enablePrefetch) {
        this.reuseRemoteFile = reuseRemoteFile;
        this.persistRemoteFile = persistRemoteFile;
        this.maxRetainedDocuments = maxRetainedDocuments;
        this.useMemoryBitmapCache = useMemoryBitmapCache;
        this.useDiskBitmapCache = useDiskBitmapCache;
        this.enablePrefetch = enablePrefetch;
    }

    public final boolean getReuseRemoteFile() {
        return this.reuseRemoteFile;
    }

    public final boolean getPersistRemoteFile() {
        return this.persistRemoteFile;
    }

    public final int getMaxRetainedDocuments() {
        return this.maxRetainedDocuments;
    }

    public final boolean getUseMemoryBitmapCache() {
        return this.useMemoryBitmapCache;
    }

    public final boolean getUseDiskBitmapCache() {
        return this.useDiskBitmapCache;
    }

    public final boolean getEnablePrefetch() {
        return this.enablePrefetch;
    }

    /* compiled from: CachePolicy.kt */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t¨\u0006\n"}, d2 = {"Lcom/rajat/pdfviewer/util/CachePolicy$Companion;", "", "<init>", "()V", TypedValues.TransitionType.S_FROM, "Lcom/rajat/pdfviewer/util/CachePolicy;", "strategy", "Lcom/rajat/pdfviewer/util/CacheStrategy;", "maxRetainedDocuments", "", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Companion {

        /* compiled from: CachePolicy.kt */
        @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
        /* loaded from: classes12.dex */
        public /* synthetic */ class WhenMappings {
            public static final /* synthetic */ int[] $EnumSwitchMapping$0;

            static {
                int[] iArr = new int[CacheStrategy.values().length];
                try {
                    iArr[CacheStrategy.MAXIMIZE_PERFORMANCE.ordinal()] = 1;
                } catch (NoSuchFieldError e) {
                }
                try {
                    iArr[CacheStrategy.MINIMIZE_CACHE.ordinal()] = 2;
                } catch (NoSuchFieldError e2) {
                }
                try {
                    iArr[CacheStrategy.DISABLE_CACHE.ordinal()] = 3;
                } catch (NoSuchFieldError e3) {
                }
                $EnumSwitchMapping$0 = iArr;
            }
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public static /* synthetic */ CachePolicy from$default(Companion companion, CacheStrategy cacheStrategy, int i, int i2, Object obj) {
            if ((i2 & 2) != 0) {
                i = 5;
            }
            return companion.from(cacheStrategy, i);
        }

        public final CachePolicy from(CacheStrategy strategy, int maxRetainedDocuments) {
            Intrinsics.checkNotNullParameter(strategy, "strategy");
            switch (WhenMappings.$EnumSwitchMapping$0[strategy.ordinal()]) {
                case 1:
                    return new CachePolicy(true, true, maxRetainedDocuments, true, true, true);
                case 2:
                    return new CachePolicy(true, true, 1, true, false, true);
                case 3:
                    return new CachePolicy(false, false, 0, true, false, false);
                default:
                    throw new NoWhenBranchMatchedException();
            }
        }
    }
}
