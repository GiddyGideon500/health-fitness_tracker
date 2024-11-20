# Health and Fitness Tracker Smart Contract

This smart contract enables users to register, update, and retrieve their personalized health and fitness profiles on the blockchain. It provides a decentralized solution for users to manage key data related to their fitness journey, such as personal details, health metrics, and workout plans. The contract ensures data integrity and privacy, making it ideal for users who want to securely track and manage their health and fitness progress.

## Features

- **User Registration**: Allows users to register a profile with key health and fitness details.
- **Profile Update**: Users can update their profile information at any time.
- **Profile Retrieval**: Retrieve the user's full profile, including workout routines and fitness goals.
- **Data Validation**: Ensures that input data, such as age, weight, height, and workout routines, are within specified valid ranges.
- **Error Handling**: Handles specific error messages for invalid inputs and duplicate profile registrations.

## Smart Contract Structure

The contract is composed of the following key components:

### `user-profiles` Map

A mapping structure that stores user profiles:

- **Key**: The user's principal (address).
- **Value**: A record containing:
  - `full-name`: User's full name (up to 100 characters)
  - `age`: User's age (in years, must be between 18 and 120)
  - `weight`: User's weight (in kilograms, between 30kg and 500kg)
  - `height`: User's height (in centimeters, between 50cm and 250cm)
  - `fitness-goal`: User's fitness goal (e.g., "Lose weight", "Gain muscle")
  - `workout-routines`: A list of workout routines (up to 10 routines, each up to 100 characters)

### Error Constants

- **ERR_PROFILE_NOT_FOUND**: Triggered when the profile does not exist.
- **ERR_PROFILE_ALREADY_EXISTS**: Triggered when a user attempts to register a profile that already exists.
- **ERR_INVALID_AGE**: Triggered when an invalid age is provided.
- **ERR_INVALID_NAME**: Triggered when an invalid name is provided.
- **ERR_INVALID_WEIGHT**: Triggered when an invalid weight is provided.
- **ERR_INVALID_HEIGHT**: Triggered when an invalid height is provided.
- **ERR_INVALID_FITNESS_GOAL**: Triggered when an invalid fitness goal is provided.
- **ERR_INVALID_WORKOUT_ROUTINE**: Triggered when an invalid or empty workout routine list is provided.

## Functions

### `register-user-profile`

- **Purpose**: Registers a new user profile.
- **Parameters**:
  - `full-name`: User's full name (up to 100 characters).
  - `age`: User's age (must be between 18 and 120).
  - `weight`: User's weight (must be between 30kg and 500kg).
  - `height`: User's height (must be between 50cm and 250cm).
  - `fitness-goal`: User's fitness goal (e.g., "Lose weight", "Gain muscle").
  - `workout-routines`: List of up to 10 workout routines (each up to 100 characters).
- **Returns**: Success message if the profile is successfully registered, otherwise returns an error message.
- **Validation**: Ensures that all provided data is valid and that the profile does not already exist.

### `update-user-profile`

- **Purpose**: Updates an existing user profile.
- **Parameters**:
  - Same as `register-user-profile`.
- **Returns**: Success message if the profile is successfully updated, otherwise returns an error message.
- **Validation**: Ensures that the user has an existing profile and that the updated data is valid.

### `get-user-profile`

- **Purpose**: Retrieves the user's complete profile.
- **Parameters**: `user`: The principal (address) of the user.
- **Returns**: The user's profile if it exists, otherwise returns an error message.

### `get-user-workout-routines`

- **Purpose**: Retrieves the user's workout routines.
- **Parameters**: `user`: The principal (address) of the user.
- **Returns**: A list of the user's workout routines if they exist, otherwise returns an error message.

### `get-user-fitness-goal`

- **Purpose**: Retrieves the user's fitness goal.
- **Parameters**: `user`: The principal (address) of the user.
- **Returns**: The user's fitness goal if it exists, otherwise returns an error message.

## Error Handling

This contract ensures that users are informed of errors with descriptive messages:

- **ERR_PROFILE_NOT_FOUND**: If the user's profile cannot be found when attempting to retrieve or update it.
- **ERR_PROFILE_ALREADY_EXISTS**: If the user tries to register a profile that already exists.
- **ERR_INVALID_AGE**: If the age is outside the allowed range (18-120 years).
- **ERR_INVALID_NAME**: If the name is empty or invalid.
- **ERR_INVALID_WEIGHT**: If the weight is outside the allowed range (30kg-500kg).
- **ERR_INVALID_HEIGHT**: If the height is outside the allowed range (50cm-250cm).
- **ERR_INVALID_FITNESS_GOAL**: If the fitness goal is empty or invalid.
- **ERR_INVALID_WORKOUT_ROUTINE**: If no workout routines are provided or if they are invalid.

## Deployment

To deploy this contract on the Clarity blockchain, use the standard deployment tools provided by the Clarity framework. Ensure that you have a proper wallet setup and sufficient funds to cover transaction costs.

## License

This smart contract is licensed under the MIT License. See LICENSE for more information.

## Contributing

We welcome contributions to improve this project. Please feel free to open issues or submit pull requests.

## Contact

For any inquiries or support, please reach out to [your-email@example.com].
