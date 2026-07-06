# product_metrics_analysis
SQL-проект по продуктовой аналитике на PostgreSQL.
В проекте рассчитаны ключевые метрики продукта: **funnel**, **Day 7 retention** и **ARPU** на основе e-commerce датасета.

## Стек
- PostgreSQL
- SQL
- DBeaver
- Ubuntu Linux

## Что внутри
- `dataset/` — исходные CSV-данные
- `sql/` — SQL-запросы для расчёта метрик
- `results/` — результаты запросов и скриншоты

## Метрики
- Funnel: `signup -> view_product -> add_to_cart -> purchase`
- Retention: Day 7 retention
- ARPU: средняя выручка на пользователя
- ARPU by channel: ARPU по каналам привлечения

## Примеры результатов

### Funnel
![Funnel result](results/funnel_screenshot.png)

### Retention
![Retention result](results/retention_screenshot.png)

### ARPU by channel
![ARPU by channel result](results/arpu_by_channel_screenshot.png)

## Вывод
Проект демонстрирует работу с SQL, PostgreSQL, CTE, `JOIN`, агрегатными и оконными функциями в задачах продуктовой аналитики.
- посчитать retention не только Day 7, но и Day 1 / Day 30;
- добавить ARPPU;
- построить сегментацию по каналам привлечения;
- визуализировать результаты в BI-инструменте.
