# Lala — Play Store Deployment Checklist

## Already done (in this repo)

- [x] Manifest permissions minimized: no background location, no shared-media/storage read permissions. Remaining: camera, mic, location (foreground), network.
- [x] Videos record audio (mic permission requested alongside camera).
- [x] Downloads exports use MediaStore on Android 10+ (raw-path writes fail under scoped storage).
- [x] Release build minifies with R8; ProGuard rules for Room/Hilt/iText/osmdroid verified via `assembleRelease` + `bundleRelease`.
- [x] Release signing wired to `android/keystore.properties` (gitignored). Without it, release builds fall back to the debug key for local testing.
- [x] Adaptive launcher icon (incl. Android 13+ themed icon).
- [x] App label: "Lala". `applicationId com.hardlineforge.lala`, versionCode 1 / versionName 1.0.
- [x] Store listing copy: `docs/play-store-listing.md`. Privacy policy text: `docs/privacy-policy.md`.

## Your side — one-time setup

1. **Create the upload keystore** (keep it safe forever; losing it means losing the app identity):
   ```
   keytool -genkeypair -v -keystore lala-upload.jks -alias lala \
     -keyalg RSA -keysize 2048 -validity 10000
   ```
2. **Create `android/keystore.properties`** (never commit it):
   ```
   storeFile=lala-upload.jks        # path relative to the android/ folder
   storePassword=...
   keyAlias=lala
   keyPassword=...
   ```
3. **Build the Play upload artifact**:
   ```
   cd android && ./gradlew bundleRelease
   # -> app/build/outputs/bundle/release/app-release.aab
   ```
4. **Host the privacy policy** (`docs/privacy-policy.md`) at a public URL — GitHub Pages, a gist, or any static host — and put that URL in the Play listing.

## Play Console

- App name: `Lala: Local Area Logging App` (title/short/full description in `docs/play-store-listing.md`).
- Category: Tools or Productivity.
- **Data safety form** (matches the app's actual behavior):
  - Location (precise): collected, NOT shared, stored on device, user can delete, not used for ads.
  - Photos & videos: collected, NOT shared, stored on device.
  - Voice/audio (in videos): collected, NOT shared, stored on device.
  - No data transmitted off device; no third-party sharing; no ads SDKs.
- Content rating questionnaire: utility app, no objectionable content.
- Screenshots: entry with GPS/time stamp visible, timeline view, camera capture, map view. Feature graphic 1024x500.
- Testing track first: upload the AAB to Internal testing, install via the opt-in link, run the acceptance flows, then promote to Production.

## Before each future release

- Bump `versionCode` (and `versionName`) in `android/app/build.gradle.kts` — Play rejects re-used versionCodes.
- Run the acceptance flow: new entry (auto-GPS) → photo → video with sound → fast back-out → both attach → Save Entry → timeline → PDF export lands in Downloads with watermark (free tier) → map shows the entry pin/thumbnail.
- Skim the debug log (Settings → Share Debug Log) for `[Repair]` or ERROR lines.

## Known deliberate gaps

- Premium is a local placeholder toggle — integrate Google Play Billing before charging for it.
- Import Data / Export All Data buttons in Settings are stubs.
- Reports screen options (include photos / filmstrip fps) are not yet wired to the generator.
- PDF export shows completion state + share/save, not a rendered page preview.
- iText (PDF library) is AGPL: fine while the app source is public under a compatible license;
  a commercial iText license or a migration to pdfbox-android (Apache-2.0) is needed if the
  source ever goes closed.
