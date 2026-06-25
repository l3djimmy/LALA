package com.itextpdf.bouncycastleconnector;

import com.itextpdf.bouncycastle.BouncyCastleFactory;
import com.itextpdf.bouncycastleconnector.logs.BouncyCastleLogMessageConstant;
import com.itextpdf.bouncycastlefips.BouncyCastleFipsFactory;
import com.itextpdf.commons.bouncycastle.IBouncyCastleFactory;
import com.itextpdf.commons.utils.SystemUtil;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.function.Supplier;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public final class BouncyCastleFactoryCreator {
    private static final String FACTORY_ENVIRONMENT_VARIABLE_NAME = "ITEXT_BOUNCY_CASTLE_FACTORY_NAME";
    private static IBouncyCastleFactory factory;
    private static Map<String, Supplier<IBouncyCastleFactory>> factories = new LinkedHashMap();
    private static final Logger LOGGER = LoggerFactory.getLogger(BouncyCastleFactoryCreator.class);

    static {
        populateFactoriesMap();
        String factoryName = SystemUtil.getPropertyOrEnvironmentVariable(FACTORY_ENVIRONMENT_VARIABLE_NAME);
        Supplier<IBouncyCastleFactory> systemVariableFactoryCreator = factories.get(factoryName);
        if (systemVariableFactoryCreator != null) {
            tryCreateFactory(systemVariableFactoryCreator);
        }
        for (Supplier<IBouncyCastleFactory> factorySupplier : factories.values()) {
            if (factory != null) {
                break;
            }
            tryCreateFactory(factorySupplier);
        }
        if (factory == null) {
            LOGGER.error(BouncyCastleLogMessageConstant.BOUNCY_CASTLE_DEPENDENCY_MUST_PRESENT);
            factory = new BouncyCastleDefaultFactory();
        }
    }

    private BouncyCastleFactoryCreator() {
    }

    public static void setFactory(IBouncyCastleFactory newFactory) {
        factory = newFactory;
    }

    public static IBouncyCastleFactory getFactory() {
        return factory;
    }

    private static void tryCreateFactory(Supplier<IBouncyCastleFactory> factoryCreator) {
        try {
            createFactory(factoryCreator);
        } catch (NoClassDefFoundError e) {
        }
    }

    private static void createFactory(Supplier<IBouncyCastleFactory> factoryCreator) {
        factory = factoryCreator.get();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IBouncyCastleFactory lambda$populateFactoriesMap$0() {
        return new BouncyCastleFactory();
    }

    private static void populateFactoriesMap() {
        factories.put("bouncy-castle", new Supplier() { // from class: com.itextpdf.bouncycastleconnector.BouncyCastleFactoryCreator$$ExternalSyntheticLambda0
            @Override // java.util.function.Supplier
            public final Object get() {
                return BouncyCastleFactoryCreator.lambda$populateFactoriesMap$0();
            }
        });
        factories.put("bouncy-castle-fips", new Supplier() { // from class: com.itextpdf.bouncycastleconnector.BouncyCastleFactoryCreator$$ExternalSyntheticLambda1
            @Override // java.util.function.Supplier
            public final Object get() {
                return BouncyCastleFactoryCreator.lambda$populateFactoriesMap$1();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ IBouncyCastleFactory lambda$populateFactoriesMap$1() {
        return new BouncyCastleFipsFactory();
    }
}
