Feature: Whatever you want to call your feature

	related_resources: provider_resource_type
	
	Scenario: Ensure that '[WHAT YOU ARE LOOKING FOR]' is set to '[VALUE]'
		Given I have <resource_type> defined
		When it contains <some_property>
        Then its value must be <pattern>
        And its value must match the “<pattern>” regex
