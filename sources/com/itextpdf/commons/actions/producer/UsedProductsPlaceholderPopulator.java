package com.itextpdf.commons.actions.producer;

import com.itextpdf.commons.actions.confirmations.ConfirmedEventWrapper;
import com.itextpdf.commons.exceptions.CommonsExceptionMessageConstant;
import com.itextpdf.commons.utils.MessageFormatUtil;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes12.dex */
class UsedProductsPlaceholderPopulator extends AbstractFormattedPlaceholderPopulator {
    private static final String PRODUCTS_SEPARATOR = ", ";
    private static final char PRODUCT_NAME = 'P';
    private static final char USAGE_TYPE = 'T';
    private static final char VERSION = 'V';

    @Override // com.itextpdf.commons.actions.producer.IPlaceholderPopulator
    public String populate(List<ConfirmedEventWrapper> events, String parameter) {
        if (parameter == null) {
            throw new IllegalArgumentException(MessageFormatUtil.format(CommonsExceptionMessageConstant.INVALID_USAGE_FORMAT_REQUIRED, "usedProducts"));
        }
        Set<ProductRepresentation> usedProducts = new LinkedHashSet<>();
        for (ConfirmedEventWrapper event : events) {
            usedProducts.add(new ProductRepresentation(event));
        }
        Set<String> usedProductsRepresentations = new LinkedHashSet<>();
        for (ProductRepresentation representation : usedProducts) {
            usedProductsRepresentations.add(formatProduct(representation, parameter));
        }
        StringBuilder result = new StringBuilder();
        for (String stringRepresentation : usedProductsRepresentations) {
            if (result.length() > 0) {
                result.append(PRODUCTS_SEPARATOR);
            }
            result.append(stringRepresentation);
        }
        return result.toString();
    }

    private String formatProduct(ProductRepresentation product, String format) {
        StringBuilder builder = new StringBuilder();
        char[] formatArray = format.toCharArray();
        int i = 0;
        while (i < formatArray.length) {
            if (formatArray[i] == '\'') {
                i = attachQuotedString(i, builder, formatArray);
            } else if (isLetter(formatArray[i])) {
                builder.append(formatLetter(formatArray[i], product));
            } else {
                builder.append(formatArray[i]);
            }
            i++;
        }
        return builder.toString();
    }

    private String formatLetter(char letter, ProductRepresentation product) {
        if (letter == 'P') {
            return product.getProductName();
        }
        if (letter == 'V') {
            return product.getVersion();
        }
        if (letter == 'T') {
            return product.getProductUsageType();
        }
        throw new IllegalArgumentException(MessageFormatUtil.format(CommonsExceptionMessageConstant.PATTERN_CONTAINS_UNEXPECTED_CHARACTER, Character.valueOf(letter)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class ProductRepresentation {
        private static final Map<String, String> PRODUCT_USAGE_TYPE_TO_HUMAN_READABLE_FORM;
        private final String productName;
        private final String productUsageType;
        private final String version;

        static {
            Map<String, String> productUsageTypeMapping = new HashMap<>();
            productUsageTypeMapping.put("nonproduction", "non-production");
            PRODUCT_USAGE_TYPE_TO_HUMAN_READABLE_FORM = Collections.unmodifiableMap(productUsageTypeMapping);
        }

        public ProductRepresentation(ConfirmedEventWrapper event) {
            this.productName = event.getEvent().getProductData().getPublicProductName();
            if (PRODUCT_USAGE_TYPE_TO_HUMAN_READABLE_FORM.containsKey(event.getProductUsageType())) {
                this.productUsageType = PRODUCT_USAGE_TYPE_TO_HUMAN_READABLE_FORM.get(event.getProductUsageType());
            } else {
                this.productUsageType = event.getProductUsageType();
            }
            this.version = event.getEvent().getProductData().getVersion();
        }

        public String getProductName() {
            return this.productName;
        }

        public String getProductUsageType() {
            return this.productUsageType;
        }

        public String getVersion() {
            return this.version;
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o == null || getClass() != o.getClass()) {
                return false;
            }
            ProductRepresentation that = (ProductRepresentation) o;
            if (getProductName() != null ? !getProductName().equals(that.getProductName()) : that.getProductName() != null) {
                return false;
            }
            if (getProductUsageType() != null ? !getProductUsageType().equals(that.getProductUsageType()) : that.getProductUsageType() != null) {
                return false;
            }
            if (getVersion() == null) {
                if (that.getVersion() == null) {
                    return true;
                }
                return false;
            }
            return getVersion().equals(that.getVersion());
        }

        public int hashCode() {
            int result = getProductName() == null ? 0 : getProductName().hashCode();
            return (((result * 31) + (getProductUsageType() == null ? 0 : getProductUsageType().hashCode())) * 31) + (getVersion() != null ? getVersion().hashCode() : 0);
        }
    }
}
