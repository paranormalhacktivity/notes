# Removing Lines with Pattern Matching
command: `:g/^\s*delete_me/d`

Before:
```yaml
yaml_item_one:
  this_stays: "I belong here"
  delete_me: "Get rid of me"
yaml_item_two:
  this_stays: "I belong here"
  delete_me: "Get rid of me"
yaml_item_three:
  this_stays: "I belong here"
  delete_me: "Get rid of me"
```

After:
```yaml
yaml_item_one:
  this_stays: "I belong here"
yaml_item_two:
  this_stays: "I belong here"
yaml_item_three:
  this_stays: "I belong here"
```

Also works when selecting a subset of the text in Visual Mode.
