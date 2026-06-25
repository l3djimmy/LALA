package com.itextpdf.io.font;

import com.itextpdf.commons.utils.FileUtil;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.font.constants.StandardFontFamilies;
import com.itextpdf.io.font.constants.StandardFonts;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class FontRegisterProvider {
    private static final Logger LOGGER = LoggerFactory.getLogger(FontRegisterProvider.class);
    private final Map<String, String> fontNames = new HashMap();
    private final Map<String, List<String>> fontFamilies = new HashMap();

    /* JADX INFO: Access modifiers changed from: package-private */
    public FontRegisterProvider() {
        registerStandardFonts();
        registerStandardFontFamilies();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FontProgram getFont(String fontName, int style) throws IOException {
        return getFont(fontName, style, true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FontProgram getFont(String fontName, int style, boolean cached) throws IOException {
        if (fontName == null) {
            return null;
        }
        String lowerCaseFontName = fontName.toLowerCase();
        boolean equalsIgnoreCase = lowerCaseFontName.equalsIgnoreCase(StandardFonts.TIMES_ROMAN);
        Map<String, List<String>> map = this.fontFamilies;
        List<String> family = !equalsIgnoreCase ? map.get(lowerCaseFontName) : map.get(StandardFontFamilies.TIMES.toLowerCase());
        if (family != null) {
            synchronized (family) {
                int s = style == -1 ? 0 : style;
                Iterator<String> it = family.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    String f = it.next();
                    String lcf = f.toLowerCase();
                    int fs = lcf.contains("bold") ? 0 | 1 : 0;
                    if (lcf.contains("italic") || lcf.contains("oblique")) {
                        fs |= 2;
                    }
                    if ((s & 3) == fs) {
                        fontName = f;
                        break;
                    }
                }
            }
        }
        return getFontProgram(fontName, cached);
    }

    protected void registerStandardFonts() {
        this.fontNames.put("Courier".toLowerCase(), "Courier");
        this.fontNames.put(StandardFonts.COURIER_BOLD.toLowerCase(), StandardFonts.COURIER_BOLD);
        this.fontNames.put(StandardFonts.COURIER_OBLIQUE.toLowerCase(), StandardFonts.COURIER_OBLIQUE);
        this.fontNames.put(StandardFonts.COURIER_BOLDOBLIQUE.toLowerCase(), StandardFonts.COURIER_BOLDOBLIQUE);
        this.fontNames.put("Helvetica".toLowerCase(), "Helvetica");
        this.fontNames.put(StandardFonts.HELVETICA_BOLD.toLowerCase(), StandardFonts.HELVETICA_BOLD);
        this.fontNames.put(StandardFonts.HELVETICA_OBLIQUE.toLowerCase(), StandardFonts.HELVETICA_OBLIQUE);
        this.fontNames.put(StandardFonts.HELVETICA_BOLDOBLIQUE.toLowerCase(), StandardFonts.HELVETICA_BOLDOBLIQUE);
        this.fontNames.put("Symbol".toLowerCase(), "Symbol");
        this.fontNames.put(StandardFonts.TIMES_ROMAN.toLowerCase(), StandardFonts.TIMES_ROMAN);
        this.fontNames.put(StandardFonts.TIMES_BOLD.toLowerCase(), StandardFonts.TIMES_BOLD);
        this.fontNames.put(StandardFonts.TIMES_ITALIC.toLowerCase(), StandardFonts.TIMES_ITALIC);
        this.fontNames.put(StandardFonts.TIMES_BOLDITALIC.toLowerCase(), StandardFonts.TIMES_BOLDITALIC);
        this.fontNames.put("ZapfDingbats".toLowerCase(), "ZapfDingbats");
    }

    protected void registerStandardFontFamilies() {
        List<String> family = new ArrayList<>();
        family.add("Courier");
        family.add(StandardFonts.COURIER_BOLD);
        family.add(StandardFonts.COURIER_OBLIQUE);
        family.add(StandardFonts.COURIER_BOLDOBLIQUE);
        this.fontFamilies.put("Courier".toLowerCase(), family);
        List<String> family2 = new ArrayList<>();
        family2.add("Helvetica");
        family2.add(StandardFonts.HELVETICA_BOLD);
        family2.add(StandardFonts.HELVETICA_OBLIQUE);
        family2.add(StandardFonts.HELVETICA_BOLDOBLIQUE);
        this.fontFamilies.put("Helvetica".toLowerCase(), family2);
        List<String> family3 = new ArrayList<>();
        family3.add("Symbol");
        this.fontFamilies.put("Symbol".toLowerCase(), family3);
        List<String> family4 = new ArrayList<>();
        family4.add(StandardFonts.TIMES_ROMAN);
        family4.add(StandardFonts.TIMES_BOLD);
        family4.add(StandardFonts.TIMES_ITALIC);
        family4.add(StandardFonts.TIMES_BOLDITALIC);
        this.fontFamilies.put(StandardFontFamilies.TIMES.toLowerCase(), family4);
        List<String> family5 = new ArrayList<>();
        family5.add("ZapfDingbats");
        this.fontFamilies.put("ZapfDingbats".toLowerCase(), family5);
    }

    protected FontProgram getFontProgram(String fontName, boolean cached) throws IOException {
        String fontName2 = this.fontNames.get(fontName.toLowerCase());
        if (fontName2 == null) {
            return null;
        }
        FontProgram fontProgram = FontProgramFactory.createFont(fontName2, cached);
        return fontProgram;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void registerFontFamily(String familyName, String fullName, String path) {
        List<String> family;
        if (path != null) {
            this.fontNames.put(fullName, path);
        }
        synchronized (this.fontFamilies) {
            family = this.fontFamilies.get(familyName);
            if (family == null) {
                family = new ArrayList();
                this.fontFamilies.put(familyName, family);
            }
        }
        synchronized (family) {
            if (!family.contains(fullName)) {
                int fullNameLength = fullName.length();
                boolean inserted = false;
                int j = 0;
                while (true) {
                    if (j >= family.size()) {
                        break;
                    } else if (family.get(j).length() < fullNameLength) {
                        j++;
                    } else {
                        family.add(j, fullName);
                        inserted = true;
                        break;
                    }
                }
                if (!inserted) {
                    family.add(fullName);
                    String newFullName = fullName.toLowerCase();
                    if (newFullName.endsWith("regular")) {
                        family.add(0, fullName.substring(0, newFullName.substring(0, newFullName.length() - 7).trim().length()));
                    }
                }
            }
        }
    }

    void registerFont(String path) {
        registerFont(path, null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void registerFont(String path, String alias) {
        try {
            if (!path.toLowerCase().endsWith(".ttf") && !path.toLowerCase().endsWith(".otf") && path.toLowerCase().indexOf(".ttc,") <= 0) {
                if (path.toLowerCase().endsWith(".ttc")) {
                    TrueTypeCollection ttc = new TrueTypeCollection(path);
                    for (int i = 0; i < ttc.getTTCSize(); i++) {
                        String fullPath = path + "," + i;
                        if (alias != null) {
                            registerFont(fullPath, alias + "," + i);
                        } else {
                            registerFont(fullPath);
                        }
                    }
                } else if (path.toLowerCase().endsWith(".afm") || path.toLowerCase().endsWith(".pfm")) {
                    FontProgramDescriptor descriptor = FontProgramDescriptorFactory.fetchDescriptor(path);
                    registerFontFamily(descriptor.getFamilyNameLowerCase(), descriptor.getFullNameLowerCase(), null);
                    this.fontNames.put(descriptor.getFontNameLowerCase(), path);
                    this.fontNames.put(descriptor.getFullNameLowerCase(), path);
                    LOGGER.trace(MessageFormatUtil.format("Registered {0}", path));
                }
                LOGGER.trace(MessageFormatUtil.format("Registered {0}", path));
            }
            FontProgramDescriptor descriptor2 = FontProgramDescriptorFactory.fetchDescriptor(path);
            this.fontNames.put(descriptor2.getFontNameLowerCase(), path);
            if (alias != null) {
                String lcAlias = alias.toLowerCase();
                this.fontNames.put(lcAlias, path);
                if (lcAlias.endsWith("regular")) {
                    saveCopyOfRegularFont(lcAlias, path);
                }
            }
            for (String name : descriptor2.getFullNameAllLangs()) {
                this.fontNames.put(name, path);
                if (name.endsWith("regular")) {
                    saveCopyOfRegularFont(name, path);
                }
            }
            if (descriptor2.getFamilyNameEnglishOpenType() != null) {
                for (String fullName : descriptor2.getFullNamesEnglishOpenType()) {
                    registerFontFamily(descriptor2.getFamilyNameEnglishOpenType(), fullName, null);
                }
            }
            LOGGER.trace(MessageFormatUtil.format("Registered {0}", path));
        } catch (IOException e) {
            throw new com.itextpdf.io.exceptions.IOException(e);
        }
    }

    boolean saveCopyOfRegularFont(String regularFontName, String path) {
        String alias = regularFontName.substring(0, regularFontName.length() - 7).trim();
        if (this.fontNames.containsKey(alias)) {
            return false;
        }
        this.fontNames.put(alias, path);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int registerFontDirectory(String dir) {
        return registerFontDirectory(dir, false);
    }

    int registerFontDirectory(String dir, boolean scanSubdirectories) {
        String[] files;
        String suffix;
        LOGGER.debug(MessageFormatUtil.format("Registering directory {0}, looking for fonts", dir));
        int count = 0;
        try {
            files = FileUtil.listFilesInDirectory(dir, scanSubdirectories);
        } catch (Exception e) {
        }
        if (files == null) {
            return 0;
        }
        for (String file : files) {
            try {
                suffix = file.length() < 4 ? null : file.substring(file.length() - 4).toLowerCase();
            } catch (Exception e2) {
            }
            if (!".afm".equals(suffix) && !".pfm".equals(suffix)) {
                if (".ttf".equals(suffix) || ".otf".equals(suffix) || ".ttc".equals(suffix)) {
                    registerFont(file, null);
                    count++;
                }
            }
            String pfb = file.substring(0, file.length() - 4) + ".pfb";
            if (FileUtil.fileExists(pfb)) {
                registerFont(file, null);
                count++;
            }
        }
        return count;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int registerSystemFontDirectories() {
        int count = 0;
        String[] withSubDirs = {FileUtil.getFontsDir(), "/usr/share/X11/fonts", "/usr/X/lib/X11/fonts", "/usr/openwin/lib/X11/fonts", "/usr/share/fonts", "/usr/X11R6/lib/X11/fonts"};
        for (String directory : withSubDirs) {
            count += registerFontDirectory(directory, true);
        }
        String[] withoutSubDirs = {"/Library/Fonts", "/System/Library/Fonts"};
        for (String directory2 : withoutSubDirs) {
            count += registerFontDirectory(directory2, false);
        }
        return count;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Set<String> getRegisteredFonts() {
        return this.fontNames.keySet();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Set<String> getRegisteredFontFamilies() {
        return this.fontFamilies.keySet();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isRegisteredFont(String fontname) {
        return this.fontNames.containsKey(fontname.toLowerCase());
    }

    public void clearRegisteredFonts() {
        this.fontNames.clear();
        registerStandardFonts();
    }

    public void clearRegisteredFontFamilies() {
        this.fontFamilies.clear();
        registerStandardFontFamilies();
    }
}
