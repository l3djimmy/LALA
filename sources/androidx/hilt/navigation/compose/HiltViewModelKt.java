package androidx.hilt.navigation.compose;

import android.content.Context;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import androidx.hilt.navigation.HiltViewModelFactory;
import androidx.lifecycle.HasDefaultViewModelProviderFactory;
import androidx.lifecycle.ViewModel;
import androidx.lifecycle.ViewModelProvider;
import androidx.lifecycle.ViewModelStoreOwner;
import androidx.lifecycle.viewmodel.CreationExtras;
import androidx.lifecycle.viewmodel.compose.LocalViewModelStoreOwner;
import androidx.lifecycle.viewmodel.compose.ViewModelKt;
import com.itextpdf.layout.properties.Property;
import dagger.hilt.android.lifecycle.HiltViewModelExtensions;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: HiltViewModel.kt */
@Metadata(d1 = {"\u0000&\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a\u0017\u0010\u0000\u001a\u0004\u0018\u00010\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0001¢\u0006\u0002\u0010\u0004\u001a0\u0010\u0005\u001a\u0002H\u0006\"\n\b\u0000\u0010\u0006\u0018\u0001*\u00020\u00072\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tH\u0087\b¢\u0006\u0002\u0010\n\u001aN\u0010\u0005\u001a\u0002H\u0006\"\n\b\u0000\u0010\u0006\u0018\u0001*\u00020\u0007\"\u0006\b\u0001\u0010\u000b\u0018\u00012\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\u0014\b\b\u0010\f\u001a\u000e\u0012\u0004\u0012\u0002H\u000b\u0012\u0004\u0012\u0002H\u00060\rH\u0087\b¢\u0006\u0002\u0010\u000e¨\u0006\u000f"}, d2 = {"createHiltViewModelFactory", "Landroidx/lifecycle/ViewModelProvider$Factory;", "viewModelStoreOwner", "Landroidx/lifecycle/ViewModelStoreOwner;", "(Landroidx/lifecycle/ViewModelStoreOwner;Landroidx/compose/runtime/Composer;I)Landroidx/lifecycle/ViewModelProvider$Factory;", "hiltViewModel", "VM", "Landroidx/lifecycle/ViewModel;", "key", "", "(Landroidx/lifecycle/ViewModelStoreOwner;Ljava/lang/String;Landroidx/compose/runtime/Composer;II)Landroidx/lifecycle/ViewModel;", "VMF", "creationCallback", "Lkotlin/Function1;", "(Landroidx/lifecycle/ViewModelStoreOwner;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)Landroidx/lifecycle/ViewModel;", "hilt-navigation-compose_release"}, k = 2, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class HiltViewModelKt {
    public static final /* synthetic */ <VM extends ViewModel> VM hiltViewModel(ViewModelStoreOwner viewModelStoreOwner, String key, Composer $composer, int $changed, int i) {
        ViewModelStoreOwner viewModelStoreOwner2;
        $composer.startReplaceableGroup(1890788296);
        ComposerKt.sourceInformation($composer, "CC(hiltViewModel)P(1)*45@1969L7,50@2112L47,51@2171L54:HiltViewModel.kt#9mcars");
        if ((i & 1) != 0) {
            ViewModelStoreOwner viewModelStoreOwner3 = LocalViewModelStoreOwner.INSTANCE.getCurrent($composer, LocalViewModelStoreOwner.$stable);
            if (viewModelStoreOwner3 == null) {
                throw new IllegalStateException("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner".toString());
            }
            viewModelStoreOwner2 = viewModelStoreOwner3;
        } else {
            viewModelStoreOwner2 = viewModelStoreOwner;
        }
        String key2 = (i & 2) != 0 ? null : key;
        ViewModelProvider.Factory factory = createHiltViewModelFactory(viewModelStoreOwner2, $composer, $changed & 14);
        int $changed$iv = ($changed & 14) | ($changed & Property.BORDER_BOTTOM_RIGHT_RADIUS);
        $composer.startReplaceableGroup(1729797275);
        ComposerKt.sourceInformation($composer, "CC(viewModel)P(3,2,1)*80@3834L7,90@4209L68:ViewModel.kt#3tja67");
        CreationExtras extras$iv = viewModelStoreOwner2 instanceof HasDefaultViewModelProviderFactory ? ((HasDefaultViewModelProviderFactory) viewModelStoreOwner2).getDefaultViewModelCreationExtras() : CreationExtras.Empty.INSTANCE;
        Intrinsics.reifiedOperationMarker(4, "VM");
        VM vm = (VM) ViewModelKt.viewModel(ViewModel.class, viewModelStoreOwner2, key2, factory, extras$iv, $composer, (($changed$iv << 3) & 896) | 36936, 0);
        $composer.endReplaceableGroup();
        $composer.endReplaceableGroup();
        return vm;
    }

    public static final /* synthetic */ <VM extends ViewModel, VMF> VM hiltViewModel(ViewModelStoreOwner viewModelStoreOwner, String key, Function1<? super VMF, ? extends VM> function1, Composer $composer, int $changed, int i) {
        ViewModelStoreOwner viewModelStoreOwner2;
        $composer.startReplaceableGroup(-83599083);
        ComposerKt.sourceInformation($composer, "CC(hiltViewModel)P(2,1)*68@2969L7,74@3156L47,75@3215L430:HiltViewModel.kt#9mcars");
        if ((i & 1) != 0) {
            ViewModelStoreOwner viewModelStoreOwner3 = LocalViewModelStoreOwner.INSTANCE.getCurrent($composer, LocalViewModelStoreOwner.$stable);
            if (viewModelStoreOwner3 == null) {
                throw new IllegalStateException("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner".toString());
            }
            viewModelStoreOwner2 = viewModelStoreOwner3;
        } else {
            viewModelStoreOwner2 = viewModelStoreOwner;
        }
        String key2 = (i & 2) != 0 ? null : key;
        ViewModelProvider.Factory factory = createHiltViewModelFactory(viewModelStoreOwner2, $composer, $changed & 14);
        ViewModelStoreOwner $this$hiltViewModel_u24lambda_u242 = viewModelStoreOwner2;
        CreationExtras extras$iv = $this$hiltViewModel_u24lambda_u242 instanceof HasDefaultViewModelProviderFactory ? HiltViewModelExtensions.withCreationCallback(((HasDefaultViewModelProviderFactory) $this$hiltViewModel_u24lambda_u242).getDefaultViewModelCreationExtras(), function1) : HiltViewModelExtensions.withCreationCallback(CreationExtras.Empty.INSTANCE, function1);
        int $changed$iv = ($changed & 14) | ($changed & Property.BORDER_BOTTOM_RIGHT_RADIUS);
        $composer.startReplaceableGroup(1729797275);
        ComposerKt.sourceInformation($composer, "CC(viewModel)P(3,2,1)*80@3834L7,90@4209L68:ViewModel.kt#3tja67");
        Intrinsics.reifiedOperationMarker(4, "VM");
        VM vm = (VM) ViewModelKt.viewModel(ViewModel.class, viewModelStoreOwner2, key2, factory, extras$iv, $composer, (($changed$iv << 3) & 896) | 36936, 0);
        $composer.endReplaceableGroup();
        $composer.endReplaceableGroup();
        return vm;
    }

    public static final ViewModelProvider.Factory createHiltViewModelFactory(ViewModelStoreOwner viewModelStoreOwner, Composer $composer, int $changed) {
        ViewModelProvider.Factory factory;
        $composer.startReplaceableGroup(1770922558);
        ComposerKt.sourceInformation($composer, "C(createHiltViewModelFactory)95@3915L7:HiltViewModel.kt#9mcars");
        if (!(viewModelStoreOwner instanceof HasDefaultViewModelProviderFactory)) {
            factory = null;
        } else {
            ComposerKt.sourceInformationMarkerStart($composer, 103361330, "C:CompositionLocal.kt#9igjgp");
            Object consume = $composer.consume(AndroidCompositionLocals_androidKt.getLocalContext());
            ComposerKt.sourceInformationMarkerEnd($composer);
            factory = HiltViewModelFactory.create((Context) consume, ((HasDefaultViewModelProviderFactory) viewModelStoreOwner).getDefaultViewModelProviderFactory());
        }
        $composer.endReplaceableGroup();
        return factory;
    }
}
