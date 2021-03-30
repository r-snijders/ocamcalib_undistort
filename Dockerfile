FROM ubuntu:20.04

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install python3 python3-pip
RUN pip3 install --upgrade pip

# Needed for cv2:
RUN apt-get install -y libgl1-mesa-dev 
# Configure timezone without using command line input:
# https://dev.to/setevoy/docker-configure-tzdata-and-timezone-during-build-20bk
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y libglib2.0-0

# QT needed for newest OpenCV:
# https://stackoverflow.com/questions/60042568/this-application-failed-to-start-because-no-qt-platform-plugin-could-be-initiali
#RUN apt-get install -y qt5-default
# Or; downgrade to older opencv (costs less dependencies):
RUN pip3 install opencv-python==4.1.2.30  
# Extra dependecies for (older) opencv:
RUN apt-get -y install libxrender-dev libsm6

COPY . /ocamcamera 

WORKDIR /ocamcamera 
RUN pip install .
