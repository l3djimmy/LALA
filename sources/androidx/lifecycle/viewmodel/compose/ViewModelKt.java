package androidx.lifecycle.viewmodel.compose;

import androidx.compose.runtime.Composer;
import androidx.lifecycle.ViewModel;
import androidx.lifecycle.ViewModelProvider;
import androidx.lifecycle.ViewModelStoreOwner;
import androidx.lifecycle.viewmodel.CreationExtras;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.reflect.KClass;
@Metadata(d1 = {"androidx/lifecycle/viewmodel/compose/ViewModelKt__ViewModelKt", "androidx/lifecycle/viewmodel/compose/ViewModelKt__ViewModel_androidKt"}, k = 4, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class ViewModelKt {
    public static final <VM extends ViewModel> VM get(ViewModelStoreOwner $this$get, KClass<VM> kClass, String key, ViewModelProvider.Factory factory, CreationExtras extras) {
        return (VM) ViewModelKt__ViewModelKt.get($this$get, kClass, key, factory, extras);
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Superseded by viewModel that takes CreationExtras")
    public static final /* synthetic */ <VM extends ViewModel> VM viewModel(ViewModelStoreOwner viewModelStoreOwner, String key, ViewModelProvider.Factory factory, Composer $composer, int $changed, int i) {
        return (VM) ViewModelKt__ViewModel_androidKt.viewModel(viewModelStoreOwner, key, factory, $composer, $changed, i);
    }

    public static final /* synthetic */ <VM extends ViewModel> VM viewModel(ViewModelStoreOwner viewModelStoreOwner, String key, ViewModelProvider.Factory factory, CreationExtras extras, Composer $composer, int $changed, int i) {
        return (VM) ViewModelKt__ViewModelKt.viewModel(viewModelStoreOwner, key, factory, extras, $composer, $changed, i);
    }

    public static final /* synthetic */ <VM extends ViewModel> VM viewModel(ViewModelStoreOwner viewModelStoreOwner, String key, Function1<? super CreationExtras, ? extends VM> function1, Composer $composer, int $changed, int i) {
        return (VM) ViewModelKt__ViewModelKt.viewModel(viewModelStoreOwner, key, function1, $composer, $changed, i);
    }

    public static final <VM extends ViewModel> VM viewModel(Class<VM> cls, ViewModelStoreOwner viewModelStoreOwner, String key, ViewModelProvider.Factory factory, CreationExtras extras, Composer $composer, int $changed, int i) {
        return (VM) ViewModelKt__ViewModel_androidKt.viewModel(cls, viewModelStoreOwner, key, factory, extras, $composer, $changed, i);
    }

    public static final <VM extends ViewModel> VM viewModel(KClass<VM> kClass, ViewModelStoreOwner viewModelStoreOwner, String key, ViewModelProvider.Factory factory, CreationExtras extras, Composer $composer, int $changed, int i) {
        return (VM) ViewModelKt__ViewModelKt.viewModel(kClass, viewModelStoreOwner, key, factory, extras, $composer, $changed, i);
    }
}
