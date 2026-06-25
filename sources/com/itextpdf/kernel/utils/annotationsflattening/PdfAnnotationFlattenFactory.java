package com.itextpdf.kernel.utils.annotationsflattening;

import com.itextpdf.kernel.pdf.PdfName;
import java.util.HashMap;
import java.util.function.Supplier;
/* loaded from: classes12.dex */
public class PdfAnnotationFlattenFactory {
    private static final PdfName UNKNOWN = new PdfName("Unknown");
    private static final HashMap<PdfName, Supplier<IAnnotationFlattener>> map = new HashMap<>();

    static {
        map.put(PdfName.Link, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda0
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$0();
            }
        });
        map.put(PdfName.Popup, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda11
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$1();
            }
        });
        map.put(PdfName.Widget, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda18
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$2();
            }
        });
        map.put(PdfName.Screen, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda19
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$3();
            }
        });
        map.put(PdfName._3D, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda20
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$4();
            }
        });
        map.put(PdfName.Highlight, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda21
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$5();
            }
        });
        map.put(PdfName.Underline, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda22
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$6();
            }
        });
        map.put(PdfName.Squiggly, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda23
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$7();
            }
        });
        map.put(PdfName.StrikeOut, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda24
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$8();
            }
        });
        map.put(PdfName.Caret, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda25
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$9();
            }
        });
        map.put(PdfName.Text, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda1
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$10();
            }
        });
        map.put(PdfName.Sound, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda2
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$11();
            }
        });
        map.put(PdfName.Stamp, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda3
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$12();
            }
        });
        map.put(PdfName.FileAttachment, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda4
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$13();
            }
        });
        map.put(PdfName.Ink, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda5
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$14();
            }
        });
        map.put(PdfName.PrinterMark, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda6
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$15();
            }
        });
        map.put(PdfName.TrapNet, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda7
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$16();
            }
        });
        map.put(PdfName.FreeText, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda8
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$17();
            }
        });
        map.put(PdfName.Square, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda9
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$18();
            }
        });
        map.put(PdfName.Circle, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda10
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$19();
            }
        });
        map.put(PdfName.Line, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda12
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$20();
            }
        });
        map.put(PdfName.Polygon, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda13
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$21();
            }
        });
        map.put(PdfName.PolyLine, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda14
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$22();
            }
        });
        map.put(PdfName.Redact, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda15
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$23();
            }
        });
        map.put(PdfName.Watermark, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda16
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$24();
            }
        });
        map.put(UNKNOWN, new Supplier() { // from class: com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory$$ExternalSyntheticLambda17
            @Override // java.util.function.Supplier
            public final Object get() {
                return PdfAnnotationFlattenFactory.lambda$static$25();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$0() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$1() {
        return new RemoveWithoutDrawingFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$2() {
        return new WarnFormfieldFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$3() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$4() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$5() {
        return new HighLightTextMarkupAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$6() {
        return new UnderlineTextMarkupAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$7() {
        return new SquigglyTextMarkupAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$8() {
        return new StrikeOutTextMarkupAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$9() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$10() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$11() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$12() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$13() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$14() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$15() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$16() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$17() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$18() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$19() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$20() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$21() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$22() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$23() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$24() {
        return new DefaultAnnotationFlattener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IAnnotationFlattener lambda$static$25() {
        return new NotSupportedFlattener();
    }

    public IAnnotationFlattener getAnnotationFlattenWorker(PdfName name) {
        Supplier<IAnnotationFlattener> worker = map.get(name);
        if (worker == null) {
            worker = map.get(UNKNOWN);
        }
        return worker.get();
    }
}
