# k8s-docker-spamprotection-rspamd-isbg

Selfhosted setup to filter an IMAP inbox using common rspamd rules and smart bayesian learning using isbg

## install

manually create the secret

```
kubectl create secret generic isbg-credentials \
  --namespace=spamprotect \
  --from-literal=IMAP_HOST="your-imap-host" \
  --from-literal=IMAP_USER="your-imap-user" \
  --from-literal=IMAP_PASSWD="your-imap-password" \
  --from-literal=LEARN_SPAMBOX="your-spam-box" \
  --from-literal=LEARN_HAMBOX="your-ham-box"
```

after that

`kubectl apply -f kubernetes/`

# 🛡️ Rspamd + ISBG Kubernetes Spam Filter Trainer

This Kubernetes setup automates spam filter training using Rspamd and ISBG (IMAP Spam Begone).
It connects to a remote IMAP mailbox (e.g. from Outlook), reads user-classified emails (Spam / Good), and teaches Rspamd to improve future spam detection.

📦 What It Does
• ✅ Connects to your IMAP account securely (e.g. Hostinger)
• ✅ Trains Rspamd using:
• Emails in the Spam folder → learn as spam
• Emails in the Good (or Inbox/Good) folder → learn as ham
• ✅ Runs as a Kubernetes CronJob (default: every 30 minutes)
• ✅ Stores persistent config and logs at: /mnt/hdd/spamprotect/ (via hostPath)

🔧 Components

Component Description
rspamd Deployment Optional internal Rspamd instance
rspamd Service Exposes Rspamd at rspamd.spamprotect.svc.cluster.local
isbg-train CronJob Connects to IMAP and teaches Rspamd every X minutes
hostPath Volume Mounted persistent storage at /mnt/hdd/spamprotect/

📨 Folder Actions (How Training Works)

Folder (in Outlook or IMAP) Meaning Action
Spam You marked spam Learn as spam -> e.g. Junk
Good You rescued mail Learn as ham -> e.g. Inbox

Simply move emails to these folders to “teach” your spam filter.

📁 File Structure on Host

Make sure this exists:

/mnt/hdd/spamprotect/
├── config/ # Optional rspamd config
├── logs/ # Logs from ISBG training
