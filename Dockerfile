FROM centos:7
COPY . /app
RUN yum -y install epel-release && yum clean all
RUN yum -y install python-pip && yum clean all
RUN yum install mariadb-devel gcc -y
RUN yum -y install python-devel libxslt-devel libffi-devel openssl-devel
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["pip", "install", "--upgrade", "pip"]
CMD ["python", "app.py"]
