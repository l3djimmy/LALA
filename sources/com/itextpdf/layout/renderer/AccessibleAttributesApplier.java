package com.itextpdf.layout.renderer;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.tagging.PdfNamespace;
import com.itextpdf.kernel.pdf.tagging.PdfStructureAttributes;
import com.itextpdf.kernel.pdf.tagging.StandardNamespaces;
import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import com.itextpdf.kernel.pdf.tagutils.IRoleMappingResolver;
import com.itextpdf.kernel.pdf.tagutils.TagStructureContext;
import com.itextpdf.kernel.pdf.tagutils.TagTreePointer;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.Background;
import com.itextpdf.layout.properties.HorizontalAlignment;
import com.itextpdf.layout.properties.IListSymbolFactory;
import com.itextpdf.layout.properties.ListNumberingType;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.TransparentColor;
import com.itextpdf.layout.properties.Underline;
import com.itextpdf.layout.properties.UnitValue;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class AccessibleAttributesApplier {
    public static PdfStructureAttributes getLayoutAttributes(AbstractRenderer renderer, TagTreePointer taggingPointer) {
        IRoleMappingResolver resolvedMapping = resolveMappingToStandard(taggingPointer);
        if (resolvedMapping == null) {
            return null;
        }
        String role = resolvedMapping.getRole();
        int tagType = AccessibleTypes.identifyType(role);
        PdfDictionary attributes = new PdfDictionary();
        attributes.put(PdfName.O, PdfName.Layout);
        applyCommonLayoutAttributes(renderer, attributes);
        if (tagType == AccessibleTypes.BlockLevel) {
            applyBlockLevelLayoutAttributes(role, renderer, attributes);
        }
        if (tagType == AccessibleTypes.InlineLevel) {
            applyInlineLevelLayoutAttributes(renderer, attributes);
        }
        if (tagType == AccessibleTypes.Illustration) {
            applyIllustrationLayoutAttributes(renderer, attributes);
        }
        if (attributes.size() > 1) {
            return new PdfStructureAttributes(attributes);
        }
        return null;
    }

    public static PdfStructureAttributes getListAttributes(AbstractRenderer renderer, TagTreePointer taggingPointer) {
        IRoleMappingResolver resolvedMapping = resolveMappingToStandard(taggingPointer);
        if (resolvedMapping == null || !StandardRoles.L.equals(resolvedMapping.getRole())) {
            return null;
        }
        PdfDictionary attributes = new PdfDictionary();
        attributes.put(PdfName.O, PdfName.List);
        Object listSymbol = renderer.getProperty(37);
        boolean tagStructurePdf2 = isTagStructurePdf2(resolvedMapping.getNamespace());
        if (listSymbol instanceof ListNumberingType) {
            ListNumberingType numberingType = (ListNumberingType) listSymbol;
            attributes.put(PdfName.ListNumbering, transformNumberingTypeToName(numberingType, tagStructurePdf2));
        } else if (tagStructurePdf2) {
            if (listSymbol instanceof IListSymbolFactory) {
                attributes.put(PdfName.ListNumbering, PdfName.Ordered);
            } else {
                attributes.put(PdfName.ListNumbering, PdfName.Unordered);
            }
        }
        if (attributes.size() > 1) {
            return new PdfStructureAttributes(attributes);
        }
        return null;
    }

    public static PdfStructureAttributes getTableAttributes(AbstractRenderer renderer, TagTreePointer taggingPointer) {
        IRoleMappingResolver resolvedMapping = resolveMappingToStandard(taggingPointer);
        if (resolvedMapping == null || (!StandardRoles.TD.equals(resolvedMapping.getRole()) && !StandardRoles.TH.equals(resolvedMapping.getRole()))) {
            return null;
        }
        PdfDictionary attributes = new PdfDictionary();
        attributes.put(PdfName.O, PdfName.Table);
        if (renderer.getModelElement() instanceof Cell) {
            Cell cell = (Cell) renderer.getModelElement();
            if (cell.getRowspan() != 1) {
                attributes.put(PdfName.RowSpan, new PdfNumber(cell.getRowspan()));
            }
            if (cell.getColspan() != 1) {
                attributes.put(PdfName.ColSpan, new PdfNumber(cell.getColspan()));
            }
        }
        if (attributes.size() > 1) {
            return new PdfStructureAttributes(attributes);
        }
        return null;
    }

    private static void applyCommonLayoutAttributes(AbstractRenderer renderer, PdfDictionary attributes) {
        Background background = (Background) renderer.getProperty(6);
        if (background != null && (background.getColor() instanceof DeviceRgb)) {
            attributes.put(PdfName.BackgroundColor, new PdfArray(background.getColor().getColorValue()));
        }
        if (!(renderer.getModelElement() instanceof Cell)) {
            applyBorderAttributes(renderer, attributes);
        }
        applyPaddingAttribute(renderer, attributes);
        TransparentColor transparentColor = renderer.getPropertyAsTransparentColor(21);
        if (transparentColor != null && (transparentColor.getColor() instanceof DeviceRgb)) {
            attributes.put(PdfName.Color, new PdfArray(transparentColor.getColor().getColorValue()));
        }
    }

    private static void applyBlockLevelLayoutAttributes(String role, AbstractRenderer renderer, PdfDictionary attributes) {
        int i;
        int i2;
        char c;
        int i3;
        UnitValue[] margins = {renderer.getPropertyAsUnitValue(46), renderer.getPropertyAsUnitValue(43), renderer.getPropertyAsUnitValue(44), renderer.getPropertyAsUnitValue(45)};
        int[] marginsOrder = {0, 1, 2, 3};
        UnitValue spaceBefore = margins[marginsOrder[0]];
        if (spaceBefore == null) {
            i = 43;
            i2 = 44;
            c = 1;
            i3 = 45;
        } else {
            if (!spaceBefore.isPointValue()) {
                Logger logger = LoggerFactory.getLogger(AccessibleAttributesApplier.class);
                i = 43;
                logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 46));
            } else {
                i = 43;
            }
            if (0.0f != spaceBefore.getValue()) {
                i2 = 44;
                c = 1;
                i3 = 45;
                attributes.put(PdfName.SpaceBefore, new PdfNumber(spaceBefore.getValue()));
            } else {
                i2 = 44;
                c = 1;
                i3 = 45;
            }
        }
        UnitValue spaceAfter = margins[marginsOrder[c]];
        if (spaceAfter != null) {
            if (!spaceAfter.isPointValue()) {
                Logger logger2 = LoggerFactory.getLogger(AccessibleAttributesApplier.class);
                logger2.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, Integer.valueOf(i)));
            }
            if (0.0f != spaceAfter.getValue()) {
                attributes.put(PdfName.SpaceAfter, new PdfNumber(spaceAfter.getValue()));
            }
        }
        UnitValue startIndent = margins[marginsOrder[2]];
        if (startIndent != null) {
            if (!startIndent.isPointValue()) {
                Logger logger3 = LoggerFactory.getLogger(AccessibleAttributesApplier.class);
                logger3.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, Integer.valueOf(i2)));
            }
            if (0.0f != startIndent.getValue()) {
                attributes.put(PdfName.StartIndent, new PdfNumber(startIndent.getValue()));
            }
        }
        UnitValue endIndent = margins[marginsOrder[3]];
        if (endIndent != null) {
            if (!endIndent.isPointValue()) {
                Logger logger4 = LoggerFactory.getLogger(AccessibleAttributesApplier.class);
                logger4.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, Integer.valueOf(i3)));
            }
            if (0.0f != endIndent.getValue()) {
                attributes.put(PdfName.EndIndent, new PdfNumber(endIndent.getValue()));
            }
        }
        Float firstLineIndent = renderer.getPropertyAsFloat(18);
        if (firstLineIndent != null && firstLineIndent.floatValue() != 0.0f) {
            attributes.put(PdfName.TextIndent, new PdfNumber(firstLineIndent.floatValue()));
        }
        TextAlignment textAlignment = (TextAlignment) renderer.getProperty(70);
        if (textAlignment != null && !StandardRoles.TH.equals(role) && !StandardRoles.TD.equals(role)) {
            attributes.put(PdfName.TextAlign, transformTextAlignmentValueToName(textAlignment));
        }
        if (renderer.isLastRendererForModelElement) {
            Rectangle bbox = renderer.getOccupiedArea().getBBox();
            attributes.put(PdfName.BBox, new PdfArray(bbox));
        }
        if (StandardRoles.TH.equals(role) || StandardRoles.TD.equals(role) || StandardRoles.TABLE.equals(role)) {
            if (!(renderer instanceof TableRenderer) || ((Table) renderer.getModelElement()).isComplete()) {
                UnitValue width = (UnitValue) renderer.getProperty(77);
                if (width != null && width.isPointValue()) {
                    attributes.put(PdfName.Width, new PdfNumber(width.getValue()));
                }
            }
            UnitValue height = (UnitValue) renderer.getProperty(27);
            if (height != null && height.isPointValue()) {
                attributes.put(PdfName.Height, new PdfNumber(height.getValue()));
            }
        }
        if (StandardRoles.TH.equals(role) || StandardRoles.TD.equals(role)) {
            HorizontalAlignment horizontalAlignment = (HorizontalAlignment) renderer.getProperty(28);
            if (horizontalAlignment != null) {
                attributes.put(PdfName.BlockAlign, transformBlockAlignToName(horizontalAlignment));
            }
            if (textAlignment != null && textAlignment != TextAlignment.JUSTIFIED && textAlignment != TextAlignment.JUSTIFIED_ALL) {
                attributes.put(PdfName.InlineAlign, transformTextAlignmentValueToName(textAlignment));
            }
        }
    }

    private static void applyInlineLevelLayoutAttributes(AbstractRenderer renderer, PdfDictionary attributes) {
        Float textRise = renderer.getPropertyAsFloat(72);
        if (textRise != null && textRise.floatValue() != 0.0f) {
            attributes.put(PdfName.BaselineShift, new PdfNumber(textRise.floatValue()));
        }
        Object underlines = renderer.getProperty(74);
        if (underlines != null) {
            UnitValue fontSize = renderer.getPropertyAsUnitValue(24);
            if (!fontSize.isPointValue()) {
                Logger logger = LoggerFactory.getLogger(AccessibleAttributesApplier.class);
                logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 24));
            }
            Underline underline = null;
            if ((underlines instanceof List) && ((List) underlines).size() > 0 && (((List) underlines).get(0) instanceof Underline)) {
                underline = (Underline) ((List) underlines).get(0);
            } else if (underlines instanceof Underline) {
                underline = (Underline) underlines;
            }
            if (underline != null) {
                attributes.put(PdfName.TextDecorationType, underline.getYPosition(fontSize.getValue()) > 0.0f ? PdfName.LineThrough : PdfName.Underline);
                if (underline.getColor() instanceof DeviceRgb) {
                    attributes.put(PdfName.TextDecorationColor, new PdfArray(underline.getColor().getColorValue()));
                }
                attributes.put(PdfName.TextDecorationThickness, new PdfNumber(underline.getThickness(fontSize.getValue())));
            }
        }
    }

    private static void applyIllustrationLayoutAttributes(AbstractRenderer renderer, PdfDictionary attributes) {
        Rectangle bbox = renderer.getOccupiedArea().getBBox();
        attributes.put(PdfName.BBox, new PdfArray(bbox));
        UnitValue width = (UnitValue) renderer.getProperty(77);
        if (width != null && width.isPointValue()) {
            attributes.put(PdfName.Width, new PdfNumber(width.getValue()));
        } else {
            attributes.put(PdfName.Width, new PdfNumber(bbox.getWidth()));
        }
        UnitValue height = (UnitValue) renderer.getProperty(27);
        if (height != null) {
            attributes.put(PdfName.Height, new PdfNumber(height.getValue()));
        } else {
            attributes.put(PdfName.Height, new PdfNumber(bbox.getHeight()));
        }
    }

    private static void applyPaddingAttribute(AbstractRenderer renderer, PdfDictionary attributes) {
        UnitValue[] paddingsUV = {renderer.getPropertyAsUnitValue(50), renderer.getPropertyAsUnitValue(49), renderer.getPropertyAsUnitValue(47), renderer.getPropertyAsUnitValue(48)};
        if (!paddingsUV[0].isPointValue()) {
            Logger logger = LoggerFactory.getLogger(AccessibleAttributesApplier.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 50));
        }
        if (!paddingsUV[1].isPointValue()) {
            Logger logger2 = LoggerFactory.getLogger(AccessibleAttributesApplier.class);
            logger2.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 49));
        }
        if (!paddingsUV[2].isPointValue()) {
            Logger logger3 = LoggerFactory.getLogger(AccessibleAttributesApplier.class);
            logger3.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 47));
        }
        if (!paddingsUV[3].isPointValue()) {
            Logger logger4 = LoggerFactory.getLogger(AccessibleAttributesApplier.class);
            logger4.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 48));
        }
        float[] paddings = {paddingsUV[0].getValue(), paddingsUV[1].getValue(), paddingsUV[2].getValue(), paddingsUV[3].getValue()};
        PdfObject padding = null;
        if (paddings[0] == paddings[1] && paddings[0] == paddings[2] && paddings[0] == paddings[3]) {
            if (paddings[0] != 0.0f) {
                padding = new PdfNumber(paddings[0]);
            }
        } else {
            PdfArray paddingArray = new PdfArray();
            int[] paddingsOrder = {0, 1, 2, 3};
            for (int i : paddingsOrder) {
                paddingArray.add(new PdfNumber(paddings[i]));
            }
            padding = paddingArray;
        }
        if (padding != null) {
            attributes.put(PdfName.Padding, padding);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x00a5, code lost:
        if (r15.getColor().equals(r10[r4].getColor()) == false) goto L42;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void applyBorderAttributes(com.itextpdf.layout.renderer.AbstractRenderer r19, com.itextpdf.kernel.pdf.PdfDictionary r20) {
        /*
            Method dump skipped, instructions count: 399
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.layout.renderer.AccessibleAttributesApplier.applyBorderAttributes(com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.kernel.pdf.PdfDictionary):void");
    }

    private static IRoleMappingResolver resolveMappingToStandard(TagTreePointer taggingPointer) {
        TagStructureContext tagContext = taggingPointer.getDocument().getTagStructureContext();
        PdfNamespace namespace = taggingPointer.getProperties().getNamespace();
        return tagContext.resolveMappingToStandardOrDomainSpecificRole(taggingPointer.getRole(), namespace);
    }

    private static boolean isTagStructurePdf2(PdfNamespace namespace) {
        return namespace != null && StandardNamespaces.PDF_2_0.equals(namespace.getNamespaceName());
    }

    private static PdfName transformTextAlignmentValueToName(TextAlignment textAlignment) {
        switch (textAlignment) {
            case LEFT:
                if (1 != 0) {
                    return PdfName.Start;
                }
                return PdfName.End;
            case CENTER:
                return PdfName.Center;
            case RIGHT:
                if (1 != 0) {
                    return PdfName.End;
                }
                return PdfName.Start;
            case JUSTIFIED:
            case JUSTIFIED_ALL:
                return PdfName.Justify;
            default:
                return PdfName.Start;
        }
    }

    private static PdfName transformBlockAlignToName(HorizontalAlignment horizontalAlignment) {
        switch (horizontalAlignment) {
            case LEFT:
                if (1 != 0) {
                    return PdfName.Before;
                }
                return PdfName.After;
            case CENTER:
                return PdfName.Middle;
            case RIGHT:
                if (1 != 0) {
                    return PdfName.After;
                }
                return PdfName.Before;
            default:
                return PdfName.Before;
        }
    }

    private static PdfName transformBorderTypeToName(int borderType) {
        switch (borderType) {
            case 0:
                return PdfName.Solid;
            case 1:
                return PdfName.Dashed;
            case 2:
                return PdfName.Dotted;
            case 3:
                return PdfName.Double;
            case 4:
                return PdfName.Dotted;
            case 5:
                return PdfName.Groove;
            case 6:
                return PdfName.Inset;
            case 7:
                return PdfName.Outset;
            case 8:
                return PdfName.Ridge;
            default:
                return PdfName.Solid;
        }
    }

    private static PdfName transformNumberingTypeToName(ListNumberingType numberingType, boolean isTagStructurePdf2) {
        switch (numberingType) {
            case DECIMAL:
            case DECIMAL_LEADING_ZERO:
                return PdfName.Decimal;
            case ROMAN_UPPER:
                return PdfName.UpperRoman;
            case ROMAN_LOWER:
                return PdfName.LowerRoman;
            case ENGLISH_UPPER:
            case GREEK_UPPER:
                return PdfName.UpperAlpha;
            case ENGLISH_LOWER:
            case GREEK_LOWER:
                return PdfName.LowerAlpha;
            default:
                if (isTagStructurePdf2) {
                    return PdfName.Ordered;
                }
                return PdfName.None;
        }
    }
}
