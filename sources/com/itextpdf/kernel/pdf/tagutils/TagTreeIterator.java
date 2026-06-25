package com.itextpdf.kernel.pdf.tagutils;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.pdf.tagging.IStructureNode;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
/* loaded from: classes12.dex */
public class TagTreeIterator {
    private final Set<ITagTreeIteratorHandler> handlerList;
    private final IStructureNode pointer;

    public TagTreeIterator(IStructureNode tagTreePointer) {
        if (tagTreePointer == null) {
            throw new IllegalArgumentException(MessageFormatUtil.format(KernelExceptionMessageConstant.ARG_SHOULD_NOT_BE_NULL, "tagTreepointer"));
        }
        this.pointer = tagTreePointer;
        this.handlerList = new HashSet();
    }

    public TagTreeIterator addHandler(ITagTreeIteratorHandler handler) {
        this.handlerList.add(handler);
        return this;
    }

    public void traverse() {
        traverse(this.pointer, this.handlerList);
    }

    private static void traverse(IStructureNode elem, Set<ITagTreeIteratorHandler> handlerList) {
        if (elem == null) {
            return;
        }
        for (ITagTreeIteratorHandler handler : handlerList) {
            handler.nextElement(elem);
        }
        List<IStructureNode> kids = elem.getKids();
        if (kids != null) {
            for (IStructureNode kid : kids) {
                traverse(kid, handlerList);
            }
        }
    }
}
