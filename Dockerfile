FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    git \
    sudo \
    python3

WORKDIR /ase/ase_riscv_gem5_sim

COPY . .

RUN ./utils/installation.sh all-ase

EXPOSE 80

CMD ["python3", "web_entrypoint.py"]
