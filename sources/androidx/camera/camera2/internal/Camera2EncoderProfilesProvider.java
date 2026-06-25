package androidx.camera.camera2.internal;

import android.media.CamcorderProfile;
import android.media.EncoderProfiles;
import android.os.Build;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.InvalidVideoProfilesQuirk;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.compat.EncoderProfilesProxyCompat;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public class Camera2EncoderProfilesProvider implements EncoderProfilesProvider {
    private static final String TAG = "Camera2EncoderProfilesProvider";
    private final String mCameraId;
    private final Map<Integer, EncoderProfilesProxy> mEncoderProfilesCache = new HashMap();
    private final boolean mHasValidCameraId;
    private final int mIntCameraId;

    public Camera2EncoderProfilesProvider(String cameraId) {
        this.mCameraId = cameraId;
        boolean hasValidCameraId = false;
        int intCameraId = -1;
        try {
            intCameraId = Integer.parseInt(cameraId);
            hasValidCameraId = true;
        } catch (NumberFormatException e) {
            Logger.w(TAG, "Camera id is not an integer: " + cameraId + ", unable to create Camera2EncoderProfilesProvider");
        }
        this.mHasValidCameraId = hasValidCameraId;
        this.mIntCameraId = intCameraId;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public boolean hasProfile(int quality) {
        if (!this.mHasValidCameraId) {
            return false;
        }
        return CamcorderProfile.hasProfile(this.mIntCameraId, quality);
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public EncoderProfilesProxy getAll(int quality) {
        if (this.mHasValidCameraId && CamcorderProfile.hasProfile(this.mIntCameraId, quality)) {
            if (this.mEncoderProfilesCache.containsKey(Integer.valueOf(quality))) {
                return this.mEncoderProfilesCache.get(Integer.valueOf(quality));
            }
            EncoderProfilesProxy profiles = getProfilesInternal(quality);
            this.mEncoderProfilesCache.put(Integer.valueOf(quality), profiles);
            return profiles;
        }
        return null;
    }

    private EncoderProfilesProxy getProfilesInternal(int quality) {
        if (Build.VERSION.SDK_INT >= 31) {
            EncoderProfiles profiles = Api31Impl.getAll(this.mCameraId, quality);
            if (profiles == null) {
                return null;
            }
            boolean isVideoProfilesInvalid = DeviceQuirks.get(InvalidVideoProfilesQuirk.class) != null;
            if (isVideoProfilesInvalid) {
                Logger.d(TAG, "EncoderProfiles contains invalid video profiles, use CamcorderProfile to create EncoderProfilesProxy.");
            } else {
                try {
                    return EncoderProfilesProxyCompat.from(profiles);
                } catch (NullPointerException e) {
                    Logger.w(TAG, "Failed to create EncoderProfilesProxy, EncoderProfiles might  contain invalid video profiles. Use CamcorderProfile instead.", e);
                }
            }
        }
        return createProfilesFromCamcorderProfile(quality);
    }

    private EncoderProfilesProxy createProfilesFromCamcorderProfile(int quality) {
        CamcorderProfile profile = null;
        try {
            profile = CamcorderProfile.get(this.mIntCameraId, quality);
        } catch (RuntimeException e) {
            Logger.w(TAG, "Unable to get CamcorderProfile by quality: " + quality, e);
        }
        if (profile != null) {
            return EncoderProfilesProxyCompat.from(profile);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class Api31Impl {
        static EncoderProfiles getAll(String cameraId, int quality) {
            return CamcorderProfile.getAll(cameraId, quality);
        }

        private Api31Impl() {
        }
    }
}
