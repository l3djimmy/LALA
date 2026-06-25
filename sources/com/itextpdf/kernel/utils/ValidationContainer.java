package com.itextpdf.kernel.utils;

import com.itextpdf.kernel.pdf.IsoKey;
import com.itextpdf.kernel.pdf.PdfResources;
import com.itextpdf.kernel.pdf.PdfStream;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes12.dex */
public class ValidationContainer {
    private final List<IValidationChecker> validationCheckers = new ArrayList();

    public void validate(ValidationContext context) {
        for (IValidationChecker checker : this.validationCheckers) {
            checker.validateDocument(context);
        }
    }

    public void validate(Object obj, IsoKey key, PdfResources resources, PdfStream contentStream, Object extra) {
        for (IValidationChecker checker : this.validationCheckers) {
            checker.validateObject(obj, key, resources, contentStream, extra);
        }
    }

    public void addChecker(IValidationChecker checker) {
        this.validationCheckers.add(checker);
    }

    public boolean containsChecker(IValidationChecker checker) {
        return this.validationCheckers.contains(checker);
    }
}
