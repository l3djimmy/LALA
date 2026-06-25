package com.itextpdf.layout.element;

import com.itextpdf.kernel.pdf.action.PdfAction;
import com.itextpdf.layout.ElementPropertyContainer;
import com.itextpdf.layout.Style;
import com.itextpdf.layout.element.IElement;
import com.itextpdf.layout.renderer.IRenderer;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Set;
/* loaded from: classes12.dex */
public abstract class AbstractElement<T extends IElement> extends ElementPropertyContainer<T> implements IAbstractElement {
    protected java.util.List<IElement> childElements = new ArrayList();
    protected IRenderer nextRenderer;
    protected Set<Style> styles;

    protected abstract IRenderer makeNewRenderer();

    @Override // com.itextpdf.layout.element.IElement
    public IRenderer getRenderer() {
        if (this.nextRenderer != null) {
            IRenderer renderer = this.nextRenderer;
            this.nextRenderer = this.nextRenderer.getNextRenderer();
            return renderer;
        }
        IRenderer renderer2 = makeNewRenderer();
        return renderer2;
    }

    @Override // com.itextpdf.layout.element.IElement
    public void setNextRenderer(IRenderer renderer) {
        this.nextRenderer = renderer;
    }

    @Override // com.itextpdf.layout.element.IElement
    public IRenderer createRendererSubTree() {
        IRenderer rendererRoot = getRenderer();
        for (IElement child : this.childElements) {
            rendererRoot.addChild(child.createRendererSubTree());
        }
        return rendererRoot;
    }

    @Override // com.itextpdf.layout.ElementPropertyContainer, com.itextpdf.layout.IPropertyContainer
    public boolean hasProperty(int property) {
        boolean hasProperty = super.hasProperty(property);
        if (this.styles != null && this.styles.size() > 0 && !hasProperty) {
            for (Style style : this.styles) {
                if (style.hasProperty(property)) {
                    return true;
                }
            }
            return hasProperty;
        }
        return hasProperty;
    }

    @Override // com.itextpdf.layout.ElementPropertyContainer, com.itextpdf.layout.IPropertyContainer
    public <T1> T1 getProperty(int property) {
        Object result = (T1) super.getProperty(property);
        if (this.styles != null && this.styles.size() > 0 && result == null && !super.hasProperty(property)) {
            for (Style style : this.styles) {
                Object result2 = style.getProperty(property);
                if (result2 != null || style.hasProperty(property)) {
                    result = (T1) result2;
                }
            }
        }
        return (T1) result;
    }

    public T addStyle(Style style) {
        if (style == null) {
            throw new IllegalArgumentException("Style can not be null.");
        }
        if (this.styles == null) {
            this.styles = new LinkedHashSet();
        }
        this.styles.add(style);
        return this;
    }

    @Override // com.itextpdf.layout.element.IAbstractElement
    public java.util.List<IElement> getChildren() {
        return this.childElements;
    }

    public boolean isEmpty() {
        return this.childElements.size() == 0;
    }

    public T setAction(PdfAction action) {
        setProperty(1, action);
        return this;
    }

    public T setPageNumber(int pageNumber) {
        setProperty(51, Integer.valueOf(pageNumber));
        return this;
    }
}
