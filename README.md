# Visualizations of ceps models - playground

## Installation
### Requirements
- Unixish OS
- recent C++ compiler (e.g. g++ version >= 9)
- cmake
- https://github.com/cepsdev/machines4ceps
- Tip: copy the ceps binary to /usr/sbin/local

## Visualization of models
### Using mermaidjs
#### State Charts

Usage: $ ceps FILE [FILES] sm2mermaaidjs.ceps

Example: 

```
$ ceps iso15118-2-evcc_communication_states_ac_v2g.ceps sm2mermaaidjs.ceps 
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

Rendered by mermaid.live:


![](/iso15118-2-evcc_communication_states_ac_v2g.png)


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