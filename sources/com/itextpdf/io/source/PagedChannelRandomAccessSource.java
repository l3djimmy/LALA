package com.itextpdf.io.source;

import com.itextpdf.io.logs.IoLogMessageConstant;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.Iterator;
import java.util.LinkedList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class PagedChannelRandomAccessSource extends GroupedRandomAccessSource implements IRandomAccessSource {
    public static final int DEFAULT_MAX_OPEN_BUFFERS = 16;
    public static final int DEFAULT_TOTAL_BUFSIZE = 67108864;
    private final int bufferSize;
    private final FileChannel channel;
    private final MRU<IRandomAccessSource> mru;

    public PagedChannelRandomAccessSource(FileChannel channel) throws IOException {
        this(channel, 67108864, 16);
    }

    public PagedChannelRandomAccessSource(FileChannel channel, int totalBufferSize, int maxOpenBuffers) throws IOException {
        super(buildSources(channel, totalBufferSize / maxOpenBuffers));
        this.channel = channel;
        this.bufferSize = totalBufferSize / maxOpenBuffers;
        this.mru = new MRU<>(maxOpenBuffers);
    }

    private static IRandomAccessSource[] buildSources(FileChannel channel, int bufferSize) throws IOException {
        long size = channel.size();
        if (size > 0) {
            int bufferCount = ((int) (size / bufferSize)) + (size % ((long) bufferSize) == 0 ? 0 : 1);
            MappedChannelRandomAccessSource[] sources = new MappedChannelRandomAccessSource[bufferCount];
            for (int i = 0; i < bufferCount; i++) {
                long pageOffset = i * bufferSize;
                long pageLength = Math.min(size - pageOffset, bufferSize);
                sources[i] = new MappedChannelRandomAccessSource(channel, pageOffset, pageLength);
            }
            return sources;
        }
        throw new IOException("File size must be greater than zero");
    }

    @Override // com.itextpdf.io.source.GroupedRandomAccessSource
    protected int getStartingSourceIndex(long offset) {
        return (int) (offset / this.bufferSize);
    }

    @Override // com.itextpdf.io.source.GroupedRandomAccessSource
    protected void sourceReleased(IRandomAccessSource source) throws IOException {
        IRandomAccessSource old = this.mru.enqueue(source);
        if (old != null) {
            old.close();
        }
    }

    @Override // com.itextpdf.io.source.GroupedRandomAccessSource
    protected void sourceInUse(IRandomAccessSource source) throws IOException {
        ((MappedChannelRandomAccessSource) source).open();
    }

    @Override // com.itextpdf.io.source.GroupedRandomAccessSource, com.itextpdf.io.source.IRandomAccessSource
    public void close() throws IOException {
        try {
            super.close();
            try {
                this.channel.close();
            } catch (Exception ex) {
                Logger logger = LoggerFactory.getLogger(PagedChannelRandomAccessSource.class);
                logger.error(IoLogMessageConstant.FILE_CHANNEL_CLOSING_FAILED, (Throwable) ex);
            }
        } catch (Throwable th) {
            try {
                this.channel.close();
            } catch (Exception ex2) {
                Logger logger2 = LoggerFactory.getLogger(PagedChannelRandomAccessSource.class);
                logger2.error(IoLogMessageConstant.FILE_CHANNEL_CLOSING_FAILED, (Throwable) ex2);
            }
            throw th;
        }
    }

    /* loaded from: classes12.dex */
    private static class MRU<E> {
        private final int limit;
        private LinkedList<E> queue = new LinkedList<>();

        public MRU(int limit) {
            this.limit = limit;
        }

        public E enqueue(E newElement) {
            if (this.queue.isEmpty() || this.queue.getFirst() != newElement) {
                Iterator<E> it = this.queue.iterator();
                while (it.hasNext()) {
                    E element = it.next();
                    if (newElement == element) {
                        it.remove();
                        this.queue.addFirst(newElement);
                        return null;
                    }
                }
                this.queue.addFirst(newElement);
                if (this.queue.size() > this.limit) {
                    return this.queue.removeLast();
                }
                return null;
            }
            return null;
        }
    }
}
