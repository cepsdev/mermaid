%ext_mermaid
%ignore_ws
%%


lexer read_transitions{
 [ * ] --> ident => t{Initial;$6; };. 
 ident --> ident => t{ $0  ;  $4  ;};.
 ident --> [ * ] => t{$0;Final; };. 
 any => .
}


BEGIN{
 stateDiagram-v2 => mermaid_sm_import {call read_transitions  };.
 any => .
}

%%