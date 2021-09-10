FROM python:3.9

RUN apt update && apt upgrade -y
RUN apt install python3-pip -y
RUN apt install ffmpeg -y
RUN apt install wget -y

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN wget https://dhworker.dcat1.workers.dev/0:/audio_spbob.raw
RUN wget https://dhworker.dcat1.workers.dev/0:/vid_spbob.raw
RUN apt-get install -y nodejs
RUN npm i -g npm

RUN mkdir /innexia/
COPY . /innexia
WORKDIR /innexia

RUN pip3 install --upgrade pip
RUN pip3 install -U -r requirements.txt

CMD python3 -m main.py
