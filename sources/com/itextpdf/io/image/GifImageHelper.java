package com.itextpdf.io.image;

import androidx.exifinterface.media.ExifInterface;
import androidx.fragment.app.FragmentTransaction;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.util.StreamUtil;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import kotlin.UByte;
/* loaded from: classes12.dex */
public final class GifImageHelper {
    static final int MAX_STACK_SIZE = 4096;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class GifParameters {
        int bgColor;
        int bgIndex;
        int currentFrame;
        byte[] fromData;
        URL fromUrl;
        boolean gctFlag;
        int ih;
        GifImageData image;
        InputStream input;
        boolean interlace;
        int iw;
        int ix;
        int iy;
        boolean lctFlag;
        int lctSize;
        int m_bpc;
        byte[] m_curr_table;
        int m_gbpc;
        byte[] m_global_table;
        int m_line_stride;
        byte[] m_local_table;
        byte[] m_out;
        int pixelAspect;
        byte[] pixelStack;
        byte[] pixels;
        short[] prefix;
        byte[] suffix;
        int transIndex;
        byte[] block = new byte[256];
        int blockSize = 0;
        int dispose = 0;
        boolean transparency = false;
        int delay = 0;

        public GifParameters(GifImageData image) {
            this.image = image;
        }
    }

    public static void processImage(GifImageData image) {
        processImage(image, -1);
    }

