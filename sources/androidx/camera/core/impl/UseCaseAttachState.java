package androidx.camera.core.impl;

import androidx.camera.core.Logger;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.UseCaseAttachState;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public final class UseCaseAttachState {
    private static final String TAG = "UseCaseAttachState";
    private final Map<String, UseCaseAttachInfo> mAttachedUseCasesToInfoMap = new LinkedHashMap();
    private final String mCameraId;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public interface AttachStateFilter {
        boolean filter(UseCaseAttachInfo useCaseAttachInfo);
    }

    public UseCaseAttachState(String cameraId) {
        this.mCameraId = cameraId;
    }

    public void setUseCaseActive(String useCaseId, SessionConfig sessionConfig, UseCaseConfig<?> useCaseConfig) {
        UseCaseAttachInfo useCaseAttachInfo = getOrCreateUseCaseAttachInfo(useCaseId, sessionConfig, useCaseConfig);
        useCaseAttachInfo.setActive(true);
    }

    public void setUseCaseInactive(String useCaseId) {
        if (!this.mAttachedUseCasesToInfoMap.containsKey(useCaseId)) {
            return;
        }
        UseCaseAttachInfo useCaseAttachInfo = this.mAttachedUseCasesToInfoMap.get(useCaseId);
        useCaseAttachInfo.setActive(false);
        if (!useCaseAttachInfo.getAttached()) {
            this.mAttachedUseCasesToInfoMap.remove(useCaseId);
        }
    }

    public void setUseCaseAttached(String useCaseId, SessionConfig sessionConfig, UseCaseConfig<?> userCaseConfig) {
        UseCaseAttachInfo useCaseAttachInfo = getOrCreateUseCaseAttachInfo(useCaseId, sessionConfig, userCaseConfig);
        useCaseAttachInfo.setAttached(true);
    }

    public void setUseCaseDetached(String useCaseId) {
        if (!this.mAttachedUseCasesToInfoMap.containsKey(useCaseId)) {
            return;
        }
        UseCaseAttachInfo useCaseAttachInfo = this.mAttachedUseCasesToInfoMap.get(useCaseId);
        useCaseAttachInfo.setAttached(false);
        if (!useCaseAttachInfo.getActive()) {
            this.mAttachedUseCasesToInfoMap.remove(useCaseId);
        }
    }

    public boolean isUseCaseAttached(String useCaseId) {
        if (!this.mAttachedUseCasesToInfoMap.containsKey(useCaseId)) {
            return false;
        }
        UseCaseAttachInfo useCaseAttachInfo = this.mAttachedUseCasesToInfoMap.get(useCaseId);
        return useCaseAttachInfo.getAttached();
    }

    public Collection<UseCaseConfig<?>> getAttachedUseCaseConfigs() {
        return Collections.unmodifiableCollection(getUseCaseConfigs(new AttachStateFilter() { // from class: androidx.camera.core.impl.UseCaseAttachState$$ExternalSyntheticLambda1
            @Override // androidx.camera.core.impl.UseCaseAttachState.AttachStateFilter
            public final boolean filter(UseCaseAttachState.UseCaseAttachInfo useCaseAttachInfo) {
                boolean attached;
                attached = useCaseAttachInfo.getAttached();
                return attached;
            }
        }));
    }

    public Collection<SessionConfig> getAttachedSessionConfigs() {
        return Collections.unmodifiableCollection(getSessionConfigs(new AttachStateFilter() { // from class: androidx.camera.core.impl.UseCaseAttachState$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.impl.UseCaseAttachState.AttachStateFilter
            public final boolean filter(UseCaseAttachState.UseCaseAttachInfo useCaseAttachInfo) {
                boolean attached;
                attached = useCaseAttachInfo.getAttached();
                return attached;
            }
        }));
    }

    public Collection<SessionConfig> getActiveAndAttachedSessionConfigs() {
        return Collections.unmodifiableCollection(getSessionConfigs(new AttachStateFilter() { // from class: androidx.camera.core.impl.UseCaseAttachState$$ExternalSyntheticLambda2
            @Override // androidx.camera.core.impl.UseCaseAttachState.AttachStateFilter
            public final boolean filter(UseCaseAttachState.UseCaseAttachInfo useCaseAttachInfo) {
                return UseCaseAttachState.lambda$getActiveAndAttachedSessionConfigs$2(useCaseAttachInfo);
            }
        }));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ boolean lambda$getActiveAndAttachedSessionConfigs$2(UseCaseAttachInfo useCaseAttachInfo) {
        return useCaseAttachInfo.getActive() && useCaseAttachInfo.getAttached();
    }

    public void updateUseCase(String useCaseId, SessionConfig sessionConfig, UseCaseConfig<?> useCaseConfig) {
        if (!this.mAttachedUseCasesToInfoMap.containsKey(useCaseId)) {
            return;
        }
        UseCaseAttachInfo newUseCaseAttachInfo = new UseCaseAttachInfo(sessionConfig, useCaseConfig);
        UseCaseAttachInfo oldUseCaseAttachInfo = this.mAttachedUseCasesToInfoMap.get(useCaseId);
        newUseCaseAttachInfo.setAttached(oldUseCaseAttachInfo.getAttached());
        newUseCaseAttachInfo.setActive(oldUseCaseAttachInfo.getActive());
        this.mAttachedUseCasesToInfoMap.put(useCaseId, newUseCaseAttachInfo);
    }

    public void removeUseCase(String useCaseId) {
        this.mAttachedUseCasesToInfoMap.remove(useCaseId);
    }

    public SessionConfig.ValidatingBuilder getActiveAndAttachedBuilder() {
        SessionConfig.ValidatingBuilder validatingBuilder = new SessionConfig.ValidatingBuilder();
        List<String> list = new ArrayList<>();
        for (Map.Entry<String, UseCaseAttachInfo> attachedUseCase : this.mAttachedUseCasesToInfoMap.entrySet()) {
            UseCaseAttachInfo useCaseAttachInfo = attachedUseCase.getValue();
            if (useCaseAttachInfo.getActive() && useCaseAttachInfo.getAttached()) {
                String useCaseId = attachedUseCase.getKey();
                validatingBuilder.add(useCaseAttachInfo.getSessionConfig());
                list.add(useCaseId);
            }
        }
        Logger.d(TAG, "Active and attached use case: " + list + " for camera: " + this.mCameraId);
        return validatingBuilder;
    }

    public SessionConfig.ValidatingBuilder getAttachedBuilder() {
        SessionConfig.ValidatingBuilder validatingBuilder = new SessionConfig.ValidatingBuilder();
        List<String> list = new ArrayList<>();
        for (Map.Entry<String, UseCaseAttachInfo> attachedUseCase : this.mAttachedUseCasesToInfoMap.entrySet()) {
            UseCaseAttachInfo useCaseAttachInfo = attachedUseCase.getValue();
            if (useCaseAttachInfo.getAttached()) {
                validatingBuilder.add(useCaseAttachInfo.getSessionConfig());
                String useCaseId = attachedUseCase.getKey();
                list.add(useCaseId);
            }
        }
        Logger.d(TAG, "All use case: " + list + " for camera: " + this.mCameraId);
        return validatingBuilder;
    }

    private UseCaseAttachInfo getOrCreateUseCaseAttachInfo(String useCaseId, SessionConfig sessionConfig, UseCaseConfig<?> useCaseConfig) {
        UseCaseAttachInfo useCaseAttachInfo = this.mAttachedUseCasesToInfoMap.get(useCaseId);
        if (useCaseAttachInfo == null) {
            UseCaseAttachInfo useCaseAttachInfo2 = new UseCaseAttachInfo(sessionConfig, useCaseConfig);
            this.mAttachedUseCasesToInfoMap.put(useCaseId, useCaseAttachInfo2);
            return useCaseAttachInfo2;
        }
        return useCaseAttachInfo;
    }

    private Collection<SessionConfig> getSessionConfigs(AttachStateFilter attachStateFilter) {
        List<SessionConfig> sessionConfigs = new ArrayList<>();
        for (Map.Entry<String, UseCaseAttachInfo> attachedUseCase : this.mAttachedUseCasesToInfoMap.entrySet()) {
            if (attachStateFilter == null || attachStateFilter.filter(attachedUseCase.getValue())) {
                sessionConfigs.add(attachedUseCase.getValue().getSessionConfig());
            }
        }
        return sessionConfigs;
    }

    private Collection<UseCaseConfig<?>> getUseCaseConfigs(AttachStateFilter attachStateFilter) {
        List<UseCaseConfig<?>> useCaseConfigs = new ArrayList<>();
        for (Map.Entry<String, UseCaseAttachInfo> attachedUseCase : this.mAttachedUseCasesToInfoMap.entrySet()) {
            if (attachStateFilter == null || attachStateFilter.filter(attachedUseCase.getValue())) {
                useCaseConfigs.add(attachedUseCase.getValue().getUseCaseConfig());
            }
        }
        return useCaseConfigs;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static final class UseCaseAttachInfo {
        private final SessionConfig mSessionConfig;
        private final UseCaseConfig<?> mUseCaseConfig;
        private boolean mAttached = false;
        private boolean mActive = false;

        UseCaseAttachInfo(SessionConfig sessionConfig, UseCaseConfig<?> useCaseConfig) {
            this.mSessionConfig = sessionConfig;
            this.mUseCaseConfig = useCaseConfig;
        }

        UseCaseConfig<?> getUseCaseConfig() {
            return this.mUseCaseConfig;
        }

        SessionConfig getSessionConfig() {
            return this.mSessionConfig;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public boolean getAttached() {
            return this.mAttached;
        }

        void setAttached(boolean attached) {
            this.mAttached = attached;
        }

        boolean getActive() {
            return this.mActive;
        }

        void setActive(boolean active) {
            this.mActive = active;
        }
    }
}
