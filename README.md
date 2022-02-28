# Программа для тестування російський сайтів на витривалість
**

**На даний момент потрібно додатково перед використанням програми встановити VPN або Proxy та віртуальну машину з Ubuntu.**
**Програма тестувалась на Ubuntu 20.04.4 LTS, тому рекомендується юзати її там.**


***Що може:*** 
 1. Централізоване управління по цілях з автоматичним оновленням
    таргетів кожну хвилину; 
 2. Автоматичне встановлення утиліти wrk, за
        допомогою якої і проходить саме "тестування";
 3. Запуск в n потоків/цілей в залежності від ресурсів вашого комп'ютера.

***Як встановити:*** 

***В терміналі ввести:***

    git clone https://github.com/putinhuylo2022/ph_service

***В терміналі ввести:***

    cd ph_service && ./install.sh

***Запуск тестувальника у папці програми:***

    ./start.sh
   
  За замовчування програма запускається в 4 сайти/потоки, але кількість потоків можна задати самому через параметр -t <кількість>:
  

      ./start.sh -t 12
