package com.itextpdf.kernel.pdf;

import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.navigation.PdfDestination;
import com.itextpdf.kernel.utils.ICopyFilter;
import java.util.Collections;
import java.util.List;
import java.util.function.Consumer;
/* loaded from: classes12.dex */
public class DestinationResolverCopyFilter implements ICopyFilter {
    private static final List<PdfName> EXCLUDE_KEYS_ACTIONCOPY = Collections.singletonList(PdfName.D);
    private final PdfDocument fromDocument;
    private final PdfDocument targetDocument;

    public DestinationResolverCopyFilter(PdfDocument fromDocument, PdfDocument targetDocument) {
        this.fromDocument = fromDocument;
        this.targetDocument = targetDocument;
    }

    @Override // com.itextpdf.kernel.utils.ICopyFilter
    public boolean shouldProcess(PdfObject newParent, PdfName name, PdfObject value) {
        PdfObject workRef = getDirectPdfObject(value);
        if (workRef.getType() == 3) {
            PdfDictionary dict = (PdfDictionary) workRef;
            if (dict.getAsName(PdfName.S) == PdfName.GoTo) {
                processAction(newParent, name, dict);
                return false;
            } else if (PdfName.Link.equals(dict.getAsName(PdfName.Subtype)) && newParent.isDictionary()) {
                return processLinkAnnotion(newParent, value, dict);
            } else {
                return true;
            }
        }
        return true;
    }

    private boolean processLinkAnnotion(final PdfObject newParent, final PdfObject value, PdfDictionary dict) {
        PdfObject destination = dict.get(PdfName.Dest);
        if (destination != null && !destination.equals(PdfNull.PDF_NULL)) {
            this.fromDocument.storeDestinationToReaddress(PdfDestination.makeDestination(destination), new Consumer() { // from class: com.itextpdf.kernel.pdf.DestinationResolverCopyFilter$$ExternalSyntheticLambda2
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    DestinationResolverCopyFilter.this.m7329x210e2111(value, newParent, (PdfDestination) obj);
                }
            }, new Consumer() { // from class: com.itextpdf.kernel.pdf.DestinationResolverCopyFilter$$ExternalSyntheticLambda3
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    DestinationResolverCopyFilter.lambda$processLinkAnnotion$1((PdfDestination) obj);
                }
            });
            return false;
        } else if (dict.getAsDictionary(PdfName.A) != null && dict.getAsDictionary(PdfName.A).get(PdfName.D) != null && !PdfNull.PDF_NULL.equals(dict.getAsDictionary(PdfName.A).get(PdfName.D)) && !PdfName.GoToR.equals(dict.getAsDictionary(PdfName.A).get(PdfName.S))) {
            this.fromDocument.storeDestinationToReaddress(PdfDestination.makeDestination(dict.getAsDictionary(PdfName.A).get(PdfName.D)), new Consumer() { // from class: com.itextpdf.kernel.pdf.DestinationResolverCopyFilter$$ExternalSyntheticLambda4
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    DestinationResolverCopyFilter.this.m7330x73b6cb93(value, newParent, (PdfDestination) obj);
                }
            }, new Consumer() { // from class: com.itextpdf.kernel.pdf.DestinationResolverCopyFilter$$ExternalSyntheticLambda5
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    DestinationResolverCopyFilter.lambda$processLinkAnnotion$3((PdfDestination) obj);
                }
            });
            return false;
        } else {
            return true;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$processLinkAnnotion$0$com-itextpdf-kernel-pdf-DestinationResolverCopyFilter  reason: not valid java name */
    public /* synthetic */ void m7329x210e2111(PdfObject value, PdfObject newParent, PdfDestination nd) {
        PdfObject newVal = value.copyTo(this.targetDocument, this);
        new PdfPage((PdfDictionary) newParent).addAnnotation(-1, PdfAnnotation.makeAnnotation(newVal), false);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$processLinkAnnotion$1(PdfDestination od) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$processLinkAnnotion$2$com-itextpdf-kernel-pdf-DestinationResolverCopyFilter  reason: not valid java name */
    public /* synthetic */ void m7330x73b6cb93(PdfObject value, PdfObject newParent, PdfDestination nd) {
        PdfObject newAnnot = value.copyTo(this.targetDocument);
        ((PdfDictionary) newAnnot).getAsDictionary(PdfName.A).put(PdfName.D, nd.getPdfObject());
        new PdfPage((PdfDictionary) newParent).addAnnotation(-1, PdfAnnotation.makeAnnotation(newAnnot), false);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$processLinkAnnotion$3(PdfDestination od) {
    }

    private void processAction(final PdfObject newParent, final PdfName name, final PdfDictionary dict) {
        PdfObject destination = dict.get(PdfName.D);
        if (destination == null || PdfNull.PDF_NULL.equals(destination)) {
            return;
        }
        this.fromDocument.storeDestinationToReaddress(PdfDestination.makeDestination(destination), new Consumer() { // from class: com.itextpdf.kernel.pdf.DestinationResolverCopyFilter$$ExternalSyntheticLambda0
            @Override // java.util.function.Consumer
            public final void accept(Object obj) {
                DestinationResolverCopyFilter.this.m7328xd90442ef(dict, newParent, name, (PdfDestination) obj);
            }
        }, new Consumer() { // from class: com.itextpdf.kernel.pdf.DestinationResolverCopyFilter$$ExternalSyntheticLambda1
            @Override // java.util.function.Consumer
            public final void accept(Object obj) {
                DestinationResolverCopyFilter.lambda$processAction$5((PdfDestination) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$processAction$4$com-itextpdf-kernel-pdf-DestinationResolverCopyFilter  reason: not valid java name */
    public /* synthetic */ void m7328xd90442ef(PdfDictionary dict, PdfObject newParent, PdfName name, PdfDestination nd) {
        PdfObject newVal = dict.copyTo(this.targetDocument, EXCLUDE_KEYS_ACTIONCOPY, false);
        ((PdfDictionary) newVal).put(PdfName.D, nd.getPdfObject());
        if (newParent.getType() == 3) {
            ((PdfDictionary) newParent).put(name, newVal);
        } else {
            ((PdfArray) newParent).add(newVal);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$processAction$5(PdfDestination od) {
    }

    private static PdfObject getDirectPdfObject(PdfObject value) {
        if (!value.isIndirectReference()) {
            return value;
        }
        PdfObject workRef = ((PdfIndirectReference) value).getRefersTo();
        return workRef;
    }
}
