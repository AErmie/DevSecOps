Feature: Storage related general feature

	related_resources: azurerm_storage_account
	
	Scenario: Ensure that 'Secure transfer required' is set to 'Enabled'
		Given I have azurerm_storage_account defined
		Then it must have enable_https_traffic_only
		And its value must be true


