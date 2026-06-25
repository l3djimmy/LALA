package com.hardlineforge.lala.ui.viewmodel;

import com.hardlineforge.lala.ui.viewmodel.LalaViewModel_HiltModules;
import dagger.internal.Factory;
/* loaded from: classes4.dex */
public final class LalaViewModel_HiltModules_KeyModule_ProvideFactory implements Factory<Boolean> {
    @Override // javax.inject.Provider, jakarta.inject.Provider
    public Boolean get() {
        return Boolean.valueOf(provide());
    }

    public static LalaViewModel_HiltModules_KeyModule_ProvideFactory create() {
        return InstanceHolder.INSTANCE;
    }

    public static boolean provide() {
        return LalaViewModel_HiltModules.KeyModule.provide();
    }

    /* loaded from: classes4.dex */
    private static final class InstanceHolder {
        static final LalaViewModel_HiltModules_KeyModule_ProvideFactory INSTANCE = new LalaViewModel_HiltModules_KeyModule_ProvideFactory();

        private InstanceHolder() {
        }
    }
}
