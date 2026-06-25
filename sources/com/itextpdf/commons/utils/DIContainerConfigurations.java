package com.itextpdf.commons.utils;
/* loaded from: classes12.dex */
public class DIContainerConfigurations {
    private static final String[] DEFAULT_CONFIGURATIONS_CLASS = {"com.itextpdf.forms.util.RegisterDefaultDiContainer"};

    private DIContainerConfigurations() {
    }

    public static void loadDefaultConfigurations() {
        String[] strArr;
        for (String defaultConfigurationClass : DEFAULT_CONFIGURATIONS_CLASS) {
            try {
                Class.forName(defaultConfigurationClass);
            } catch (ClassNotFoundException e) {
            }
        }
    }
}
