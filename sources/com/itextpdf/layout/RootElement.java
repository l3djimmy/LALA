package com.itextpdf.layout;

import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.IsoKey;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import com.itextpdf.layout.IPropertyContainer;
import com.itextpdf.layout.element.Div;
import com.itextpdf.layout.element.IBlockElement;
import com.itextpdf.layout.element.IElement;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.font.FontProvider;
import com.itextpdf.layout.properties.FontKerning;
import com.itextpdf.layout.properties.HorizontalAlignment;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.UnitValue;
import com.itextpdf.layout.properties.VerticalAlignment;
import com.itextpdf.layout.renderer.IRenderer;
import com.itextpdf.layout.renderer.RootRenderer;
import com.itextpdf.layout.splitting.DefaultSplitCharacters;
import com.itextpdf.layout.splitting.ISplitCharacters;
import com.itextpdf.layout.tagging.LayoutTaggingHelper;
import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes12.dex */
public abstract class RootElement<T extends IPropertyContainer> extends ElementPropertyContainer<T> implements Closeable {
    protected PdfFont defaultFont;
    protected FontProvider defaultFontProvider;
    private LayoutTaggingHelper defaultLayoutTaggingHelper;
    protected ISplitCharacters defaultSplitCharacters;
    protected PdfDocument pdfDocument;
    protected RootRenderer rootRenderer;
    protected boolean immediateFlush = true;
    protected List<IElement> childElements = new ArrayList();

    protected abstract RootRenderer ensureRootRendererNotNull();

    public T add(IBlockElement element) {
        return addElement(element);
    }

    public T add(Image image) {
        return addElement(image);
    }

    public FontProvider getFontProvider() {
        Object fontProvider = getProperty(91);
        if (fontProvider instanceof FontProvider) {
            return (FontProvider) fontProvider;
        }
        return null;
    }

    public void setFontProvider(FontProvider fontProvider) {
        setProperty(91, fontProvider);
    }

    @Override // com.itextpdf.layout.ElementPropertyContainer, com.itextpdf.layout.IPropertyContainer
    public boolean hasProperty(int property) {
        return hasOwnProperty(property);
    }

    @Override // com.itextpdf.layout.ElementPropertyContainer, com.itextpdf.layout.IPropertyContainer
    public boolean hasOwnProperty(int property) {
        return this.properties.containsKey(Integer.valueOf(property));
    }

    @Override // com.itextpdf.layout.ElementPropertyContainer, com.itextpdf.layout.IPropertyContainer
    public <T1> T1 getProperty(int property) {
        return (T1) getOwnProperty(property);
    }

    @Override // com.itextpdf.layout.ElementPropertyContainer, com.itextpdf.layout.IPropertyContainer
    public <T1> T1 getOwnProperty(int property) {
        return (T1) this.properties.get(Integer.valueOf(property));
    }

    @Override // com.itextpdf.layout.ElementPropertyContainer, com.itextpdf.layout.IPropertyContainer
    public <T1> T1 getDefaultProperty(int property) {
        try {
            switch (property) {
                case 20:
                    if (this.defaultFont == null) {
                        this.defaultFont = PdfFontFactory.createFont();
                    }
                    return (T1) this.defaultFont;
                case 24:
                    return (T1) UnitValue.createPointValue(12.0f);
                case 61:
                    return (T1) Float.valueOf(0.75f);
                case 62:
                    if (this.defaultSplitCharacters == null) {
                        this.defaultSplitCharacters = new DefaultSplitCharacters();
                    }
                    return (T1) this.defaultSplitCharacters;
                case Property.TEXT_RENDERING_MODE /* 71 */:
                    return (T1) 0;
                case Property.TEXT_RISE /* 72 */:
                    return (T1) Float.valueOf(0.0f);
                case Property.FONT_PROVIDER /* 91 */:
                    if (this.defaultFontProvider == null) {
                        this.defaultFontProvider = new FontProvider();
                    }
                    return (T1) this.defaultFontProvider;
                case 108:
                    return (T1) initTaggingHelperIfNeeded();
                default:
                    return null;
            }
        } catch (IOException exc) {
            throw new RuntimeException(exc.toString(), exc);
        }
    }

    @Override // com.itextpdf.layout.ElementPropertyContainer, com.itextpdf.layout.IPropertyContainer
    public void deleteOwnProperty(int property) {
        this.properties.remove(Integer.valueOf(property));
    }

    @Override // com.itextpdf.layout.ElementPropertyContainer, com.itextpdf.layout.IPropertyContainer
    public void setProperty(int property, Object value) {
        this.properties.put(Integer.valueOf(property), value);
    }

    public RootRenderer getRenderer() {
        return ensureRootRendererNotNull();
    }

    public T showTextAligned(String text, float x, float y, TextAlignment textAlign) {
        return showTextAligned(text, x, y, textAlign, 0.0f);
    }

