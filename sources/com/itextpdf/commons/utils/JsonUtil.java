package com.itextpdf.commons.utils;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.core.util.DefaultIndenter;
import com.fasterxml.jackson.core.util.DefaultPrettyPrinter;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.itextpdf.commons.logs.CommonsLogMessageConstant;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public final class JsonUtil {
    private static final Logger LOGGER = LoggerFactory.getLogger(JsonUtil.class);

    private JsonUtil() {
    }

    public static boolean areTwoJsonObjectEquals(String expectedString, String toCompare) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode expectedObject = mapper.readTree(expectedString);
        JsonNode actualObject = mapper.readTree(toCompare);
        return actualObject.equals(expectedObject);
    }

    public static void serializeToStream(OutputStream outputStream, Object value) {
        serializeToStream(outputStream, value, new CustomPrettyPrinter());
    }

    public static String serializeToString(Object value) {
        return serializeToString(value, new CustomPrettyPrinter());
    }

    public static void serializeToMinimalStream(OutputStream outputStream, Object value) {
        serializeToStream(outputStream, value, new MinimalPrinter());
    }

    public static String serializeToMinimalString(Object value) {
        return serializeToString(value, new MinimalPrinter());
    }

    public static <T> T deserializeFromStream(InputStream content, Class<T> objectType) {
        ObjectMapper objectMapper = new ObjectMapper();
        return (T) deserializeFromStream(content, objectMapper.constructType(objectType));
    }

    public static <T> T deserializeFromStream(InputStream content, TypeReference<T> objectType) {
        ObjectMapper objectMapper = new ObjectMapper();
        return (T) deserializeFromStream(content, objectMapper.constructType(objectType));
    }

    public static <T> T deserializeFromStream(InputStream content, JavaType objectType) {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        try {
            return (T) objectMapper.readValue(content, objectType);
        } catch (IOException ex) {
            LOGGER.warn(MessageFormatUtil.format(CommonsLogMessageConstant.UNABLE_TO_DESERIALIZE_JSON, ex.getClass(), ex.getMessage()));
            return null;
        }
    }

    public static <T> T deserializeFromString(String content, Class<T> objectType) {
        ObjectMapper objectMapper = new ObjectMapper();
        return (T) deserializeFromString(content, objectMapper.constructType(objectType));
    }

    public static <T> T deserializeFromString(String content, TypeReference<T> objectType) {
        ObjectMapper objectMapper = new ObjectMapper();
        return (T) deserializeFromString(content, objectMapper.constructType(objectType));
    }

    public static <T> T deserializeFromString(String content, JavaType objectType) {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        try {
            return (T) objectMapper.readValue(content, objectType);
        } catch (JsonProcessingException ex) {
            LOGGER.warn(MessageFormatUtil.format(CommonsLogMessageConstant.UNABLE_TO_DESERIALIZE_JSON, ex.getClass(), ex.getMessage()));
            return null;
        }
    }

    private static ObjectWriter createAndConfigureObjectWriter(DefaultPrettyPrinter prettyPrinter) {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
        objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        objectMapper.disable(new JsonGenerator.Feature[]{JsonGenerator.Feature.AUTO_CLOSE_TARGET});
        return objectMapper.writer(prettyPrinter);
    }

    private static void serializeToStream(OutputStream outputStream, Object value, DefaultPrettyPrinter prettyPrinter) {
        try {
            createAndConfigureObjectWriter(prettyPrinter).writeValue(outputStream, value);
        } catch (IOException ex) {
            LOGGER.warn(MessageFormatUtil.format(CommonsLogMessageConstant.UNABLE_TO_SERIALIZE_OBJECT, ex.getClass(), ex.getMessage()));
        }
    }

    private static String serializeToString(Object value, DefaultPrettyPrinter prettyPrinter) {
        try {
            return createAndConfigureObjectWriter(prettyPrinter).writeValueAsString(value);
        } catch (JsonProcessingException ex) {
            LOGGER.warn(MessageFormatUtil.format(CommonsLogMessageConstant.UNABLE_TO_SERIALIZE_OBJECT, ex.getClass(), ex.getMessage()));
            return null;
        }
    }

    /* loaded from: classes12.dex */
    private static class CustomPrettyPrinter extends DefaultPrettyPrinter {
        public CustomPrettyPrinter() {
            this._objectFieldValueSeparatorWithSpaces = ": ";
            indentArraysWith(DefaultIndenter.SYSTEM_LINEFEED_INSTANCE.withLinefeed("\n"));
            indentObjectsWith(DefaultIndenter.SYSTEM_LINEFEED_INSTANCE.withLinefeed("\n"));
        }

        /* renamed from: createInstance */
        public DefaultPrettyPrinter m7323createInstance() {
            return new CustomPrettyPrinter();
        }
    }

    /* loaded from: classes12.dex */
    private static class MinimalPrinter extends DefaultPrettyPrinter {
        public MinimalPrinter() {
            this._objectFieldValueSeparatorWithSpaces = ":";
            indentArraysWith(new DefaultIndenter("", ""));
            indentObjectsWith(new DefaultIndenter("", ""));
        }

        /* renamed from: createInstance */
        public DefaultPrettyPrinter m7324createInstance() {
            return new MinimalPrinter();
        }
    }
}
