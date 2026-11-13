FROM ubuntu:20.04

ENV app /app

RUN mkdir $app
WORKDIR $app
COPY . $app            
RUN apt update
RUN apt install python3 -y
RUN apt install python3-pip -y
RUN pip install --upgrade pip 
RUN apt install rabbitmq-server -y 
RUN pip install -r requirements.txt

#RUN rabbitmq-server &
#RUN celery -A celery_app worker &

#CMD ["rabbitmq-server"]
#CMD ["celery", "-A", "celery_app", "worker"]

WORKDIR API/


#CMD ["./app/start_server.sh"]


EXPOSE 8094
ENTRYPOINT ["python3", "./api.py"]
CMD ["tail", "-f", "/app/logs/scan.log"]
CMD ["./app/start_server.sh"]

#RUN echo "#!/bin/bash" >> /app/start_services.sh
#RUN echo "rabbitmq-server &" >> /app/start_services.sh
#RUN echo "sleep 1" >> /app/start_services.sh
#RUN echo "celery -A celery_app worker &" >> /app/start_services.sh
#RUN chmod +x /app/start_services.sh
#CMD ["./app/start_services.sh"]

