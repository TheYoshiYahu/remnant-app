# Natural-voice audio — one-time setup (S444)

The app looks for recordings at https://audio.remnantofpromise.org. Until that
address exists, the app quietly uses the phone's own voice, so nothing breaks.

## 1. Make the bucket (Cloudflare dashboard, about 5 minutes)
1. dash.cloudflare.com → your account → **R2 Object Storage**. Turn R2 on if asked
   (Cloudflare may ask for a card even on the free plan; the free plan covers
   10 GB of storage and downloads are not charged).
2. **Create bucket** → name it `rop-audio` → Create.
3. In the bucket: **Settings → Custom Domains → Connect Domain** →
   `audio.remnantofpromise.org` → Connect.
4. Still in Settings: **CORS Policy → Edit** → paste the contents of
   `~/Desktop/App/hosting/r2-audio-cors.json` → Save.

## 2. Let your Mac upload (once)
1. R2 overview page → **Manage R2 API Tokens → Create API token** →
   permission **Object Read & Write**, bucket `rop-audio` → Create.
   Keep the page open: it shows an Access Key ID, a Secret Access Key, and an
   S3 endpoint (https://<account-id>.r2.cloudflarestorage.com).
2. In Terminal:
   ```
   brew install rclone
   rclone config
   ```
   Answer: `n` (new remote) → name `r2` → storage type `s3` → provider
   `Cloudflare` → `1` (enter keys) → paste the Access Key ID and Secret →
   region: press Enter → endpoint: paste the S3 endpoint → press Enter through
   the rest → `y` → `q`.

## 3. Upload (any time new recordings land in ~/Desktop/App/audio)
```
~/Desktop/App/_s444_upload_audio.sh
```
