FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y python3 python3-dev python3-pip 
RUN apt-get install -y git

RUN pip3 install --upgrade pip

RUN git clone https://github.com/ronaldnoronha/weather_chatbot.git

WORKDIR ./weather_chatbot

RUN pip install -r requirements.txt

RUN python3 -m spacy download en

RUN python3 nlu_model.py

CMD python3 -m rasa_core_sdk.endpoint --actions actions

CMD python3 dialogue_management_model.py
