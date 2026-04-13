FROM                  python:3
RUN                   useradd -m roboshop
RUN                   mkdir /app
RUN                   chown -R roboshop:roboshop /app
USER                  roboshop
COPY                  payment.ini payment.py rabbitmq.py requirements.txt  /app/
WORKDIR               /app
RUN                   pip3 install --user --no-cache-dir -r requirements.txt
ENV                   PATH=/home/roboshop/.local/bin:$PATH
ENTRYPOINT           ["uwsgi", "--ini", "payment.ini"]


#  here -m means /home/roboshop
# $PATH search "uwsgi" in /home/roboshop/.local/bin

