FROM alpine:3.18.3

RUN apk add --update python3 py3-pip \
    && pip3 install --upgrade pip

WORKDIR /flaskAPI

COPY ./src /flaskAPI

RUN pip3 --no-cache-dir install -r requirements.txt

ENTRYPOINT ["python3","app.py"]

EXPOSE 5000