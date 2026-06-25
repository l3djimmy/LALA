package com.hardlineforge.lala.ui.viewmodel;

import androidx.lifecycle.ViewModel;
import dagger.Binds;
import dagger.Module;
import dagger.Provides;
import dagger.multibindings.IntoMap;
import dagger.multibindings.LazyClassKey;
/* loaded from: classes4.dex */
public final class LalaViewModel_HiltModules {
    private LalaViewModel_HiltModules() {
    }

    @Module
    /* loaded from: classes4.dex */
    public static abstract class BindsModule {
        @LazyClassKey(LalaViewModel.class)
        @Binds
        @IntoMap
        public abstract ViewModel binds(LalaViewModel vm);

        private BindsModule() {
        }
    }

    @Module
    /* loaded from: classes4.dex */
    public static final class KeyModule {
        private KeyModule() {
        }

        @Provides
        @LazyClassKey(LalaViewModel.class)
        @IntoMap
        public static boolean provide() {
            return true;
        }
    }
}
