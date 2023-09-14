# Visualizations of ceps models - playground

## Installation
### Requirements
- Unixish OS
- recent C++ compiler (e.g. g++ version >= 9)
- cmake
- https://github.com/cepsdev/machines4ceps
- Tip: copy the ceps binary to /usr/sbin/local

## Traversal of models 
### Extract events from transitions: extract_events_transitively_and_group.ceps

Usage: $ ceps FILE [FILES] extract_events_transitively_and_group.ceps

Example: 

```
$ ceps s.ceps extract_events_transitively_and_group.ceps
```

Output:
```
{
  "components":
 [
    {"name":"S1", "events":["E1","E2"]},
    {"name":"S2", "events":["E3","E4","E5"]}
 ]
}
```

Description: For each state machine S create the set of all events which are contained in a transition of S or in a transition of one of its sub state machines .  