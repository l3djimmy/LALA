package com.itextpdf.io.image;

import com.itextpdf.io.colors.IccProfile;
import com.itextpdf.io.exceptions.IOException;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.source.ByteArrayOutputStream;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import com.itextpdf.io.source.RandomAccessSourceFactory;
import com.itextpdf.io.util.StreamUtil;
import java.net.URL;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public abstract class ImageData {
    private static long serialId = 0;
    private static final Object staticLock = new Object();
    protected byte[] data;
    protected float[] decode;
    protected Map<String, Object> decodeParms;
    protected boolean deflated;
    protected String filter;
    protected float height;
    protected Map<String, Object> imageAttributes;
    protected ImageData imageMask;
    protected int imageSize;
    protected boolean interpolation;
    protected ImageType originalType;
    protected IccProfile profile;
    protected float rotation;
    protected int[] transparency;
    protected URL url;
    protected float width;
    protected int bpc = 1;
    protected int colorEncodingComponentsNumber = -1;
    protected boolean inverted = false;
    protected int dpiX = 0;
    protected int dpiY = 0;
    protected int colorTransform = 1;
    protected boolean mask = false;
    protected float XYRatio = 0.0f;
    protected Long mySerialId = getSerialId();

    /* JADX INFO: Access modifiers changed from: protected */
    public ImageData(URL url, ImageType type) {
        this.url = url;
        this.originalType = type;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ImageData(byte[] bytes, ImageType type) {
        this.data = bytes;
        this.originalType = type;
    }

    public boolean isRawImage() {
        return false;
    }

    public URL getUrl() {
        return this.url;
    }

    public void setUrl(URL url) {
        this.url = url;
    }

    public int[] getTransparency() {
        return this.transparency;
    }

    public void setTransparency(int[] transparency) {
        this.transparency = transparency;
    }

    public boolean isInverted() {
        return this.inverted;
    }

    public void setInverted(boolean inverted) {
        this.inverted = inverted;
    }

    public float getRotation() {
        return this.rotation;
    }

    public void setRotation(float rotation) {
        this.rotation = rotation;
    }

    public IccProfile getProfile() {
        return this.profile;
    }

    public void setProfile(IccProfile profile) {
        this.profile = profile;
    }

    public int getDpiX() {
        return this.dpiX;
    }

    public int getDpiY() {
        return this.dpiY;
    }

    public void setDpi(int dpiX, int dpiY) {
        this.dpiX = dpiX;
        this.dpiY = dpiY;
    }

    public int getColorTransform() {
        return this.colorTransform;
    }

    public void setColorTransform(int colorTransform) {
        this.colorTransform = colorTransform;
    }

    public boolean isDeflated() {
        return this.deflated;
    }

    public void setDeflated(boolean deflated) {
        this.deflated = deflated;
    }

    public ImageType getOriginalType() {
        return this.originalType;
    }

    public int getColorEncodingComponentsNumber() {
        return this.colorEncodingComponentsNumber;
    }

    public void setColorEncodingComponentsNumber(int colorEncodingComponentsNumber) {
        this.colorEncodingComponentsNumber = colorEncodingComponentsNumber;
    }

    public byte[] getData() {
        return this.data;
    }

    public boolean canBeMask() {
        return (isRawImage() && this.bpc > 255) || this.colorEncodingComponentsNumber == 1;
    }

    public boolean isMask() {
        return this.mask;
    }

    public ImageData getImageMask() {
        return this.imageMask;
    }

    public void setImageMask(ImageData imageMask) {
        if (this.mask) {
            throw new IOException(IoExceptionMessageConstant.IMAGE_MASK_CANNOT_CONTAIN_ANOTHER_IMAGE_MASK);
        }
        if (!imageMask.mask) {
            throw new IOException(IoExceptionMessageConstant.IMAGE_IS_NOT_A_MASK_YOU_MUST_CALL_IMAGE_DATA_MAKE_MASK);
        }
        this.imageMask = imageMask;
    }

    public boolean isSoftMask() {
        return this.mask && this.bpc > 1 && this.bpc <= 8;
    }

    public void makeMask() {
        if (!canBeMask()) {
            throw new IOException(IoExceptionMessageConstant.THIS_IMAGE_CAN_NOT_BE_AN_IMAGE_MASK);
        }
        this.mask = true;
    }

    public float getWidth() {
        return this.width;
    }

    public void setWidth(float width) {
        this.width = width;
    }

    public float getHeight() {
        return this.height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public int getBpc() {
        return this.bpc;
    }

    public void setBpc(int bpc) {
        this.bpc = bpc;
    }

    public boolean isInterpolation() {
        return this.interpolation;
    }

    public void setInterpolation(boolean interpolation) {
        this.interpolation = interpolation;
    }

    public float getXYRatio() {
        return this.XYRatio;
    }

    public void setXYRatio(float XYRatio) {
        this.XYRatio = XYRatio;
    }

    public Map<String, Object> getImageAttributes() {
        return this.imageAttributes;
    }

    public void setImageAttributes(Map<String, Object> imageAttributes) {
        this.imageAttributes = imageAttributes;
    }

    public String getFilter() {
        return this.filter;
    }

    public void setFilter(String filter) {
        this.filter = filter;
    }

    public Map<String, Object> getDecodeParms() {
        return this.decodeParms;
    }

    public float[] getDecode() {
        return this.decode;
    }

    public void setDecode(float[] decode) {
        this.decode = decode;
    }

    public boolean canImageBeInline() {
        Logger logger = LoggerFactory.getLogger(ImageData.class);
        if (this.imageSize > 4096) {
            logger.warn(IoLogMessageConstant.IMAGE_SIZE_CANNOT_BE_MORE_4KB);
            return false;
        } else if (this.imageMask != null) {
            logger.warn(IoLogMessageConstant.IMAGE_HAS_MASK);
            return false;
        } else {
            return true;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void loadData() throws java.io.IOException {
        RandomAccessFileOrArray raf = new RandomAccessFileOrArray(new RandomAccessSourceFactory().createSource(this.url));
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        StreamUtil.transferBytes(raf, stream);
        raf.close();
        this.data = stream.toByteArray();
    }

    private static Long getSerialId() {
        Long valueOf;
        synchronized (staticLock) {
            long j = serialId + 1;
            serialId = j;
            valueOf = Long.valueOf(j);
        }
        return valueOf;
    }
}
