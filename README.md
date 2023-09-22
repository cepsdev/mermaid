# Visualization and transformation of ceps models

## Requirements
- Unixish OS
- https://github.com/cepsdev/machines4ceps or download binaries directly from [sourceforge](https://sourceforge.net/projects/ceps-tool/files)
- Only if you intend to build ceps from source: g++ (version >= 9), cmake. 
- Tip: copy the ceps binary to /usr/sbin/local, make sure the binary is marked as executable (# chmod /usr/local/sbin/ceps +x)

## State/Harel Charts/Diagrams

### Static visualization (no trace info etc.)

- [ceps model => mermaid.js](/ceps2mermaid)
- [mermaid.js => ceps model](/mermaid2ceps)

### Dynamic visualization (with trace info etc.)
- [ceps model + trace of execution => mermaid.js](/ceps_with_state_trace2mermaidjs)


## Traversal of models 
### Extract events from transitions: extract_events_transitively_and_group.ceps

#### Synopsis: 

$ ceps FILE [FILES] extract_events_transitively_and_group.ceps

#### Example: 

```
$ ceps s.ceps extract_events_transitively_and_group.ceps
```

Input state machine is: [s.ceps](/s.ceps)


Output:
```
{
  "components":
 [
    { "name":"S1", "in_events":["E1","E2"], "out_events":[]},
    { "name":"S2", "in_events":["E3","E4","E5"], "out_events":[]}
 ]
}
```

#### Second example: 
**Warning**
Requires [ceps version 8.1.1](https://sourceforge.net/projects/ceps-tool/) or higher. 

```
$ ceps examples_ceps_sm/sm_with_actions.ceps extract_events_transitively_and_group.ceps
```

Input state machine is: [sm_with_actions.ceps](/examples_ceps_sm/sm_with_actions.ceps)


Output:
```
{
  "components":
 [
    { "name":"basic_example1", "in_events":["ANY_KEY","CAPS_LOCK"], "out_events":["OUT1","OUT2","OUT3"]},
    { "name":"basic_example2", "in_events":["ANY_KEY","OUT1","OUT2"], "out_events":["CAPS_LOCK","OUT2"]}
 ]
}
```

Description: For each state machine S create the set of all events which are contained in a transition of S or in a transition of one of its sub state machines .  