    public T showTextAligned(String text, float x, float y, TextAlignment textAlign, float angle) {
        return showTextAligned(text, x, y, textAlign, VerticalAlignment.BOTTOM, angle);
    }

    public T showTextAligned(String text, float x, float y, TextAlignment textAlign, VerticalAlignment vertAlign, float angle) {
        Paragraph p = new Paragraph(text).setMultipliedLeading(1.0f).setMargin(0.0f);
        return showTextAligned(p, x, y, this.pdfDocument.getNumberOfPages(), textAlign, vertAlign, angle);
    }

    public T showTextAlignedKerned(String text, float x, float y, TextAlignment textAlign, VerticalAlignment vertAlign, float radAngle) {
        Paragraph p = (Paragraph) new Paragraph(text).setMultipliedLeading(1.0f).setMargin(0.0f).setFontKerning(FontKerning.YES);
        return showTextAligned(p, x, y, this.pdfDocument.getNumberOfPages(), textAlign, vertAlign, radAngle);
    }

    public T showTextAligned(Paragraph p, float x, float y, TextAlignment textAlign) {
        return showTextAligned(p, x, y, this.pdfDocument.getNumberOfPages(), textAlign, VerticalAlignment.BOTTOM, 0.0f);
    }

    public T showTextAligned(Paragraph p, float x, float y, TextAlignment textAlign, VerticalAlignment vertAlign) {
        return showTextAligned(p, x, y, this.pdfDocument.getNumberOfPages(), textAlign, vertAlign, 0.0f);
    }

    public T showTextAligned(Paragraph p, float x, float y, int pageNumber, TextAlignment textAlign, VerticalAlignment vertAlign, float radAngle) {
        Div div = new Div();
        ((Div) div.setTextAlignment(textAlign)).setVerticalAlignment(vertAlign);
        if (radAngle != 0.0f) {
            div.setRotationAngle(radAngle);
        }
        div.setProperty(58, Float.valueOf(x));
        div.setProperty(59, Float.valueOf(y));
        float divX = x;
        float divY = y;
        if (textAlign == TextAlignment.CENTER) {
            divX = x - (5000.0f / 2.0f);
            p.setHorizontalAlignment(HorizontalAlignment.CENTER);
        } else if (textAlign == TextAlignment.RIGHT) {
            divX = x - 5000.0f;
            p.setHorizontalAlignment(HorizontalAlignment.RIGHT);
        }
        if (vertAlign == VerticalAlignment.MIDDLE) {
            divY = y - (5000.0f / 2.0f);
        } else if (vertAlign == VerticalAlignment.TOP) {
            divY = y - 5000.0f;
        }
        if (pageNumber == 0) {
            pageNumber = 1;
        }
        ((Div) div.setFixedPosition(pageNumber, divX, divY, 5000.0f)).setMinHeight(5000.0f);
        if (p.getProperty(33) == null) {
            p.setMultipliedLeading(1.0f);
        }
        div.add(p.setMargins(0.0f, 0.0f, 0.0f, 0.0f));
        div.getAccessibilityProperties().setRole(StandardRoles.ARTIFACT);
        add(div);
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void createAndAddRendererSubTree(IElement element) {
        IRenderer rendererSubTreeRoot = element.createRendererSubTree();
        LayoutTaggingHelper taggingHelper = initTaggingHelperIfNeeded();
        if (taggingHelper != null) {
            taggingHelper.addKidsHint(this.pdfDocument.getTagStructureContext().getAutoTaggingPointer(), Collections.singletonList(rendererSubTreeRoot));
        }
        ensureRootRendererNotNull().addChild(rendererSubTreeRoot);
        traverseAndCallIso(this.pdfDocument, rendererSubTreeRoot);
    }

    private LayoutTaggingHelper initTaggingHelperIfNeeded() {
        if (this.defaultLayoutTaggingHelper == null && this.pdfDocument.isTagged()) {
            LayoutTaggingHelper layoutTaggingHelper = new LayoutTaggingHelper(this.pdfDocument, this.immediateFlush);
            this.defaultLayoutTaggingHelper = layoutTaggingHelper;
            return layoutTaggingHelper;
        }
        return this.defaultLayoutTaggingHelper;
    }

    private T addElement(IElement element) {
        this.childElements.add(element);
        createAndAddRendererSubTree(element);
        if (this.immediateFlush) {
            this.childElements.remove(this.childElements.size() - 1);
        }
        return this;
    }

    private static void traverseAndCallIso(PdfDocument pdfDocument, IRenderer renderer) {
        if (renderer == null) {
            return;
        }
        pdfDocument.checkIsoConformance(renderer, IsoKey.LAYOUT);
        List<IRenderer> renderers = renderer.getChildRenderers();
        if (renderers == null) {
            return;
        }
        for (IRenderer childRenderer : renderers) {
            traverseAndCallIso(pdfDocument, childRenderer);
        }
    }
}
