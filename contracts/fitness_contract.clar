;; Health and Fitness Tracker Smart Contract
;; This contract enables users to register, update, and retrieve their personalized health and fitness profiles.
;; Users can manage key data related to their fitness journey, such as personal details, health metrics, and workout plans.
;; It stores information such as a user's full name, age, weight, height, fitness goals, and workout routines.

;; `user-profiles` map holds the user data:
;; - The key is the user's principal (address).
;; - The value is a record containing user's full name, age, weight, height, fitness goal, and workout routines.

(define-map user-profiles
    principal
    {
        full-name: (string-ascii 100),  ;; User's full name (up to 100 characters)
        age: uint,                      ;; User's age (in years, must be between 18 and 120)
        weight: uint,                   ;; User's weight (in kilograms, should be between 30kg and 500kg)
        height: uint,                   ;; User's height (in centimeters, should be between 50cm and 250cm)
        fitness-goal: (string-ascii 100),  ;; User's fitness goal (e.g., "Lose weight", "Gain muscle", etc.)
        workout-routines: (list 10 (string-ascii 100))  ;; List of user's workout routines (up to 10 routines, each up to 100 characters)
    }
)

;; Custom error constants to handle specific errors:
(define-constant ERR_PROFILE_NOT_FOUND (err u404))  ;; Error when the user profile does not exist in the system
(define-constant ERR_PROFILE_ALREADY_EXISTS (err u409))  ;; Error when a user attempts to register an existing profile
(define-constant ERR_INVALID_AGE (err u400))  ;; Error for invalid age input (must be between 18 and 120)
(define-constant ERR_INVALID_NAME (err u401))  ;; Error for invalid or empty name input
(define-constant ERR_INVALID_WEIGHT (err u402))  ;; Error for invalid weight input (must be between 30kg and 500kg)
(define-constant ERR_INVALID_HEIGHT (err u403))  ;; Error for invalid height input (must be between 50cm and 250cm)
(define-constant ERR_INVALID_FITNESS_GOAL (err u404))  ;; Error for invalid or empty fitness goal input
(define-constant ERR_INVALID_WORKOUT_ROUTINE (err u405))  ;; Error for invalid or empty workout routine list

;; Public function to register a new user profile
(define-public (register-user-profile 
    (full-name (string-ascii 100))
    (age uint)
    (weight uint)
    (height uint)
    (fitness-goal (string-ascii 100))
    (workout-routines (list 10 (string-ascii 100))))
    (let
        (
            (caller tx-sender)
            (existing-profile (map-get? user-profiles caller))  ;; Check if the user already has a profile
        )
        ;; Ensure the user does not have an existing profile
        (if (is-none existing-profile)
            (begin
                ;; Validate user inputs for age, weight, height, etc.
                (if (or (is-eq full-name "")
                        (< age u18)
                        (> age u120)
                        (< weight u30) ;; Minimum weight validation
                        (> weight u500) ;; Maximum weight validation
                        (< height u50) ;; Minimum height validation
                        (> height u250) ;; Maximum height validation
                        (is-eq fitness-goal "")
                        (is-eq (len workout-routines) u0)) ;; Ensure workout routines are provided
                    (err ERR_INVALID_AGE) ;; Handle invalid input
                    (begin
                        ;; Store the new user profile in the `user-profiles` map
                        (map-set user-profiles caller
                            {
                                full-name: full-name,
                                age: age,
                                weight: weight,
                                height: height,
                                fitness-goal: fitness-goal,
                                workout-routines: workout-routines
                            }
                        )
                        (ok "Profile successfully registered.") ;; Return success message
                    )
                )
            )
            (err ERR_PROFILE_ALREADY_EXISTS) ;; Error if profile already exists
        )
    )
)
