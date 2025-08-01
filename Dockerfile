FROM python:3.10-alpine

# Install ISBG + dependencies
RUN apk add --no-cache rspamd-client
RUN pip3 install isbg


# Entrypoint script
COPY train.sh /train.sh
RUN chmod +x /train.sh

ENTRYPOINT ["sh", "/train.sh"]