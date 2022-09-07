# Producer-Consumer-Celery-RabbitMQ-Redis-Docker-Python 
</hr>

##  Setup & Installation
Build Docker Consumer Image:
```bash
cp Dockerfile_consumer Dockerfile && docker build -t celery_consumer .
```

Start redis, rabbitmq, and consumer services with `docker-compose`:
```bash
docker-compose up -d
```

Verify that the services are up and running:
```
$ docker ps

# Excepted output
27d1b8ced89a   rabbitmq:latest   "docker-entrypoint.s…"   8 minutes ago   Up 8 minutes   4369/tcp, 5671/tcp, 15691-15692/tcp, 25672/tcp, 0.0.0.0:5672->5672/tcp, :::5672->5672/tcp   python-async-tasks_rabbitmq_1
17b72947fb8a   redis:latest      "docker-entrypoint.s…"   8 minutes ago   Up 8 minutes   0.0.0.0:6379->6379/tcp, :::6379->6379/tcp                                                   python-async-tasks_redis_1
```

## Usage
Check all the docker containers:
```bash
docker ps -a
```
Watch real-time logs worker:
```bash
docker logs --follow {docker_celery_consumer_name}
```
Run producer:
```bash
python3 -m pip install -r requirements.txt
python3 producer.py
```
Check KEYS in Redis
Install redis-cli as https://redis.io/docs/getting-started/installation/install-redis-on-linux/
Access Redis:
```bash
redis-cli -h 0.0.0.0 -p 6379
```
GET a specific Key in Redis:
```bash
0.0.0.0:6379> KEYS *
GET celery-task-meta-a48306c8-10cf-4acb-a8cd-f39027ca90ce
```

Spin up a new terminal and start the celery worker:
```bash
$ celery -A consumer_tasks worker -l info --pool=solo
```
Send a task to celery worker to verify that it's working as excepted:
Open a new terminal and get inside python interactive shell, import `say_hello` function from `consumer_tasks.py` and then call it with `delay()`

```python
$ python
>>> from consumer_tasks import say_hello
>>> say_hello.delay("Valon")
<AsyncResult: 5711efdc-17c7-4f02-bfba-d193c3d28c42>
```
And in the celery terminal that we started the worker before we should except a result similar to:
```
INFO/MainProcess] Received task: consumer_tasks.say_hello[5711efdc-17c7-4f02-bfba-d193c3d28c42]
INFO/MainProcess] Task consumer_tasks.say_hello[5711efdc-17c7-4f02-bfba-d193c3d28c42] succeeded in 5.01600000000326s: 'Hello Valon'
```

## What to do next?
Just expand the usage of the celery, define your tasks and keep doing amazing stuff :)

## Contact:
If you have any questions regarding the topic or anything else, feel free to reach to me on: </br>
* [LinkedIn](https://www.linkedin.com/in/valon-januzaj-b02692187/) </br>
* [Github](https://github.com/vjanz) </br>
* [Email](mailto:valon.januzaj98@gmail.com)


## License
This project is licensed under the terms of the MIT license.


