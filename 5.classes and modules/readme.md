# Как я понял код программы или простейшая реализация паттерна MVC
***
### Понимание работы класса Router
 Задача класса Router состоит в хранении routes (ссылки на методы) и в вызове класса PostController с передачей ему ссылок на методы для обработки постов или комментариев.
 Router принимает от пользователя что нужно отредактировать: Пост или комментарий. Далее в соответствии с выбранной опцией  передает данные в PostController и тот в свою очередь уже предлагает пользователю, что нужно сделать с постом либо комментарием
 Метод resources содержит ссылки на методы для выполения запросов по типу: Отобразить (все посты или частично), Сделать новый пост, редактировать существующий или удалить.
 
 По моему мнению такая реализация сделана для того, чтобы писать независимые блоки кода, которые можно менять как угодно, не затрагивая другие.

### Почему для модуля Resourse используется Extend, а не include?
Для ответа на этот вопрос стоит понять, что происходит при том или ином подключении миксина.
**include** используется для добавления методов модуля в класс в качестве методов экземпляра класса. Когда вы включаете модуль с помощью include, методы из модуля становятся доступными для объектов этого класса (экземпляров класса)
**extend** используется для добавления методов модуля в класс в качестве методов класса (статических методов). Когда вы расширяете класс с помощью extend, методы из модуля становятся доступными для самого класса, но не для его экземпляров.

Исходя из приведенных выше определений видно, что include позволяет использовать примешанный код непосредственно в экземпляре класса, а extend подключает методы модуля как методы класса.
Миксин мы выделяем в отдельный файл, чтобы вынести туда то,для чего нелогично создавать объект(экземпляр класса). Именно поэтому данный модуль мы подключаем через extend, чтобы иметь возможность пользоваться методами на уровень класса, но внутри инстанса они не были видны. Таким образом мы отделяем "ООП логику" от функционала, который к этой логике не принадлежит.