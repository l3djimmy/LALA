package com.itextpdf.kernel.pdf;
/* loaded from: classes12.dex */
public class PdfDeveloperExtension {
    public static final PdfDeveloperExtension ADOBE_1_7_EXTENSIONLEVEL3 = new PdfDeveloperExtension(PdfName.ADBE, PdfName.Pdf_Version_1_7, 3);
    public static final PdfDeveloperExtension ESIC_1_7_EXTENSIONLEVEL2 = new PdfDeveloperExtension(PdfName.ESIC, PdfName.Pdf_Version_1_7, 2);
    public static final PdfDeveloperExtension ESIC_1_7_EXTENSIONLEVEL5 = new PdfDeveloperExtension(PdfName.ESIC, PdfName.Pdf_Version_1_7, 5);
    public static final PdfDeveloperExtension ISO_32001 = new PdfDeveloperExtension(PdfName.ISO_, PdfName.Pdf_Version_2_0, 32001, "https://www.iso.org/standard/45874.html", ":2022", true);
    public static final PdfDeveloperExtension ISO_32002 = new PdfDeveloperExtension(PdfName.ISO_, PdfName.Pdf_Version_2_0, 32002, "https://www.iso.org/standard/45875.html", ":2022", true);
    protected PdfName baseVersion;
    protected int extensionLevel;
    private final String extensionRevision;
    private final boolean isMultiValued;
    protected PdfName prefix;
    private final String url;

    public PdfDeveloperExtension(PdfName prefix, PdfName baseVersion, int extensionLevel) {
        this(prefix, baseVersion, extensionLevel, null, null, false);
    }

    public PdfDeveloperExtension(PdfName prefix, PdfName baseVersion, int extensionLevel, String url, String extensionRevision, boolean isMultiValued) {
        this.prefix = prefix;
        this.baseVersion = baseVersion;
        this.extensionLevel = extensionLevel;
        this.url = url;
        this.extensionRevision = extensionRevision;
        this.isMultiValued = isMultiValued;
    }

    public PdfName getPrefix() {
        return this.prefix;
    }

    public PdfName getBaseVersion() {
        return this.baseVersion;
    }

    public int getExtensionLevel() {
        return this.extensionLevel;
    }

    public boolean isMultiValued() {
        return this.isMultiValued;
    }

    public PdfDictionary getDeveloperExtensions() {
        PdfDictionary developerextensions = new PdfDictionary();
        developerextensions.put(PdfName.BaseVersion, this.baseVersion);
        developerextensions.put(PdfName.ExtensionLevel, new PdfNumber(this.extensionLevel));
        if (this.url != null) {
            developerextensions.put(PdfName.URL, new PdfString(this.url));
        }
        if (this.extensionRevision != null) {
            developerextensions.put(PdfName.ExtensionRevision, new PdfString(this.extensionRevision));
        }
        return developerextensions;
    }
}
