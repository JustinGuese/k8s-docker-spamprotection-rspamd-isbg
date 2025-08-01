#!/bin/bash

echo "Starting ISBG training job..."

isbg \
    --imaphost="${IMAP_HOST}" \
    --imapuser="${IMAP_USER}" \
    --imappasswd="${IMAP_PASSWD}" \
    --learnspambox="${LEARN_SPAMBOX}" \
    --learnhambox="${LEARN_HAMBOX}" \
    --rspam \
    --rspamhost=rspamd.spamprotect.svc.cluster.local \
    --rspamport=11333 \
    --noninteractive