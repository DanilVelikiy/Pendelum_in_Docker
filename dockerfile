#указываем базовый образ для сборки
FROM jupyter/scipy-notebook
#установка node.js что бы работали виджеты (под root)
USER root
RUN apt-get update && apt-get install -y --no-install-recommends curl && curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
#смена пользователя
USER $NB_UID
#копирование в создаваемый образ ноутбука с программой затухающего математического маятника
COPY /notebook .
#запуск jupiter lab с необходимыми параметрами
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --ServerApp.token='' --ServerApp.password='' --ServerApp.allow_origin='*'
