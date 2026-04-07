FROM                  python:3.11-slim
RUN                   useradd roboshop
RUN                   mkdir /app
RUN                   chown -R roboshop:roboshop /app
USER                  roboshop
COPY                  payment.ini payment.py rabbitmq.py requirements.txt  /app/
WORKDIR               /app
RUN                   RUN pip3 install --user -r requirements.txt
ENTRYPOINT           ["uwsgi", "--ini payment.ini"]

