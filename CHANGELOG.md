## [Unreleased]

## [0.1.0] - 2023-12-25
- Initial release

## [RELEASED]

## [0.1.1] - 2024-09-28
- First live version

## [0.1.6] - 2024-10-27
### Added
- **New `Faussaire::Piraterie` Methods**:
  - `role`: Generates a learner status inspired by The Hacking Project.
  - `pnj`: Provides a pirate-themed character title.
  - `nav`: Outputs a random pirate ship type.
  - `rage`: Produces pirate-themed swearing expressions.
  - `excuse`: Generates excuses for project delays or absences.
  - `potin`: Creates gossipy anecdotes about bootcamp life.

### Enhancements
- Improved spec coverage:
  - Tests for duplicate values in YAML data.
  - Format validation for data entries.
  - Tests to confirm that each method returns a unique and expected value.

## [1.0.0] - 2024-11-23
### Added
- **New `Faussaire::Tv.netflix` Method**:
  - Generates a random Netflix Original title from a cleaned dataset of 1033 TV shows, movies, stand-up comedy specials, and more.
  - Example: `Faussaire::Tv.netflix` => `"Squid Game"`

### Enhancements
- **Duplicate Check Refactoring**:
  - Improved duplicate detection logic in YAML datasets for TV.
  - Added `netflix` subset to duplicate-checking specs.

- **Readme Updates**:
  - Added examples for the new `Faussaire::Tv.netflix` method.
  - Updated documentation to reflect the expanded dataset.

- **Ruby Version Update**:
  - Adjusted the required Ruby version to address a `rubocop` PR conflict issue.
  - Standardized capitalization in the `license.txt` file.