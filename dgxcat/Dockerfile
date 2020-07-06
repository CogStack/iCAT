FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-devel
ENV PATH="${PATH}:/home/dgxcat/.local/bin"


# Update everything
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y update

# Install a couple of things
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y vim build-essential libssl-dev zlib1g-dev libbz2-dev \
                libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
                xz-utils tk-dev libffi-dev liblzma-dev python-openssl git htop zsh sudo zip unzip


RUN useradd -ms /bin/bash dgxcat
# Do not care about security
RUN echo "dgxcat:admin" | chpasswd
RUN usermod -aG sudo dgxcat 
RUN chsh -s /bin/zsh dgxcat

# Crate some dirs and chown
RUN mkdir /data /home/dgxcat/projects /home/dgxcat/models && \
    chown dgxcat:dgxcat /data && \
    chown -R dgxcat:dgxcat /home/dgxcat

# Switch user
USER dgxcat
WORKDIR /home/dgxcat

# Add everything
ADD . /home/dgxcat

# Create and activate an environment
RUN mkdir /home/dgxcat/.venv
# Activate
RUN python -m venv /home/dgxcat/.venv/play
ENV VIRTUAL_ENV=/home/dgxcat/.venv/play
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN python -m pip install pip --upgrade
RUN python -m pip install -r /home/dgxcat/requirements.txt --upgrade
RUN python -m pip install https://s3-us-west-2.amazonaws.com/ai2-s2-scispacy/releases/v0.2.4/en_core_sci_md-0.2.4.tar.gz

# Add model download for transformers
RUN python /home/dgxcat/download_models.py
