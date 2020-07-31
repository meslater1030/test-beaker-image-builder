FROM nvidia/cuda:10.2-base-ubuntu18.04

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Install base packages.
RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         python3.6-dev \
         python3-setuptools \
         python3-pip && \
     rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip

COPY requirements.txt .
RUN pip install requirements.txt

ENTRYPOINT ["python"]
