FROM dorowu/ubuntu-desktop-lxde-vnc:latest

RUN apt-get update

RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip

RUN add-apt-repository ppa:deadsnakes/ppa
RUN pip3 install numpy==1.16.4
RUN pip3 install tensorflow==1.13.1
RUN  apt install -y \
    libwebkitgtk-3.0-dev \
    libgtk-3-dev \
    libsm-dev \
    freeglut3 \
    freeglut3-dev \
    libnotify-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    dpkg-dev \
    build-essential \
    libjpeg-dev \
    libtiff-dev \
    libsdl1.2-dev \
    software-properties-common
RUN pip3 install -U --no-cache-dir -f https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-18.04 wxPython
RUN pip3 install 'deeplabcut[gui]'
RUN pip3 install ipywidgets
RUN pip3 install seaborn

# CUDA
COPY --from=nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04 /usr/local/cuda-10.0/ /usr/local/cuda-10.0
RUN ln -s /usr/local/cuda-10.0 /usr/local/cuda
ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/cuda/lib:/usr/local/cuda/lib64
ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs:${LIBRARY_PATH}
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES all
ENV NVIDIA_REQUIRE_CUDA "cuda>=10.0"