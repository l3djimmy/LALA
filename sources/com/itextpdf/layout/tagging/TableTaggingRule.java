package com.itextpdf.layout.tagging;

import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Div;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.CaptionSide;
import com.itextpdf.layout.properties.Property;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
/* loaded from: classes12.dex */
class TableTaggingRule implements ITaggingRule {
    @Override // com.itextpdf.layout.tagging.ITaggingRule
    public boolean onTagFinish(LayoutTaggingHelper taggingHelper, TaggingHintKey tableHintKey) {
        List<TaggingHintKey> kidKeys = taggingHelper.getAccessibleKidsHint(tableHintKey);
        Map<Integer, TreeMap<Integer, TaggingHintKey>> tableTags = new TreeMap<>();
        List<TaggingHintKey> tableCellTagsUnindexed = new ArrayList<>();
        List<TaggingHintKey> nonCellKids = new ArrayList<>();
        Iterator<TaggingHintKey> it = kidKeys.iterator();
        while (true) {
            boolean isCell = true;
            if (!it.hasNext()) {
                break;
            }
            TaggingHintKey kidKey = it.next();
            String kidRole = getKidRole(kidKey, taggingHelper);
            if (!StandardRoles.TD.equals(kidRole) && !StandardRoles.TH.equals(kidRole)) {
                isCell = false;
            }
            if (isCell && (kidKey.getAccessibleElement() instanceof Cell)) {
                Cell cell = (Cell) kidKey.getAccessibleElement();
                int rowInd = cell.getRow();
                int colInd = cell.getCol();
                TreeMap<Integer, TaggingHintKey> rowTags = tableTags.get(Integer.valueOf(rowInd));
                if (rowTags == null) {
                    rowTags = new TreeMap<>();
                    tableTags.put(Integer.valueOf(rowInd), rowTags);
                }
                rowTags.put(Integer.valueOf(colInd), kidKey);
            } else if (isCell) {
                tableCellTagsUnindexed.add(kidKey);
            } else {
                nonCellKids.add(kidKey);
            }
        }
        TaggingDummyElement tbodyTag = getTbodyTag(tableHintKey);
        for (TaggingHintKey nonCellKid : nonCellKids) {
            String kidRole2 = getKidRole(nonCellKid, taggingHelper);
            if (!StandardRoles.THEAD.equals(kidRole2) && !StandardRoles.TFOOT.equals(kidRole2) && !StandardRoles.CAPTION.equals(kidRole2)) {
                taggingHelper.moveKidHint(nonCellKid, tableHintKey);
            }
        }
        for (TaggingHintKey nonCellKid2 : nonCellKids) {
            if (StandardRoles.THEAD.equals(getKidRole(nonCellKid2, taggingHelper))) {
                taggingHelper.moveKidHint(nonCellKid2, tableHintKey);
            }
        }
        taggingHelper.addKidsHint(tableHintKey, Collections.singletonList(LayoutTaggingHelper.getOrCreateHintKey(tbodyTag)), -1);
        for (TaggingHintKey nonCellKid3 : nonCellKids) {
            if (StandardRoles.TFOOT.equals(getKidRole(nonCellKid3, taggingHelper))) {
                taggingHelper.moveKidHint(nonCellKid3, tableHintKey);
            }
        }
        for (TreeMap<Integer, TaggingHintKey> rowTags2 : tableTags.values()) {
            TaggingDummyElement row = new TaggingDummyElement(StandardRoles.TR);
            TaggingHintKey rowTagHint = LayoutTaggingHelper.getOrCreateHintKey(row);
            for (TaggingHintKey cellTagHint : rowTags2.values()) {
                taggingHelper.moveKidHint(cellTagHint, rowTagHint);
            }
            if (tableCellTagsUnindexed != null) {
                for (TaggingHintKey cellTagHint2 : tableCellTagsUnindexed) {
                    taggingHelper.moveKidHint(cellTagHint2, rowTagHint);
                }
                tableCellTagsUnindexed = null;
            }
            taggingHelper.addKidsHint(tbodyTag, Collections.singletonList(row), -1);
        }
        for (TaggingHintKey nonCellKid4 : nonCellKids) {
            if (StandardRoles.CAPTION.equals(getKidRole(nonCellKid4, taggingHelper))) {
                moveCaption(taggingHelper, nonCellKid4, tableHintKey);
            }
        }
        return true;
    }

    private static String getKidRole(TaggingHintKey kidKey, LayoutTaggingHelper helper) {
        return helper.getPdfDocument().getTagStructureContext().resolveMappingToStandardOrDomainSpecificRole(kidKey.getAccessibilityProperties().getRole(), null).getRole();
    }

    private static TaggingDummyElement getTbodyTag(TaggingHintKey tableHintKey) {
        boolean createTBody = true;
        if (tableHintKey.getAccessibleElement() instanceof Table) {
            Table modelElement = (Table) tableHintKey.getAccessibleElement();
            createTBody = ((modelElement.getHeader() == null || modelElement.isSkipFirstHeader()) && (modelElement.getFooter() == null || modelElement.isSkipLastFooter())) ? false : true;
        }
        return new TaggingDummyElement(createTBody ? StandardRoles.TBODY : null);
    }

    private static void moveCaption(LayoutTaggingHelper taggingHelper, TaggingHintKey caption, TaggingHintKey tableHintKey) {
        CaptionSide captionSide;
        if (!(tableHintKey.getAccessibleElement() instanceof Table)) {
            return;
        }
        Table tableElem = (Table) tableHintKey.getAccessibleElement();
        Div captionDiv = tableElem.getCaption();
        if (captionDiv == null) {
            return;
        }
        if (captionDiv.getProperty(Property.CAPTION_SIDE) == null) {
            captionSide = CaptionSide.TOP;
        } else {
            captionSide = (CaptionSide) captionDiv.getProperty(Property.CAPTION_SIDE);
        }
        if (CaptionSide.TOP.equals(captionSide)) {
            taggingHelper.moveKidHint(caption, tableHintKey, 0);
        } else {
            taggingHelper.moveKidHint(caption, tableHintKey);
        }
    }
}
