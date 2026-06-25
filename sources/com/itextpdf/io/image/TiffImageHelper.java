package com.itextpdf.io.image;

import com.itextpdf.io.codec.TIFFDirectory;
import com.itextpdf.io.codec.TIFFField;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.source.DeflaterOutputStream;
import com.itextpdf.io.source.IRandomAccessSource;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import com.itextpdf.io.source.RandomAccessSourceFactory;
import java.io.IOException;
import java.util.Map;
import kotlin.jvm.internal.ByteCompanionObject;
/* loaded from: classes12.dex */
class TiffImageHelper {
    TiffImageHelper() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class TiffParameters {
        Map<String, Object> additional;
        TiffImageData image;
        boolean jpegProcessing;

        TiffParameters(TiffImageData image) {
            this.image = image;
        }
    }

    public static void processImage(ImageData image) {
        if (image.getOriginalType() != ImageType.TIFF) {
            throw new IllegalArgumentException("TIFF image expected");
        }
        try {
            if (image.getData() == null) {
                image.loadData();
            }
            IRandomAccessSource ras = new RandomAccessSourceFactory().createSource(image.getData());
            RandomAccessFileOrArray raf = new RandomAccessFileOrArray(ras);
            TiffParameters tiff = new TiffParameters((TiffImageData) image);
            processTiffImage(raf, tiff);
            raf.close();
            if (!tiff.jpegProcessing) {
                RawImageHelper.updateImageAttributes(tiff.image, tiff.additional);
            }
        } catch (IOException e) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.TIFF_IMAGE_EXCEPTION, (Throwable) e);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:82:0x0136, code lost:
        r8 = r15;
        r15 = new long[1];
        r15[r24] = r58.length() - ((int) r13[r24]);
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x0146, code lost:
        r14 = r15;
     */
    /* JADX WARN: Incorrect condition in loop: B:130:0x026b */
    /* JADX WARN: Removed duplicated region for block: B:101:0x017a A[Catch: Exception -> 0x00b2, TRY_ENTER, TryCatch #7 {Exception -> 0x00b2, blocks: (B:43:0x00ac, B:59:0x00ee, B:72:0x0113, B:74:0x0119, B:76:0x011f, B:82:0x0136, B:90:0x0158, B:101:0x017a, B:103:0x0182, B:106:0x018b, B:125:0x0216, B:136:0x02b8, B:141:0x02cf, B:143:0x02e6, B:145:0x02f4, B:108:0x019a, B:110:0x01a6, B:112:0x01be, B:114:0x01ce, B:117:0x01df, B:119:0x01e5, B:122:0x0202), top: B:206:0x00ac, inners: #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:107:0x018e  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x019a A[Catch: Exception -> 0x00b2, TryCatch #7 {Exception -> 0x00b2, blocks: (B:43:0x00ac, B:59:0x00ee, B:72:0x0113, B:74:0x0119, B:76:0x011f, B:82:0x0136, B:90:0x0158, B:101:0x017a, B:103:0x0182, B:106:0x018b, B:125:0x0216, B:136:0x02b8, B:141:0x02cf, B:143:0x02e6, B:145:0x02f4, B:108:0x019a, B:110:0x01a6, B:112:0x01be, B:114:0x01ce, B:117:0x01df, B:119:0x01e5, B:122:0x0202), top: B:206:0x00ac, inners: #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:112:0x01be A[Catch: Exception -> 0x00b2, TryCatch #7 {Exception -> 0x00b2, blocks: (B:43:0x00ac, B:59:0x00ee, B:72:0x0113, B:74:0x0119, B:76:0x011f, B:82:0x0136, B:90:0x0158, B:101:0x017a, B:103:0x0182, B:106:0x018b, B:125:0x0216, B:136:0x02b8, B:141:0x02cf, B:143:0x02e6, B:145:0x02f4, B:108:0x019a, B:110:0x01a6, B:112:0x01be, B:114:0x01ce, B:117:0x01df, B:119:0x01e5, B:122:0x0202), top: B:206:0x00ac, inners: #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:122:0x0202 A[Catch: Exception -> 0x00b2, TryCatch #7 {Exception -> 0x00b2, blocks: (B:43:0x00ac, B:59:0x00ee, B:72:0x0113, B:74:0x0119, B:76:0x011f, B:82:0x0136, B:90:0x0158, B:101:0x017a, B:103:0x0182, B:106:0x018b, B:125:0x0216, B:136:0x02b8, B:141:0x02cf, B:143:0x02e6, B:145:0x02f4, B:108:0x019a, B:110:0x01a6, B:112:0x01be, B:114:0x01ce, B:117:0x01df, B:119:0x01e5, B:122:0x0202), top: B:206:0x00ac, inners: #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:124:0x0214 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:131:0x026d A[Catch: Exception -> 0x0411, TRY_LEAVE, TryCatch #8 {Exception -> 0x0411, blocks: (B:49:0x00bd, B:52:0x00d4, B:56:0x00e2, B:68:0x0102, B:87:0x014e, B:98:0x0172, B:128:0x025e, B:129:0x026a, B:131:0x026d, B:149:0x0313), top: B:207:0x00bd }] */
    /* JADX WARN: Removed duplicated region for block: B:177:0x040a A[Catch: Exception -> 0x0424, TRY_ENTER, TryCatch #6 {Exception -> 0x0424, blocks: (B:15:0x004e, B:168:0x03de, B:170:0x03ec, B:172:0x03ff, B:177:0x040a, B:166:0x03a8, B:151:0x0324, B:157:0x0344, B:159:0x037d, B:162:0x0388, B:164:0x0390, B:165:0x0391, B:167:0x03bb, B:183:0x0416, B:184:0x0423, B:145:0x02f4, B:149:0x0313), top: B:205:0x0027, inners: #1, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:193:0x03ec A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:216:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00a8  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00f4  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0111  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0130  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0154  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0168  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x016a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void processTiffImage(com.itextpdf.io.source.RandomAccessFileOrArray r58, com.itextpdf.io.image.TiffImageHelper.TiffParameters r59) {
        /*
            Method dump skipped, instructions count: 1142
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.io.image.TiffImageHelper.processTiffImage(com.itextpdf.io.source.RandomAccessFileOrArray, com.itextpdf.io.image.TiffImageHelper$TiffParameters):void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:83:0x018d, code lost:
        r5 = r9;
        r12 = new long[1];
        r12[r35] = r2.length() - ((int) r10[r35]);
        r11 = r12;
     */
    /* JADX WARN: Removed duplicated region for block: B:112:0x01f9  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x0202 A[Catch: Exception -> 0x064f, TryCatch #1 {Exception -> 0x064f, blocks: (B:3:0x0009, B:5:0x000f, B:8:0x0019, B:9:0x001c, B:258:0x063d, B:259:0x064e, B:10:0x0024, B:11:0x002e, B:16:0x0037, B:17:0x004a, B:18:0x004b, B:20:0x0059, B:32:0x0077, B:34:0x007f, B:37:0x008a, B:38:0x0091, B:39:0x0092, B:42:0x009c, B:44:0x00a5, B:46:0x00af, B:48:0x00b8, B:50:0x00c2, B:51:0x00c5, B:256:0x062b, B:257:0x063c, B:52:0x00d4, B:54:0x00ec, B:56:0x00f4, B:58:0x0119, B:64:0x013a, B:66:0x0146, B:71:0x0157, B:73:0x0165, B:75:0x016d, B:77:0x0175, B:83:0x018d, B:116:0x0202, B:120:0x021f, B:127:0x0245, B:136:0x0272, B:138:0x027a, B:140:0x0291, B:142:0x02a4, B:206:0x04bf, B:210:0x04cc, B:212:0x04d5, B:214:0x04e7, B:216:0x04ed, B:224:0x04fd, B:226:0x0503, B:228:0x051d, B:230:0x055c, B:232:0x0561, B:240:0x0574, B:243:0x05a5, B:235:0x0568, B:246:0x05dc, B:249:0x05e7, B:252:0x05f3, B:143:0x02db, B:144:0x02ec, B:147:0x02fa, B:149:0x02fe, B:151:0x0315, B:153:0x0324, B:155:0x032c, B:156:0x032f, B:158:0x0339, B:160:0x0344, B:161:0x0346, B:163:0x036c, B:165:0x0382, B:168:0x039b, B:169:0x03af, B:171:0x03b3, B:173:0x03b6, B:175:0x03cd, B:177:0x03df, B:178:0x03e2, B:189:0x041f, B:194:0x0458, B:192:0x0431, B:193:0x044d, B:180:0x03ea, B:181:0x03f2, B:182:0x0401, B:200:0x048a, B:204:0x0493, B:205:0x04a3, B:128:0x0250, B:132:0x025f, B:94:0x01b3, B:96:0x01bb, B:109:0x01e2, B:110:0x01f6, B:101:0x01ce, B:102:0x01d7), top: B:265:0x0009 }] */
    /* JADX WARN: Removed duplicated region for block: B:117:0x020d  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x021f A[Catch: Exception -> 0x064f, TryCatch #1 {Exception -> 0x064f, blocks: (B:3:0x0009, B:5:0x000f, B:8:0x0019, B:9:0x001c, B:258:0x063d, B:259:0x064e, B:10:0x0024, B:11:0x002e, B:16:0x0037, B:17:0x004a, B:18:0x004b, B:20:0x0059, B:32:0x0077, B:34:0x007f, B:37:0x008a, B:38:0x0091, B:39:0x0092, B:42:0x009c, B:44:0x00a5, B:46:0x00af, B:48:0x00b8, B:50:0x00c2, B:51:0x00c5, B:256:0x062b, B:257:0x063c, B:52:0x00d4, B:54:0x00ec, B:56:0x00f4, B:58:0x0119, B:64:0x013a, B:66:0x0146, B:71:0x0157, B:73:0x0165, B:75:0x016d, B:77:0x0175, B:83:0x018d, B:116:0x0202, B:120:0x021f, B:127:0x0245, B:136:0x0272, B:138:0x027a, B:140:0x0291, B:142:0x02a4, B:206:0x04bf, B:210:0x04cc, B:212:0x04d5, B:214:0x04e7, B:216:0x04ed, B:224:0x04fd, B:226:0x0503, B:228:0x051d, B:230:0x055c, B:232:0x0561, B:240:0x0574, B:243:0x05a5, B:235:0x0568, B:246:0x05dc, B:249:0x05e7, B:252:0x05f3, B:143:0x02db, B:144:0x02ec, B:147:0x02fa, B:149:0x02fe, B:151:0x0315, B:153:0x0324, B:155:0x032c, B:156:0x032f, B:158:0x0339, B:160:0x0344, B:161:0x0346, B:163:0x036c, B:165:0x0382, B:168:0x039b, B:169:0x03af, B:171:0x03b3, B:173:0x03b6, B:175:0x03cd, B:177:0x03df, B:178:0x03e2, B:189:0x041f, B:194:0x0458, B:192:0x0431, B:193:0x044d, B:180:0x03ea, B:181:0x03f2, B:182:0x0401, B:200:0x048a, B:204:0x0493, B:205:0x04a3, B:128:0x0250, B:132:0x025f, B:94:0x01b3, B:96:0x01bb, B:109:0x01e2, B:110:0x01f6, B:101:0x01ce, B:102:0x01d7), top: B:265:0x0009 }] */
    /* JADX WARN: Removed duplicated region for block: B:121:0x0236  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x0240 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:130:0x025c  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x0272 A[Catch: Exception -> 0x064f, TryCatch #1 {Exception -> 0x064f, blocks: (B:3:0x0009, B:5:0x000f, B:8:0x0019, B:9:0x001c, B:258:0x063d, B:259:0x064e, B:10:0x0024, B:11:0x002e, B:16:0x0037, B:17:0x004a, B:18:0x004b, B:20:0x0059, B:32:0x0077, B:34:0x007f, B:37:0x008a, B:38:0x0091, B:39:0x0092, B:42:0x009c, B:44:0x00a5, B:46:0x00af, B:48:0x00b8, B:50:0x00c2, B:51:0x00c5, B:256:0x062b, B:257:0x063c, B:52:0x00d4, B:54:0x00ec, B:56:0x00f4, B:58:0x0119, B:64:0x013a, B:66:0x0146, B:71:0x0157, B:73:0x0165, B:75:0x016d, B:77:0x0175, B:83:0x018d, B:116:0x0202, B:120:0x021f, B:127:0x0245, B:136:0x0272, B:138:0x027a, B:140:0x0291, B:142:0x02a4, B:206:0x04bf, B:210:0x04cc, B:212:0x04d5, B:214:0x04e7, B:216:0x04ed, B:224:0x04fd, B:226:0x0503, B:228:0x051d, B:230:0x055c, B:232:0x0561, B:240:0x0574, B:243:0x05a5, B:235:0x0568, B:246:0x05dc, B:249:0x05e7, B:252:0x05f3, B:143:0x02db, B:144:0x02ec, B:147:0x02fa, B:149:0x02fe, B:151:0x0315, B:153:0x0324, B:155:0x032c, B:156:0x032f, B:158:0x0339, B:160:0x0344, B:161:0x0346, B:163:0x036c, B:165:0x0382, B:168:0x039b, B:169:0x03af, B:171:0x03b3, B:173:0x03b6, B:175:0x03cd, B:177:0x03df, B:178:0x03e2, B:189:0x041f, B:194:0x0458, B:192:0x0431, B:193:0x044d, B:180:0x03ea, B:181:0x03f2, B:182:0x0401, B:200:0x048a, B:204:0x0493, B:205:0x04a3, B:128:0x0250, B:132:0x025f, B:94:0x01b3, B:96:0x01bb, B:109:0x01e2, B:110:0x01f6, B:101:0x01ce, B:102:0x01d7), top: B:265:0x0009 }] */
    /* JADX WARN: Removed duplicated region for block: B:145:0x02ed  */
    /* JADX WARN: Removed duplicated region for block: B:208:0x04c9  */
    /* JADX WARN: Removed duplicated region for block: B:246:0x05dc A[Catch: Exception -> 0x064f, TryCatch #1 {Exception -> 0x064f, blocks: (B:3:0x0009, B:5:0x000f, B:8:0x0019, B:9:0x001c, B:258:0x063d, B:259:0x064e, B:10:0x0024, B:11:0x002e, B:16:0x0037, B:17:0x004a, B:18:0x004b, B:20:0x0059, B:32:0x0077, B:34:0x007f, B:37:0x008a, B:38:0x0091, B:39:0x0092, B:42:0x009c, B:44:0x00a5, B:46:0x00af, B:48:0x00b8, B:50:0x00c2, B:51:0x00c5, B:256:0x062b, B:257:0x063c, B:52:0x00d4, B:54:0x00ec, B:56:0x00f4, B:58:0x0119, B:64:0x013a, B:66:0x0146, B:71:0x0157, B:73:0x0165, B:75:0x016d, B:77:0x0175, B:83:0x018d, B:116:0x0202, B:120:0x021f, B:127:0x0245, B:136:0x0272, B:138:0x027a, B:140:0x0291, B:142:0x02a4, B:206:0x04bf, B:210:0x04cc, B:212:0x04d5, B:214:0x04e7, B:216:0x04ed, B:224:0x04fd, B:226:0x0503, B:228:0x051d, B:230:0x055c, B:232:0x0561, B:240:0x0574, B:243:0x05a5, B:235:0x0568, B:246:0x05dc, B:249:0x05e7, B:252:0x05f3, B:143:0x02db, B:144:0x02ec, B:147:0x02fa, B:149:0x02fe, B:151:0x0315, B:153:0x0324, B:155:0x032c, B:156:0x032f, B:158:0x0339, B:160:0x0344, B:161:0x0346, B:163:0x036c, B:165:0x0382, B:168:0x039b, B:169:0x03af, B:171:0x03b3, B:173:0x03b6, B:175:0x03cd, B:177:0x03df, B:178:0x03e2, B:189:0x041f, B:194:0x0458, B:192:0x0431, B:193:0x044d, B:180:0x03ea, B:181:0x03f2, B:182:0x0401, B:200:0x048a, B:204:0x0493, B:205:0x04a3, B:128:0x0250, B:132:0x025f, B:94:0x01b3, B:96:0x01bb, B:109:0x01e2, B:110:0x01f6, B:101:0x01ce, B:102:0x01d7), top: B:265:0x0009 }] */
    /* JADX WARN: Removed duplicated region for block: B:249:0x05e7 A[Catch: Exception -> 0x064f, TryCatch #1 {Exception -> 0x064f, blocks: (B:3:0x0009, B:5:0x000f, B:8:0x0019, B:9:0x001c, B:258:0x063d, B:259:0x064e, B:10:0x0024, B:11:0x002e, B:16:0x0037, B:17:0x004a, B:18:0x004b, B:20:0x0059, B:32:0x0077, B:34:0x007f, B:37:0x008a, B:38:0x0091, B:39:0x0092, B:42:0x009c, B:44:0x00a5, B:46:0x00af, B:48:0x00b8, B:50:0x00c2, B:51:0x00c5, B:256:0x062b, B:257:0x063c, B:52:0x00d4, B:54:0x00ec, B:56:0x00f4, B:58:0x0119, B:64:0x013a, B:66:0x0146, B:71:0x0157, B:73:0x0165, B:75:0x016d, B:77:0x0175, B:83:0x018d, B:116:0x0202, B:120:0x021f, B:127:0x0245, B:136:0x0272, B:138:0x027a, B:140:0x0291, B:142:0x02a4, B:206:0x04bf, B:210:0x04cc, B:212:0x04d5, B:214:0x04e7, B:216:0x04ed, B:224:0x04fd, B:226:0x0503, B:228:0x051d, B:230:0x055c, B:232:0x0561, B:240:0x0574, B:243:0x05a5, B:235:0x0568, B:246:0x05dc, B:249:0x05e7, B:252:0x05f3, B:143:0x02db, B:144:0x02ec, B:147:0x02fa, B:149:0x02fe, B:151:0x0315, B:153:0x0324, B:155:0x032c, B:156:0x032f, B:158:0x0339, B:160:0x0344, B:161:0x0346, B:163:0x036c, B:165:0x0382, B:168:0x039b, B:169:0x03af, B:171:0x03b3, B:173:0x03b6, B:175:0x03cd, B:177:0x03df, B:178:0x03e2, B:189:0x041f, B:194:0x0458, B:192:0x0431, B:193:0x044d, B:180:0x03ea, B:181:0x03f2, B:182:0x0401, B:200:0x048a, B:204:0x0493, B:205:0x04a3, B:128:0x0250, B:132:0x025f, B:94:0x01b3, B:96:0x01bb, B:109:0x01e2, B:110:0x01f6, B:101:0x01ce, B:102:0x01d7), top: B:265:0x0009 }] */
    /* JADX WARN: Removed duplicated region for block: B:250:0x05ef  */
    /* JADX WARN: Removed duplicated region for block: B:252:0x05f3 A[Catch: Exception -> 0x064f, TryCatch #1 {Exception -> 0x064f, blocks: (B:3:0x0009, B:5:0x000f, B:8:0x0019, B:9:0x001c, B:258:0x063d, B:259:0x064e, B:10:0x0024, B:11:0x002e, B:16:0x0037, B:17:0x004a, B:18:0x004b, B:20:0x0059, B:32:0x0077, B:34:0x007f, B:37:0x008a, B:38:0x0091, B:39:0x0092, B:42:0x009c, B:44:0x00a5, B:46:0x00af, B:48:0x00b8, B:50:0x00c2, B:51:0x00c5, B:256:0x062b, B:257:0x063c, B:52:0x00d4, B:54:0x00ec, B:56:0x00f4, B:58:0x0119, B:64:0x013a, B:66:0x0146, B:71:0x0157, B:73:0x0165, B:75:0x016d, B:77:0x0175, B:83:0x018d, B:116:0x0202, B:120:0x021f, B:127:0x0245, B:136:0x0272, B:138:0x027a, B:140:0x0291, B:142:0x02a4, B:206:0x04bf, B:210:0x04cc, B:212:0x04d5, B:214:0x04e7, B:216:0x04ed, B:224:0x04fd, B:226:0x0503, B:228:0x051d, B:230:0x055c, B:232:0x0561, B:240:0x0574, B:243:0x05a5, B:235:0x0568, B:246:0x05dc, B:249:0x05e7, B:252:0x05f3, B:143:0x02db, B:144:0x02ec, B:147:0x02fa, B:149:0x02fe, B:151:0x0315, B:153:0x0324, B:155:0x032c, B:156:0x032f, B:158:0x0339, B:160:0x0344, B:161:0x0346, B:163:0x036c, B:165:0x0382, B:168:0x039b, B:169:0x03af, B:171:0x03b3, B:173:0x03b6, B:175:0x03cd, B:177:0x03df, B:178:0x03e2, B:189:0x041f, B:194:0x0458, B:192:0x0431, B:193:0x044d, B:180:0x03ea, B:181:0x03f2, B:182:0x0401, B:200:0x048a, B:204:0x0493, B:205:0x04a3, B:128:0x0250, B:132:0x025f, B:94:0x01b3, B:96:0x01bb, B:109:0x01e2, B:110:0x01f6, B:101:0x01ce, B:102:0x01d7), top: B:265:0x0009 }] */
    /* JADX WARN: Removed duplicated region for block: B:253:0x0620  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01bb A[Catch: Exception -> 0x064f, TryCatch #1 {Exception -> 0x064f, blocks: (B:3:0x0009, B:5:0x000f, B:8:0x0019, B:9:0x001c, B:258:0x063d, B:259:0x064e, B:10:0x0024, B:11:0x002e, B:16:0x0037, B:17:0x004a, B:18:0x004b, B:20:0x0059, B:32:0x0077, B:34:0x007f, B:37:0x008a, B:38:0x0091, B:39:0x0092, B:42:0x009c, B:44:0x00a5, B:46:0x00af, B:48:0x00b8, B:50:0x00c2, B:51:0x00c5, B:256:0x062b, B:257:0x063c, B:52:0x00d4, B:54:0x00ec, B:56:0x00f4, B:58:0x0119, B:64:0x013a, B:66:0x0146, B:71:0x0157, B:73:0x0165, B:75:0x016d, B:77:0x0175, B:83:0x018d, B:116:0x0202, B:120:0x021f, B:127:0x0245, B:136:0x0272, B:138:0x027a, B:140:0x0291, B:142:0x02a4, B:206:0x04bf, B:210:0x04cc, B:212:0x04d5, B:214:0x04e7, B:216:0x04ed, B:224:0x04fd, B:226:0x0503, B:228:0x051d, B:230:0x055c, B:232:0x0561, B:240:0x0574, B:243:0x05a5, B:235:0x0568, B:246:0x05dc, B:249:0x05e7, B:252:0x05f3, B:143:0x02db, B:144:0x02ec, B:147:0x02fa, B:149:0x02fe, B:151:0x0315, B:153:0x0324, B:155:0x032c, B:156:0x032f, B:158:0x0339, B:160:0x0344, B:161:0x0346, B:163:0x036c, B:165:0x0382, B:168:0x039b, B:169:0x03af, B:171:0x03b3, B:173:0x03b6, B:175:0x03cd, B:177:0x03df, B:178:0x03e2, B:189:0x041f, B:194:0x0458, B:192:0x0431, B:193:0x044d, B:180:0x03ea, B:181:0x03f2, B:182:0x0401, B:200:0x048a, B:204:0x0493, B:205:0x04a3, B:128:0x0250, B:132:0x025f, B:94:0x01b3, B:96:0x01bb, B:109:0x01e2, B:110:0x01f6, B:101:0x01ce, B:102:0x01d7), top: B:265:0x0009 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void processTiffImageColor(com.itextpdf.io.codec.TIFFDirectory r49, com.itextpdf.io.source.RandomAccessFileOrArray r50, com.itextpdf.io.image.TiffImageHelper.TiffParameters r51) {
        /*
            Method dump skipped, instructions count: 1710
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.io.image.TiffImageHelper.processTiffImageColor(com.itextpdf.io.codec.TIFFDirectory, com.itextpdf.io.source.RandomAccessFileOrArray, com.itextpdf.io.image.TiffImageHelper$TiffParameters):void");
    }

    private static int getDpi(TIFFField fd, int resolutionUnit) {
        if (fd == null) {
            return 0;
        }
        long[] res = fd.getAsRational(0);
        float frac = ((float) res[0]) / ((float) res[1]);
        switch (resolutionUnit) {
            case 1:
            case 2:
                int dpi = (int) (frac + 0.5d);
                return dpi;
            case 3:
                int dpi2 = (int) ((frac * 2.54d) + 0.5d);
                return dpi2;
            default:
                return 0;
        }
    }

    private static void processExtraSamples(DeflaterOutputStream zip, DeflaterOutputStream mzip, byte[] outBuf, int samplePerPixel, int bitsPerSample, int width, int height) throws IOException {
        if (bitsPerSample == 8) {
            byte[] mask = new byte[width * height];
            int mptr = 0;
            int optr = 0;
            int total = width * height * samplePerPixel;
            int k = 0;
            while (k < total) {
                int s = 0;
                while (s < samplePerPixel - 1) {
                    outBuf[optr] = outBuf[k + s];
                    s++;
                    optr++;
                }
                int s2 = mptr + 1;
                mask[mptr] = outBuf[(k + samplePerPixel) - 1];
                k += samplePerPixel;
                mptr = s2;
            }
            zip.write(outBuf, 0, optr);
            mzip.write(mask, 0, mptr);
            return;
        }
        throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.EXTRA_SAMPLES_ARE_NOT_SUPPORTED);
    }

    private static long[] getArrayLongShort(TIFFDirectory dir, int tag) {
        TIFFField field = dir.getField(tag);
        if (field == null) {
            return null;
        }
        if (field.getType() == 4) {
            return field.getAsLongs();
        }
        char[] temp = field.getAsChars();
        long[] offset = new long[temp.length];
        for (int k = 0; k < temp.length; k++) {
            offset[k] = temp[k];
        }
        return offset;
    }

    private static void decodePackbits(byte[] data, byte[] dst) {
        int srcCount = 0;
        int dstCount = 0;
        while (dstCount < dst.length) {
            try {
                int srcCount2 = srcCount + 1;
                try {
                    byte b = data[srcCount];
                    if (b >= 0 && b <= Byte.MAX_VALUE) {
                        int i = 0;
                        while (i < b + 1) {
                            int dstCount2 = dstCount + 1;
                            int srcCount3 = srcCount2 + 1;
                            try {
                                dst[dstCount] = data[srcCount2];
                                i++;
                                dstCount = dstCount2;
                                srcCount2 = srcCount3;
                            } catch (Exception e) {
                                return;
                            }
                        }
                        srcCount = srcCount2;
                    } else if ((b & ByteCompanionObject.MIN_VALUE) == 0 || b == Byte.MIN_VALUE) {
                        srcCount = srcCount2 + 1;
                    } else {
                        int srcCount4 = srcCount2 + 1;
                        try {
                            byte repeat = data[srcCount2];
                            int i2 = 0;
                            while (i2 < ((~b) & 255) + 2) {
                                int dstCount3 = dstCount + 1;
                                try {
                                    dst[dstCount] = repeat;
                                    i2++;
                                    dstCount = dstCount3;
                                } catch (Exception e2) {
                                    return;
                                }
                            }
                            srcCount = srcCount4;
                        } catch (Exception e3) {
                            return;
                        }
                    }
                } catch (Exception e4) {
                    return;
                }
            } catch (Exception e5) {
                return;
            }
        }
    }

    private static void applyPredictor(byte[] uncompData, int predictor, int w, int h, int samplesPerPixel) {
        if (predictor != 2) {
            return;
        }
        for (int j = 0; j < h; j++) {
            int count = ((j * w) + 1) * samplesPerPixel;
            for (int i = samplesPerPixel; i < w * samplesPerPixel; i++) {
                uncompData[count] = (byte) (uncompData[count] + uncompData[count - samplesPerPixel]);
                count++;
            }
        }
    }
}
