# Visualization and transformation of ceps models

## Requirements
- Unixish OS
- https://github.com/cepsdev/machines4ceps or download binaries directly from [sourceforge](https://sourceforge.net/projects/ceps-tool/files)
- Only if you intend to build ceps from source: g++ (version >= 9), cmake. 
- Tip: copy the ceps binary to /usr/sbin/local, make sure the binary is marked as executable (# chmod /usr/local/sbin/ceps +x)

## ceps and mermaidjs
### State Charts

#### A. Generate a mermaidjs conformant representation of a ceps state machine, i.e. ceps to mermaidjs.

Synopsis: $ ceps FILE [FILES] sm2mermaidjs.ceps

Example: 

```
$ ceps iso15118-2-evcc_communication_states_ac_v2g.ceps sm2mermaidjs.ceps 
```

Output:
```
stateDiagram-v2
  [*] --> Wait_for_supportedAppProtocolRes
  Wait_for_supportedAppProtocolRes --> Wait_for_SessionSetupRes
  Wait_for_SessionSetupRes --> Wait_for_ServiceDiscoveryRes
  Wait_for_ServiceDiscoveryRes --> Wait_for_ServiceDetailRes
  Wait_for_ServiceDetailRes --> Wait_for_ServiceDetailRes
  Wait_for_ServiceDetailRes --> Wait_for_ServicePaymentSelectionRes
  Wait_for_ServiceDiscoveryRes --> Wait_for_ServicePaymentSelectionRes
  Wait_for_ServicePaymentSelectionRes --> Wait_for_CertificateInstallationRes
  Wait_for_ServicePaymentSelectionRes --> Wait_for_CertificateUpdateRes
  Wait_for_CertificateUpdateRes --> Wait_for_PaymentDetailsRes
  Wait_for_CertificateInstallationRes --> Wait_for_PaymentDetailsRes
  Wait_for_ServicePaymentSelectionRes --> Wait_for_PaymentDetailsRes
  Wait_for_ServicePaymentSelectionRes --> Wait_for_AuthorizationRes
  Wait_for_PaymentDetailsRes --> Wait_for_AuthorizationRes
  Wait_for_AuthorizationRes --> Wait_for_AuthorizationRes
  Wait_for_AuthorizationRes --> Wait_for_ChargeParameterDiscoveryRes
  Wait_for_ChargeParameterDiscoveryRes --> Wait_for_ChargeParameterDiscoveryRes
  Wait_for_ChargeParameterDiscoveryRes --> Wait_for_PowerDeliveryRes
  Wait_for_PowerDeliveryRes --> Wait_for_ChargeParameterDiscoveryRes
  Wait_for_PowerDeliveryRes --> Wait_for_SessionStopRes
  Wait_for_PowerDeliveryRes --> Wait_for_ChargingStatusRes
  Wait_for_ChargingStatusRes --> Wait_for_PowerDeliveryRes
  Wait_for_ChargingStatusRes --> Wait_for_PowerDeliveryRes
  Wait_for_ChargingStatusRes --> Wait_for_ChargingStatusRes
  Wait_for_ChargingStatusRes --> Wait_for_MeteringReceiptRes
  Wait_for_MeteringReceiptRes --> Wait_for_ChargingStatusRes
  Wait_for_MeteringReceiptRes --> Wait_for_PowerDeliveryRes
  Wait_for_MeteringReceiptRes --> Wait_for_PowerDeliveryRes
  Wait_for_SessionStopRes --> [*]
```

Example as rendered by mermaid.live:


![](/iso15118-2-evcc_communication_states_ac_v2g.png)


#### B.  Generate a ceps conformant representation of a mermaidjs state machine, i.e. mermaidjs to ceps.

Synopsis: $ ceps mermaid.ceps.lex FILE.mermaid mermaidjs2sm.ceps

Example: 

```
$ ceps mermaid.ceps.lex iso15118-2-evcc_communication_states_ac_v2g.mermaid mermaidjs2sm.ceps
```
Remark: The magic lies in the two files [mermaid.ceps.lex](/mermaid.ceps.lex) and [mermaidjs2sm.ceps](mermaidjs2sm.ceps). The former defines a simple set of rules which enable ceps to read .mermaid files, the latter operates on the result by adding the necessary states declaration.

Second example:

```
$ ceps mermaid.ceps.lex iso15118-2-evcc_communication_states_ac_v2g.mermaid mermaidjs2sm.ceps sm2mermaidjs.ceps
```

Output (second example):
```
stateDiagram-v2
  [*] --> Wait_for_supportedAppProtocolRes
  Wait_for_supportedAppProtocolRes --> Wait_for_SessionSetupRes
  Wait_for_SessionSetupRes --> Wait_for_ServiceDiscoveryRes
  Wait_for_ServiceDiscoveryRes --> Wait_for_ServiceDetailRes
  Wait_for_ServiceDetailRes --> Wait_for_ServiceDetailRes
  Wait_for_ServiceDetailRes --> Wait_for_ServicePaymentSelectionRes
  Wait_for_ServiceDiscoveryRes --> Wait_for_ServicePaymentSelectionRes
  Wait_for_ServicePaymentSelectionRes --> Wait_for_CertificateInstallationRes
  Wait_for_ServicePaymentSelectionRes --> Wait_for_CertificateUpdateRes
  Wait_for_CertificateUpdateRes --> Wait_for_PaymentDetailsRes
  Wait_for_CertificateInstallationRes --> Wait_for_PaymentDetailsRes
  Wait_for_ServicePaymentSelectionRes --> Wait_for_PaymentDetailsRes
  Wait_for_ServicePaymentSelectionRes --> Wait_for_AuthorizationRes
  Wait_for_PaymentDetailsRes --> Wait_for_AuthorizationRes
  Wait_for_AuthorizationRes --> Wait_for_AuthorizationRes
  Wait_for_AuthorizationRes --> Wait_for_ChargeParameterDiscoveryRes
  Wait_for_ChargeParameterDiscoveryRes --> Wait_for_ChargeParameterDiscoveryRes
  Wait_for_ChargeParameterDiscoveryRes --> Wait_for_PowerDeliveryRes
  Wait_for_PowerDeliveryRes --> Wait_for_ChargeParameterDiscoveryRes
  Wait_for_PowerDeliveryRes --> Wait_for_SessionStopRes
  Wait_for_PowerDeliveryRes --> Wait_for_ChargingStatusRes
  Wait_for_ChargingStatusRes --> Wait_for_PowerDeliveryRes
  Wait_for_ChargingStatusRes --> Wait_for_PowerDeliveryRes
  Wait_for_ChargingStatusRes --> Wait_for_ChargingStatusRes
  Wait_for_ChargingStatusRes --> Wait_for_MeteringReceiptRes
  Wait_for_MeteringReceiptRes --> Wait_for_ChargingStatusRes
  Wait_for_MeteringReceiptRes --> Wait_for_PowerDeliveryRes
  Wait_for_MeteringReceiptRes --> Wait_for_PowerDeliveryRes
  Wait_for_SessionStopRes --> [*]
```
Remark: Second example above demonstrates that the transformation mermaid -> ceps -> mermaid is indeed the identity map. 

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
