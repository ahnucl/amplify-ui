Feature: Sign Up with Username

  Create a new user in the Amazon Cognito UserPool by passing the new user’s email address, password, and other attributes.

  Background:
    Given I'm running the example "ui/components/authenticator/sign-up-with-username"

  @todo-migration @angular @react @vue @react-native
  Scenario: Login mechanism set to "username"
    Then I see "Username" as an input field

  @todo-migration @angular @react @vue @react-native
  Scenario: "Email" is included from `aws_cognito_verification_mechanisms`
    Then I see "Email" as an "email" field
  
  @todo-migration @angular @react @vue @react-native
  Scenario: "Phone Number" is not included
    Then I don't see "Phone Number"
  
  @todo-migration @angular @react @vue
  Scenario: Sign up a new username & password
    Given I intercept '{ "headers": { "X-Amz-Target": "AWSCognitoIdentityProviderService.SignUp" } }' with fixture "sign-up-with-username"
    When I type a new "username"
    Then I type my password
    Then I confirm my password
    Then I type my "email" with status "UNCONFIRMED"
    Then I click the "Create Account" button
    Then I see "Your code is on the way"
    Then I see "Confirmation Code"

  @react-native
  Scenario: Sign up a new username & password
    When I type a new "username"
    Then I type my password
    Then I confirm my password
    Then I type my "email" with status "UNCONFIRMED"
    Then I click the "Create Account" button
    Then I see "Your code is on the way. To log in, enter the code we sent you. It may take a minute to arrive."
    Then I see "Confirmation Code"

  @todo-migration @angular @react @vue
  Scenario: Username field autocompletes username
    Then "Username" field autocompletes "username"

  @todo-migration @angular @react @vue
  Scenario: Password fields autocomplete "new-password"
    Then "Password" field autocompletes "new-password"
    Then "Confirm Password" field autocompletes "new-password"
