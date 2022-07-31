## Incrementing a list(starting without any incrementation)
1. `ctrl-v` to start vertical highlighting
2. `G` to jump to bottom line
3. `I` to start insert mode in front of the highlighted characters
4. `esc` after insert "0. ", this will put "0. " in front of all highlighted characters
5. `ctrl-v` and `G` again on the "0", to highlight all of the zeros
6. `g` first, then `ctrl-a` and this replace all of the highlighted zeros with incremented numbers, starting at one

Before:
```
list item one
list item two
list item three
```

After:
```
1. list item one
2. list item two
3. list item three
```
