FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    git \
    sudo \
    python3

WORKDIR /ase

RUN git clone \
    --branch main \
    --recurse-submodules \
    https://github.com/cad-polito-it/ase_riscv_gem5_sim.git \
    && cd ase_riscv_gem5_sim \
    && ./utils/installation.sh all-ase

WORKDIR /ase/ase_riscv_gem5_sim

COPY web_entrypoint.py /web_entrypoint.py

EXPOSE 80

CMD ["python3", "/web_entrypoint.py"]
