# dgxCAT 

A docker container for CogStack/MedCAT/HuggingFace development in isolated environments. This is meant for envs that are completely locked-out, everything has to be prebuilt and then moved. It contains the basic tools necessary to interact with the CogStack platform + GPU support + MedCAT + Transformers from Huggingface.


### How to 

1. Clone the repository
2. Run `docker-compose up -d`
3. Connect to the container using `docker exec -it <container_id> zsh`
4. Activate the environment `source /home/dgxcat/.venv/play/bin/activate`


### Current status

* Starts from a `pytorch/cuda` image
* Basic `ubuntu` packages pre-installed
* Configuration for `vim` and `zsh`
* Base python requirements for CogStack/MedCAT/HuggingFace pre-installed
* Volumes for data and projects
* Open ports for jupyter notebooks (8888)
* Pre-downloaded GPTv2 and BERT models


#### This is very experimantal
