FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-devel
ENV PATH="${PATH}:/home/icat/.local/bin"


# Update everything
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y update

# Install a couple of things
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y vim build-essential libssl-dev zlib1g-dev libbz2-dev \
                libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
                xz-utils tk-dev libffi-dev liblzma-dev python-openssl git htop zsh sudo zip unzip


RUN useradd -ms /bin/bash icat
# Do not care about security
RUN echo "icat:admin" | chpasswd
RUN usermod -aG sudo icat 
RUN chsh -s /bin/zsh icat

# Crate some dirs and chown
RUN mkdir /data /home/icat/projects /home/icat/models && \
    chown icat:icat /data && \
    chown -R icat:icat /home/icat

# Switch user
USER icat
WORKDIR /home/icat

# Add everything
ADD . /home/icat

# Create and activate an environment
RUN mkdir /home/icat/.venv
# Activate
RUN python -m venv /home/icat/.venv/play
ENV VIRTUAL_ENV=/home/icat/.venv/play
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN python -m pip install pip --upgrade
RUN python -m pip install -r /home/icat/requirements.txt --upgrade
RUN python -m pip install https://s3-us-west-2.amazonaws.com/ai2-s2-scispacy/releases/v0.2.4/en_core_sci_md-0.2.4.tar.gz

# Add model download for transformers
RUN python /home/icat/download_models.py
