package com.itextpdf.io.font;

import androidx.exifinterface.media.ExifInterface;
import com.itextpdf.io.exceptions.IOException;
import com.itextpdf.io.font.cmap.CMapUniCid;
import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.io.util.IntHashtable;
import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.StringTokenizer;
/* loaded from: classes12.dex */
public class CidFont extends FontProgram {
    private Set<String> compatibleCmaps;
    private String fontName;
    private int pdfFontFlags;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CidFont(String fontName, String cmap, Set<String> compatibleCmaps) {
        this.fontName = fontName;
        this.compatibleCmaps = compatibleCmaps;
        this.fontNames = new FontNames();
        initializeCidFontNameAndStyle(fontName);
        Map<String, Object> fontDesc = CidFontProperties.getAllFonts().get(this.fontNames.getFontName());
        if (fontDesc == null) {
            throw new IOException("There is no such predefined font: {0}").setMessageParams(fontName);
        }
        initializeCidFontProperties(fontDesc, cmap);
    }

    public boolean compatibleWith(String cmap) {
        if (cmap.equals(PdfEncodings.IDENTITY_H) || cmap.equals(PdfEncodings.IDENTITY_V)) {
            return true;
        }
        return this.compatibleCmaps != null && this.compatibleCmaps.contains(cmap);
    }

    @Override // com.itextpdf.io.font.FontProgram
    public int getKerning(Glyph glyph1, Glyph glyph2) {
        return 0;
    }

    @Override // com.itextpdf.io.font.FontProgram
    public int getPdfFontFlags() {
        return this.pdfFontFlags;
    }

    @Override // com.itextpdf.io.font.FontProgram
    public boolean isFontSpecific() {
        return false;
    }

    @Override // com.itextpdf.io.font.FontProgram
    public boolean isBuiltWith(String fontName) {
        return Objects.equals(this.fontName, fontName);
    }

    private void initializeCidFontNameAndStyle(String fontName) {
        String nameBase = trimFontStyle(fontName);
        if (nameBase.length() < fontName.length()) {
            this.fontNames.setFontName(fontName);
            this.fontNames.setStyle(fontName.substring(nameBase.length()));
        } else {
            this.fontNames.setFontName(fontName);
        }
        this.fontNames.setFullName(new String[][]{new String[]{"", "", "", this.fontNames.getFontName()}});
    }

    private void initializeCidFontProperties(Map<String, Object> fontDesc, String cmap) {
        this.fontIdentification.setPanose((String) fontDesc.get("Panose"));
        this.fontMetrics.setItalicAngle(Integer.parseInt((String) fontDesc.get("ItalicAngle")));
        this.fontMetrics.setCapHeight(Integer.parseInt((String) fontDesc.get("CapHeight")));
        this.fontMetrics.setTypoAscender(Integer.parseInt((String) fontDesc.get("Ascent")));
        this.fontMetrics.setTypoDescender(Integer.parseInt((String) fontDesc.get("Descent")));
        this.fontMetrics.setStemV(Integer.parseInt((String) fontDesc.get("StemV")));
        this.pdfFontFlags = Integer.parseInt((String) fontDesc.get("Flags"));
        String fontBBox = (String) fontDesc.get("FontBBox");
        StringTokenizer tk = new StringTokenizer(fontBBox, " []\r\n\t\f");
        int llx = Integer.parseInt(tk.nextToken());
        int lly = Integer.parseInt(tk.nextToken());
        int urx = Integer.parseInt(tk.nextToken());
        int ury = Integer.parseInt(tk.nextToken());
        this.fontMetrics.updateBbox(llx, lly, urx, ury);
        this.registry = (String) fontDesc.get("Registry");
        String uniMap = getCompatibleUniMap(this.registry, cmap);
        if (uniMap != null) {
            IntHashtable metrics = (IntHashtable) fontDesc.get(ExifInterface.LONGITUDE_WEST);
            CMapUniCid uni2cid = CjkResourceLoader.getUni2CidCmap(uniMap);
            int i = 0;
            this.avgWidth = 0;
            int[] codePoints = uni2cid.getCodePoints();
            int length = codePoints.length;
            while (i < length) {
                int cp = codePoints[i];
                int cid = uni2cid.lookup(cp);
                int width = metrics.containsKey(cid) ? metrics.get(cid) : 1000;
                String fontBBox2 = fontBBox;
                Glyph glyph = new Glyph(cid, width, cp);
                this.avgWidth += glyph.getWidth();
                this.codeToGlyph.put(Integer.valueOf(cid), glyph);
                this.unicodeToGlyph.put(Integer.valueOf(cp), glyph);
                i++;
                fontBBox = fontBBox2;
                tk = tk;
            }
            fixSpaceIssue();
            if (this.codeToGlyph.size() != 0) {
                this.avgWidth /= this.codeToGlyph.size();
            }
        }
    }

    private static String getCompatibleUniMap(String registry, String cmap) {
        Set<String> compatibleUniMaps = CidFontProperties.getRegistryNames().get(registry + "_Uni");
        if (cmap != null && compatibleUniMaps.contains(cmap)) {
            return cmap;
        }
        String uniMap = "";
        for (String name : compatibleUniMaps) {
            uniMap = name;
            if (name.endsWith(StandardRoles.H)) {
                return name;
            }
        }
        return uniMap;
    }
}
