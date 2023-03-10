#language: ru

@tree

Функционал: Проверка создание документа Заказ

Как Менеджер по продажам я хочу
создать документ Заказ
чтобы выписать заказ клиента

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Подготовка данных
* Загрузка констант
И Загрузка констант
* Загрузка покупателей и Складов и Товаров и Регистр Цены
И Загрузка покупателей

Сценарий: Проверка создания заказа по организации без валютного учета
* Проверка создания документа Заказ
и Создание документа Заказ

Сценарий: Проверка создания заказа по организации с валютным учетом
* Проверка создания документа Заказ
и Создание документа Заказ для Вида цен "Закупочная" по организации с валютным учетом
