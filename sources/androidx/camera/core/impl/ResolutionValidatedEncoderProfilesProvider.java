package androidx.camera.core.impl;

import androidx.camera.core.impl.quirk.ProfileResolutionQuirk;
import java.util.List;
/* loaded from: classes.dex */
public class ResolutionValidatedEncoderProfilesProvider implements EncoderProfilesProvider {
    private final EncoderProfilesResolutionValidator mEncoderProfilesResolutionValidator;
    private final EncoderProfilesProvider mProvider;

    public ResolutionValidatedEncoderProfilesProvider(EncoderProfilesProvider provider, Quirks quirks) {
        this.mProvider = provider;
        List<ProfileResolutionQuirk> resolutionQuirks = quirks.getAll(ProfileResolutionQuirk.class);
        this.mEncoderProfilesResolutionValidator = new EncoderProfilesResolutionValidator(resolutionQuirks);
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public boolean hasProfile(int quality) {
        if (!this.mProvider.hasProfile(quality)) {
            return false;
        }
        if (this.mEncoderProfilesResolutionValidator.hasQuirk()) {
            EncoderProfilesProxy profiles = this.mProvider.getAll(quality);
            return this.mEncoderProfilesResolutionValidator.hasValidVideoResolution(profiles);
        }
        return true;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public EncoderProfilesProxy getAll(int quality) {
        if (!this.mProvider.hasProfile(quality)) {
            return null;
        }
        EncoderProfilesProxy profiles = this.mProvider.getAll(quality);
        if (this.mEncoderProfilesResolutionValidator.hasQuirk()) {
            return this.mEncoderProfilesResolutionValidator.filterInvalidVideoResolution(profiles);
        }
        return profiles;
    }
}
