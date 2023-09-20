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
