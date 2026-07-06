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
- Funnel: `signup - view_product - add_to_cart - purchase`
- Retention: Day 7 retention
- ARPU: средняя выручка на пользователя
- ARPU by channel: ARPU по каналам привлечения

## Результаты

### Funnel
![Funnel result](results/funnel_screenshot.png)

### Retention
![Retention result](results/retention_screenshot.png)

### ARPU by channel
![ARPU by channel result](results/arpu_by_channel_screenshot.png)

## Выводы

- До покупки доходит 36.67% пользователей, основной отток происходит на этапах `view_product -> add_to_cart` и `add_to_cart -> purchase`. Для улучшения конверсии стоит упростить карточку товара и процесс оформления заказа.
- Day 7 retention остаётся невысоким, что указывает на слабое удержание новых пользователей. Для улучшения retention можно усилить онбординг и добавить сценарии повторного возврата пользователей.
- Самый высокий ARPU у `social`, самый низкий — у `organic`. Для роста ARPU стоит перераспределить внимание в сторону более доходных каналов и отдельно оптимизировать монетизацию органического трафика.
