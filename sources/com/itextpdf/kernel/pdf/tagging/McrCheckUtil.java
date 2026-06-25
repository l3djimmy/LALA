package com.itextpdf.kernel.pdf.tagging;

import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.tagutils.ITagTreeIteratorHandler;
import com.itextpdf.kernel.pdf.tagutils.TagTreeIterator;
/* loaded from: classes12.dex */
public final class McrCheckUtil {
    private McrCheckUtil() {
    }

    public static boolean isTrContainsMcr(PdfDictionary elementTR) {
        TagTreeIterator tagTreeIterator = new TagTreeIterator(new PdfStructElem(elementTR));
        McrTagHandler handler = new McrTagHandler();
        tagTreeIterator.addHandler(handler);
        tagTreeIterator.traverse();
        return handler.tagTreeHaveMcr();
    }

    /* loaded from: classes12.dex */
    private static class McrTagHandler implements ITagTreeIteratorHandler {
        private boolean haveMcr = false;

        public boolean tagTreeHaveMcr() {
            return this.haveMcr;
        }

        @Override // com.itextpdf.kernel.pdf.tagutils.ITagTreeIteratorHandler
        public void nextElement(IStructureNode elem) {
            if (elem instanceof PdfMcr) {
                this.haveMcr = true;
            }
        }
    }
}
