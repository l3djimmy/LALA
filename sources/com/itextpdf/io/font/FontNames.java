package com.itextpdf.io.font;

import com.itextpdf.io.font.constants.FontStretches;
import com.itextpdf.io.font.constants.FontWeights;
import java.util.List;
import java.util.Map;
/* loaded from: classes12.dex */
public class FontNames {
    protected Map<Integer, List<String[]>> allNames;
    private boolean allowEmbedding;
    private String cidFontName;
    private String[][] familyName;
    private String[][] familyName2;
    private String fontName;
    private String[][] fullName;
    private int macStyle;
    private String[][] subfamily;
    private String style = "";
    private int weight = FontWeights.NORMAL;
    private String fontStretch = FontStretches.NORMAL;

    public String[][] getNames(int id) {
        List<String[]> names = this.allNames.get(Integer.valueOf(id));
        if (names == null || names.size() <= 0) {
            return null;
        }
        return listToArray(names);
    }

    public String[][] getFullName() {
        return this.fullName;
    }

    public String getFontName() {
        return this.fontName;
    }

    public String getCidFontName() {
        return this.cidFontName;
    }

    public String[][] getFamilyName() {
        return this.familyName;
    }

    public String[][] getFamilyName2() {
        return this.familyName2;
    }

    public String getStyle() {
        return this.style;
    }

    public String getSubfamily() {
        return this.subfamily != null ? this.subfamily[0][3] : "";
    }

    public int getFontWeight() {
        return this.weight;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFontWeight(int weight) {
        this.weight = FontWeights.normalizeFontWeight(weight);
    }

    public String getFontStretch() {
        return this.fontStretch;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFontStretch(String fontStretch) {
        this.fontStretch = fontStretch;
    }

    public boolean allowEmbedding() {
        return this.allowEmbedding;
    }

    public boolean isBold() {
        return (this.macStyle & 1) != 0;
    }

    public boolean isItalic() {
        return (this.macStyle & 2) != 0;
    }

    public boolean isUnderline() {
        return (this.macStyle & 4) != 0;
    }

    public boolean isOutline() {
        return (this.macStyle & 8) != 0;
    }

    public boolean isShadow() {
        return (this.macStyle & 16) != 0;
    }

    public boolean isCondensed() {
        return (this.macStyle & 32) != 0;
    }

    public boolean isExtended() {
        return (this.macStyle & 64) != 0;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setAllNames(Map<Integer, List<String[]>> allNames) {
        this.allNames = allNames;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFullName(String[][] fullName) {
        this.fullName = fullName;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFullName(String fullName) {
        this.fullName = new String[][]{new String[]{"", "", "", fullName}};
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFontName(String psFontName) {
        this.fontName = psFontName;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setCidFontName(String cidFontName) {
        this.cidFontName = cidFontName;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFamilyName(String[][] familyName) {
        this.familyName = familyName;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFamilyName2(String[][] familyName2) {
        this.familyName2 = familyName2;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFamilyName(String familyName) {
        this.familyName = new String[][]{new String[]{"", "", "", familyName}};
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setStyle(String style) {
        this.style = style;
    }

    protected void setSubfamily(String subfamily) {
        this.subfamily = new String[][]{new String[]{"", "", "", subfamily}};
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSubfamily(String[][] subfamily) {
        this.subfamily = subfamily;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setMacStyle(int macStyle) {
        this.macStyle = macStyle;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int getMacStyle() {
        return this.macStyle;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setAllowEmbedding(boolean allowEmbedding) {
        this.allowEmbedding = allowEmbedding;
    }

    private String[][] listToArray(List<String[]> list) {
        String[][] array = new String[list.size()];
        for (int i = 0; i < list.size(); i++) {
            array[i] = list.get(i);
        }
        return array;
    }

    public String toString() {
        String name = getFontName();
        return (name == null || name.length() <= 0) ? super.toString() : name;
    }
}
