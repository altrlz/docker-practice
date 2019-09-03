FROM centos:latest

WORKDIR /app

EXPOSE 80

COPY . .

RUN yum update -y && \
  yum install -y git unzip && \
  yum install -y https://centos7.iuscommunity.org/ius-release.rpm && \
  yum install -y python36u python36u-libs python36u-devel python36u-pip python36u-tools && \
  yum install -y libSM-devel libXext-devel && \
  pip3.6 install --upgrade pip  && \
  pip3.6 install tensorflow==1.5 keras bottle gevent h5py paste opencv-python scikit-image  && \
  git clone https://github.com/lllyasviel/style2paints.git && \
  unzip model.zip -d model && \
  cd ./style2paints/V3/server && \
  mv /app/model/* .

CMD ["python3.6" "server.py" "cpu"]
