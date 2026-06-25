package com.itextpdf.kernel.pdf;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.MemoryLimitsAwareException;
import java.util.HashSet;
/* loaded from: classes12.dex */
public class MemoryLimitsAwareHandler {
    private static final int MAX_NUMBER_OF_ELEMENTS_IN_XREF_STRUCTURE = 50000000;
    private static final long MAX_X_OBJECTS_SIZE_PER_PAGE = 3221225472L;
    private static final int MIN_LIMIT_FOR_NUMBER_OF_ELEMENTS_IN_XREF_STRUCTURE = 500000;
    private static final int SINGLE_DECOMPRESSED_PDF_STREAM_MIN_SIZE = 21474836;
    private static final int SINGLE_SCALE_COEFFICIENT = 100;
    private static final long SUM_OF_DECOMPRESSED_PDF_STREAMS_MIN_SIZE = 107374182;
    private static final int SUM_SCALE_COEFFICIENT = 500;
    private long allMemoryUsedForDecompression;
    boolean considerCurrentPdfStream;
    private int maxNumberOfElementsInXrefStructure;
    private long maxSizeOfDecompressedPdfStreamsSum;
    private int maxSizeOfSingleDecompressedPdfStream;
    private long maxXObjectsSizePerPage;
    private long memoryUsedForCurrentPdfStreamDecompression;

    public MemoryLimitsAwareHandler() {
        this(SINGLE_DECOMPRESSED_PDF_STREAM_MIN_SIZE, SUM_OF_DECOMPRESSED_PDF_STREAMS_MIN_SIZE, MAX_NUMBER_OF_ELEMENTS_IN_XREF_STRUCTURE, MAX_X_OBJECTS_SIZE_PER_PAGE);
    }

    public MemoryLimitsAwareHandler(long documentSize) {
        this((int) calculateDefaultParameter(documentSize, 100, 21474836L), calculateDefaultParameter(documentSize, 500, SUM_OF_DECOMPRESSED_PDF_STREAMS_MIN_SIZE), calculateMaxElementsInXref(documentSize), MAX_X_OBJECTS_SIZE_PER_PAGE);
    }

    private MemoryLimitsAwareHandler(int maxSizeOfSingleDecompressedPdfStream, long maxSizeOfDecompressedPdfStreamsSum, int maxNumberOfElementsInXrefStructure, long maxXObjectsSizePerPage) {
        this.allMemoryUsedForDecompression = 0L;
        this.memoryUsedForCurrentPdfStreamDecompression = 0L;
        this.considerCurrentPdfStream = false;
        this.maxSizeOfSingleDecompressedPdfStream = maxSizeOfSingleDecompressedPdfStream;
        this.maxSizeOfDecompressedPdfStreamsSum = maxSizeOfDecompressedPdfStreamsSum;
        this.maxNumberOfElementsInXrefStructure = maxNumberOfElementsInXrefStructure;
        this.maxXObjectsSizePerPage = maxXObjectsSizePerPage;
    }

    public int getMaxSizeOfSingleDecompressedPdfStream() {
        return this.maxSizeOfSingleDecompressedPdfStream;
    }

    public MemoryLimitsAwareHandler setMaxSizeOfSingleDecompressedPdfStream(int maxSizeOfSingleDecompressedPdfStream) {
        this.maxSizeOfSingleDecompressedPdfStream = maxSizeOfSingleDecompressedPdfStream;
        return this;
    }

    public long getMaxSizeOfDecompressedPdfStreamsSum() {
        return this.maxSizeOfDecompressedPdfStreamsSum;
    }

    public MemoryLimitsAwareHandler setMaxSizeOfDecompressedPdfStreamsSum(long maxSizeOfDecompressedPdfStreamsSum) {
        this.maxSizeOfDecompressedPdfStreamsSum = maxSizeOfDecompressedPdfStreamsSum;
        return this;
    }

