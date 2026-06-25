package androidx.camera.view;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MediatorLiveData;
import androidx.lifecycle.Observer;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class ForwardingLiveData<T> extends MediatorLiveData<T> {
    private LiveData<T> mLiveDataSource;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Multi-variable type inference failed */
    public void setSource(LiveData<T> liveDataSource) {
        if (this.mLiveDataSource != null) {
            super.removeSource((LiveData<T>) this.mLiveDataSource);
        }
        this.mLiveDataSource = liveDataSource;
        super.addSource(liveDataSource, new Observer() { // from class: androidx.camera.view.ForwardingLiveData$$ExternalSyntheticLambda0
            @Override // androidx.lifecycle.Observer
            public final void onChanged(Object obj) {
                ForwardingLiveData.this.setValue(obj);
            }
        });
    }

    @Override // androidx.lifecycle.LiveData
    public T getValue() {
        if (this.mLiveDataSource == null) {
            return null;
        }
        return this.mLiveDataSource.getValue();
    }
}
