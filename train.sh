#!/bin/bash

echo "Starting ISBG training job..."
echo "Mailbox: ${IMAP_USER}, Name: ${IMAP_HOST}, Good box: ${LEARN_HAMBOX}, Bad box: ${LEARN_SPAMBOX}"
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