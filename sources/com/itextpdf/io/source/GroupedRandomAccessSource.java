package com.itextpdf.io.source;

import com.itextpdf.io.logs.IoLogMessageConstant;
import java.io.IOException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
class GroupedRandomAccessSource implements IRandomAccessSource {
    private SourceEntry currentSourceEntry;
    private final long size;
    private final SourceEntry[] sources;

    public GroupedRandomAccessSource(IRandomAccessSource[] sources) throws IOException {
        this.sources = new SourceEntry[sources.length];
        long totalSize = 0;
        for (int i = 0; i < sources.length; i++) {
            this.sources[i] = new SourceEntry(i, sources[i], totalSize);
            totalSize += sources[i].length();
        }
        this.size = totalSize;
        this.currentSourceEntry = this.sources[sources.length - 1];
        sourceInUse(this.currentSourceEntry.source);
    }

    protected int getStartingSourceIndex(long offset) {
        if (offset >= this.currentSourceEntry.firstByte) {
            return this.currentSourceEntry.index;
        }
        return 0;
    }

    private SourceEntry getSourceEntryForOffset(long offset) throws IOException {
        if (offset >= this.size) {
            return null;
        }
        if (offset >= this.currentSourceEntry.firstByte && offset <= this.currentSourceEntry.lastByte) {
            return this.currentSourceEntry;
        }
        sourceReleased(this.currentSourceEntry.source);
        int startAt = getStartingSourceIndex(offset);
        for (int i = startAt; i < this.sources.length; i++) {
            if (offset >= this.sources[i].firstByte && offset <= this.sources[i].lastByte) {
                this.currentSourceEntry = this.sources[i];
                sourceInUse(this.currentSourceEntry.source);
                return this.currentSourceEntry;
            }
        }
        return null;
    }

    protected void sourceReleased(IRandomAccessSource source) throws IOException {
    }

    protected void sourceInUse(IRandomAccessSource source) throws IOException {
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long position) throws IOException {
        SourceEntry entry = getSourceEntryForOffset(position);
        if (entry == null) {
            return -1;
        }
        return entry.source.get(entry.offsetN(position));
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:?, code lost:
        return -1;
     */
    @Override // com.itextpdf.io.source.IRandomAccessSource
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public int get(long r11, byte[] r13, int r14, int r15) throws java.io.IOException {
        /*
            r10 = this;
            com.itextpdf.io.source.GroupedRandomAccessSource$SourceEntry r0 = r10.getSourceEntryForOffset(r11)
            r1 = -1
            if (r0 != 0) goto L8
            return r1
        L8:
            long r2 = r0.offsetN(r11)
            r4 = r15
            r6 = r14
            r7 = r4
            r3 = r2
        L10:
            if (r7 <= 0) goto L38
            if (r0 != 0) goto L16
            r5 = r13
            goto L39
        L16:
            com.itextpdf.io.source.IRandomAccessSource r14 = r0.source
            long r8 = r14.length()
            int r14 = (r3 > r8 ? 1 : (r3 == r8 ? 0 : -1))
            if (r14 <= 0) goto L22
            r5 = r13
            goto L39
        L22:
            com.itextpdf.io.source.IRandomAccessSource r2 = r0.source
            r5 = r13
            int r13 = r2.get(r3, r5, r6, r7)
            if (r13 != r1) goto L2c
            goto L39
        L2c:
            int r6 = r6 + r13
            long r8 = (long) r13
            long r11 = r11 + r8
            int r7 = r7 - r13
            r3 = 0
            com.itextpdf.io.source.GroupedRandomAccessSource$SourceEntry r0 = r10.getSourceEntryForOffset(r11)
            r13 = r5
            goto L10
        L38:
            r5 = r13
        L39:
            if (r7 != r15) goto L3c
            goto L3e
        L3c:
            int r1 = r15 - r7
        L3e:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.io.source.GroupedRandomAccessSource.get(long, byte[], int, int):int");
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public long length() {
        return this.size;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public void close() throws IOException {
        SourceEntry[] sourceEntryArr;
        IOException firstThrownIOExc = null;
        for (SourceEntry entry : this.sources) {
            try {
                entry.source.close();
            } catch (IOException ex) {
                if (firstThrownIOExc == null) {
                    firstThrownIOExc = ex;
                } else {
                    Logger logger = LoggerFactory.getLogger(GroupedRandomAccessSource.class);
                    logger.error(IoLogMessageConstant.ONE_OF_GROUPED_SOURCES_CLOSING_FAILED, (Throwable) ex);
                }
            } catch (Exception ex2) {
                Logger logger2 = LoggerFactory.getLogger(GroupedRandomAccessSource.class);
                logger2.error(IoLogMessageConstant.ONE_OF_GROUPED_SOURCES_CLOSING_FAILED, (Throwable) ex2);
            }
        }
        if (firstThrownIOExc != null) {
            throw firstThrownIOExc;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SourceEntry {
        final long firstByte;
        final int index;
        final long lastByte;
        final IRandomAccessSource source;

        public SourceEntry(int index, IRandomAccessSource source, long offset) {
            this.index = index;
            this.source = source;
            this.firstByte = offset;
            this.lastByte = (source.length() + offset) - 1;
        }

        public long offsetN(long absoluteOffset) {
            return absoluteOffset - this.firstByte;
        }
    }
}
