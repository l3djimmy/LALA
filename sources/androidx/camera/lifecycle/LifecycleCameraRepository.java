package androidx.camera.lifecycle;

import androidx.camera.core.CameraEffect;
import androidx.camera.core.UseCase;
import androidx.camera.core.ViewPort;
import androidx.camera.core.concurrent.CameraCoordinator;
import androidx.camera.core.internal.CameraUseCaseAdapter;
import androidx.core.util.Preconditions;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleObserver;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.OnLifecycleEvent;
import java.util.ArrayDeque;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
final class LifecycleCameraRepository {
    CameraCoordinator mCameraCoordinator;
    private final Object mLock = new Object();
    private final Map<Key, LifecycleCamera> mCameraMap = new HashMap();
    private final Map<LifecycleCameraRepositoryObserver, Set<Key>> mLifecycleObserverMap = new HashMap();
    private final ArrayDeque<LifecycleOwner> mActiveLifecycleOwners = new ArrayDeque<>();

    /* JADX INFO: Access modifiers changed from: package-private */
    public LifecycleCamera createLifecycleCamera(LifecycleOwner lifecycleOwner, CameraUseCaseAdapter cameraUseCaseAdaptor) {
        LifecycleCamera lifecycleCamera;
        synchronized (this.mLock) {
            Key key = Key.create(lifecycleOwner, cameraUseCaseAdaptor.getCameraId());
            Preconditions.checkArgument(this.mCameraMap.get(key) == null, "LifecycleCamera already exists for the given LifecycleOwner and set of cameras");
            if (lifecycleOwner.getLifecycle().getCurrentState() == Lifecycle.State.DESTROYED) {
                throw new IllegalArgumentException("Trying to create LifecycleCamera with destroyed lifecycle.");
            }
            lifecycleCamera = new LifecycleCamera(lifecycleOwner, cameraUseCaseAdaptor);
            if (cameraUseCaseAdaptor.getUseCases().isEmpty()) {
                lifecycleCamera.suspend();
            }
            registerCamera(lifecycleCamera);
        }
        return lifecycleCamera;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public LifecycleCamera getLifecycleCamera(LifecycleOwner lifecycleOwner, CameraUseCaseAdapter.CameraId cameraId) {
        LifecycleCamera lifecycleCamera;
        synchronized (this.mLock) {
            lifecycleCamera = this.mCameraMap.get(Key.create(lifecycleOwner, cameraId));
        }
        return lifecycleCamera;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Collection<LifecycleCamera> getLifecycleCameras() {
        Collection<LifecycleCamera> unmodifiableCollection;
        synchronized (this.mLock) {
            unmodifiableCollection = Collections.unmodifiableCollection(this.mCameraMap.values());
        }
        return unmodifiableCollection;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void clear() {
        synchronized (this.mLock) {
            Set<LifecycleCameraRepositoryObserver> keySet = new HashSet<>(this.mLifecycleObserverMap.keySet());
            for (LifecycleCameraRepositoryObserver observer : keySet) {
                unregisterLifecycle(observer.getLifecycleOwner());
            }
        }
    }

    private void registerCamera(LifecycleCamera lifecycleCamera) {
        Set<Key> lifecycleCameraKeySet;
        synchronized (this.mLock) {
            LifecycleOwner lifecycleOwner = lifecycleCamera.getLifecycleOwner();
            Key key = Key.create(lifecycleOwner, lifecycleCamera.getCameraUseCaseAdapter().getCameraId());
            LifecycleCameraRepositoryObserver observer = getLifecycleCameraRepositoryObserver(lifecycleOwner);
            if (observer != null) {
                lifecycleCameraKeySet = this.mLifecycleObserverMap.get(observer);
            } else {
                lifecycleCameraKeySet = new HashSet<>();
            }
            lifecycleCameraKeySet.add(key);
            this.mCameraMap.put(key, lifecycleCamera);
            if (observer == null) {
                LifecycleCameraRepositoryObserver observer2 = new LifecycleCameraRepositoryObserver(lifecycleOwner, this);
                this.mLifecycleObserverMap.put(observer2, lifecycleCameraKeySet);
                lifecycleOwner.getLifecycle().addObserver(observer2);
            }
        }
    }

    void unregisterLifecycle(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            LifecycleCameraRepositoryObserver observer = getLifecycleCameraRepositoryObserver(lifecycleOwner);
            if (observer == null) {
                return;
            }
            setInactive(lifecycleOwner);
            for (Key key : this.mLifecycleObserverMap.get(observer)) {
                this.mCameraMap.remove(key);
            }
            this.mLifecycleObserverMap.remove(observer);
            observer.getLifecycleOwner().getLifecycle().removeObserver(observer);
        }
    }

    private LifecycleCameraRepositoryObserver getLifecycleCameraRepositoryObserver(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            for (LifecycleCameraRepositoryObserver observer : this.mLifecycleObserverMap.keySet()) {
                if (lifecycleOwner.equals(observer.getLifecycleOwner())) {
                    return observer;
                }
            }
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void bindToLifecycleCamera(LifecycleCamera lifecycleCamera, ViewPort viewPort, List<CameraEffect> effects, Collection<UseCase> useCases, CameraCoordinator cameraCoordinator) {
        synchronized (this.mLock) {
            Preconditions.checkArgument(!useCases.isEmpty());
            this.mCameraCoordinator = cameraCoordinator;
            LifecycleOwner lifecycleOwner = lifecycleCamera.getLifecycleOwner();
            LifecycleCameraRepositoryObserver observer = getLifecycleCameraRepositoryObserver(lifecycleOwner);
            Set<Key> lifecycleCameraKeySet = this.mLifecycleObserverMap.get(observer);
            if (this.mCameraCoordinator == null || this.mCameraCoordinator.getCameraOperatingMode() != 2) {
                for (Key key : lifecycleCameraKeySet) {
                    LifecycleCamera camera = (LifecycleCamera) Preconditions.checkNotNull(this.mCameraMap.get(key));
                    if (!camera.equals(lifecycleCamera) && !camera.getUseCases().isEmpty()) {
                        throw new IllegalArgumentException("Multiple LifecycleCameras with use cases are registered to the same LifecycleOwner.");
                    }
                }
            }
            try {
                lifecycleCamera.getCameraUseCaseAdapter().setViewPort(viewPort);
                lifecycleCamera.getCameraUseCaseAdapter().setEffects(effects);
                lifecycleCamera.bind(useCases);
                if (lifecycleOwner.getLifecycle().getCurrentState().isAtLeast(Lifecycle.State.STARTED)) {
                    setActive(lifecycleOwner);
                }
            } catch (CameraUseCaseAdapter.CameraException e) {
                throw new IllegalArgumentException(e.getMessage());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void unbind(Collection<UseCase> useCases) {
        synchronized (this.mLock) {
            for (Key key : this.mCameraMap.keySet()) {
                LifecycleCamera lifecycleCamera = this.mCameraMap.get(key);
                boolean hasUseCase = !lifecycleCamera.getUseCases().isEmpty();
                lifecycleCamera.unbind(useCases);
                if (hasUseCase && lifecycleCamera.getUseCases().isEmpty()) {
                    setInactive(lifecycleCamera.getLifecycleOwner());
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void unbindAll() {
        synchronized (this.mLock) {
            for (Key key : this.mCameraMap.keySet()) {
                LifecycleCamera lifecycleCamera = this.mCameraMap.get(key);
                lifecycleCamera.unbindAll();
                setInactive(lifecycleCamera.getLifecycleOwner());
            }
        }
    }

    void setActive(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            if (hasUseCaseBound(lifecycleOwner)) {
                if (this.mActiveLifecycleOwners.isEmpty()) {
                    this.mActiveLifecycleOwners.push(lifecycleOwner);
                } else if (this.mCameraCoordinator == null || this.mCameraCoordinator.getCameraOperatingMode() != 2) {
                    LifecycleOwner currentActiveLifecycleOwner = this.mActiveLifecycleOwners.peek();
                    if (!lifecycleOwner.equals(currentActiveLifecycleOwner)) {
                        suspendUseCases(currentActiveLifecycleOwner);
                        this.mActiveLifecycleOwners.remove(lifecycleOwner);
                        this.mActiveLifecycleOwners.push(lifecycleOwner);
                    }
                }
                unsuspendUseCases(lifecycleOwner);
            }
        }
    }

    void setInactive(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            this.mActiveLifecycleOwners.remove(lifecycleOwner);
            suspendUseCases(lifecycleOwner);
            if (!this.mActiveLifecycleOwners.isEmpty()) {
                LifecycleOwner newActiveLifecycleOwner = this.mActiveLifecycleOwners.peek();
                unsuspendUseCases(newActiveLifecycleOwner);
            }
        }
    }

    private boolean hasUseCaseBound(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            LifecycleCameraRepositoryObserver observer = getLifecycleCameraRepositoryObserver(lifecycleOwner);
            if (observer == null) {
                return false;
            }
            Set<Key> lifecycleCameraKeySet = this.mLifecycleObserverMap.get(observer);
            for (Key key : lifecycleCameraKeySet) {
                if (!((LifecycleCamera) Preconditions.checkNotNull(this.mCameraMap.get(key))).getUseCases().isEmpty()) {
                    return true;
                }
            }
            return false;
        }
    }

    private void suspendUseCases(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            LifecycleCameraRepositoryObserver observer = getLifecycleCameraRepositoryObserver(lifecycleOwner);
            if (observer == null) {
                return;
            }
            for (Key key : this.mLifecycleObserverMap.get(observer)) {
                ((LifecycleCamera) Preconditions.checkNotNull(this.mCameraMap.get(key))).suspend();
            }
        }
    }

    private void unsuspendUseCases(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            LifecycleCameraRepositoryObserver observer = getLifecycleCameraRepositoryObserver(lifecycleOwner);
            for (Key key : this.mLifecycleObserverMap.get(observer)) {
                LifecycleCamera lifecycleCamera = this.mCameraMap.get(key);
                if (!((LifecycleCamera) Preconditions.checkNotNull(lifecycleCamera)).getUseCases().isEmpty()) {
                    lifecycleCamera.unsuspend();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static abstract class Key {
        public abstract CameraUseCaseAdapter.CameraId getCameraId();

        public abstract LifecycleOwner getLifecycleOwner();

        static Key create(LifecycleOwner lifecycleOwner, CameraUseCaseAdapter.CameraId cameraId) {
            return new AutoValue_LifecycleCameraRepository_Key(lifecycleOwner, cameraId);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class LifecycleCameraRepositoryObserver implements LifecycleObserver {
        private final LifecycleCameraRepository mLifecycleCameraRepository;
        private final LifecycleOwner mLifecycleOwner;

        LifecycleCameraRepositoryObserver(LifecycleOwner lifecycleOwner, LifecycleCameraRepository lifecycleCameraRepository) {
            this.mLifecycleOwner = lifecycleOwner;
            this.mLifecycleCameraRepository = lifecycleCameraRepository;
        }

        LifecycleOwner getLifecycleOwner() {
            return this.mLifecycleOwner;
        }

        @OnLifecycleEvent(Lifecycle.Event.ON_START)
        public void onStart(LifecycleOwner lifecycleOwner) {
            this.mLifecycleCameraRepository.setActive(lifecycleOwner);
        }

        @OnLifecycleEvent(Lifecycle.Event.ON_STOP)
        public void onStop(LifecycleOwner lifecycleOwner) {
            this.mLifecycleCameraRepository.setInactive(lifecycleOwner);
        }

        @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
        public void onDestroy(LifecycleOwner lifecycleOwner) {
            this.mLifecycleCameraRepository.unregisterLifecycle(lifecycleOwner);
        }
    }
}
