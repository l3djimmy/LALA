package com.itextpdf.layout.properties;

import com.itextpdf.kernel.colors.gradients.AbstractLinearGradientBuilder;
import com.itextpdf.kernel.pdf.xobject.PdfFormXObject;
import com.itextpdf.kernel.pdf.xobject.PdfImageXObject;
import com.itextpdf.kernel.pdf.xobject.PdfXObject;
import com.itextpdf.layout.properties.BackgroundRepeat;
/* loaded from: classes12.dex */
public class BackgroundImage {
    private static final BlendMode DEFAULT_BLEND_MODE = BlendMode.NORMAL;
    private final BackgroundBox backgroundClip;
    private final BackgroundBox backgroundOrigin;
    private final BackgroundSize backgroundSize;
    private BlendMode blendMode;
    protected PdfXObject image;
    protected AbstractLinearGradientBuilder linearGradientBuilder;
    private final BackgroundPosition position;
    private final BackgroundRepeat repeat;

    public BackgroundImage(BackgroundImage backgroundImage) {
        this(backgroundImage.getImage() == null ? backgroundImage.getForm() : backgroundImage.getImage(), backgroundImage.getRepeat(), backgroundImage.getBackgroundPosition(), backgroundImage.getBackgroundSize(), backgroundImage.getLinearGradientBuilder(), backgroundImage.getBlendMode(), backgroundImage.getBackgroundClip(), backgroundImage.getBackgroundOrigin());
    }

    public PdfImageXObject getImage() {
        if (this.image instanceof PdfImageXObject) {
            return (PdfImageXObject) this.image;
        }
        return null;
    }

    public PdfFormXObject getForm() {
        if (this.image instanceof PdfFormXObject) {
            return (PdfFormXObject) this.image;
        }
        return null;
    }

    private BackgroundImage(PdfXObject image, BackgroundRepeat repeat, BackgroundPosition position, BackgroundSize backgroundSize, AbstractLinearGradientBuilder linearGradientBuilder, BlendMode blendMode, BackgroundBox clip, BackgroundBox origin) {
        this.blendMode = DEFAULT_BLEND_MODE;
        this.image = image;
        this.repeat = repeat;
        this.position = position;
        this.backgroundSize = backgroundSize;
        this.linearGradientBuilder = linearGradientBuilder;
        if (blendMode != null) {
            this.blendMode = blendMode;
        }
        this.backgroundClip = clip;
        this.backgroundOrigin = origin;
    }

    public BackgroundPosition getBackgroundPosition() {
        return this.position;
    }

    public AbstractLinearGradientBuilder getLinearGradientBuilder() {
        return this.linearGradientBuilder;
    }

    public boolean isBackgroundSpecified() {
        return (this.image instanceof PdfFormXObject) || (this.image instanceof PdfImageXObject) || this.linearGradientBuilder != null;
    }

    public BackgroundSize getBackgroundSize() {
        return this.backgroundSize;
    }

    public float getImageWidth() {
        return this.image.getWidth();
    }

    public float getImageHeight() {
        return this.image.getHeight();
    }

    public BackgroundRepeat getRepeat() {
        return this.repeat;
    }

    public BlendMode getBlendMode() {
        return this.blendMode;
    }

    public BackgroundBox getBackgroundClip() {
        return this.backgroundClip;
    }

    public BackgroundBox getBackgroundOrigin() {
        return this.backgroundOrigin;
    }

    /* loaded from: classes12.dex */
    public static class Builder {
        private PdfXObject image;
        private AbstractLinearGradientBuilder linearGradientBuilder;
        private BackgroundPosition position = new BackgroundPosition();
        private BackgroundRepeat repeat = new BackgroundRepeat();
        private BlendMode blendMode = BackgroundImage.DEFAULT_BLEND_MODE;
        private BackgroundSize backgroundSize = new BackgroundSize();
        private BackgroundBox clip = BackgroundBox.BORDER_BOX;
        private BackgroundBox origin = BackgroundBox.PADDING_BOX;

        public Builder setImage(PdfXObject image) {
            this.image = image;
            this.linearGradientBuilder = null;
            return this;
        }

        public Builder setLinearGradientBuilder(AbstractLinearGradientBuilder linearGradientBuilder) {
            this.linearGradientBuilder = linearGradientBuilder;
            this.repeat = new BackgroundRepeat(BackgroundRepeat.BackgroundRepeatValue.NO_REPEAT);
            this.image = null;
            return this;
        }

        public Builder setBackgroundRepeat(BackgroundRepeat repeat) {
            this.repeat = repeat;
            return this;
        }

        public Builder setBackgroundPosition(BackgroundPosition position) {
            this.position = position;
            return this;
        }

        public Builder setBackgroundBlendMode(BlendMode blendMode) {
            if (blendMode != null) {
                this.blendMode = blendMode;
            }
            return this;
        }

        public Builder setBackgroundSize(BackgroundSize backgroundSize) {
            if (backgroundSize != null) {
                this.backgroundSize = backgroundSize;
            }
            return this;
        }

        public Builder setBackgroundClip(BackgroundBox clip) {
            this.clip = clip;
            return this;
        }

        public Builder setBackgroundOrigin(BackgroundBox origin) {
            this.origin = origin;
            return this;
        }

        public BackgroundImage build() {
            return new BackgroundImage(this.image, this.repeat, this.position, this.backgroundSize, this.linearGradientBuilder, this.blendMode, this.clip, this.origin);
        }
    }
}
