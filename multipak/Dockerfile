FROM ubuntu:16.04
MAINTAINER lmq

EXPOSE 50001
ENV PYTHONIOENCODING utf-8
ENV LANG C.UTF-8 
ENV LC_ALL C.UTF-8
ENV TZ Asia/Shanghai

RUN apt-get update \
 && apt-get install -y python3-pip python3-dev \
 && cd /usr/local/bin \
 && ln -s /usr/bin/python3 python

RUN apt-get install -y cmake libboost-python-dev \
 && apt-get install -y libglib2.0-0 libsm6 libxrender1 libxext6

ADD . /svr
WORKDIR /svr

RUN pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple  --upgrade pip==9.0.3 \
 && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt \
 && cd beautypackage && python setup.py install && cd ..\
 && cd emotionpackage && python setup.py install && cd ..\
 && cd faceRecognitionpackage && python setup.py install && cd ..\
 && cd genderpackage && python setup.py install && cd ..\
 && apt-get autoremove \
 && apt-get clean

CMD ["python", "faceservice.py"]
