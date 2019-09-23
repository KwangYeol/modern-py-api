FROM python:3.7

LABEL maintainer="Kwangyeol Ryu <kwangyeolryu@gmail.com>"

COPY requirements.in /src/
WORKDIR /src

# packages
# RUN apk add --no-cache gcc
RUN pip install -U pip pip-tools && \
    pip-compile --generate-hashes --verbose requirements.in > requirements.txt && \
    pip install --require-hashes -r requirements.txt
