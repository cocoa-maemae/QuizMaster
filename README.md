# cocoa-maemae QuizMaster set up

* install docker CE according to the public instruction<br>
https://docs.docker.com/install/

* Get centos image from docker hub(individual docker hub account is essential)
```
sudo docker login -u *** -p ***
sudo docker pull centos
```

* Run centos7 container
```
sudo docker run --privilege -it -p 80:80 <br>
```
