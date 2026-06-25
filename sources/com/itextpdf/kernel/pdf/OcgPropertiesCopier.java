package com.itextpdf.kernel.pdf;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.logs.KernelLogMessageConstant;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.layer.PdfOCProperties;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public final class OcgPropertiesCopier {
    private static final Logger LOGGER = LoggerFactory.getLogger(OcgPropertiesCopier.class);

    private OcgPropertiesCopier() {
    }

    public static void copyOCGProperties(PdfDocument fromDocument, PdfDocument toDocument, Map<PdfPage, PdfPage> page2page) {
        try {
            Set<PdfIndirectReference> fromOcgsToCopy = getAllUsedNonFlushedOCGs(page2page, toDocument.getCatalog().getPdfObject().getAsDictionary(PdfName.OCProperties));
            if (fromOcgsToCopy.isEmpty()) {
                return;
            }
            PdfDictionary toOcProperties = toDocument.getCatalog().fillAndGetOcPropertiesDictionary();
            PdfDictionary fromOcProperties = fromDocument.getCatalog().getPdfObject().getAsDictionary(PdfName.OCProperties);
            copyOCGs(fromOcgsToCopy, toOcProperties, toDocument);
            copyDDictionary(fromOcgsToCopy, fromOcProperties.getAsDictionary(PdfName.D), toOcProperties, toDocument);
        } catch (Exception ex) {
            LOGGER.error(MessageFormatUtil.format(IoLogMessageConstant.OCG_COPYING_ERROR, ex.toString()));
        }
    }

    private static Set<PdfIndirectReference> getAllUsedNonFlushedOCGs(Map<PdfPage, PdfPage> page2page, PdfDictionary toOcProperties) {
        PdfPage[] fromPages;
        Set<PdfIndirectReference> fromUsedOcgs = new LinkedHashSet<>();
        PdfPage[] fromPages2 = (PdfPage[]) page2page.keySet().toArray(new PdfPage[0]);
        PdfPage[] toPages = (PdfPage[]) page2page.values().toArray(new PdfPage[0]);
        int i = 0;
        while (i < toPages.length) {
            PdfPage fromPage = fromPages2[i];
            PdfPage toPage = toPages[i];
            List<PdfAnnotation> toAnnotations = toPage.getAnnotations();
            List<PdfAnnotation> fromAnnotations = fromPage.getAnnotations();
            int j = 0;
            while (j < toAnnotations.size()) {
                if (toAnnotations.get(j).isFlushed()) {
                    fromPages = fromPages2;
                } else {
                    PdfDictionary toAnnotDict = toAnnotations.get(j).getPdfObject();
                    PdfDictionary fromAnnotDict = fromAnnotations.get(j).getPdfObject();
                    PdfAnnotation toAnnot = toAnnotations.get(j);
                    PdfAnnotation fromAnnot = fromAnnotations.get(j);
                    if (toAnnotDict.isFlushed()) {
                        fromPages = fromPages2;
                    } else {
                        getUsedNonFlushedOCGsFromOcDict(toAnnotDict.getAsDictionary(PdfName.OC), fromAnnotDict.getAsDictionary(PdfName.OC), fromUsedOcgs, toOcProperties);
                        fromPages = fromPages2;
                        getUsedNonFlushedOCGsFromXObject(toAnnot.getNormalAppearanceObject(), fromAnnot.getNormalAppearanceObject(), fromUsedOcgs, toOcProperties, new HashSet());
                        getUsedNonFlushedOCGsFromXObject(toAnnot.getRolloverAppearanceObject(), fromAnnot.getRolloverAppearanceObject(), fromUsedOcgs, toOcProperties, new HashSet());
                        getUsedNonFlushedOCGsFromXObject(toAnnot.getDownAppearanceObject(), fromAnnot.getDownAppearanceObject(), fromUsedOcgs, toOcProperties, new HashSet());
                    }
                }
                j++;
                fromPages2 = fromPages;
            }
            PdfPage[] fromPages3 = fromPages2;
            PdfDictionary toResources = toPage.getPdfObject().getAsDictionary(PdfName.Resources);
            PdfDictionary fromResources = fromPage.getPdfObject().getAsDictionary(PdfName.Resources);
            getUsedNonFlushedOCGsFromResources(toResources, fromResources, fromUsedOcgs, toOcProperties, new HashSet());
            i++;
            fromPages2 = fromPages3;
        }
        return fromUsedOcgs;
    }

    private static void getUsedNonFlushedOCGsFromResources(PdfDictionary toResources, PdfDictionary fromResources, Set<PdfIndirectReference> fromUsedOcgs, PdfDictionary toOcProperties, Set<PdfObject> visitedObjects) {
        if (toResources != null && !toResources.isFlushed()) {
            PdfDictionary toProperties = toResources.getAsDictionary(PdfName.Properties);
            PdfDictionary fromProperties = fromResources.getAsDictionary(PdfName.Properties);
            if (toProperties != null && !toProperties.isFlushed()) {
                for (PdfName name : toProperties.keySet()) {
                    PdfObject toCurrObj = toProperties.get(name);
                    PdfObject fromCurrObj = fromProperties.get(name);
                    getUsedNonFlushedOCGsFromOcDict(toCurrObj, fromCurrObj, fromUsedOcgs, toOcProperties);
                }
            }
            PdfDictionary toXObject = toResources.getAsDictionary(PdfName.XObject);
            PdfDictionary fromXObject = fromResources.getAsDictionary(PdfName.XObject);
            getUsedNonFlushedOCGsFromXObject(toXObject, fromXObject, fromUsedOcgs, toOcProperties, visitedObjects);
        }
    }

    private static void getUsedNonFlushedOCGsFromXObject(PdfDictionary toXObject, PdfDictionary fromXObject, Set<PdfIndirectReference> fromUsedOcgs, PdfDictionary toOcProperties, Set<PdfObject> visitedObjects) {
        if (visitedObjects.contains(fromXObject)) {
            return;
        }
        visitedObjects.add(fromXObject);
        if (toXObject != null && !toXObject.isFlushed()) {
            if (toXObject.isStream() && !toXObject.isFlushed()) {
                PdfStream toStream = (PdfStream) toXObject;
                PdfStream fromStream = (PdfStream) fromXObject;
                getUsedNonFlushedOCGsFromOcDict(toStream.getAsDictionary(PdfName.OC), fromStream.getAsDictionary(PdfName.OC), fromUsedOcgs, toOcProperties);
                getUsedNonFlushedOCGsFromResources(toStream.getAsDictionary(PdfName.Resources), fromStream.getAsDictionary(PdfName.Resources), fromUsedOcgs, toOcProperties, visitedObjects);
                return;
            }
            for (PdfName name : toXObject.keySet()) {
                PdfObject toCurrObj = toXObject.get(name);
                PdfObject fromCurrObj = fromXObject.get(name);
                if (toCurrObj.isStream() && !toCurrObj.isFlushed()) {
                    getUsedNonFlushedOCGsFromXObject((PdfStream) toCurrObj, (PdfStream) fromCurrObj, fromUsedOcgs, toOcProperties, visitedObjects);
                }
            }
        }
    }

    private static void getUsedNonFlushedOCGsFromOcDict(PdfObject toObj, PdfObject fromObj, Set<PdfIndirectReference> fromUsedOcgs, PdfDictionary toOcProperties) {
        if (toObj != null && toObj.isDictionary() && !toObj.isFlushed()) {
            PdfDictionary toCurrDict = (PdfDictionary) toObj;
            PdfDictionary fromCurrDict = (PdfDictionary) fromObj;
            PdfName typeName = toCurrDict.getAsName(PdfName.Type);
            if (PdfName.OCG.equals(typeName) && !ocgAlreadyInOCGs(toCurrDict.getIndirectReference(), toOcProperties)) {
                fromUsedOcgs.add(fromCurrDict.getIndirectReference());
            } else if (PdfName.OCMD.equals(typeName)) {
                PdfArray toOcgs = null;
                PdfArray fromOcgs = null;
                if (toCurrDict.getAsDictionary(PdfName.OCGs) != null) {
                    toOcgs = new PdfArray();
                    toOcgs.add(toCurrDict.getAsDictionary(PdfName.OCGs));
                    fromOcgs = new PdfArray();
                    fromOcgs.add(fromCurrDict.getAsDictionary(PdfName.OCGs));
                } else if (toCurrDict.getAsArray(PdfName.OCGs) != null) {
                    toOcgs = toCurrDict.getAsArray(PdfName.OCGs);
                    fromOcgs = fromCurrDict.getAsArray(PdfName.OCGs);
                }
                if (toOcgs != null && !toOcgs.isFlushed()) {
                    for (int i = 0; i < toOcgs.size(); i++) {
                        getUsedNonFlushedOCGsFromOcDict(toOcgs.get(i), fromOcgs.get(i), fromUsedOcgs, toOcProperties);
                    }
                }
            }
        }
    }

    private static void copyOCGs(Set<PdfIndirectReference> fromOcgsToCopy, PdfDictionary toOcProperties, PdfDocument toDocument) {
        Set<String> layerNames = new HashSet<>();
        if (toOcProperties.getAsArray(PdfName.OCGs) != null) {
            PdfArray toOcgs = toOcProperties.getAsArray(PdfName.OCGs);
            Iterator<PdfObject> it = toOcgs.iterator();
            while (it.hasNext()) {
                PdfObject toOcgObj = it.next();
                if (toOcgObj.isDictionary()) {
                    layerNames.add(((PdfDictionary) toOcgObj).getAsString(PdfName.Name).toUnicodeString());
                }
            }
        }
        boolean hasConflictingNames = false;
        for (PdfIndirectReference fromOcgRef : fromOcgsToCopy) {
            PdfDictionary toOcg = (PdfDictionary) fromOcgRef.getRefersTo().copyTo(toDocument, false);
            String currentLayerName = toOcg.getAsString(PdfName.Name).toUnicodeString();
            if (layerNames.contains(currentLayerName)) {
                hasConflictingNames = true;
                int i = 0;
                while (layerNames.contains(currentLayerName + "_" + i)) {
                    i++;
                }
                toOcg.put(PdfName.Name, new PdfString(currentLayerName + "_" + i, PdfEncodings.UNICODE_BIG));
            }
            if (toOcProperties.getAsArray(PdfName.OCGs) == null) {
                toOcProperties.put(PdfName.OCGs, new PdfArray());
            }
            toOcProperties.getAsArray(PdfName.OCGs).add(toOcg);
        }
        if (hasConflictingNames) {
            LOGGER.warn(IoLogMessageConstant.DOCUMENT_HAS_CONFLICTING_OCG_NAMES);
        }
    }

    private static boolean ocgAlreadyInOCGs(PdfIndirectReference toOcgRef, PdfDictionary toOcProperties) {
        PdfArray toOcgs;
        if (toOcProperties != null && (toOcgs = toOcProperties.getAsArray(PdfName.OCGs)) != null) {
            Iterator<PdfObject> it = toOcgs.iterator();
            while (it.hasNext()) {
                PdfObject toOcg = it.next();
                if (toOcgRef.equals(toOcg.getIndirectReference())) {
                    return true;
                }
            }
        }
        return false;
    }

    private static void copyDDictionary(Set<PdfIndirectReference> fromOcgsToCopy, PdfDictionary fromDDict, PdfDictionary toOcProperties, PdfDocument toDocument) {
        if (toOcProperties.getAsDictionary(PdfName.D) == null) {
            toOcProperties.put(PdfName.D, new PdfDictionary());
        }
        PdfDictionary toDDict = toOcProperties.getAsDictionary(PdfName.D);
        copyDStringField(PdfName.Name, fromDDict, toDDict);
        toDDict.remove(PdfName.Creator);
        copyDNameField(PdfName.BaseState, fromDDict, toDDict);
        copyDArrayField(PdfName.ON, fromOcgsToCopy, fromDDict, toDDict, toDocument);
        copyDArrayField(PdfName.OFF, fromOcgsToCopy, fromDDict, toDDict, toDocument);
        copyDNameField(PdfName.Intent, fromDDict, toDDict);
        copyDArrayField(PdfName.Order, fromOcgsToCopy, fromDDict, toDDict, toDocument);
        copyDNameField(PdfName.ListMode, fromDDict, toDDict);
        copyDArrayField(PdfName.RBGroups, fromOcgsToCopy, fromDDict, toDDict, toDocument);
        copyDArrayField(PdfName.Locked, fromOcgsToCopy, fromDDict, toDDict, toDocument);
    }

    private static void attemptToAddObjectToArray(Set<PdfIndirectReference> fromOcgsToCopy, PdfObject fromObj, PdfArray toArray, PdfDocument toDocument) {
        PdfIndirectReference fromObjRef = fromObj.getIndirectReference();
        if (fromObjRef != null && fromOcgsToCopy.contains(fromObjRef)) {
            toArray.add(fromObj.copyTo(toDocument, false));
        }
    }

    private static void copyDNameField(PdfName fieldToCopy, PdfDictionary fromDict, PdfDictionary toDict) {
        PdfName fromName = fromDict.getAsName(fieldToCopy);
        if (fromName == null || toDict.getAsName(fieldToCopy) != null) {
            return;
        }
        if (PdfOCProperties.checkDDictonaryFieldValue(fieldToCopy, fromName)) {
            toDict.put(fieldToCopy, fromName);
            return;
        }
        Logger logger = LoggerFactory.getLogger(OcgPropertiesCopier.class);
        String warnText = MessageFormatUtil.format(KernelLogMessageConstant.INVALID_DDICTIONARY_FIELD_VALUE, fieldToCopy, fromName);
        logger.warn(warnText);
    }

    private static void copyDStringField(PdfName fieldToCopy, PdfDictionary fromDict, PdfDictionary toDict) {
        PdfString fromString = fromDict.getAsString(fieldToCopy);
        if (fromString == null || toDict.getAsString(fieldToCopy) != null) {
            return;
        }
        if (PdfOCProperties.checkDDictonaryFieldValue(fieldToCopy, fromString)) {
            toDict.put(fieldToCopy, fromString);
            return;
        }
        Logger logger = LoggerFactory.getLogger(OcgPropertiesCopier.class);
        String warnText = MessageFormatUtil.format(KernelLogMessageConstant.INVALID_DDICTIONARY_FIELD_VALUE, fieldToCopy, fromString);
        logger.warn(warnText);
    }

    private static void copyDArrayField(PdfName fieldToCopy, Set<PdfIndirectReference> fromOcgsToCopy, PdfDictionary fromDict, PdfDictionary toDict, PdfDocument toDocument) {
        PdfArray toArray;
        if (fromDict.getAsArray(fieldToCopy) == null) {
            return;
        }
        PdfArray fromArray = fromDict.getAsArray(fieldToCopy);
        if (toDict.getAsArray(fieldToCopy) == null) {
            toDict.put(fieldToCopy, new PdfArray());
        }
        PdfArray toArray2 = toDict.getAsArray(fieldToCopy);
        Set<PdfIndirectReference> toOcgsToCopy = new HashSet<>();
        for (PdfIndirectReference fromRef : fromOcgsToCopy) {
            toOcgsToCopy.add(fromRef.getRefersTo().copyTo(toDocument, false).getIndirectReference());
        }
        if (PdfName.Order.equals(fieldToCopy)) {
            List<Integer> removeIndex = new ArrayList<>();
            int i = 0;
            while (i < toArray2.size()) {
                PdfObject toOrderItem = toArray2.get(i);
                PdfArray toArray3 = toArray2;
                Set<PdfIndirectReference> toOcgsToCopy2 = toOcgsToCopy;
                if (orderBranchContainsSetElements(toOrderItem, toArray2, i, toOcgsToCopy, null, null)) {
                    removeIndex.add(Integer.valueOf(i));
                }
                i++;
                toArray2 = toArray3;
                toOcgsToCopy = toOcgsToCopy2;
            }
            toArray = toArray2;
            for (int i2 = removeIndex.size() - 1; i2 > -1; i2--) {
                toArray.remove(removeIndex.get(i2).intValue());
            }
            PdfArray toOcgs = toDocument.getCatalog().getPdfObject().getAsDictionary(PdfName.OCProperties).getAsArray(PdfName.OCGs);
            int i3 = 0;
            while (i3 < fromArray.size()) {
                PdfObject fromOrderItem = fromArray.get(i3);
                Set<PdfIndirectReference> fromOcgsToCopy2 = fromOcgsToCopy;
                PdfDocument toDocument2 = toDocument;
                if (orderBranchContainsSetElements(fromOrderItem, fromArray, i3, fromOcgsToCopy2, toOcgs, toDocument2)) {
                    toArray.add(fromOrderItem.copyTo(toDocument2, false));
                }
                i3++;
                fromOcgsToCopy = fromOcgsToCopy2;
                toDocument = toDocument2;
            }
        } else {
            toArray = toArray2;
            if (PdfName.RBGroups.equals(fieldToCopy)) {
                for (int i4 = toArray.size() - 1; i4 > -1; i4--) {
                    PdfArray toRbGroup = (PdfArray) toArray.get(i4);
                    Iterator<PdfObject> it = toRbGroup.iterator();
                    while (true) {
                        if (it.hasNext()) {
                            PdfObject toRbGroupItemObj = it.next();
                            if (toOcgsToCopy.contains(toRbGroupItemObj.getIndirectReference())) {
                                toArray.remove(i4);
                                break;
                            }
                        }
                    }
                }
                Iterator<PdfObject> it2 = fromArray.iterator();
                while (it2.hasNext()) {
                    PdfObject fromRbGroupObj = it2.next();
                    PdfArray fromRbGroup = (PdfArray) fromRbGroupObj;
                    Iterator<PdfObject> it3 = fromRbGroup.iterator();
                    while (true) {
                        if (it3.hasNext()) {
                            PdfObject fromRbGroupItemObj = it3.next();
                            if (fromOcgsToCopy.contains(fromRbGroupItemObj.getIndirectReference())) {
                                toArray.add(fromRbGroup.copyTo(toDocument, false));
                                break;
                            }
                        }
                    }
                }
            } else {
                Iterator<PdfObject> it4 = fromArray.iterator();
                while (it4.hasNext()) {
                    PdfObject fromObj = it4.next();
                    attemptToAddObjectToArray(fromOcgsToCopy, fromObj, toArray, toDocument);
                }
            }
        }
        if (toArray.isEmpty()) {
            toDict.remove(fieldToCopy);
        }
    }

    private static boolean orderBranchContainsSetElements(PdfObject arrayObj, PdfArray array, int currentIndex, Set<PdfIndirectReference> ocgs, PdfArray toOcgs, PdfDocument toDocument) {
        if (!arrayObj.isDictionary()) {
            PdfArray toOcgs2 = toOcgs;
            if (arrayObj.isArray()) {
                PdfDocument toDocument2 = toDocument;
                Set<PdfIndirectReference> ocgs2 = ocgs;
                PdfArray arrayItem = (PdfArray) arrayObj;
                int i = 0;
                while (i < arrayItem.size()) {
                    PdfObject obj = arrayItem.get(i);
                    PdfArray toOcgs3 = toOcgs2;
                    int i2 = i;
                    boolean orderBranchContainsSetElements = orderBranchContainsSetElements(obj, arrayItem, i2, ocgs2, toOcgs3, toDocument2);
                    PdfArray arrayItem2 = arrayItem;
                    Set<PdfIndirectReference> ocgs3 = ocgs2;
                    toOcgs2 = toOcgs3;
                    PdfDocument toDocument3 = toDocument2;
                    if (orderBranchContainsSetElements) {
                        return true;
                    }
                    i = i2 + 1;
                    toDocument2 = toDocument3;
                    ocgs2 = ocgs3;
                    arrayItem = arrayItem2;
                }
                PdfArray arrayItem3 = arrayItem;
                Set<PdfIndirectReference> ocgs4 = ocgs2;
                if (!arrayItem3.isEmpty() && !arrayItem3.get(0).isString() && currentIndex > 0 && array.get(currentIndex - 1).isDictionary()) {
                    PdfDictionary previousDict = (PdfDictionary) array.get(currentIndex - 1);
                    return ocgs4.contains(previousDict.getIndirectReference());
                }
            }
        } else if (ocgs.contains(arrayObj.getIndirectReference())) {
            return true;
        } else {
            if (currentIndex < array.size() - 1 && array.get(currentIndex + 1).isArray()) {
                PdfArray nextArray = array.getAsArray(currentIndex + 1);
                if (!nextArray.get(0).isString()) {
                    boolean result = orderBranchContainsSetElements(nextArray, array, currentIndex + 1, ocgs, toOcgs, toDocument);
                    if (result && toOcgs != null && !ocgs.contains(arrayObj.getIndirectReference())) {
                        toOcgs.add(arrayObj.copyTo(toDocument, false));
                    }
                    return result;
                }
            }
        }
        return false;
    }
}
