# Challenge solution: add salad to order.yml

**The question:** add `salad` to the list of dishes in `order.yml`. How many spaces go before the dash?

**The answer: four spaces**, exactly like `- pizza` and `- pasta`. Items of the same list start at the
same column.

```yaml
order:
  table: 4
  dishes:
    - pizza
    - pasta
    - salad
```

Why four? `order` starts at column 0. `table` and `dishes` belong to the order, so they are 2 spaces
in. The dishes belong to `dishes`, so they are 2 more spaces in: 4.

**What if you type 3 or 5 spaces?** The new line no longer lines up with the other items, and YAML stops
with an error (or reads something you did not mean). And never press the Tab key: YAML does not allow
tabs for indentation.

**Check it yourself** (optional, if you have Python with the PyYAML library):

```bash
python3 -c 'import yaml; print(yaml.safe_load(open("order.yml")))'
# {'order': {'table': 4, 'dishes': ['pizza', 'pasta', 'salad']}}
```