    public boolean isMemoryLimitsAwarenessRequiredOnDecompression(PdfArray filters) {
        HashSet<PdfName> filterSet = new HashSet<>();
        for (int index = 0; index < filters.size(); index++) {
            PdfName filterName = filters.getAsName(index);
            if (!filterSet.add(filterName)) {
                return true;
            }
        }
        return false;
    }

    public int getMaxNumberOfElementsInXrefStructure() {
        return this.maxNumberOfElementsInXrefStructure;
    }

    public long getMaxXObjectsSizePerPage() {
        return this.maxXObjectsSizePerPage;
    }

    public void setMaxXObjectsSizePerPage(long maxPageSize) {
        this.maxXObjectsSizePerPage = maxPageSize;
    }

    public void setMaxNumberOfElementsInXrefStructure(int maxNumberOfElementsInXrefStructure) {
        this.maxNumberOfElementsInXrefStructure = maxNumberOfElementsInXrefStructure;
    }

    public void checkIfXrefStructureExceedsTheLimit(int requestedCapacity) {
        if (requestedCapacity - 1 > this.maxNumberOfElementsInXrefStructure || requestedCapacity < 0) {
            throw new MemoryLimitsAwareException(KernelExceptionMessageConstant.XREF_STRUCTURE_SIZE_EXCEEDED_THE_LIMIT);
        }
    }

    public void checkIfPageSizeExceedsTheLimit(long totalXObjectsSize) {
        if (totalXObjectsSize > this.maxXObjectsSizePerPage) {
            throw new MemoryLimitsAwareException(KernelExceptionMessageConstant.TOTAL_XOBJECT_SIZE_ONE_PAGE_EXCEEDED_THE_LIMIT);
        }
    }

    protected static int calculateMaxElementsInXref(long documentSizeInBytes) {
        int documentSizeInMb = Math.max(1, Math.min(((int) documentSizeInBytes) / 1048576, 100));
        return MIN_LIMIT_FOR_NUMBER_OF_ELEMENTS_IN_XREF_STRUCTURE * documentSizeInMb;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MemoryLimitsAwareHandler considerBytesOccupiedByDecompressedPdfStream(long numOfOccupiedBytes) {
        if (this.considerCurrentPdfStream && this.memoryUsedForCurrentPdfStreamDecompression < numOfOccupiedBytes) {
            this.memoryUsedForCurrentPdfStreamDecompression = numOfOccupiedBytes;
            if (this.memoryUsedForCurrentPdfStreamDecompression > this.maxSizeOfSingleDecompressedPdfStream) {
                throw new MemoryLimitsAwareException(KernelExceptionMessageConstant.DURING_DECOMPRESSION_SINGLE_STREAM_OCCUPIED_MORE_MEMORY_THAN_ALLOWED);
            }
        }
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MemoryLimitsAwareHandler beginDecompressedPdfStreamProcessing() {
        ensureCurrentStreamIsReset();
        this.considerCurrentPdfStream = true;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MemoryLimitsAwareHandler endDecompressedPdfStreamProcessing() {
        this.allMemoryUsedForDecompression += this.memoryUsedForCurrentPdfStreamDecompression;
        if (this.allMemoryUsedForDecompression > this.maxSizeOfDecompressedPdfStreamsSum) {
            throw new MemoryLimitsAwareException(KernelExceptionMessageConstant.DURING_DECOMPRESSION_MULTIPLE_STREAMS_IN_SUM_OCCUPIED_MORE_MEMORY_THAN_ALLOWED);
        }
        ensureCurrentStreamIsReset();
        this.considerCurrentPdfStream = false;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getAllMemoryUsedForDecompression() {
        return this.allMemoryUsedForDecompression;
    }

    private static long calculateDefaultParameter(long documentSize, int scale, long min) {
        long result = scale * documentSize;
        if (result < min) {
            result = min;
        }
        if (result > scale * min) {
            return min * scale;
        }
        return result;
    }

    private void ensureCurrentStreamIsReset() {
        this.memoryUsedForCurrentPdfStreamDecompression = 0L;
    }
}
