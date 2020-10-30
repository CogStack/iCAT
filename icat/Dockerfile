FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-runtime
ENV PATH="${PATH}:/home/icat/.local/bin"


# Update everything
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y update

# Install a couple of things
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y vim build-essential libssl-dev zlib1g-dev libbz2-dev \
                libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
                xz-utils tk-dev libffi-dev liblzma-dev python-openssl git htop zsh sudo zip unzip \
                apt-utils gnupg libssl1.0.0 libssl-dev libpq-dev


# uses Ubuntu 16.04 as base image
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

# install SQL Server remaining packages
RUN DEBIAN_FRONTEND="noninteractive" apt-get update && \
    DEBIAN_FRONTEND="noninteractive" ACCEPT_EULA=Y apt-get install -y msodbcsql17 && \
    DEBIAN_FRONTEND="noninteractive" ACCEPT_EULA=Y apt-get install -y mssql-tools && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y --no-install-recommends install \
	   unixodbc unixodbc-dev odbcinst

RUN useradd -ms /bin/bash icat
# Do not care about security
RUN echo "icat:admin" | chpasswd
RUN usermod -aG sudo icat 
RUN chsh -s /bin/zsh icat

# Add the medcat group - additional group used for icat
RUN groupadd medcat -g 1111
RUN usermod -a -G medcat icat

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
#RUN python /home/icat/download_models.py

# make executable
#RUN chmod a+x /home/icat/run.sh