    public static void processImage(GifImageData image, int lastFrameNumber) {
        GifParameters gif = new GifParameters(image);
        try {
            if (image.getData() == null) {
                image.loadData();
            }
            InputStream gifStream = new ByteArrayInputStream(image.getData());
            process(gifStream, gif, lastFrameNumber);
        } catch (IOException e) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.GIF_IMAGE_EXCEPTION, (Throwable) e);
        }
    }

    private static void process(InputStream stream, GifParameters gif, int lastFrameNumber) throws IOException {
        gif.input = stream;
        readHeader(gif);
        readContents(gif, lastFrameNumber);
        if (gif.currentFrame <= lastFrameNumber) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.CANNOT_FIND_FRAME).setMessageParams(Integer.valueOf(lastFrameNumber));
        }
    }

    private static void readHeader(GifParameters gif) throws IOException {
        StringBuilder id = new StringBuilder("");
        for (int i = 0; i < 6; i++) {
            id.append((char) gif.input.read());
        }
        if (!id.toString().startsWith("GIF8")) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.GIF_SIGNATURE_NOT_FOUND);
        }
        readLSD(gif);
        if (gif.gctFlag) {
            gif.m_global_table = readColorTable(gif.m_gbpc, gif);
        }
    }

    private static void readLSD(GifParameters gif) throws IOException {
        gif.image.setLogicalWidth(readShort(gif));
        gif.image.setLogicalHeight(readShort(gif));
        int packed = gif.input.read();
        gif.gctFlag = (packed & 128) != 0;
        gif.m_gbpc = (packed & 7) + 1;
        gif.bgIndex = gif.input.read();
        gif.pixelAspect = gif.input.read();
    }

    private static int readShort(GifParameters gif) throws IOException {
        return gif.input.read() | (gif.input.read() << 8);
    }

    private static int readBlock(GifParameters gif) throws IOException {
        gif.blockSize = gif.input.read();
        if (gif.blockSize <= 0) {
            gif.blockSize = 0;
            return 0;
        }
        gif.blockSize = gif.input.read(gif.block, 0, gif.blockSize);
        return gif.blockSize;
    }

    private static byte[] readColorTable(int bpc, GifParameters gif) throws IOException {
        int ncolors = 1 << bpc;
        int nbytes = ncolors * 3;
        byte[] table = new byte[(1 << newBpc(bpc)) * 3];
        StreamUtil.readFully(gif.input, table, 0, nbytes);
        return table;
    }

    private static int newBpc(int bpc) {
        switch (bpc) {
            case 1:
            case 2:
            case 4:
                return bpc;
            case 3:
                return 4;
            default:
                return 8;
        }
    }

    private static void readContents(GifParameters gif, int lastFrameNumber) throws IOException {
        boolean done = false;
        gif.currentFrame = 0;
        while (!done) {
            int code = gif.input.read();
            switch (code) {
                case 33:
                    int code2 = gif.input.read();
                    switch (code2) {
                        case 249:
                            readGraphicControlExt(gif);
                            continue;
                        case 255:
                            readBlock(gif);
                            skip(gif);
                            continue;
                        default:
                            skip(gif);
                            continue;
                    }
                case 44:
                    readFrame(gif);
                    if (gif.currentFrame == lastFrameNumber) {
                        done = true;
                    }
                    gif.currentFrame++;
                    break;
                default:
                    done = true;
                    break;
            }
        }
    }

    private static void readFrame(GifParameters gif) throws IOException {
        gif.ix = readShort(gif);
        gif.iy = readShort(gif);
        gif.iw = readShort(gif);
        gif.ih = readShort(gif);
        int packed = gif.input.read();
        gif.lctFlag = (packed & 128) != 0;
        gif.interlace = (packed & 64) != 0;
        gif.lctSize = 2 << (packed & 7);
        gif.m_bpc = newBpc(gif.m_gbpc);
        if (gif.lctFlag) {
            gif.m_curr_table = readColorTable((packed & 7) + 1, gif);
            gif.m_bpc = newBpc((packed & 7) + 1);
        } else {
            gif.m_curr_table = gif.m_global_table;
        }
        if (gif.transparency && gif.transIndex >= gif.m_curr_table.length / 3) {
            gif.transparency = false;
        }
        if (gif.transparency && gif.m_bpc == 1) {
            byte[] tp = new byte[12];
            System.arraycopy(gif.m_curr_table, 0, tp, 0, 6);
            gif.m_curr_table = tp;
            gif.m_bpc = 2;
        }
        boolean skipZero = decodeImageData(gif);
        if (!skipZero) {
            skip(gif);
        }
        try {
            int len = gif.m_curr_table.length;
            Object[] colorspace = {"/Indexed", "/DeviceRGB", Integer.valueOf((len / 3) - 1), PdfEncodings.convertToString(gif.m_curr_table, null)};
            Map<String, Object> ad = new HashMap<>();
            ad.put(ExifInterface.TAG_COLOR_SPACE, colorspace);
            RawImageData img = new RawImageData(gif.m_out, ImageType.GIF);
            RawImageHelper.updateRawImageParameters(img, gif.iw, gif.ih, 1, gif.m_bpc, gif.m_out);
            RawImageHelper.updateImageAttributes(img, ad);
            gif.image.addFrame(img);
            if (gif.transparency) {
                img.setTransparency(new int[]{gif.transIndex, gif.transIndex});
            }
        } catch (Exception e) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.GIF_IMAGE_EXCEPTION, (Throwable) e);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static boolean decodeImageData(GifParameters gif) throws IOException {
        int datum;
        int NullCode;
        int npix;
        int top;
        int line;
        int in_code;
        int NullCode2 = -1;
        int npix2 = gif.iw * gif.ih;
        boolean skipZero = false;
        if (gif.prefix == null) {
            gif.prefix = new short[4096];
        }
        if (gif.suffix == null) {
            gif.suffix = new byte[4096];
        }
        if (gif.pixelStack == null) {
            gif.pixelStack = new byte[FragmentTransaction.TRANSIT_FRAGMENT_OPEN];
        }
        gif.m_line_stride = ((gif.iw * gif.m_bpc) + 7) / 8;
        gif.m_out = new byte[gif.m_line_stride * gif.ih];
        int inc = gif.interlace ? 8 : 1;
        int line2 = 0;
        int xpos = 0;
        int data_size = gif.input.read();
        int clear = 1 << data_size;
        int end_of_information = clear + 1;
        int available = clear + 2;
        int old_code = -1;
        int code_size = data_size + 1;
        int code_mask = (1 << code_size) - 1;
        int code = 0;
        while (true) {
            datum = 0;
            if (code >= clear) {
                break;
            }
            gif.prefix[code] = 0;
            gif.suffix[code] = (byte) code;
            code++;
            skipZero = skipZero;
        }
        boolean skipZero2 = skipZero;
        int count = 0;
        int bi = 0;
        int first = 0;
        int pass = 1;
        int bits = 0;
        int top2 = 0;
        int top3 = 0;
        while (top3 < npix2) {
            if (top2 != 0) {
                NullCode = NullCode2;
                npix = npix2;
                top = top2;
            } else if (bits < code_size) {
                if (count == 0) {
                    count = readBlock(gif);
                    if (count <= 0) {
                        return true;
                    }
                    bi = 0;
                }
                datum += (gif.block[bi] & UByte.MAX_VALUE) << bits;
                bits += 8;
                bi++;
                count--;
                npix2 = npix2;
            } else {
                npix = npix2;
                short code2 = datum & code_mask;
                datum >>= code_size;
                bits -= code_size;
                if (code2 <= available && code2 != end_of_information) {
                    if (code2 == clear) {
                        code_size = data_size + 1;
                        code_mask = (1 << code_size) - 1;
                        available = clear + 2;
                        old_code = NullCode2;
                        npix2 = npix;
                    } else if (old_code == NullCode2) {
                        gif.pixelStack[top2] = gif.suffix[code2];
                        old_code = code2;
                        first = code2;
                        npix2 = npix;
                        top2++;
                        NullCode2 = NullCode2;
                    } else {
                        NullCode = NullCode2;
                        if (code2 != available) {
                            in_code = code2;
                        } else {
                            in_code = code2;
                            gif.pixelStack[top2] = (byte) first;
                            code2 = old_code;
                            top2++;
                        }
                        while (code2 > clear) {
                            gif.pixelStack[top2] = gif.suffix[code2];
                            code2 = gif.prefix[code2];
                            top2++;
                        }
                        first = gif.suffix[code2] & UByte.MAX_VALUE;
                        if (available >= 4096) {
                            return skipZero2;
                        }
                        top = top2 + 1;
                        gif.pixelStack[top2] = (byte) first;
                        gif.prefix[available] = (short) old_code;
                        gif.suffix[available] = (byte) first;
                        available++;
                        if ((available & code_mask) == 0 && available < 4096) {
                            code_size++;
                            code_mask += available;
                        }
                        old_code = in_code;
                    }
                }
                return skipZero2;
            }
            top2 = top - 1;
            top3++;
            setPixel(xpos, line2, gif.pixelStack[top2], gif);
            xpos++;
            if (xpos < gif.iw) {
                npix2 = npix;
                NullCode2 = NullCode;
            } else {
                xpos = 0;
                line2 += inc;
                if (line2 < gif.ih) {
                    npix2 = npix;
                    NullCode2 = NullCode;
                } else if (gif.interlace) {
                    do {
                        pass++;
                        switch (pass) {
                            case 2:
                                line2 = 4;
                                break;
                            case 3:
                                inc = 4;
                                line2 = 2;
                                break;
                            case 4:
                                inc = 2;
                                line2 = 1;
                                break;
                            default:
                                int line3 = gif.ih - 1;
                                inc = 0;
                                line2 = line3;
                                break;
                        }
                        line = gif.ih;
                    } while (line2 >= line);
                    npix2 = npix;
                    NullCode2 = NullCode;
                } else {
                    line2 = gif.ih - 1;
                    inc = 0;
                    npix2 = npix;
                    NullCode2 = NullCode;
                }
            }
        }
        return skipZero2;
    }

    private static void setPixel(int x, int y, int v, GifParameters gif) {
        if (gif.m_bpc == 8) {
            gif.m_out[(gif.iw * y) + x] = (byte) v;
            return;
        }
        int pos = (gif.m_line_stride * y) + (x / (8 / gif.m_bpc));
        int vout = v << ((8 - (gif.m_bpc * (x % (8 / gif.m_bpc)))) - gif.m_bpc);
        byte[] bArr = gif.m_out;
        bArr[pos] = (byte) (bArr[pos] | ((byte) vout));
    }

    private static void readGraphicControlExt(GifParameters gif) throws IOException {
        gif.input.read();
        int packed = gif.input.read();
        gif.dispose = (packed & 28) >> 2;
        if (gif.dispose == 0) {
            gif.dispose = 1;
        }
        gif.transparency = (packed & 1) != 0;
        gif.delay = readShort(gif) * 10;
        gif.transIndex = gif.input.read();
        gif.input.read();
    }

    private static void skip(GifParameters gif) throws IOException {
        do {
            readBlock(gif);
        } while (gif.blockSize > 0);
    }
}
