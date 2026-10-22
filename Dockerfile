
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    sudo \
    python3 \
    python3-virtualenv \
    software-properties-common \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Verifica Python 3.10 PRIMA della compilazione GCC
RUN add-apt-repository -y ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y \
        python3.10 \
        python3.10-dev \
        python3.10-venv \
    && python3.10 --version \
    && test -x /usr/bin/python3.10-config \
    && command -v virtualenv \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ase/ase_riscv_gem5_sim

COPY . .

# Installazioni separate per identificare gli errori
RUN ./utils/installation.sh toolchain

RUN ./utils/installation.sh gem5

RUN ./utils/installation.sh ase-studio

EXPOSE 80

CMD ["python3", "web_entrypoint.py"]
