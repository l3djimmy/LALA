package com.itextpdf.layout.element;

import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties;
import com.itextpdf.kernel.pdf.tagutils.DefaultAccessibilityProperties;
import com.itextpdf.layout.properties.ListNumberingType;
import com.itextpdf.layout.properties.ListSymbolPosition;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.renderer.IRenderer;
import com.itextpdf.layout.renderer.ListItemRenderer;
/* loaded from: classes12.dex */
public class ListItem extends Div {
    public ListItem() {
    }

    public ListItem(String text) {
        this();
        add(new Paragraph(text).setMarginTop(0.0f).setMarginBottom(0.0f));
    }

    public ListItem setListSymbolOrdinalValue(int ordinalValue) {
        setProperty(120, Integer.valueOf(ordinalValue));
        return this;
    }

    public ListItem(Image image) {
        this();
        add(image);
    }

    @Override // com.itextpdf.layout.element.BlockElement, com.itextpdf.layout.ElementPropertyContainer, com.itextpdf.layout.IPropertyContainer
    public <T1> T1 getDefaultProperty(int property) {
        switch (property) {
            case Property.LIST_SYMBOL_POSITION /* 83 */:
                return (T1) ListSymbolPosition.DEFAULT;
            default:
                return (T1) super.getDefaultProperty(property);
        }
    }

    public ListItem setListSymbol(String symbol) {
        return setListSymbol(new Text(symbol));
    }

    public ListItem setListSymbol(Text text) {
        setProperty(37, text);
        return this;
    }

    public ListItem setListSymbol(Image image) {
        setProperty(37, image);
        return this;
    }

    public ListItem setListSymbol(ListNumberingType listNumberingType) {
        if (listNumberingType == ListNumberingType.ZAPF_DINGBATS_1 || listNumberingType == ListNumberingType.ZAPF_DINGBATS_2 || listNumberingType == ListNumberingType.ZAPF_DINGBATS_3 || listNumberingType == ListNumberingType.ZAPF_DINGBATS_4) {
            setProperty(42, " ");
        }
        setProperty(37, listNumberingType);
        return this;
    }

    @Override // com.itextpdf.layout.element.Div, com.itextpdf.layout.tagging.IAccessibleElement
    public AccessibilityProperties getAccessibilityProperties() {
        if (this.tagProperties == null) {
            this.tagProperties = new DefaultAccessibilityProperties(StandardRoles.LBODY);
        }
        return this.tagProperties;
    }

    @Override // com.itextpdf.layout.element.Div, com.itextpdf.layout.element.AbstractElement
    protected IRenderer makeNewRenderer() {
        return new ListItemRenderer(this);
    }
}
