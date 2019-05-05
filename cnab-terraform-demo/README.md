# Simple CNAB / Duffle and Terraform Demo

## Parameters

| Name | Description |
|---|---|
| backend-name | Storage account name.  |
| backend-rg | Resource group name for the storage account. |
| backend-name-rg-location | Location for the resource group. |

## Install multiple instances

```
duffle install --credentials=azure --set backend-name=terraformtestbackend test-demo-one cnab-terraform-demo:0.1.0
```

```
duffle install --credentials=azure --set backend-name=terraformtestbackend test-demo-two cnab-terraform-demo:0.1.0
```

```
duffle install --credentials=azure --set backend-name=terraformprodbackend prod-demo-one cnab-terraform-demo:0.1.0
```

```
duffle install --credentials=azure --set backend-name=terraformprodbackend prod-demo-two cnab-terraform-demo:0.1.0
```

## Uninstall instance

```
duffle uninstall --credentials=azure test-demo-one
```