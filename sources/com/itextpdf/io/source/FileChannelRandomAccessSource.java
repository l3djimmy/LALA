package com.itextpdf.io.source;

import com.itextpdf.io.logs.IoLogMessageConstant;
import java.io.IOException;
import java.nio.channels.FileChannel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class FileChannelRandomAccessSource implements IRandomAccessSource {
    private final FileChannel channel;
    private final MappedChannelRandomAccessSource source;

    public FileChannelRandomAccessSource(FileChannel channel) throws IOException {
        this.channel = channel;
        if (channel.size() == 0) {
            throw new IOException("File size is 0 bytes");
        }
        this.source = new MappedChannelRandomAccessSource(channel, 0L, channel.size());
        this.source.open();
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public void close() throws IOException {
        try {
            this.source.close();
            try {
                this.channel.close();
            } catch (Exception ex) {
                Logger logger = LoggerFactory.getLogger(FileChannelRandomAccessSource.class);
                logger.error(IoLogMessageConstant.FILE_CHANNEL_CLOSING_FAILED, (Throwable) ex);
            }
        } catch (Throwable th) {
            try {
                this.channel.close();
            } catch (Exception ex2) {
                Logger logger2 = LoggerFactory.getLogger(FileChannelRandomAccessSource.class);
                logger2.error(IoLogMessageConstant.FILE_CHANNEL_CLOSING_FAILED, (Throwable) ex2);
            }
            throw th;
        }
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long position) throws IOException {
        return this.source.get(position);
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long position, byte[] bytes, int off, int len) throws IOException {
        return this.source.get(position, bytes, off, len);
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public long length() {
        return this.source.length();
    }
}
