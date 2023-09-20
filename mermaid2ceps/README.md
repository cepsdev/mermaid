## Generate a ceps conformant representation of a mermaidjs state machine, i.e. mermaidjs to ceps.

### Synopsis: $ ceps mermaid.ceps.lex FILE.mermaid mermaidjs2sm.ceps

Example (assuming this README's directory is the current working directory): 

```
$ ceps mermaid.ceps.lex ../examples_mermaidjs_sm/iso15118-2-evcc_communication_states_ac_v2g.mermaid mermaidjs2sm.ceps
```
Remark: The magic lies in the two files [mermaid.ceps.lex](mermaid.ceps.lex) and [mermaidjs2sm.ceps](mermaidjs2sm.ceps). The former defines a simple set of rules which enable ceps to read .mermaid files, the latter operates on the result by adding the necessary states declaration.

Second example (assuming this README's directory is the current working directory):

```
$ ceps mermaid.ceps.lex ../examples_mermaidjs_sm/iso15118-2-evcc_communication_states_ac_v2g.mermaid mermaidjs2sm.ceps ../ceps2mermaid/sm2mermaidjs.ceps
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
